#!/bin/bash

declare -a array=(1 2 3 4 5)

arr_leng="${#array[@]}"

for ((i=$arr_leng - 1; i >= 0; i--)); do
    echo "${array[i]}"
done

for value in "${array[@]}"; do
    echo $value
done     
