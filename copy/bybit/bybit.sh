#!/bin/bash
git pull
: > nickName.txt
: > leaderMark.txt
: > yesterdayMaxFollowersNum.txt
: > leaderLevel.txt
: > lastLeaderLevel.txt
: > leaderLevelChangeTimeE3.txt
: > maxFollower.txt
: > ROI7.txt
: > totalTradeProfit7.txt
: > totalAllFollowProfit7.txt
: > WinRate7.txt
: > stableScoreLevel7.txt
: > ROI30.txt
: > totalTradeProfit30.txt
: > totalAllFollowProfit30.txt
: > WinRate30.txt
: > stableScoreLevel30.txt
: > ROI90.txt
: > totalTradeProfit90.txt
: > totalAllFollowProfit90.txt
: > WinRate90.txt
: > stableScoreLevel90.txt


    totalPageCount=`curl -s 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo=1&dataDuration=DATA_DURATION_SEVEN_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188' \
  --compressed | jq '.result.totalPageCount' | sed 's/"//g'`

for i in $(seq 1 $totalPageCount)
do
    bybit7=`curl -s 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo='$i'&dataDuration=DATA_DURATION_SEVEN_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188' \
  --compressed`
    bybit30=`curl -s 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo='$i'&dataDuration=DATA_DURATION_THIRTY_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188' \
  --compressed`
    bybit90=`curl -s 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo='$i'&dataDuration=DATA_DURATION_NINETY_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188' \
  --compressed`

    # leaderDetails=`echo $bybit7 | jq '.result.leaderDetails[]'`

    # if [ "$leaderDetails" == "" ]; then
    #     break
    # else
        echo "page $i/$totalPageCount"
        echo $bybit7 | jq '.result.leaderDetails[].nickName' >> nickName.txt
        echo $bybit7 | jq '.result.leaderDetails[].leaderMark' | xargs -I {} echo "=HYPERLINK(\"https://www.bybit.com/copyTrade/trade-center/detail?leaderMark={}\")" >> leaderMark.txt        
        echo $bybit7 | jq '.result.leaderDetails[].yesterdayMaxFollowersNum' >> yesterdayMaxFollowersNum.txt
        echo $bybit7 | jq '.result.leaderDetails[].leaderLevel' | sed 's/.*LEVEL_/"/g' | sed 's/_.*/"/g' >> leaderLevel.txt
        echo $bybit7 | jq '.result.leaderDetails[].lastLeaderLevel' | sed 's/.*LEVEL_/"/g' | sed 's/_.*/"/g' >> lastLeaderLevel.txt
        echo $bybit7 | jq '.result.leaderDetails[].leaderLevelChangeTimeE3' >> leaderLevelChangeTimeE3.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[2]' | sed 's/\//,/g' | sed 's/"//g' >> maxFollower.txt

        echo $bybit7 | jq '.result.leaderDetails[].metricValues[0]' | sed 's/+//g' >> ROI7.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[1]' | sed 's/+//g' >> totalTradeProfit7.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[3]' | sed 's/+//g' >> totalAllFollowProfit7.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[4]' | sed 's/+//g' >> WinRate7.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[5]' >> stableScoreLevel7.txt

        echo $bybit30 | jq '.result.leaderDetails[].metricValues[0]' | sed 's/+//g' >> ROI30.txt
        echo $bybit30 | jq '.result.leaderDetails[].metricValues[1]' | sed 's/+//g' >> totalTradeProfit30.txt
        echo $bybit30 | jq '.result.leaderDetails[].metricValues[3]' | sed 's/+//g' >> totalAllFollowProfit30.txt
        echo $bybit30 | jq '.result.leaderDetails[].metricValues[4]' | sed 's/+//g' >> WinRate30.txt
        echo $bybit30 | jq '.result.leaderDetails[].metricValues[5]' >> stableScoreLevel30.txt

        echo $bybit90 | jq '.result.leaderDetails[].metricValues[0]' | sed 's/+//g' >> ROI90.txt
        echo $bybit90 | jq '.result.leaderDetails[].metricValues[1]' | sed 's/+//g' >> totalTradeProfit90.txt
        echo $bybit90 | jq '.result.leaderDetails[].metricValues[3]' | sed 's/+//g' >> totalAllFollowProfit90.txt
        echo $bybit90 | jq '.result.leaderDetails[].metricValues[4]' | sed 's/+//g' >> WinRate90.txt
        echo $bybit90 | jq '.result.leaderDetails[].metricValues[5]' >> stableScoreLevel90.txt

    # fi
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
\&maxFollower==IMPORTDATA\(\"`$linkGit`echo maxFollower.txt\"\)\
\&ROI7==IMPORTDATA\(\"`$linkGit`echo ROI7.txt\"\)\
\&totalTradeProfit7==IMPORTDATA\(\"`$linkGit`echo totalTradeProfit7.txt\"\)\
\&totalAllFollowProfit7==IMPORTDATA\(\"`$linkGit`echo totalAllFollowProfit7.txt\"\)\
\&WinRate7==IMPORTDATA\(\"`$linkGit`echo WinRate7.txt\"\)\
\&stableScoreLevel7==IMPORTDATA\(\"`$linkGit`echo stableScoreLevel7.txt\"\)\
\&ROI30==IMPORTDATA\(\"`$linkGit`echo ROI30.txt\"\)\
\&totalTradeProfit30==IMPORTDATA\(\"`$linkGit`echo totalTradeProfit30.txt\"\)\
\&totalAllFollowProfit30==IMPORTDATA\(\"`$linkGit`echo totalAllFollowProfit30.txt\"\)\
\&WinRate30==IMPORTDATA\(\"`$linkGit`echo WinRate30.txt\"\)\
\&stableScoreLevel30==IMPORTDATA\(\"`$linkGit`echo stableScoreLevel30.txt\"\)\
\&ROI90==IMPORTDATA\(\"`$linkGit`echo ROI90.txt\"\)\
\&totalTradeProfit90==IMPORTDATA\(\"`$linkGit`echo totalTradeProfit90.txt\"\)\
\&totalAllFollowProfit90==IMPORTDATA\(\"`$linkGit`echo totalAllFollowProfit90.txt\"\)\
\&WinRate90==IMPORTDATA\(\"`$linkGit`echo WinRate90.txt\"\)\
\&stableScoreLevel90==IMPORTDATA\(\"`$linkGit`echo stableScoreLevel90.txt\"\)\
`
echo $linkPost

