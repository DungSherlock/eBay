#!/bin/bash
# git pull
: > nickName.txt
: > uid.txt
: > equity.txt
: > totalEarnings.txt
: > followerEarning.txt
: > maxDrawDown.txt
: > winRate.txt
: > totalTransactions.txt

for i in {0..11}
do
    bingX=`curl 'https://bingx.com/api/v5/copy-trade/search/search?pageSize=6&pageId='$i'&order=desc&sort=equity' \
  -H 'authority: bingx.com' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: vi' \
  -H 'app_version: 4.58.41' \
  -H 'appid: 30004' \
  -H 'authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc1NzQ0MjEzfQ.__Pm9K8Smg-PhHOWl49XAfNWrX30VAwH6oXBA7lNJDWndr9fqJPGYH0JlS6lNSkJWAaZxzO8d0qfeT_-w9wwKQ' \
  -H 'channel: copychadingSEO' \
  -H 'content-type: application/json' \
  -H 'cookie: uuid=b47c0dce-fbf5-4b3b-926e-a1da81c5a417; __cfruid=bf3b3bde847242aa3005005a7be47b05f043f1a0-1675484998; uid=1075666965101678594; fpw=login; user_token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc1NzQ0MjEzfQ.__Pm9K8Smg-PhHOWl49XAfNWrX30VAwH6oXBA7lNJDWndr9fqJPGYH0JlS6lNSkJWAaZxzO8d0qfeT_-w9wwKQ; showKo=0; kline_time_zone=8; locale=vi-vn; _cfuvid=hzxEDpyYIXNWW5XZQiANX.RIRD5_BnFgsxpARVbmqo4-1675592673706-0-604800000; lastCheckSessionAt=1675611175846; tokenExpiredAt=1675654376461; showKo=0; __cf_bm=uagwmm4cWKicBgWu8d3CrhNpktvNn_kfft6yX5fCcnE-1675611298-0-AVRMtk09cHQ0jhlSmiDLfNT9/24z5xnIXkMxhwPraaIU2OknZdI1voHdGUeePLZR9hjAI/hp17s98DVFgrZUB5o=; network_delay=110' \
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
  -H 'sign: 505531016FF2E318A1D6F416600EB0E096F5AD5268A7AF8602F8ACC196E3B514' \
  -H 'timestamp: 1675611365300' \
  -H 'timezone: 7' \
  -H 'traceid: 9c4b04ea-16d9-4487-b2f8-969ba582d251' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  -H 'visitorid: -1' \
  --data-raw '{"conditions":[{"key":"equity","type":"range","min":1000,"value":0},{"key":"riskLevel","type":"range","min":1,"max":4,"value":0}],"nickName":""}' \
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
        echo $bingX | jq '.data.result[].rankStat.totalTransactions' >> totalTransactions.txt # Tổng các lệnh giao dịch

    fi
done

# git add -A .
# git commit -m --allow-empty
# git push
# git push origin HEAD -f
# gitCommit=`git rev-parse HEAD`
# linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
# linkApi=`echo https://script.google.com/macros/s/AKfycbzsiGXaclu6CAFaAAQEIuR7io8UuGMP1jNM_flgD5uWrv8P4rIlhabx4B3AOdZ7kKw/exec?`
# linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
# echo $linkPost

