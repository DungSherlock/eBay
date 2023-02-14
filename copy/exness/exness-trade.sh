#!/bin/bash
git pull
: > account.txt
: > order_id.txt
: > trade_type.txt
: > symbol.txt
: > size.txt
: > open_price.txt
: > open_datetime.txt
: > close_price.txt
: > close_datetime.txt
: > swap.txt
: > profit.txt

  total=`curl -s 'https://social-trading.exness.com/st/v1/managers/accounts/11103957/trade-history/?limit=100&offset=0' \
--compressed | jq '.total'`
  result=$(echo "$total / 100" | bc)
  echo $total


for i in $(seq 0 $result)
do
    exness=`curl -s 'https://social-trading.exness.com/st/v1/managers/accounts/11103957/trade-history/?limit=100&offset='$((i*100))'' \
  --compressed`
    echo "page $i/$result"
    echo $exness | jq '.result[].account' >> account.txt
    echo $exness | jq '.result[].order_id' >> order_id.txt
    echo $exness | jq '.result[].trade_type' >> trade_type.txt
    echo $exness | jq '.result[].symbol' >> symbol.txt
    echo $exness | jq '.result[].size' >> size.txt
    echo $exness | jq '.result[].open_price' >> open_price.txt
    echo $exness | jq '.result[].open_datetime' >> open_datetime.txt
    echo $exness | jq '.result[].close_price' >> close_price.txt
    echo $exness | jq '.result[].close_datetime' >> close_datetime.txt
    echo $exness | jq '.result[].swap' >> swap.txt
    echo $exness | jq '.result[].profit' >> profit.txt
done

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/exness/`
linkApi=`echo https://script.google.com/macros/s/AKfycbyTRMWsggWDM5fE4F7EUBnbb6_b4nyeicD6ABJnKBfGnyg14e1R_if3FPOTPmIvv1BIUA/exec?`
linkPost=$linkApi`echo account==IMPORTDATA\(\"`$linkGit`echo account.txt\"\)\
\&order_id==IMPORTDATA\(\"`$linkGit`echo order_id.txt\"\)\
\&trade_type==IMPORTDATA\(\"`$linkGit`echo trade_type.txt\"\)\
\&symbol==IMPORTDATA\(\"`$linkGit`echo symbol.txt\"\)\
\&size==IMPORTDATA\(\"`$linkGit`echo size.txt\"\)\
\&open_price==IMPORTDATA\(\"`$linkGit`echo open_price.txt\"\)\
\&open_datetime==IMPORTDATA\(\"`$linkGit`echo open_datetime.txt\"\)\
\&close_price==IMPORTDATA\(\"`$linkGit`echo close_price.txt\"\)\
\&close_datetime==IMPORTDATA\(\"`$linkGit`echo close_datetime.txt\"\)\
\&swap==IMPORTDATA\(\"`$linkGit`echo swap.txt\"\)\
\&profit==IMPORTDATA\(\"`$linkGit`echo profit.txt\"\)\
`
echo $linkPost

