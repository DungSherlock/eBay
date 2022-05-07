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
    -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
    -H 'x-o-platform: rweb' \
    -H 'dnt: 1' \
    -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
    -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
    -H 'x-latency-trace: 1' \
    -H 'wm_mp: true' \
    -H 'x-o-market: us' \
    -H 'x-o-platform-version: main-253-ebbb47' \
    -H 'x-o-gql-query: query shoppingListTotal' \
    -H 'x-apollo-operation-name: shoppingListTotal' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36' \
    -H 'x-o-segment: oaoh' \
    -H 'content-type: application/json' \
    -H 'accept: application/json' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-o-ccm: server' \
    -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
    -H 'origin: https://www.walmart.com' \
    -H 'sec-fetch-site: same-origin' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-dest: empty' \
    -H 'accept-language: vi' \
    -H 'cookie: hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; vtc=eoxG6ZOsJorQcamjsdThz4; bstc=eoxG6ZOsJorQcamjsdThz4; mobileweb=0; xpa=0ZDGp|1avXZ|4LpDL|7sEi7|7x3vE|BONAp|Cr48Z|G8T9q|KjVFH|SiwWD|bWRKW|j2wSF|jiGHD|pSCaU|srerY|vVDIf|xP1Ae|yzDrf; exp-ck=7x3vE1BONAp1Cr48Z1G8T9q1SiwWD1vVDIf3xP1Ae1yzDrf1; cartRoute=1; TS013ed49a=01538efd7cdc43ae16d26ce24cfc8199abc86cf69075ec2c5b501e4bf71f9c055f6a37b6566a912db8a06e0fb3e87e87cba8fa2628; akavpau_p2=1650268254~id=4e600aacbac5e2372ff5183e83c59454; bm_mi=1D8018E2180BCFC998242C09B59B22F6~L23TFwjbLGTWR17rRzqV3qqkSO43CbYCw65N2z5wVF+JfxRdnsBu1U4247IXzE7a0w7GqIDgLLFA9AfIelyp0kTA1hmKC6zsV8ElttLYM/DljuTh51jRCoj/xzkUf1d3ocbc87Dwgyt7/TmnPaswZxNyfiLTmor7lUsRDnpyNf7jkexE9m200ir+1gEYJIJvnVkI5s9hzMxRp+fHX0LCArfuxbONslrcIRB2COtYPYUASVUHWMh8pLqWZ2JJZj07RrG91Cy9Tw2YDu9qsou7nw==; _astc=da09294e34661af955996c84cd4ebabc; adblocked=false; dimensionData=1000; TBV=7; tb_sw_supported=true; TB_SFOU-100=1; _abck=akmiciisl3di7hljyob6_1963; bm_sv=C4BE5AC960BA3DC9111108B815F1C5A2~LIneeCnrvjycwDptEGytE5hS9kmW+JIjk3VniwAjS5M65hAZxVaqBVv7DNA+RlgpnCLbj4/1v4vgCiOnlDYO6RfkqQl3qRXTHlmckEaKfCKvdxUJehR9kOai6NjTNszUG5hr1VqwiXDKaotGGra8qccjQbP6hF+PS80Z4NN9ZZM=; wm_ul_plus=INACTIVE|1650354070949; _vc=DbExBJ5Q0DuEpIXnOweU3hqL4bbZTVmexNRX5tYmLDk%3D; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4VzqzQCGbU0X2xkskh67bhLFcEOx2UPKDZo%2FAV0E28p5CkzFdQm9M%2B2yRK9Twy5g2lQ88%2FbreJ29hxGEqOcjsqKqeNRslxLGa5rrDc9kwPqOe4PQDgMBlIRKe1nfxIXeg%2FAM9AyOrO7eJwfQRDs428T%2FQiaVw3y86mpZKINjTM3tKXh2FXMWueHO1V7Pr16h%2BSN9RSe%2FU7uhlxK%2FKRWTSTofVJ1felIZXEXqF2zdOXyhkWe20s%2BajNfxPjMZkcwS57w%3D%3D; rtoken=MDgyNTUyMDE4GPLTd9rICwC18YZsrCrjPfT%2B%2FZqDqmgOBbS8AVP%2FAhSroE4WAjs%2BZWP3bbfR4FgUc3ZclmlO8PPFre%2FHPhsX3StPo%2BMX7cdXA2k236eEKBAJi2JuCsXAPdkY4Xm5jUwdkIojm2LdnqWGd6erNfwyreMuMtLNNIdJ760eyzXQOmF967s%2BR4V5j0JubiAUeHF9vP3sa7bXuEE3Vg8wGYWolZZS04pGM5JCkfc1xd4hKwAbKhxYmKibtQ2Mgtg%2FofuUNe19Ncm9y27mfCBNtYAmxILSJFiMHYbWCYuu4J0SzCJGXAT3%2BHIVY6skFI6On%2FOX6OcrmFydbBOCpJADN4cwu77rwv1MmG2mj3tF%2FP%2By7gH5%2F3y3lPCilHkonikeUteA1mGZypQWeKVhdJ4sciYFZ5lF0kJ%2B918U3RG1tGdZ%2FGU%3D; SPID=525d0d6efe97dbbf45f89ae164a502bff9e20b281684b35c8f023131ae10f8ae64999c5c3bebc660430c017cc6a5974fmyacc; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; type=REGISTERED; WMP=4; ak_bmsc=0422A78724EC4B2AEA094569C01A8B69~000000000000000000000000000000~YAAQ5UrIFxyXvDWAAQAAH0qeOw++NPER3H3d3F5DvtE0npBOp4h5ebKtDGxoOIjvDRQpPVgXHdFkqYxnMZovl8Nam5jE2Wz6pRlGcCnYPYPryKs3xAHn8zq6nQWhYVpin5bQC2SfBO7z2xQS+4pcaCsbyMuslZECp/8fVzVAuVOUlWdwKBsf51svmIPkZ40IyBBZgMunZizipW7lA/g2yB4B8ENUHGAJckwwv4w6zpmCuO/RUfmT1CoWYRSLiV4pLkrzp7Q1ifJS37DzwMMI7mSk+kf9cRzJrkDT3i9wmVT0J5/sKvXZa0Nb2hf6GWP5AsLPWGffeTq/2Fza6wS0uo2pFj30HMnhNhT/sFk7LiwkVXZoHrD1jMKxpC6qyJ77v1Ih0Zp54eIZOzIZMwF6Ku2aG4ZQYnDYLo+wrW0Or1g=; AID=wmlspartner%253D0%253Areflectorid%253D0000000000000000000000%253Alastupd%253D1650267671420; _m=9; assortmentStoreId=5888; xpm=1%2B1650267671%2BeoxG6ZOsJorQcamjsdThz4~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjQ3NzQ2NDIwNTEzLCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOmZhbHNlLCJ3cGx1c05vQmVuZWZpdEJhbm5lciI6dHJ1ZX0sInByb2ZpbGVEYXRhIjp7ImlzQXNzb2NpYXRlIjpmYWxzZSwiaXNUZXN0QWNjb3VudCI6ZmFsc2UsIm1lbWJlcnNoaXBPcHRJbiI6eyJpc09wdGVkSW4iOmZhbHNlLCJvcHRlZEluQXR0cmlidXRlSWQiOiI2NDIwYmI0Ni00NjA2LTQyNjUtOGJlNy04NjhhMjExNzAyMTQifX19; locDataV3=eyJyZWZyZXNoQXQiOjE2NTAyODkyNzMyNjMsImludGVudCI6IlNISVBQSU5HIiwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiI1ODg4IiwiZGlzcGxheU5hbWUiOiJDYW1wIEhpbGwgU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiI1ODg4IiwiZGlzcGxheU5hbWUiOiJDYW1wIEhpbGwgU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMTcwMTEiLCJhZGRyZXNzTGluZTEiOiIzNDAwIEhhcnR6ZGFsZSBEciIsImNpdHkiOiJDYW1wIEhpbGwiLCJzdGF0ZSI6IlBBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIxNzAxMS03MjEzIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0MC4yMjQ4ODUsImxvbmdpdHVkZSI6LTc2LjkyODQxMn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjU4ODgifV0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMTU5MSIsImRpc3BsYXlOYW1lIjoiSGFycmlzYnVyZyBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiIxNzExMSIsImFkZHJlc3NMaW5lMSI6IjY1MzUgR3JheXNvbiBSZCIsImNpdHkiOiJIYXJyaXNidXJnIiwic3RhdGUiOiJQQSIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiMTcxMTEtNTE0MSJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6NDAuMjYxNjI4LCJsb25naXR1ZGUiOi03Ni43NzI5NTd9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJhY2Nlc3NQb2ludHMiOlt7ImFjY2Vzc1R5cGUiOiJERUxJVkVSWV9BRERSRVNTIn1dLCJodWJOb2RlSWQiOiIxNTkxIiwiaXNFeHByZXNzRGVsaXZlcnlPbmx5IjpmYWxzZSwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiREVMSVZFUllfQUREUkVTUyJdfSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjo0MC4yMzMsImxvbmdpdHVkZSI6LTc2LjgyNDksInBvc3RhbENvZGUiOiIxNzExMyIsImNpdHkiOiJIYXJyaXNidXJnIiwic3RhdGUiOiJQQSIsImNvdW50cnlDb2RlIjoiVVNBIiwiZ2lmdEFkZHJlc3MiOmZhbHNlfSwiZW50aXR5RXJyb3JzIjpbXSwiaW5zdG9yZSI6ZmFsc2UsImRlbGl2ZXJ5U2xvdEluZm9EVE8iOm51bGwsImlzRGVmYXVsdGVkIjpmYWxzZSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; TS01b0be75=01538efd7cff4c5e01be1fd8285258f6ea803260bef16de9ad55ef422be537e34c68a0036b380c5acbca20e542115f065900d924fe; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1650267866165@firstcreate:1650267483157"; xptwg=2034815335:1A17B6269D85420:43E8897:E3F6F0B4:65B90603:5904AB8D:' \
    --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"'${array[1]}'","permission":"VIEW"}}}' \
    --compressed`
    if [[ $list =~ "blocked" ]]
    then
      link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
      `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
      read -n 1 -p "blocked"
    else
      echo $list | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt
      echo $list | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
      echo $list | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
      echo $list | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
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