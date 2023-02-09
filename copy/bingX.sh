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
: > winRate.txt
: > avgProfitRate.txt
: > avgLossRate.txt
: > totalTransactions.txt
: > strFollowerNum.txt
: > tradeDays.txt
: > lastTradeTime.txt

for i in {0..1000}
do
    bingX=`curl -s 'https://bingx.com/api/v5/copy-trade/search/search?pageId='$i'&order=desc&sort=comprehensive' \
  -H 'authority: bingx.com' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: vi' \
  -H 'app_version: 4.59.4' \
  -H 'appid: 30004' \
  -H 'authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc2MTYzNTExfQ.-1wSkftHAwllgLFqQSZ3g74IYldMdDV5WL8AK1jo8-BoBxanjvB7jZWi1EcXttr2nX6fixAFXZObDH1Bbv_vqA' \
  -H 'channel: copychadingSEO' \
  -H 'content-type: application/json' \
  -H 'cookie: uuid=b47c0dce-fbf5-4b3b-926e-a1da81c5a417; __cfruid=bf3b3bde847242aa3005005a7be47b05f043f1a0-1675484998; uid=1075666965101678594; fpw=login; kline_time_zone=8; locale=vi-vn; _cfuvid=wAZ4592mPbCaK8d5ry5Qip2x_p70hXaqLO9xyHC.caA-1675904279197-0-604800000; user_token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc2MTYzNTExfQ.-1wSkftHAwllgLFqQSZ3g74IYldMdDV5WL8AK1jo8-BoBxanjvB7jZWi1EcXttr2nX6fixAFXZObDH1Bbv_vqA; showKo=0; showKo=0; __cf_bm=jgsrbT7DHZvDbyycPdgsg7TyfxYbQiAl7etTg6LOcYs-1675926529-0-AXdaDRPyRhsujb5W6hBcIvIPgqEBzBHij+iHzXW4+vZfUWWE1kvcp4uhWg4sLSawml6tschwrGM6Yk/pCbUfxFM=; lastCheckSessionAt=1675926957362; tokenExpiredAt=1675970157519; network_delay=92' \
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
  -H 'sec-fetch-site: same-origin' \
  -H 'sign: 9709C64ADB8176DDF7BA022EF6D416359C2966A20534EAB1A0313543964A377E' \
  -H 'timestamp: 1675927420173' \
  -H 'timezone: 7' \
  -H 'traceid: 21c14334-d9d1-428f-8848-1028bc205ab7' \
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
        echo $bingX | jq '.data.result[].rankStat.totalEarnings' >> totalEarnings.txt # Lợi nhuận trader
        echo $bingX | jq '.data.result[].rankStat.followerEarning' >> followerEarning.txt # Lợi nhuận người copy
        echo $bingX | jq '.data.result[].rankStat.maxDrawDown' >> maxDrawDown.txt # Mức âm tài khoản tối đa
        echo $bingX | jq '.data.result[].rankStat.strTotalEarningsRate' >> strTotalEarningsRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent7DaysRate' >> strRecent7DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent30DaysRate' >> strRecent30DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent90DaysRate' >> strRecent90DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.strRecent180DaysRate' >> strRecent180DaysRate.txt
        echo $bingX | jq '.data.result[].rankStat.winRate' >> winRate.txt # Tỉ lệ thắng
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
\&winRate==IMPORTDATA\(\"`$linkGit`echo winRate.txt\"\)\
\&avgProfitRate==IMPORTDATA\(\"`$linkGit`echo avgProfitRate.txt\"\)\
\&avgLossRate==IMPORTDATA\(\"`$linkGit`echo avgLossRate.txt\"\)\
\&totalTransactions==IMPORTDATA\(\"`$linkGit`echo totalTransactions.txt\"\)\
\&strFollowerNum==IMPORTDATA\(\"`$linkGit`echo strFollowerNum.txt\"\)\
\&tradeDays==IMPORTDATA\(\"`$linkGit`echo tradeDays.txt\"\)\
\&lastTradeTime==IMPORTDATA\(\"`$linkGit`echo lastTradeTime.txt\"\)\
`
echo $linkPost

