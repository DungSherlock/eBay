#!/bin/bash
# git pull
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
: > link.txt


for i in {1..1000}
do
    bybit=`curl 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo='$i'&dataDuration=DATA_DURATION_SEVEN_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'authority: api2.bybit.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'cookie: deviceId=1aeacd63-08fc-e509-cada-8f7d93a76dd0; _by_l_g_d=892e01be-ba01-67ef-08d7-26c04c9b0b93; BYBIT_REG_REF_prod={"lang":"vi","g":"892e01be-ba01-67ef-08d7-26c04c9b0b93","referrer":"www.google.com/","source":"google.com","medium":"other","url":"https://www.bybit.com/vi-VN/"}; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%2245615322%22%2C%22first_id%22%3A%221860ffced0ec0d-07b22e7e8f6a8b-4f69117f-1764000-1860ffced0fedb%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%2C%22_a_u_v%22%3A%220.0.5%22%7D%2C%22identities%22%3A%22eyIkaWRlbnRpdHlfY29va2llX2lkIjoiMTg2MGZmY2VkMGVjMGQtMDdiMjJlN2U4ZjZhOGItNGY2OTExN2YtMTc2NDAwMC0xODYwZmZjZWQwZmVkYiIsIiRpZGVudGl0eV9sb2dpbl9pZCI6IjQ1NjE1MzIyIn0%3D%22%2C%22history_login_id%22%3A%7B%22name%22%3A%22%24identity_login_id%22%2C%22value%22%3A%2245615322%22%7D%2C%22%24device_id%22%3A%221860ffced0ec0d-07b22e7e8f6a8b-4f69117f-1764000-1860ffced0fedb%22%7D; secure-token=eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYyNjg0NTMsInVzZXJfaWQiOjQ1NjE1MzIyLCJub25jZSI6IjQ1YmNiNmQzIiwiZ2VuX3RzIjoxNjc2MDA5MjUzLCJwIjozLCJucyI6IiIsImIiOjB9.KXgwbjvRP3hJrhA0icf8kFoT9-uw6uVtTF9fZaNzXoOv42VJtiDKribLWa8Seyqba0IXjU51eRMZ_QBRaVkTHw; b_t_c_k=eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYyNjg0NTMsInVzZXJfaWQiOjQ1NjE1MzIyLCJub25jZSI6IjQ1YmNiNmQzIiwiZ2VuX3RzIjoxNjc2MDA5MjUzLCJwIjozLCJucyI6IiIsImIiOjB9.KXgwbjvRP3hJrhA0icf8kFoT9-uw6uVtTF9fZaNzXoOv42VJtiDKribLWa8Seyqba0IXjU51eRMZ_QBRaVkTHw; BYBIT_REG_REF={"lang":"vi","g":"892e01be-ba01-67ef-08d7-26c04c9b0b93","referrer":"www.bybit.com/app/user/security","source":"bybit.com","medium":"other","url":"https://www.bybit.com/fiat/deposit"}; bm_sz=D06D73BFE10C3C80ACF0D77821CF3D53~YAAQlXoZuMB4zTCGAQAAaPTEOhI6dtR2aqfQyKDq1oIrYzOYQC6LKHo/IBAljU2br01FaJ9rm7HqlkAY5jUAKJrVJH/7fuIT13lt+U7JncKcnpOu0dHXp0ClnIFW7+Pr4wtPbZnjV/emZKF5v1dCc/wD6rQTmq/jq0YdkSLO6RmW8sR/l0HHdWqi/fJb3WjQpQALYJCdW4MsptOIV92CUg8CtivUUaXGc1qfRxRA+ARsxdJWNHBkceU3Msa/d4WrM3qbH/ub7JT/MrohyjIeEWXoiG8Xw310CNheFKMdLUHR/CkzqgaV17QFezoe4yYx2iTy5QubLtn+dg==~4404272~4342341; ak_bmsc=BA685DF0173D1EC286799F408C2392BD~000000000000000000000000000000~YAAQnnoZuKr5XSaGAQAApdI9OxKNQnRzlKVgZ5lzaP4FaHTZDpU08P/EaqCb6y18P8dpGeULDd17HoBC9Rus7nM/PCUybkzM4Pm/2mmdNT6y3pYl6KmzuB4oQhNPSn/+prrB6+NqQCGUppNh2hkIZwwWbg9Odm8TUaH2sVHiW4TokX/7WzaBs96MXzXkg4O+G1LRFGnVMK0TF9sT8MwgexVjhQ7qv0uQXgz3RfqKuhGQsRoetnae90T/oB+4OneY9SwCu/sfazjqH2SmkUyqk7HhluW5oKnWSMvQZOtxxTFa79P073YmKLxa4Qkey4S44eWtcM3xTs4p2G3aBYRdU73JeVvjx74F48tSx12I5O3Rk/0V18NtxBClgII9ULqfuBVQ04kPUg==; _abck=A5D5828B82A331D719EFD0B690B0F5B6~0~YAAQnnoZuFn6XSaGAQAAK+s9OwmDiZXx/RL4Q1sg3OcQsTtKKDrtbrVM1w+mPT1iYa8EU/mIqcwyaeqa4BBQ0F2yvzeWNiEaRk2IAc/76Yvw3OtEFjbagGtvv1On3vRkUCMXjq5ByjGl9Kw9W4E2xMmqe4QdkHlXQGa9alB4/KSxsuRlPpZJnWcMV2Yw7o02IGfSZk/fIVLVv6n0+a2/AfHnAxe/xMlZTadphMr8EVMqbNug5bYVJom0kaHkWjJkgPxFcl7BWRDGFnHtTc2VNuEBTk9Ba/9prTngPPqx4Fqz/mxdoslmWQHfsWbpdEirYmbwEkZtJHUqKEq2VnC9KuENN0F/sFlzPUmgI0dE5l2xdRl3ngHaOIHnvC5+zg==~-1~-1~-1; bm_sv=204151C6E763CA9F1EEC775B5F4B7FCF~YAAQnnoZuFr6XSaGAQAAK+s9OxLdbchcKWSjJAHxbgftf3FPNEgVaWWRCvezaB77GWZA+Wtnm0KErcbQNfTW3sc9BZzcXW/HQyNwTxZDPrPcxDdLPVVukHHbJE4gsM3jOSxKgqbXl0M9BQ5BsJjg0ydK9M0DwU1eDQY1iFZl95TZFp/p4gcyXwyI2CspIqgc5UvIrBwKnQncJFabkzkkXqh9bsNwfWDO+YD5g9CDnOLq1ymrKxDzi61cu5oWjqPC~1' \
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
        echo $bybit | jq '.result.leaderDetails[].leaderMark' | xargs -I {} echo "=HYPERLINK(\"https://www.bybit.com/copyTrade/trade-center/detail?leaderMark={}\")" >> leaderMark.txt        
        echo $bybit | jq '.result.leaderDetails[].yesterdayMaxFollowersNum' >> yesterdayMaxFollowersNum.txt
        echo $bybit | jq '.result.leaderDetails[].leaderLevel' | sed 's/.*LEVEL_/"/g' | sed 's/_.*/"/g' >> leaderLevel.txt
        echo $bybit | jq '.result.leaderDetails[].lastLeaderLevel' | sed 's/.*LEVEL_/"/g' | sed 's/_.*/"/g' >> lastLeaderLevel.txt
        echo $bybit | jq '.result.leaderDetails[].leaderLevelChangeTimeE3' >> leaderLevelChangeTimeE3.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[0]' | sed 's/+//g' >> ROI.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[1]' | sed 's/+//g' >> totalTradeProfit.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[2]' >> maxFollower.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[3]' | sed 's/+//g' >> totalAllFollowProfit.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[4]' | sed 's/+//g' >> WinRate.txt
        echo $bybit | jq '.result.leaderDetails[].metricValues[5]' >> stableScoreLevel.txt
    fi
done

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/bybit/`
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

