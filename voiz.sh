#!/bin/bash
# git pull

# idBook=`curl -Ls https://script.google.com/macros/s/AKfycbwUXljrnjCBVZRFbDIbzNtmv9eFrSD-ejpOzXqvwXv2XO6Ybb1JtK5o1Xv9_ffr2QIySw/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g'`

read -p 'Nhap ID: ' idBook
book=`curl -s https://api.voiz.vn/v1/playlists/$idBook`
folder=`echo $book | jq '.data.author_string + "-" + .data.name'` | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//' > voiz-title.txt
echo $folder
echo $idBook >> voiz-title.txt
mkdir "/Users/om/Downloads/voiz/$folder"
image=`echo $book | jq '.data.avatar.original_url' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//'`

echo $image
exit

curl -H -LOs "Host: voiz-prod.s3.cloud.cmctelecom.vn" -H "Accept: image/x-ms-bmp,image/x-win-bitmap,image/bmp,image/tiff,image/ico,image/x-icon,image/jpeg,image/x-bmp,image/x-xbitmap,image/gif,image/png" -H "Accept-Language: en-US;q=1.0, vi-US;q=0.9" -H "User-Agent: wewe/12.0.0 (com.wewe.musicsounds; build:20230223.161211; iOS 16.4.1) Alamofire/12.0.0" --compressed $image --output "/Users/om/Downloads/voiz/$folder"


list=`curl -s https://api.voiz.vn/v1/playlists/$idBook/audios\?limit\=1000\&order\=asc\&position\=bottom`
echo $list | jq '.data[].name' > voiz-name.txt
echo $list | jq '.data[].id' > voiz-id.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbyX2_giAjG24Gh0HmVsErUD2r1ikuoUjkfhMDHfMsOopjy7OcimmUpTXPB87JmnSikwVw/exec?`
linkPost=$linkApi`echo \
\&title==IMPORTDATA\(\"`$linkGit`echo voiz-title.txt\"\)\
\&id==IMPORTDATA\(\"`$linkGit`echo voiz-id.txt\"\)\
\&name==IMPORTDATA\(\"`$linkGit`echo voiz-name.txt\"\)\
`

echo '[InternetShortcut]
URL='$linkPost > voiz.url
open voiz.url