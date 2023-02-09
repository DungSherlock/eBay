#!/bin/bash
git pull
: > nickName.txt
: > uid.txt
: > link.txt
: > disPlayName.txt
: > equity.txt
: > totalEarnings.txt
: > followerEarning.txt
: > maxDrawDown.txt
: > strTotalEarningsRate.txt
: > strRecent7DaysRate.txt
: > strRecent30DaysRate.txt
: > strRecent90DaysRate.txt
: > strRecent180DaysRate.txt
: > riskLevel7Days.txt
: > riskLevel30Days.txt
: > riskLevel90Days.txt
: > riskLevel180Days.txt
: > winRate.txt
: > avgProfitRate.txt
: > avgLossRate.txt
: > totalTransactions.txt
: > strFollowerNum.txt
: > tradeDays.txt
: > lastTradeTime.txt

for i in {0..1000}
do
    bingX=`curl -s 'https://api-app.qq-os.com/api/v5/copy-trade/search/search?pageId='$i'&order=desc&sort=comprehensive' \
  -H 'authority: api-app.qq-os.com' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: vi' \
  -H 'app_version: 4.59.6' \
  -H 'appid: 30004' \
  -H 'authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc2MTYzNTExfQ.-1wSkftHAwllgLFqQSZ3g74IYldMdDV5WL8AK1jo8-BoBxanjvB7jZWi1EcXttr2nX6fixAFXZObDH1Bbv_vqA' \
  -H 'channel: copychadingSEO' \
  -H 'content-type: application/json' \
  -H 'cookie: __cfruid=8a2e0048ecaade746201a1e96518c0f6919043ca-1675904282; __cf_bm=4eqem.e5VftSCAjxv7ogKK_mijTLkHYPJbjQt2aBvkc-1675939228-0-AX3h7f0fSkCJ7ecb4eK7t/82RaLZAdqecz5J7fX80BqJiT497QpGbhs0Kifir0gxZnp8DiDnBf5JKr6a1So9lsI=' \
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
  -H 'sign: C7FF4A8D4CA2C5DD8B0FB9EE2A55D62AA0BD0309FE8BC00CA64F24755A7720A3' \
  -H 'timestamp: 1675939285573' \
  -H 'timezone: 7' \
  -H 'traceid: 1d5ef421-24fe-427e-a510-0c8bd6d6f5c7' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  -H 'visitorid: -1' \
  --data-raw '{"nickName":""}' \
  --compressed`

    result=`echo $bingX | jq '.data.result[]'`

    if [ "$result" == "" ]; then
        break
    else
        echo "page $i"
        echo $bingX | jq '.data.result[].trader.nickName' >> nickName.txt
        echo $bingX | jq '.data.result[].trader.uid' | xargs -I {} echo \'{} >> uid.txt
        echo $bingX | jq '.data.result[].trader.nickName' | xargs -I {} echo "=HYPERLINK(\"https://bingx.com/vi-vn/traders/?from=5&search={}\")" | sed 's/,/ /g' >> link.txt
        echo $bingX | jq '.data.result[].rankStat.disPlayName' >> disPlayName.txt # Tên hợp đồng
        echo $bingX | jq '.data.result[].rankStat.equity' >> equity.txt # Vốn
        echo $bingX | jq '.data.result[].rankStat.totalEarnings' | sed 's/+//g' >> totalEarnings.txt # Lợi nhuận trader
        echo $bingX | jq '.data.result[].rankStat.followerEarning' | sed 's/+//g' >> followerEarning.txt # Lợi nhuận người copy
        echo $bingX | jq '.data.result[].rankStat.maxDrawDown' >> maxDrawDown.txt # Mức âm tài khoản tối đa
        echo $bingX | jq '.data.result[].rankStat.strTotalEarningsRate' | sed 's/+//g' >> strTotalEarningsRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent7DaysRate' | sed 's/+//g' >> strRecent7DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent30DaysRate' | sed 's/+//g' >> strRecent30DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent90DaysRate' | sed 's/+//g' >> strRecent90DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent180DaysRate' | sed 's/+//g' >> strRecent180DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.riskLevel7Days' >> riskLevel7Days.txt
        echo $bingX | jq '.data.result[].rankStat.riskLevel30Days' >> riskLevel30Days.txt
        echo $bingX | jq '.data.result[].rankStat.riskLevel90Days' >> riskLevel90Days.txt
        echo $bingX | jq '.data.result[].rankStat.riskLevel180Days' >> riskLevel180Days.txt
        echo $bingX | jq '.data.result[].rankStat.winRate' | sed 's/+//g' >> winRate.txt # Tỉ lệ thắng
        echo $bingX | jq '.data.result[].rankStat.avgProfitRate' >> avgProfitRate.txt # Tỉ lệ lãi bình quân
        echo $bingX | jq '.data.result[].rankStat.avgLossRate' >> avgLossRate.txt # Tỉ lệ lỗ bình quân
        echo $bingX | jq '.data.result[].rankStat.totalTransactions' >> totalTransactions.txt # Tổng các lệnh giao dịch
        echo $bingX | jq '.data.result[].rankStat.strFollowerNum' >> strFollowerNum.txt # Số người sao chép
        echo $bingX | jq '.data.result[].rankStat.tradeDays' >> tradeDays.txt # Số ngày đã giao dịch
        echo $bingX | jq '.data.result[].rankStat.lastTradeTime' >> lastTradeTime.txt # Ngày giao dịch gần nhất
    fi
