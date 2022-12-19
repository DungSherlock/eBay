#!/bin/bash

# git pull
: > giayEbay-item.txt
: > giayEbay-size.txt
: > giayEbay-price.txt
: > giayEbay-stock.txt

# url="https://www.ebay.com/itm/385241868363"
# echo $url



# echo Thoát
# exit 1  
while read line
do
  echo $line
  curl ${line} \
  -H 'authority: www.ebay.com' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: vi' \
  -H 'cache-control: max-age=0' \
  -H 'cookie: __uzma=933d04ce-1dcd-403e-b177-dcfea05402c1; __uzmb=1653320972; __uzme=2257; __ssds=2; __ssuzjsr2=a9be0cd8e; __gsas=ID=1152a6b5c679a738:T=1655775418:S=ALNI_MbjPgoCvHAyPcCgT2FdC16YAgZC8w; cid=KkZknEv4RjWzrMRs%23407228541; __uzmc=1867316027915; __uzmd=1670719413; __uzmf=7f60005d10fe5a-5775-4d68-afe0-c3fedbd9f1cc165332097276717398440576-0b0978e4afaa4f28163; __deba=C_ZqiJhRPZiFSfExIf5MuZgSIfSnSnRrwFQIKVeTWDKgbgKjpIX9y1Ptzk0s6xPHfMiftpm1sVECba0DdJAjhUqXpeDEv1YmpIsq2zOvDmZeFuR_xg6emDrJhymXKtquLlimd9JMAktSmEud1dcqzQ==; ak_bmsc=67DCF79CE3AE1B69FF7FEF021206D3AA~000000000000000000000000000000~YAAQngqrcQJbWyCFAQAA8VSPKBKq5J9WkOauDueKYyfsGMypkpuR9rzfKMmFbXAFmd2Qn9s8HXsjkoZp53/t/HX2qXd8O+LMtk/PQ7U+eu45SukZ7juzM62QAKkNjU6Xl3IhE+Il2Y6kSmGaU7n/z5+NMVRIZ7mrOQTku7rD7NDLtIBLpPtLJV6Lu4f8lRmpFVnwGwBjdOBIRU+YRqyavmDwG/j/K+08S4bywfaInuwJ9ILU+6k3yZYS55YEg7U7loDGlo/gHMHPKUxG9o+WuvFZ/1mVs10EGqhlyqweuB/X5HkJGdCWnouxqB/7zhi1FBkGysvZRwfOSzX9vRHZDil85C4w5IZu9dIMg3Cy91r37UtVsnha1fENV7MxtZX1aOT6qkmp1YzQhA==; JSESSIONID=0C011B6C00168C9FAA4EEBBA7C16D9B2; bm_sv=85E6752CD5704B2ECE81886F2534EE26~YAAQngqrcR9iWyCFAQAAS8CRKBJZu+wxjdFDRks2oCq2CaPDlrEoSgaDtF1sfvZx6AzTz45qs4kwGkNM6VIe/R/vwgmF26T863+7i3if05sDcmJ0iXBTKrZfT2f11yuAvHyCZcxDsmHqsg7WDbwyQxbDM/JSin3qKW2JlAMHPO3Atara41zrDcfGFirBQowK7pE8BDSylAvoKe8cS13wKBsul+NcMuX3vTh45M4nknMzBjudXMX2EttYJB2FIA==~1; totp=1671422969439.dunanwgjGunOY+p9TZZNP+p7AGnT/MhZBZn047EKTO3MNttiPlpWFCHJ7ptVdXUqA9g5PLVCAWVL0dhldh+B4V0hFRTeZGbuG2vhW9uw4uurWF641SFyg2b4FB0hwArA; dp1=bexpt/000165577545139163a1ba9b^bl/VNen-US67624b03^kms/in67624b03^pbf/%230000c000e0000081808200000065811783^u1p/aHVlZHVuZw**67624b03^u1f/Dung67624b03^; ns1=BAQAAAYUN7khyAAaAANgATGWBF4NjNzJ8NjAxXjE2NTMzMjEyNTY2NjNeXjFeM3wyfDV8NHw3fDExXjFeMl40XjNeMTJeMTJeMl4xXjFeMF4xXjBeMV42NDQyNDU5MDc1AKUADWWBF4MyMzYxMjM2MDcwLzA7FzTUJ4r0Jvp0BTB/O3JyxW9BWBk*; s=CgAD4ACBjoTWDYjFlZWE0MjUxODAwYTc2NDJmNTNmNWMyZmZmYzg1ODk3pqxR; nonsession=BAQAAAYUN7khyAAaAABAAB2WBF4NodWVkdW5nAEAAB2WBF4NodWVkdW5nADMACmWBF4M0MzAwMDAsVk5NAAQAB2V1WNtodWVkdW5nAWQAB2diSwMjMDAwMDhhAAgAHGPHcQMxNjcxNDIyODg1eDM4NTI0MTg2ODM2M3gweDJOAMoAIGdiSwNiMWVlYTQyNTE4MDBhNzY0MmY1M2Y1YzJmZmZjODU4OQDLAAJjn+sLMTEAnAA4ZYEXg25ZK3NIWjJQckJtZGo2d1ZuWStzRVoyUHJBMmRqNk1IbG9PakM1YUNwZ3lkajZ4OW5ZK3NlUT09AJ0ACGWBF4MwMDAwMDAwMVz6AwU6fWWQyYC8Z4t+CevHjU+5; ebay=%5Ejs%3D1%5Esbf%3D%2310000100000%5E' \
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
  --compressed
  
  echo Hay

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
