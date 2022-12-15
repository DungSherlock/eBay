#!/bin/bash

# git pull
: > giayEbay-item.txt
: > giayEbay-size.txt
: > giayEbay-price.txt
: > giayEbay-stock.txt


while read line
do
  # curl=`curl `$line` -H 'accept: text/html'`
  # echo $line
  # echo $curl
  curl ${line} -H 'accept: text/html'
  echo $curl | grep -oiP '(?<="text":"US \$).*?(?=")' | sed 's|.*|${array[0]}|g' >> giayEbay-item.txt
  echo $curl | grep -oiP '(?<=Shoe Size":).*?(?=})' >> giayEbay-size.txt
  echo $curl | grep -oiP '(?<="text":"US \$).*?(?=")' >> giayEbay-price.txt
  echo $curl | grep -oiP '(?<=inStock":).*?(?=\,)' >> giayEbay-stock.txt
done < input-giay.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxvgB0cMGKRjx_sVCDTrrzTkT40YIeRPsBUp-1-e913NLyI8mUywjiaGDu9MDj9bChN/exec?`
linkPost=$linkApi`echo Item ID==IMPORTDATA\(\"`$linkGit`echo track-usItemId-CO.txt\"\)\&Giá==IMPORTDATA\(\"`$linkGit`echo track-priceValue-CO.txt\"\)\&Tên==IMPORTDATA\(\"`$linkGit`echo track-fullName-CO.txt\"\)\&Địa chỉ==index\(IMPORTDATA\(\"`$linkGit`echo track-address-CO.txt\"\),,1\)\&Status==IMPORTDATA\(\"`$linkGit`echo track-status-CO.txt\"\)\&Tracking Number==IMPORTDATA\(\"`$linkGit`echo track-number-CO.txt\"\)\&Tracking URL==IMPORTDATA\(\"`$linkGit`echo track-url-CO.txt\"\)\&Email==IMPORTDATA\(\"`$linkGit`echo track-email-CO.txt\"\)\&Order==IMPORTDATA\(\"`$linkGit`echo track-OrderID-CO.txt\"\)\&categoriesType==IMPORTDATA\(\"`$linkGit`echo track-categoriesType-CO.txt\"\)`
echo $linkPost
