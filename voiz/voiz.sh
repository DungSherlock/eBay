#!/bin/bash
# git pull

read -p 'Nhap ID: ' idBook
book=`curl -s https://api.voiz.vn/v1/playlists/$idBook`
folder=`echo $book | jq '.data.author_string + "-" + .data.name' | xargs`
echo $folder > voiz-title.txt
echo $idBook >> voiz-title.txt
mkdir "/Users/om/Downloads/voiz/`echo $folder`"
imageLink=`echo $book | jq '.data.avatar.original_url' | xargs`
imageExt=$(basename $imageLink | cut -d. -f2)

curl -Ls `echo $imageLink` --output "/Users/om/Downloads/voiz/`echo $folder`/cover.`echo $imageExt`"

list=`curl -s https://api.voiz.vn/v1/playlists/$idBook/audios\?limit\=1000\&order\=asc\&position\=bottom`
echo $list | jq '.data[].name' | '"' + xargs -I {} + '"' > voiz-name.txt
echo $list | jq '.data[].id' | xargs -I {} > voiz-id.txt


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /voiz/`
linkApi=`echo https://script.google.com/macros/s/AKfycbyX2_giAjG24Gh0HmVsErUD2r1ikuoUjkfhMDHfMsOopjy7OcimmUpTXPB87JmnSikwVw/exec?`
linkPost=$linkApi`echo \
\&title==IMPORTDATA\(\"`$linkGit`echo voiz-title.txt\"\)\
\&id==IMPORTDATA\(\"`$linkGit`echo voiz-id.txt\"\)\
\&name==IMPORTDATA\(\"`$linkGit`echo voiz-name.txt\"\)\
`

echo '[InternetShortcut]
URL='$linkPost > voiz.url
open voiz.url