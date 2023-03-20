#!/bin/bash
git pull
# : > currency.txt
# : > margin.txt
: > pip_value.txt
# : > swap_long.txt
# : > swap_short.txt
: > spread_pro.txt
: > commission_pro.txt
: > spread_zero.txt
: > commission_zero.txt


while IFS= read -r line; do
  echo $line
  pro=`curl -s 'https://pwapi.ex2b.com/' \
-H 'content-type: application/json' \
--data-raw $'{"operationName":"Calculate","variables":{"input":{"account_type":"mt5_classic_real_vc","instrument":"'$line'","currency":"USD","leverage":200,"lot":1}},"query":"mutation Calculate($input: CalculationInput\u0021) {\\n  calculate(input: $input) {\\n    pip_value\\n    spread\\n    commission\\n    __typename\\n  }\\n}"}' \
--compressed`
  zero=`curl -s 'https://pwapi.ex2b.com/' \
-H 'content-type: application/json' \
--data-raw $'{"operationName":"Calculate","variables":{"input":{"account_type":"mt5_zero_real_vc","instrument":"'$line'","currency":"USD","leverage":200,"lot":1}},"query":"mutation Calculate($input: CalculationInput\u0021) {\\n  calculate(input: $input) {\\n    pip_value\\n    spread\\n    commission\\n    __typename\\n  }\\n}"}' \
--compressed`
  echo $pro | jq '.data.calculate.pip_value' >> pip_value.txt
  echo $pro | jq '.data.calculate.spread' >> spread_pro.txt
  echo $pro | jq '.data.calculate.commission' >> commission_pro.txt
  echo $zero | jq '.data.calculate.spread' >> spread_zero.txt
  echo $zero | jq '.data.calculate.commission' >> commission_zero.txt
done < list-fx.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbyg9KwvDN1B_jwX83fWpoXnQCXF43_fFSgP4T_b75KOrKdnkW5HyCSne_HzT4Ch9Wk-Ew/exec?`
linkPost=$linkApi`echo ItemID==IMPORTDATA\(\"`$linkGit`echo \
\&pip_value==IMPORTDATA\(\"`$linkGit`echo pip_value.txt\"\)\
\&spread_pro==IMPORTDATA\(\"`$linkGit`echo spread_pro.txt\"\)\
\&commission_pro==IMPORTDATA\(\"`$linkGit`echo commission_pro.txt\"\)\
\&spread_zero==IMPORTDATA\(\"`$linkGit`echo spread_zero.txt\"\)\
\&commission_zero==IMPORTDATA\(\"`$linkGit`echo commission_zero.txt\"\)\
`
echo '[InternetShortcut]\
URL='$linkPost > fx.url
open fx.url
