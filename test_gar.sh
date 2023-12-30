#!/bin/bash

source help_gar.sh
source options_handler_gar.sh

#Process temp directory
temp_directory=$(mktemp -d)

if [[ -z "$temp_directory" ]]; then
    echo "Cannot create temporary folder. Check access privilages"
    exit 1
else 
    echo "Prepared temporary folder: $temp_directory"
fi

remove_temp_folder_on_exit() {
    rm -r "$temp_directory"
}

trap remove_temp_folder_on_exit EXIT

#Spring dependencies
spring_version='5.2.2.RELEASE'

declare -a spring_modules=("spring-context" "spring-web" "spring-core" "spring-beans" "spring-webmvc")

for spring_module in "${spring_modules[@]}"; do
    spring_jar="$spring_module-$spring_version.jar"
    spring_download_link="https://repo1.maven.org/maven2/org/springframework/$spring_module/$spring_version/$spring_jar"
    wget "$spring_download_link" -P "$temp_directory"
    mv "$temp_directory/$spring_jar" "$TARGET_LOCATION"

    if [[ ! -f "$TARGET_LOCATION/$spring_jar" ]]; then
    echo "Unable to find $spring_jar"
    exit 1
fi

done

echo "Dependencies were successfully downloaded into target folder: $TARGET_LOCATION"
