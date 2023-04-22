#!/bin/bash
# git pull

# idBook=`curl -Ls https://script.google.com/macros/s/AKfycbwUXljrnjCBVZRFbDIbzNtmv9eFrSD-ejpOzXqvwXv2XO6Ybb1JtK5o1Xv9_ffr2QIySw/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g'`

read -p 'Nhap ID: ' idBook
book=`curl -s https://api.voiz.vn/v1/playlists/$idBook`
echo $book | jq '.data.author_string + "-" + .data.name' > voiz-title.txt
echo $idBook >> voiz-title.txt


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