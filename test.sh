#!/bin/bash
while read line
do
    line0=(${line// /$})
    array=(${line0//|/ })
    echo ${array[0]//$/ }
    echo ${array[4]//$/ }
done < input-wm-track-TD.txt

# arr0=(${IN//;/-})
# arr=(${arr1//;/ })
# echo ${arr[0]//-/ }
# echo ${arr[1]//-/ }