#!/bin/bash
git pull
: > account.txt
: > link.txt
: > name.txt
: > trading_time.txt
: > leverage.txt
: > risk_score.txt
: > commission.txt
: > profitability.txt
: > drawdown.txt
: > investors.txt
: > equity.txt
: > trading_period_start.txt
: > trading_period_end.txt


  total=`curl -s 'https://social-trading.exness.com/st/v1/managers/accounts/?drawdown__lt=100' \
-H 'content-type: application/json' \
-H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/111.0.1661.43' \
--compressed | jq '.total'`
  result=$(echo "$total / 30" | bc)
  echo $total


for i in $(seq 0 $result)
do
    exness=`curl -s 'https://social-trading.exness.com/st/v1/managers/accounts/?drawdown__lt=100&limit=30&offset='$((i*30))'' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.63' \
  --compressed`
    echo "page $i/$result"
    echo $exness | jq '.result[].account' >> account.txt
    echo $exness | jq '.result[].account' | xargs -I {} echo "=HYPERLINK(\"https://social-trading.exness.com/strategy/{}\")" >> link.txt
    echo $exness | jq '.result[].name' >> name.txt
    echo $exness | jq '.result[].trading_time' >> trading_time.txt
    echo $exness | jq '.result[].leverage' >> leverage.txt
    echo $exness | jq '.result[].risk_score' >> risk_score.txt
    echo $exness | jq '.result[].commission' >> commission.txt
    echo $exness | jq '.result[].profitability' >> profitability.txt
    echo $exness | jq '.result[].drawdown' >> drawdown.txt
    echo $exness | jq '.result[].investors' >> investors.txt
    echo $exness | jq '.result[].equity' >> equity.txt
    echo $exness | jq '.result[].trading_period.start' >> trading_period_start.txt
    echo $exness | jq '.result[].trading_period.end' >> trading_period_end.txt
done

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/exness/`
linkApi=`echo https://script.google.com/macros/s/AKfycby6z7gCg6QHCMx6iiGA7Ioc3IR7y7k0G5B_NgZWSWQpcEmI6iSUBAM0e0VQkyyVoe3KSQ/exec?`
linkPost=$linkApi`echo account==IMPORTDATA\(\"`$linkGit`echo account.txt\"\)\
\&link==IMPORTDATA\(\"`$linkGit`echo link.txt\"\)\
\&name==IMPORTDATA\(\"`$linkGit`echo name.txt\"\)\
\&trading_time==IMPORTDATA\(\"`$linkGit`echo trading_time.txt\"\)\
\&leverage==IMPORTDATA\(\"`$linkGit`echo leverage.txt\"\)\
\&risk_score==IMPORTDATA\(\"`$linkGit`echo risk_score.txt\"\)\
\&commission==IMPORTDATA\(\"`$linkGit`echo commission.txt\"\)\
\&profitability==IMPORTDATA\(\"`$linkGit`echo profitability.txt\"\)\
\&drawdown==IMPORTDATA\(\"`$linkGit`echo drawdown.txt\"\)\
\&investors==IMPORTDATA\(\"`$linkGit`echo investors.txt\"\)\
\&equity==IMPORTDATA\(\"`$linkGit`echo equity.txt\"\)\
\&trading_period_start==IMPORTDATA\(\"`$linkGit`echo trading_period_start.txt\"\)\
\&trading_period_end==IMPORTDATA\(\"`$linkGit`echo trading_period_end.txt\"\)\
`
echo $linkPost

