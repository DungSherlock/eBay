#!/bin/bash
# git pull
: > nickName.txt
: > uid.txt
: > equity.txt
: > totalEarnings.txt
: > followerEarning.txt
: > maxDrawDown.txt
: > winRate.txt
: > avgProfitRate.txt
: > avgLossRate.txt
: > totalTransactions.txt

for i in {0..11}
do
    bingX=`curl -s 'https://api-app.we-api.com/api/v5/copy-trade/search/search?pageSize=6&pageId='$i'&order=desc&sort=comprehensive' \
  -H 'authority: api-app.we-api.com' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: vi' \
  -H 'app_version: 4.59.3' \
  -H 'appid: 30004' \
  -H 'authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc2MDMzNTAxfQ.UaBEU26iv3KI9LkNM3WfE5CD7sRDwlmcSgs2Cgbio2hlfUXS2RHdLv0bdj7U1UHknviut01RzCoISG1nCyRPmg' \
  -H 'channel: copychadingSEO' \
  -H 'content-type: application/json' \
  -H 'device_id: b47c0dce-fbf5-4b3b-926e-a1da81c5a417' \
  -H 'dnt: 1' \
  -H 'lang: vi-VN' \
  -H 'mainappid: 10009' \
  -H 'origin: https://bingx.com' \
  -H 'platformid: 30' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Microsoft Edge";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sign: BB860EE8954A6C62A6F07B941703BA6F9D6AAD30DEB572EE154BAE5D1644151A' \
  -H 'timestamp: 1675781863547' \
  -H 'timezone: 7' \
  -H 'traceid: 406ccd0c-1476-497b-8c90-13ec58c69eed' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  -H 'visitorid: -1' \
  --data-raw '{"conditions":[{"key":"equity","type":"range","min":1000,"value":0},{"key":"riskLevel","type":"range","min":1,"max":4,"value":0},{"key":"winRate","type":"range","min":80,"value":0}],"nickName":""}' \
  --compressed`
    result=`echo $bingX | jq '.data.result[]'`

    if [ "$result" == "" ]; then
        break
    else
        echo "page $i"
        echo $bingX | jq '.data.result[].trader.nickName' >> nickName.txt
        echo $bingX | jq '.data.result[].trader.uid' >> uid.txt
        echo $bingX | jq '.data.result[].rankStat.equity' >> equity.txt # Vốn
        echo $bingX | jq '.data.result[].rankStat.totalEarnings' >> totalEarnings.txt # Lợi nhuận trader
        echo $bingX | jq '.data.result[].rankStat.followerEarning' >> followerEarning.txt # Lợi nhuận người copy
        echo $bingX | jq '.data.result[].rankStat.maxDrawDown' >> maxDrawDown.txt # Mức âm tài khoản tối đa
        echo $bingX | jq '.data.result[].rankStat.winRate' >> winRate.txt # Tỉ lệ thắng
        echo $bingX | jq '.data.result[].rankStat.avgProfitRate' >> avgProfitRate.txt # Tỉ lệ lãi bình quân
        echo $bingX | jq '.data.result[].rankStat.avgLossRate' >> avgLossRate.txt # Tỉ lệ lỗ bình quân
        echo $bingX | jq '.data.result[].rankStat.totalTransactions' >> totalTransactions.txt # Tổng các lệnh giao dịch
    fi
done

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/copy/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxZKVFLSFo99w9G8aL1BGd5Inx9g2P0bo4Jm0qrb8KflcC_CDBvs22GuKx9J3HHPR8-WA/exec?`
linkPost=$linkApi`echo nickName==IMPORTDATA\(\"`$linkGit`echo nickName.txt\"\)\
&uid==IMPORTDATA\(\"`$linkGit`echo uid.txt\"\)\
&equity==IMPORTDATA\(\"`$linkGit`echo equity.txt\"\)\
&totalEarnings==IMPORTDATA\(\"`$linkGit`echo totalEarnings.txt\"\)\
&followerEarning==IMPORTDATA\(\"`$linkGit`echo followerEarning.txt\"\)`
echo $linkPost

