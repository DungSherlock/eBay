#!/bin/bash
# git pull
read -p 'Nhap ID: ' idBook
book=`curl -s https://api.voiz.vn/v1/playlists/$idBook`
# title=`echo $book | jq '.data.author_string + "-" + .data.name' | sed 's/"//g' | sed 's/ /%20/g' | sed 's/-/%20D/g'`
title=`echo $book | jq '.data.author_string + "-" + .data.name' | sed 's/"//g'`
tit=$(echo $title | sed 's/%/%25/g; s/ /%20/g; s/!/%21/g; s/"/%22/g; s/#/%23/g; s/\$/%24/g; s/\&/%26/g; s/'\''/%27/g; s/(/%28/g; s/)/%29/g; s/\*/%2A/g; s/+/%2B/g; s/,/%2C/g; s/-/%2D/g; s/\./%2E/g; s/\//%2F/g; s/:/%3A/g; s/;/%3B/g; s//%3C/g; s/=/%3D/g; s//%3E/g; s/?/%3F/g; s/@/%40/g; s/\[/%5B/g; s/\\/%5C/g; s/\]/%5D/g; s/\^/%5E/g; s/_/%5F/g; s/`/%60/g; s/{/%7B/g; s/|/%7C/g; s/}/%7D/g; s/~/%%7E/g')

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
\title=`$tit` echo \
\&id==IMPORTDATA\(\"`$linkGit`echo voiz-id.txt\"\)\
\&name==IMPORTDATA\(\"`$linkGit`echo voiz-name.txt\"\)\
`
echo '[InternetShortcut]
URL='$linkPost > voiz.url
open voiz.url