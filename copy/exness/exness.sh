#!/bin/bash
# git pull
: > nickName.txt



    total=`curl -s 'https://social-trading.exness.com/st/v1/managers/accounts/?drawdown__lt=100' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54' \
  --compressed | jq '.total'`
    result=$(echo "$total / 34" | bc)
    echo $total


for i in $(seq 1 $result)
do
    exness=`curl -s 'https://social-trading.exness.com/st/v1/managers/accounts/?drawdown__lt=100&limit=34&offset='($i*34)'' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.41' \
  --compressed`
    echo $((i*34))
    echo "page $i/$result"
    echo $exness | jq '.result[].account' >> account.txt
    echo $exness | jq '.result[].name' >> name.txt
    echo $exness | jq '.result[].trading_time' >> trading_time.txt
    echo $exness | jq '.result[].leverage' >> leverage.txt
    echo $exness | jq '.result[].risk_score' >> risk_score.txt
    echo $exness | jq '.result[].commission' >> commission.txt
    echo $exness | jq '.result[].profitability' >> profitability.txt
    echo $exness | jq '.result[].drawdown' >> drawdown.txt
    echo $exness | jq '.result[].investors' >> investors.txt
    echo $exness | jq '.result[].equity' >> equity.txt
    echo $exness | jq '.result[].trading_period' >> trading_period.txt
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

