#!/bin/bash
git pull
: > nickName.txt
: > leaderMark.txt
: > yesterdayMaxFollowersNum.txt
: > leaderLevel.txt
: > lastLeaderLevel.txt
: > leaderLevelChangeTimeE3.txt
: > ROI.txt
: > totalTradeProfit.txt
: > maxFollower.txt
: > totalAllFollowProfit.txt
: > WinRate.txt
: > stableScoreLevel.txt


for i in {0..1000}
do
    bybit=`curl 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?timeStamp=1676015594891&pageNo='$i'&pageSize=16&dataDuration=DATA_DURATION_SEVEN_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'authority: api2.bybit.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'cookie: deviceId=1aeacd63-08fc-e509-cada-8f7d93a76dd0; _by_l_g_d=892e01be-ba01-67ef-08d7-26c04c9b0b93; BYBIT_REG_REF_prod={"lang":"vi","g":"892e01be-ba01-67ef-08d7-26c04c9b0b93","referrer":"www.google.com/","source":"google.com","medium":"other","url":"https://www.bybit.com/vi-VN/"}; bm_sz=F84E6FB714506222D2EAA6070A018F65~YAAQnnoZuJGXWCaGAQAArQLtORIYOyv7qyKUSwQOZQLo+8JJiYRx2FfFFrYluKeZJrKT/uFcwoQpFNJsDFMY6ELRqyqlRR4SlEfMBlmUX3FJlQCm4+mHDmMRAw6B4NkaZ7oZxnqQsBcn9uYqImLoEhFk4+SvvMcBHoBqnrEFo9ya7nsYDnY0ZYOmtQxFjN8KBq/W4g2HrAWN+tw/gA0a9EjmxUhE7aV/GJRD1SKFH0JEgQr++hTWUvTV29mVk6/CRJf5aIFnerCxYi/WjCyKtdcvZgjuH9TYbLhNKDKITNb8xw==~4272944~3420985; bm_mi=ABF59DC13D8A9D28EEF88A6530524CC8~YAAQnnoZuMGaWCaGAQAAOgjuORJ2awEi1Y3XHLbl3f60tm4I1mvAyKvXyrogisdwL+Ovtsn8Kal7jEaLJXMMlg9RAVJ/h4j/CS6jZF7Bpd5M28FalFEnEKZQh5ZUccLus05Salovmeluitwj4tO0Kn81nDWmEdjuzE4TMO4nyrxatkQ9QcBnwWVjpjV2t/R3LsL8GK+R/p+vKBHELZMA217e4HFgZ4d/86BWgoYZTN2VfCLBao2CRjlbHxg/pMk2g8+VmBlZBrlHXYIW7L3sy3lbbJILJ5CALSNefPnei62RnItogNSohCPpLGhsR77RI9s=~1; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%2245615322%22%2C%22first_id%22%3A%221860ffced0ec0d-07b22e7e8f6a8b-4f69117f-1764000-1860ffced0fedb%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%2C%22_a_u_v%22%3A%220.0.5%22%7D%2C%22identities%22%3A%22eyIkaWRlbnRpdHlfY29va2llX2lkIjoiMTg2MGZmY2VkMGVjMGQtMDdiMjJlN2U4ZjZhOGItNGY2OTExN2YtMTc2NDAwMC0xODYwZmZjZWQwZmVkYiIsIiRpZGVudGl0eV9sb2dpbl9pZCI6IjQ1NjE1MzIyIn0%3D%22%2C%22history_login_id%22%3A%7B%22name%22%3A%22%24identity_login_id%22%2C%22value%22%3A%2245615322%22%7D%2C%22%24device_id%22%3A%221860ffced0ec0d-07b22e7e8f6a8b-4f69117f-1764000-1860ffced0fedb%22%7D; bm_sv=11C732C37DE65106A678BFAB8EA62E27~YAAQnnoZuLubWCaGAQAAZUXuORLFBqpKJtmBsBmNAarTVtdonaCZe+tEK8f7VtEUEUym4WLhietXkkdjt1tD875DYpgjYuccphcEO8uounoFTl3/cr+NwZNMyov8je1FHsutmk9qgEURbxdXHGiPXD1a6060of1ZoZ/Zk8/2HoK6zI0wUQZE2NYb1ARucfEqTaa8ZdsrFBCyXeC0Nzt6vnnqT02yQaAcA6WY+TW4rgCM/EXFiP1tR+vuGd4e9fLg~1; ak_bmsc=A742BAFA1296E87A0C55D611053CA4A1~000000000000000000000000000000~YAAQnnoZuLybWCaGAQAAeEXuORLp1TpR2FXRgP13gkpsuPZcFJWjCcrOCtPAjpvaVVMDeKqW0JmihFvmPiNueMu9D5309dXJ+PUIo62iSaP6ndD2pqO5GLswJ4msOZFvIcREoFed1D7EbS+rs7bFVqDVu9Go5LbiccrpaOLD5viIYhvRGBcsljDkPxNMna3UKyqnEBUheWPkrwRgHR4iT+NADwV595whe2TC/Y/rU1/JCEfOa9uv8ZOYXJHhtgQ02FHlhJrBNC2nOGWdY8+UacTYKUnlH5PpCn87ijuNwxYv7zXxW+XAw2vhSEqZKD7RA/zsqF3xKEpocmhYF9ohXaAywEWchInoADdtIAOKEY5XAh85P55iQkqRq9Cs2tYgqv5VqNE+Q7UNP96FIPfkOeSBJdsPZ0sh94lsqaCDK2OuF8sy; secure-token=eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYyNjg0NTMsInVzZXJfaWQiOjQ1NjE1MzIyLCJub25jZSI6IjQ1YmNiNmQzIiwiZ2VuX3RzIjoxNjc2MDA5MjUzLCJwIjozLCJucyI6IiIsImIiOjB9.KXgwbjvRP3hJrhA0icf8kFoT9-uw6uVtTF9fZaNzXoOv42VJtiDKribLWa8Seyqba0IXjU51eRMZ_QBRaVkTHw; _abck=A5D5828B82A331D719EFD0B690B0F5B6~0~YAAQnnoZuAygWCaGAQAApqrvOQlIJFLAMXkTXVGA9ICPKnRTvVBh4oUPOp70dtzT8PC9N511IFmyttTbHrGBKBeId+xSC/WIl2z3S557Cs+6ny114kZPRLTtQlBABpEpSe7kfqp4zDxG+n9Q0Xooqo0yglRV6UaTGOHNE50DPkyvR14YrklIm9eC6BJUH6wgOBUnC1QQJkOETaXz4S7znGXSIUUIti+yTXTFPjwnzdb4GKxNkWZUrkvLTW8/rDVJI1Kv0zs7qtcsiCeHYeetrD97QZkCooTnLTv55xc92vSaa2Q+HmxZ1plLm+x9ExTV9XFNdvZS7Z4tS809yxa79hnaKLL7Qk5V1ggcHJxw4FQzWDwhjxUCDME7WegcWDM8vDo1FWBS4EiONSA7DAzeZQfP6JVf7fY/~-1~-1~-1; b_t_c_k=eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYyNjg0NTMsInVzZXJfaWQiOjQ1NjE1MzIyLCJub25jZSI6IjQ1YmNiNmQzIiwiZ2VuX3RzIjoxNjc2MDA5MjUzLCJwIjozLCJucyI6IiIsImIiOjB9.KXgwbjvRP3hJrhA0icf8kFoT9-uw6uVtTF9fZaNzXoOv42VJtiDKribLWa8Seyqba0IXjU51eRMZ_QBRaVkTHw; BYBIT_REG_REF={"lang":"vi","g":"892e01be-ba01-67ef-08d7-26c04c9b0b93","referrer":"www.bybit.com/app/user/security","source":"bybit.com","medium":"other","url":"https://www.bybit.com/fiat/deposit"}' \
  -H 'distinctid: 45615322' \
  -H 'dnt: 1' \
  -H 'lang: vi-vn' \
  -H 'origin: https://www.bybit.com' \
  -H 'platform: pc' \
  -H 'referer: https://www.bybit.com/' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Microsoft Edge";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  -H 'usertoken: eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYyNjg0NTMsInVzZXJfaWQiOjQ1NjE1MzIyLCJub25jZSI6IjQ1YmNiNmQzIiwiZ2VuX3RzIjoxNjc2MDA5MjUzLCJwIjozLCJucyI6IiIsImIiOjB9.KXgwbjvRP3hJrhA0icf8kFoT9-uw6uVtTF9fZaNzXoOv42VJtiDKribLWa8Seyqba0IXjU51eRMZ_QBRaVkTHw' \
  --compressed`

    leaderDetails=`echo $bybit | jq '.result.leaderDetails[]'`

    if [ "$leaderDetails" == "" ]; then
        break
    else
        echo "page $i"
        echo $bybit | jq '.result.leaderDetails[].nickName' >> nickName.txt
        echo $bybit | jq '.result.leaderDetails[].leaderMark' >> leaderMark.txt
        echo $bybit | jq '.result.leaderDetails[].leaderLevel' >> leaderLevel.txt
        echo $bybit | jq '.result.leaderDetails[].lastLeaderLevel' >> lastLeaderLevel.txt
        echo $bybit | jq '.result.leaderDetails[].leaderLevelChangeTimeE3' >> leaderLevelChangeTimeE3.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[0]' >> ROI.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[1]' >> totalTradeProfit.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[2]' >> maxFollower.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[3]' >> totalAllFollowProfit.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[4]' >> WinRate.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[5]' >> stableScoreLevel.txt


        # echo $bybit | jq '.data.result[].trader.uid' | xargs -I {} echo \'{} >> uid.txt
        # echo $bybit | jq '.data.result[].trader.nickName' | xargs -I {} echo "=HYPERLINK(\"https://bybit.com/vi-vn/traders/?from=5&search={}\")" | sed 's/,/ /g' >> link.txt
        # echo $bybit | jq '.data.result[].rankStat.disPlayName' >> disPlayName.txt # Tên hợp đồng
        # echo $bybit | jq '.data.result[].rankStat.equity' >> equity.txt # Vốn
        # echo $bybit | jq '.data.result[].rankStat.totalEarnings' | sed 's/+//g' >> totalEarnings.txt # Lợi nhuận trader

    fi