done

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/`
linkApi=`echo https://script.google.com/macros/s/AKfycbxZKVFLSFo99w9G8aL1BGd5Inx9g2P0bo4Jm0qrb8KflcC_CDBvs22GuKx9J3HHPR8-WA/exec?`
linkPost=$linkApi`echo nickName==IMPORTDATA\(\"`$linkGit`echo nickName.txt\"\)\
\&uid==IMPORTDATA\(\"`$linkGit`echo uid.txt\"\)\
\&link==IMPORTDATA\(\"`$linkGit`echo link.txt\"\)\
\&disPlayName==IMPORTDATA\(\"`$linkGit`echo disPlayName.txt\"\)\
\&equity==IMPORTDATA\(\"`$linkGit`echo equity.txt\"\)\
\&totalEarnings==IMPORTDATA\(\"`$linkGit`echo totalEarnings.txt\"\)\
\&followerEarning==IMPORTDATA\(\"`$linkGit`echo followerEarning.txt\"\)\
\&maxDrawDown==IMPORTDATA\(\"`$linkGit`echo maxDrawDown.txt\"\)\
\&strTotalEarningsRate==IMPORTDATA\(\"`$linkGit`echo strTotalEarningsRate.txt\"\)\
\&strRecent7DaysRate==IMPORTDATA\(\"`$linkGit`echo strRecent7DaysRate.txt\"\)\
\&strRecent30DaysRate==IMPORTDATA\(\"`$linkGit`echo strRecent30DaysRate.txt\"\)\
\&strRecent90DaysRate==IMPORTDATA\(\"`$linkGit`echo strRecent90DaysRate.txt\"\)\
\&strRecent180DaysRate==IMPORTDATA\(\"`$linkGit`echo strRecent180DaysRate.txt\"\)\
\&riskLevel7Days==IMPORTDATA\(\"`$linkGit`echo riskLevel7Days.txt\"\)\
\&riskLevel30Days==IMPORTDATA\(\"`$linkGit`echo riskLevel30Days.txt\"\)\
\&riskLevel90Days==IMPORTDATA\(\"`$linkGit`echo riskLevel90Days.txt\"\)\
\&riskLevel180Days==IMPORTDATA\(\"`$linkGit`echo riskLevel180Days.txt\"\)\
\&winRate==IMPORTDATA\(\"`$linkGit`echo winRate.txt\"\)\
\&avgProfitRate==IMPORTDATA\(\"`$linkGit`echo avgProfitRate.txt\"\)\
\&avgLossRate==IMPORTDATA\(\"`$linkGit`echo avgLossRate.txt\"\)\
\&totalTransactions==IMPORTDATA\(\"`$linkGit`echo totalTransactions.txt\"\)\
\&strFollowerNum==IMPORTDATA\(\"`$linkGit`echo strFollowerNum.txt\"\)\
\&tradeDays==IMPORTDATA\(\"`$linkGit`echo tradeDays.txt\"\)\
\&lastTradeTime==IMPORTDATA\(\"`$linkGit`echo lastTradeTime.txt\"\)\
`
echo $linkPost

