#!/bin/bash
git pull
: > accountID.txt
: > day.txt
: > daily_equity.txt
: > deposit_count.txt
: > withdrawal_count.txt
: > stopout_count.txt
: > deposit_amount.txt
: > withdrawal_amount.txt

while IFS= read -r line; do
  echo $line
  exness=`curl -s 'https://api.excalls.mobi/st/api/v1/managers/accounts/'$line'/daily_stats/?date_from=2023-02-10&date_to=2023-03-02&fields=daily_equity%2Cdeposit_count%2Cdeposit_amount%2Cwithdrawal_count%2Cwithdrawal_amount%2Cstopout_count'`
  echo $exness | jq '.result[].day' | xargs -I {} echo $line >> accountID.txt
  echo $exness | jq '.result[].day' >> day.txt
  echo $exness | jq '.result[].daily_equity' >> daily_equity.txt
  echo $exness | jq '.result[].deposit_count' >> deposit_count.txt
  echo $exness | jq '.result[].withdrawal_count' >> withdrawal_count.txt
  echo $exness | jq '.result[].stopout_count' >> stopout_count.txt
  echo $exness | jq '.result[].deposit_amount' >> deposit_amount.txt
  echo $exness | jq '.result[].withdrawal_amount' >> withdrawal_amount.txt
done < account-mobile.txt
  


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /copy/exness/`
linkApi=`echo https://script.google.com/macros/s/AKfycbxLVEWLJ4woVSv5SjVOFI4Caomw2w2n2YVluJ1zoA1CZgTMPW_VWy3j8NvYJYmwsDVLKg/exec?`
linkPost=$linkApi`echo accountID==IMPORTDATA\(\"`$linkGit`echo accountID.txt\"\)\
\&day==IMPORTDATA\(\"`$linkGit`echo day.txt\"\)\
\&daily_equity==IMPORTDATA\(\"`$linkGit`echo daily_equity.txt\"\)\
\&deposit_count==IMPORTDATA\(\"`$linkGit`echo deposit_count.txt\"\)\
\&withdrawal_count==IMPORTDATA\(\"`$linkGit`echo withdrawal_count.txt\"\)\
\&stopout_count==IMPORTDATA\(\"`$linkGit`echo stopout_count.txt\"\)\
\&deposit_amount==IMPORTDATA\(\"`$linkGit`echo deposit_amount.txt\"\)\
\&withdrawal_amount==IMPORTDATA\(\"`$linkGit`echo withdrawal_amount.txt\"\)\
`
echo '[InternetShortcut]\
URL='$linkPost > exness-mobile.url
open exness-mobile.url
