#!/bin/bash
git pull
: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

while read line
do
  array=(${line//|/ })
  while true
  do
  list=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'cookie: auth=MTAyOTYyMDE4whWVgg30Og%2FYhAKxhRVNTYp5nLDWeNGOEj6D%2Fi5kupb4lCSEG6SxUMxYCeZe6WKtc2jpXz1BG1IC5KLud2J8Q%2BQ6tFJ%2B%2BBgem8OsdlKwGaAusveA%2BTbnYz%2BRTq%2BY31dA767wuZloTfhm7Wk2KcjygglTqinKgSpV0hco0QKmh1BnfzO4V5EqvTDv0o9iNjZVr63ayNZpwJqNPep%2BV%2BWe%2Fo7t3jS6mnrTxi6kXuWGvm0UMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrnSQySa0y4qPoXBl3BS2csVJJ30qDmjUartcsuV4ZslwSb5GX8hg%2BGur88Iukd14webYF13lyqvN5%2FoPNwE5nCmFdkoX%2F5E649TIVeJpXOEw%2BhG92LSVHLjbEzuAQVIaESQzX7MAlLBJXxL%2Bwi6fx6Y%3D; ACID=ddeec1e6-7fa4-4a42-8400-99f8cdafb93b; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=WowydB0Yc30g3-XFmrPK9I; bstc=WowydB0Yc30g3-XFmrPK9I; mobileweb=0; xpa=-wnVY|0t4gT|1oQfl|4NCWH|4z-gR|7qRDz|8wp7a|A7sVv|DAwQd|Ecx7k|HF4Pf|HmBmS|Hv6FZ|IJVMl|J8ZPQ|JVe4Z|M4FdN|MfFwr|NeQqX|NoJl6|ObD24|OmAEG|UBwCK|V-nnO|_hSAz|bstaQ|cfVAR|duBe9|eWARP|esP9X|fAqJv|gKUSD|gVG-b|hGNr-|kFqfr|l9g7n|mrxWN|qyn67|rdfjX|tMxiN|vk3k1|xCzID; exp-ck=0t4gT11oQfl14NCWH18wp7a2A7sVv3DAwQd3Ecx7k1HF4Pf1IJVMl1JVe4Z1MfFwr3UBwCK3V-nnO1_hSAz1eWARP1fAqJv1gKUSD2gVG-b1hGNr-1kFqfr1qyn672tMxiN1; helpgql=1; TS01b0be75=01538efd7c2b90edeba08f7e201b61c1ea546ac1a340bbe3fe916e3c375d4e2b4e6382d88e28b24158e024b6eaebdb45bd3d3f2821; TS013ed49a=01538efd7c2b90edeba08f7e201b61c1ea546ac1a340bbe3fe916e3c375d4e2b4e6382d88e28b24158e024b6eaebdb45bd3d3f2821; pxcts=fbe9b689-f10e-11ec-a627-446352415258; _pxvid=fbe9a7fa-f10e-11ec-a627-446352415258; _pxff_cfp=1; TBV=7; xpm=1%2B1655780718%2BWowydB0Yc30g3-XFmrPK9I~%2B0; ak_bmsc=D4C07EA57D733391B20F57BAF35801FB~000000000000000000000000000000~YAAQlQqrcWpyZDuBAQAAkMA4hBCKAsGYYtFQptyhZHs+S5QUURTgwpYsB4TATA2DactRaJ3mD88cY0q/TqdfGzEOwpc+w4iJBTA3NfXIGsFrIYE/fzvZ/DOAXzoc4pQdC0PbRwo4gZyvTFbgGcT1J0IuZ/42A7PkTuBOCihVOjC8zzeCgLrfd0brai8ko1TRfprCoZvjnX99/UJ2rxXD4Bkh86ejpvx71qgXRqy304eZmjuuAEQ1q8cGKXx3DeXMtfULv6eBL2w0fSA2GKVQ06bgusOFbdPqvb2VzkeFllIg4/erPW04dVYI1O2Yw7+zw7NgJeS8llWwuld5DZ8aQqtHT0k1041l4W1jTfJDwurtI18sIRtrSV9NvkU/wUwZ8dr2CfFBhcvJXvgY+JQrnPASE06hLXqmvi8QXney514KIN5xtmNxcCidD2lzwRhDwARAn0bNZ2hfTagxU00HQss2e5gniPOgqpMPvMAdKqbqNYklTXLmUOjnSrYH; tb_sw_supported=true; _px3=847f334f2ab6a845a048b24eb57f4d49c2e6d5cbd1e9d2fde61a09c5e1011e89:oIIu+gsEEuT0ETvPgfqaD7DmfxTLi5rVPZyabyuALMb4smNDkBvevw94dlOEIKLm9A/WQ5e/AcIeiL9sqE5HQw==:1000:9a0iI/qt6wE6zEYm+Bkjxdu4buxroctbJ7gywE4IwevAXmuAf5+ks1Y7A7Q3Oui/5WMc0LFo8mADlAbxkLIBA+l9pBIWq+kHPAJ778rJr6na8uCK+77Fft1Im3k8eBV2rKhqzdVfB5ukNLVfY/FoOBTQF+pRXWJYYbjLO8iQUH4l3eqTS6EMeCFfD0L5Ib5Is+6o8CIxXmiA1fnfMYqWJQ==; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjMwODEiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjU1ODAyMzIwNjkyLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6ZGRlZWMxZTYtN2ZhNC00YTQyLTg0MDAtOTlmOGNkYWZiOTNiIn0%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjU1NzgwNzIwNjc5fSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NTU3ODA3MjA2NzksImJhc2UiOiI5NTgyOSJ9LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6ZGRlZWMxZTYtN2ZhNC00YTQyLTg0MDAtOTlmOGNkYWZiOTNiIn0%3D; QuantumMetricSessionID=95a84a94ffe4e1ecc1de5e4414a9ba25; QuantumMetricUserID=97fb39fc02886538538069e540372fe9; TB_SFOU-100=1; xptwg=1686113300:7459D07F799C30:12DCE1A:F3CA64F8:EC178057:1FE799D1:; bm_sv=09EE76DB54174B22D36DDC74C0E740A1~YAAQlQqrcd5yZDuBAQAA0+Y4hBCD4VYjb0Q+2f5PEb2zmdaTE49upmnShKIXjKQe5i6FawrwRG17pxbDaZSTXTJcsjfiPuMST1l1YJBJyeg/voM9jBY8HcrfKVaBsZP2KcRxQryYSRthvp2KjhT00nzNApfE494maOrx5Yal80WFrQKcU+FuDi23MZGk2SKAkHeyhOjgk8BOFpuilK/Dg1AzkdvFh829zseJRx0aDNOI1bmHLCwzSICsEpPUHjjIyw==~1; _astc=5e51f6846200c173a1792bccbb4872f4' \
  -H 'device_profile_ref_id: OwWj_p7I2Vc6AxA6VD_eYwyYziYtoOaS25XZ' \
  -H 'dnt: 1' \
  -H 'origin: https://www.walmart.com' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/${array[1]}' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="101", "Microsoft Edge";v="101"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: Ji2Tv_5IPqcbSwm3zFc3wHQWDVx7KAcZo18s' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/${array[1]}' \
  -H 'wm_qos.correlation_id: Ji2Tv_5IPqcbSwm3zFc3wHQWDVx7KAcZo18s' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: Ji2Tv_5IPqcbSwm3zFc3wHQWDVx7KAcZo18s' \
  -H 'x-o-gql-query: query shoppingListTotal' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.2.0-3a465c' \
  -H 'x-o-segment: oaoh' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{linePrice{price}}}productsTotal}}","variables":{"input":{"id":"'${array[1]}'","permission":"VIEW"}}}' \
  --compressed`
    if [[ $list =~ "blocked" ]]
    then
      link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
      `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
      read -n 1 -p "blocked"
    else
      echo $list | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
      echo $list | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
      echo $list | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
      echo $list | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
      echo ${array[0]}
      break
    fi
  done
done < input-wm-list.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost