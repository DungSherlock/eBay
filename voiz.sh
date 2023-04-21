#!/bin/bash
# git pull
read -p 'Nhap ID: ' id
book=`curl -s https://api.voiz.vn/v1/playlists/$id`
title=`echo $book | jq '.data.author_string + "-" + .data.name'`
list=`curl -s https://api.voiz.vn/v1/playlists/$id/audios\?limit\=1000\&order\=asc\&position\=bottom`
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
\title==`$title`\
\&id==IMPORTDATA\(\"`$linkGit`echo voiz-id.txt\"\)\
\&name==IMPORTDATA\(\"`$linkGit`echo voiz-name.txt\"\)\
`
echo '[InternetShortcut]\
URL='$linkPost > voiz.url
open voiz.url