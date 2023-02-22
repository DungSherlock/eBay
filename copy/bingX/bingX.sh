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
: > profitCount.txt
: > avgProfitAmount.txt
: > avgProfitRate.txt
: > lossCount.txt
: > avgLossAmount.txt
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
  -H 'app_version: 4.60.3' \
  -H 'appid: 30004' \
  -H 'authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc3MzEzMDQ2fQ.KAVawYMl72Nj9i1qhsJfKZL9te7gkG5ggppFesHp8cb9hy0azoL47kdUlX5SbSfULFgMcFS9PXwTEq31mB-QWA' \
  -H 'channel: copychadingSEO' \
  -H 'content-type: application/json' \
  -H 'cookie: uuid=b47c0dce-fbf5-4b3b-926e-a1da81c5a417; kline_time_zone=8; locale=vi-vn; _bl_uid=7UlUXe9I6tIf7630t9vmtsaoI14j; fpw=login; __cf_bm=KKnPmdRsiTEKMfbFRTZ4Qx9v.K8Nrj5u05st.ZJFPMo-1677053806-0-AcWO+qVmfPoV9PruVTfttLuzCOHJgqzTzZLRQpECYby5f5QSJX0ID6LlHQTMYCZnLcZMFfxn8gmX9juaUCtkpkQ=; _cfuvid=UWFYzN21MX74VZoug1mbP.9m_HyqZWlR5bDk5tidKYY-1677053806193-0-604800000; __cfruid=0180ddedd9321d763371b0f1b3e2bad7c9ace1f0-1677053838; network_delay=89; uid=1075666965101678594; user_token=eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMDc1NjY2OTY1MTAxNjc4NTk0IiwiZXhwIjoxNjc3MzEzMDQ2fQ.KAVawYMl72Nj9i1qhsJfKZL9te7gkG5ggppFesHp8cb9hy0azoL47kdUlX5SbSfULFgMcFS9PXwTEq31mB-QWA; lastCheckSessionAt=1677053859898; tokenExpiredAt=1677097060936; showKo=0' \
  -H 'device_id: b47c0dce-fbf5-4b3b-926e-a1da81c5a417' \
  -H 'dnt: 1' \
  -H 'lang: vi-VN' \
  -H 'mainappid: 10009' \
  -H 'origin: https://bingx.com' \
  -H 'platformid: 30' \
  -H 'sec-ch-ua: "Chromium";v="110", "Not A(Brand";v="24", "Microsoft Edge";v="110"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sign: E8144AD7997DBBBC87DD05587B5B2E8E32CE4067E1CA28A40ABD33AC886C6EF2' \
  -H 'timestamp: 1677053924944' \
  -H 'timezone: 7' \
  -H 'traceid: 0526582f-d58c-4cbf-8add-1f02f0875a09' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.41' \
  -H 'visitorid: -1' \
  --data-raw '{"conditions":[{"key":"riskLevel","type":"range","min":1,"max":7,"value":0}],"nickName":""}' \
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
        echo $bingX | jq '.data.result[].rankStat.profitCount' >> profitCount.txt
        echo $bingX | jq '.data.result[].rankStat.avgProfitAmount' >> avgProfitAmount.txt
        echo $bingX | jq '.data.result[].rankStat.avgProfitRate' >> avgProfitRate.txt # Tỉ lệ lãi bình quân
        echo $bingX | jq '.data.result[].rankStat.lossCount' >> lossCount.txt
        echo $bingX | jq '.data.result[].rankStat.avgLossAmount' >> avgLossAmount.txt
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
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/bingX`
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
\&profitCount==IMPORTDATA\(\"`$linkGit`echo profitCount.txt\"\)\
\&avgProfitAmount==IMPORTDATA\(\"`$linkGit`echo avgProfitAmount.txt\"\)\
\&avgProfitRate==IMPORTDATA\(\"`$linkGit`echo avgProfitRate.txt\"\)\
\&lossCount==IMPORTDATA\(\"`$linkGit`echo lossCount.txt\"\)\
\&avgLossAmount==IMPORTDATA\(\"`$linkGit`echo avgLossAmount.txt\"\)\
\&avgLossRate==IMPORTDATA\(\"`$linkGit`echo avgLossRate.txt\"\)\
\&totalTransactions==IMPORTDATA\(\"`$linkGit`echo totalTransactions.txt\"\)\
\&strFollowerNum==IMPORTDATA\(\"`$linkGit`echo strFollowerNum.txt\"\)\
\&tradeDays==IMPORTDATA\(\"`$linkGit`echo tradeDays.txt\"\)\
\&lastTradeTime==IMPORTDATA\(\"`$linkGit`echo lastTradeTime.txt\"\)\
`
echo $linkPost