done

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/`
linkApi=`echo https://script.google.com/macros/s/AKfycbzqe1xUYUS3DMYILrf4gi0r3jlf5rok46Yvx_2BSVEu_p_oVj5hdv3q-YXoMUG-N7HB/exec?`
linkPost=$linkApi`echo nickName==IMPORTDATA\(\"`$linkGit`echo nickName.txt\"\)\
\&leaderMark==IMPORTDATA\(\"`$linkGit`echo leaderMark.txt\"\)\
\&yesterdayMaxFollowersNum==IMPORTDATA\(\"`$linkGit`echo yesterdayMaxFollowersNum.txt\"\)\
\&leaderLevel==IMPORTDATA\(\"`$linkGit`echo leaderLevel.txt\"\)\
\&lastLeaderLevel==IMPORTDATA\(\"`$linkGit`echo lastLeaderLevel.txt\"\)\
\&leaderLevelChangeTimeE3==IMPORTDATA\(\"`$linkGit`echo leaderLevelChangeTimeE3.txt\"\)\
\&ROI==IMPORTDATA\(\"`$linkGit`echo ROI.txt\"\)\
\&totalTradeProfit==IMPORTDATA\(\"`$linkGit`echo totalTradeProfit.txt\"\)\
\&maxFollower==IMPORTDATA\(\"`$linkGit`echo maxFollower.txt\"\)\
\&totalAllFollowProfit==IMPORTDATA\(\"`$linkGit`echo totalAllFollowProfit.txt\"\)\
\&WinRate==IMPORTDATA\(\"`$linkGit`echo WinRate.txt\"\)\
\&stableScoreLevel==IMPORTDATA\(\"`$linkGit`echo stableScoreLevel.txt\"\)\
`
echo $linkPost

