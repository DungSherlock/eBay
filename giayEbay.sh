#!/bin/bash

# git pull
: > giayEbay-item.txt
: > giayEbay-size.txt
: > giayEbay-price.txt
: > giayEbay-stock.txt


while read line
do
  echo ${line}
  curl=`curl ${line} \
  -H 'authority: www.ebay.com' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: vi' \
  -H 'cookie: __uzma=933d04ce-1dcd-403e-b177-dcfea05402c1; __uzmb=1653320972; __uzme=2257; __ssds=2; __ssuzjsr2=a9be0cd8e; __gsas=ID=1152a6b5c679a738:T=1655775418:S=ALNI_MbjPgoCvHAyPcCgT2FdC16YAgZC8w; cid=KkZknEv4RjWzrMRs%23407228541; __uzmc=1867316027915; __uzmd=1670719413; __uzmf=7f60005d10fe5a-5775-4d68-afe0-c3fedbd9f1cc165332097276717398440576-0b0978e4afaa4f28163; __deba=C_ZqiJhRPZiFSfExIf5MuZgSIfSnSnRrwFQIKVeTWDKgbgKjpIX9y1Ptzk0s6xPHfMiftpm1sVECba0DdJAjhUqXpeDEv1YmpIsq2zOvDmZeFuR_xg6emDrJhymXKtquLlimd9JMAktSmEud1dcqzQ==; dp1=bexpt/000165577545139163a1ba9b^bl/VNen-US675ae2f1^kms/in675ae2f1^pbf/%230000c000e000008180820000006579af71^u1p/aHVlZHVuZw**675ae2f1^u1f/Dung675ae2f1^; ns1=BAQAAAYTabrBzAAaAANgATGV5r3FjNzJ8NjAxXjE2NTMzMjEyNTY2NjNeXjFeM3wyfDV8NHw3fDExXjFeMl40XjNeMTJeMTJeMl4xXjFeMF4xXjBeMV42NDQyNDU5MDc1AKUADWV5r3EyMzYxMjM2MDcwLzA7pDXheSdNaTZ+AV3dHE8yAnuY+Lk*; nonsession=BAQAAAYTabrBzAAaAABAAB2V5r3FodWVkdW5nAEAAB2V5r3FodWVkdW5nADMACmV5r3E0MzAwMDAsVk5NAAQAB2V1WNtodWVkdW5nAWQAB2da4vEjMDAwMDhhAAgAHGPACPExNjcwOTM2OTgyeDM4NTI0MTg2ODM2M3gweDJOAMoAIGda4vFiMWVlYTQyNTE4MDBhNzY0MmY1M2Y1YzJmZmZjODU4OQDLAAFjmIL5NQCcADhlea9xblkrc0haMlByQm1kajZ3Vm5ZK3NFWjJQckEyZGo2TUhsb09qQzVhQ3BneWRqNng5blkrc2VRPT0AnQAIZXmvcTAwMDAwMDAxVm/pv6obIGd+h4r1oedDmsWooLg*; totp=1670975009193.4jgcylUT68JYi5l8UVgFUsA+cBX5t4YrIFtO+FfOkoECUphlGczuKWOalxTSNK1mIhHbDozNrYaaC9IutrCN9kuQ/SSkIaiuavZjdC9qB0kr+6lfA2vFDdGP5qDLd7zd' \
  -H 'dnt: 1' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Microsoft Edge";v="108"' \
  -H 'sec-ch-ua-full-version: "108.0.1462.46"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-model: ""' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-platform-version: "13.0.0"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: none' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46' \
  --compressed`
  echo $curl
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
