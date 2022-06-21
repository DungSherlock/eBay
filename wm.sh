#!/bin/bash

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
  -H 'cookie: auth=MTAyOTYyMDE487y6h1jDZrldbOH8CodJv9ilZsmQwPkyGkm%2BFWsZmro8RG5RQsM4awFqQtrI8esiB82gsd4xfVJCH3AKWCeErFh7YSwmeYATth33TyrD95tRSAElgFrAXxBSJwn9B7rI767wuZloTfhm7Wk2KcjygglTqinKgSpV0hco0QKmh1COkNyLLPhf6Lxvv8jG%2FU0EUYmvPzMN%2Fr41EK5j5RyfY9SoFYBe%2Fh2KC6S9aPXIkHEUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrveiyEkGx%2FDw89IsgATVfw2SL%2BD7uigpkYbVevhmo677IrVNhbyoUKs8g2i0jYySz2YSua9%2BBdc%2FTiXhcyde8qL17eolBffSrZb5VfRBAVaWmgItG49uf%2BSBCTR6LxT%2B3JE5WBBdZBCyKnCQAR7o6eg%3D; ACID=2b23e2c8-9b09-4891-9377-a80913d4afce; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=bvY3z8cUGIyGn-8_H1fIBw; bstc=bvY3z8cUGIyGn-8_H1fIBw; mobileweb=0; xpa=09BXG|0t4gT|3pRU7|4z-gR|7qRDz|8vnnu|8wp7a|9DjTL|CN28l|Ecx7k|EjkLl|IJVMl|J8ZPQ|JVe4Z|Jzlyf|MfFwr|NeQqX|ObD24|UBwCK|V-nnO|VAuQw|YkREw|Zm3yB|_hSAz|ccDGr|esP9X|nzyw-|pOwFR|qcwx4|qyn67|srerY|tKtX9|tMxiN|w8Q1J|wEzaB|zCylr; exp-ck=09BXG20t4gT18vnnu18wp7a2Ecx7k1EjkLl1IJVMl1JVe4Z1MfFwr3UBwCK3V-nnO1Zm3yB2_hSAz1ccDGr1nzyw-1pOwFR1qcwx41qyn672tMxiN1w8Q1J1wEzaB2; helpgql=1; TS01b0be75=01538efd7ccf3b4bb566e67ea4493983a99ed184e766811d1da80f0f1467debca8b3e8e54d1cff506d8bdeb82d6e24017174888012; TS013ed49a=01538efd7ccf3b4bb566e67ea4493983a99ed184e766811d1da80f0f1467debca8b3e8e54d1cff506d8bdeb82d6e24017174888012; TBV=7; pxcts=4688ab4e-f0fc-11ec-88ff-6877494b654b; _pxvid=46889f3f-f0fc-11ec-88ff-6877494b654b; _pxff_cfp=1; _pxff_tm=1; xpm=1%2B1655772682%2BbvY3z8cUGIyGn-8_H1fIBw~%2B0; tb_sw_supported=true; ak_bmsc=F54D5B44C1673AF54E8B640D3F20FC4A~000000000000000000000000000000~YAAQnwqrcTPZcziBAQAAZCO+gxBoh2pOW1Qm3nkjNoFOPtv7hd14RVNV0sCVRJeMAVY3kM5TKF9YFF7aMOtzPGlWRbSj4VTysmyOCqNpRuaZcsTASdSP13j0wLHbP2p/MI3ZL+ijloWGGs2Uz0DxmAQTyobZogLeNXLjCGZDbVEGd78DHFuwMahhFrR8/KGw6r+dSEuRFmJnwS5CdU32g1nlVOeQIfNl+cdsZFmmGPQfHTRghilumLxj1BETxYBK6qjxF0XJrjNovAQfQ0oLclXhv53lGYquR+qCycJR7aE8RsCOS7cp8+kPAv/WwA8wIsQFrrKqydoZIJwz+1sD0ed+7ttukhrk4kV7sPoe7KkZcp+zZP/1Tjliff9el5LR7UyaPU3SKmQK6FdVO94UYLpDq1MBvyRPrt9LJ76lHDeCTAp21Lsnl52qucvA2qg+RWzhRvFefO0dSkx66Qbgv3f3S/MyjUJF2fzdDvCDqNwYM4AidiQuqkOEjffQ; _px3=ca0e68345854b4dfc0ba33bf563a1b8a1e2b56f3fd018ed6baec0c954c719159:rd/YH2ie3htEJIe5igxFucMo0+tEtXhI2h5tFMNZFBaG7r1SDqE/TpixO2zxNF1ODb8SVPZdkuymjYr+xxIvog==:1000:d/4JZcK4zMQ0YfkKcqdDh62QU+2I6pfE7fMxH/+3HrPL63vB0xVRLV3YdrN6nEGZCoVtybae03Yx/SxoDZ1sBJWMMKZtc34trZrb8cHIbxjZ1DIe6fhDzURnpUeLj6tQTbzlcGfam1MECsDhslVE2Gk5bR+W9W5Of6vD+f7TfR5uvv32axttyhABFFgzFNrt+iiug6bq4BYfkI42+R4CkA==; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIzMDgxIiwiZGlzcGxheU5hbWUiOiJTYWNyYW1lbnRvIFN1cGVyY2VudGVyIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6Ijk1ODI5IiwiYWRkcmVzc0xpbmUxIjoiODkxNSBHZXJiZXIgUm9hZCIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiOTU4MjktMDAwMCJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6MzguNDgyNjc3LCJsb25naXR1ZGUiOi0xMjEuMzY5MDI2fSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiaHViTm9kZUlkIjoiMzA4MSIsInN0b3JlSHJzIjoiMDY6MDAtMjM6MDAiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJQSUNLVVBfQ1VSQlNJREUiLCJQSUNLVVBfSU5TVE9SRSIsIlBJQ0tVUF9TUEVDSUFMX0VWRU5UIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ0LCJsb25naXR1ZGUiOi0xMjEuMzQzNywicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjU1Nzk0Mjg1Nzk2LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6MmIyM2UyYzgtOWIwOS00ODkxLTkzNzctYTgwOTEzZDRhZmNlIn0%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NTU3NzI2ODU3ODZ9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY1NTc3MjY4NTc4NiwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2MjoyYjIzZTJjOC05YjA5LTQ4OTEtOTM3Ny1hODA5MTNkNGFmY2UifQ%3D%3D; TB_SFOU-100=1; xptwg=4022229353:A7226F053996B0:1B1893E:9855FF6:92012108:6E8EFF1E:; bm_sv=6DF1E9A1468171BD728188E5088072CA~YAAQnwqrcVrZcziBAQAAiES+gxDSuibFwerfIEkdjEMdfpTJSvPx9XjuhytGG4zmo2/sL8CVsCwPhHZXSTFmC7nnRPCXQsiPn99ubBSv5lsIPWpGZHeR2et/LrS9zpsu1qdQ2xkMZDciqz7y/yHnleHHCNN6hpeCZTdJt7psOrO9IEC9rWx+4esfwdeOVWzz2NShJcRZw5DVjtfHcIXjturqQ5BN0ZKYzZed8k9yEeW3o3rurGC2cZw+geJzwv8Fgg==~1; _astc=5e51f6846200c173a1792bccbb4872f4' \
  -H 'device_profile_ref_id: CeltZ2hAkXNTSCO2ItJZunrf0cxox4SgMYOj' \
  -H 'dnt: 1' \
  -H 'origin: https://www.walmart.com' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/caf523c1-f70a-4d38-aa12-029147e94b16' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="101", "Microsoft Edge";v="101"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: kUHCy3Vby7Q2mf-oEIbURHcO37Gv71abVvri' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/caf523c1-f70a-4d38-aa12-029147e94b16' \
  -H 'wm_qos.correlation_id: kUHCy3Vby7Q2mf-oEIbURHcO37Gv71abVvri' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: kUHCy3Vby7Q2mf-oEIbURHcO37Gv71abVvri' \
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

git pull
git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost


