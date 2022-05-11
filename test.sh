#!/bin/bash
: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

while read line
do
  array=(${line//|/ })

  while true
  do
    list=`echo blocked`
    if [[ $list = "blocked" ]]
    then
        link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
    #   `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
        echo "Tạm dừng!" ${array[0]}
        echo ${line}
        read -p "blocked"
    else
      echo ${array[0]}
      break
    fi
  done

done < input-wm-list.txt