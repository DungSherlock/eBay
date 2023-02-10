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


    totalPageCount=`curl -s 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo=1&dataDuration=DATA_DURATION_SEVEN_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  --compressed | jq '.result.totalPageCount' | sed 's/"//g'`
    echo $totalPageCount

for i in ${1..$totalPageCount}
do
    bybit7=`curl 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo='$i'&dataDuration=DATA_DURATION_SEVEN_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  --compressed`
    bybit30=`curl 'https://api2.bybit.com/fapi/beehive/public/v1/common/dynamic-leader-list?pageNo='$i'&dataDuration=DATA_DURATION_THIRTY_DAY&leaderTag=&code=&leaderLevel=&userTag=' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  --compressed`


    leaderDetails=`echo $bybit | jq '.result.leaderDetails[]'`

    if [ "$leaderDetails" == "" ]; then
        break
    else
        echo "page $i"
        echo $bybit7 | jq '.result.leaderDetails[].nickName' >> nickName.txt
        echo $bybit7 | jq '.result.leaderDetails[].leaderMark' | xargs -I {} echo "=HYPERLINK(\"https://www.bybit7.com/copyTrade/trade-center/detail?leaderMark={}\")" >> leaderMark.txt        
        echo $bybit7 | jq '.result.leaderDetails[].yesterdayMaxFollowersNum' >> yesterdayMaxFollowersNum.txt
        echo $bybit7 | jq '.result.leaderDetails[].leaderLevel' | sed 's/.*LEVEL_/"/g' | sed 's/_.*/"/g' >> leaderLevel.txt
        echo $bybit7 | jq '.result.leaderDetails[].lastLeaderLevel' | sed 's/.*LEVEL_/"/g' | sed 's/_.*/"/g' >> lastLeaderLevel.txt
        echo $bybit7 | jq '.result.leaderDetails[].leaderLevelChangeTimeE3' >> leaderLevelChangeTimeE3.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[0]' | sed 's/+//g' >> ROI.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[1]' | sed 's/+//g' >> totalTradeProfit.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[2]' >> maxFollower.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[3]' | sed 's/+//g' >> totalAllFollowProfit.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[4]' | sed 's/+//g' >> WinRate.txt
        echo $bybit7 | jq '.result.leaderDetails[].metricValues[5]' >> stableScoreLevel.txt
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

