#!/bin/bash
list1=`curl https://www.ebay.com/itm/353840550286`
list2=`echo $list1 | htmlq --text '#prcIsum' | sed 's/[a-zA-Z $]//g'`

if [[ $list1 =~ "Error Page" ]]
then
  echo "Deleted" || echo "hay"
fi