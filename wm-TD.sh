#!/bin/bash
eval `ssh-agent -s`
git pull
: > wm-TD-usItemId.txt
: > wm-TD-currentPrice.txt
: > wm-TD-wasPrice.txt
: > wm-TD-availabilityStatus.txt
: > wm-TD-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TD-list.txt

cookie='vtc=ZV4XF19kqR87hp6NvYWKOU; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; type=REGISTERED; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; SPID=2b1e79311f9f4458e4e7d273218bd2281a67a19c7c65e3f0585183b0fe65d2d82e572a1141b9aed67e19ca9b2ab7e48cwmart; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; _vc=jg%2FqNdJcplr1yZ0awAeHZi4BfiSrquCjY3jVDz%2Bp9PQ%3D; abqme=true; TBV=7; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1684743066990; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjAxODI0IiwiYWRkcmVzc0xpbmUxIjoiNjYgUGFya2h1cnN0IFJkIiwiY2l0eSI6IkNoZWxtc2ZvcmQiLCJzdGF0ZSI6Ik1BIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIwMTgyNC0xNTA4In0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0Mi42MjI4NTIsImxvbmdpdHVkZSI6LTcxLjM2MDc0Mn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjI5MDMiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0lOU1RPUkUiLCJQSUNLVVBfQ1VSQlNJREUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsiaWQiOiIzN2ZlOGMwMS0wNjc5LTRkOGUtOGFiMS1iMDAxZDNjZGI5ZGQiLCJhZGRyZXNzTGluZU9uZSI6IjQzMCBUZXh0aWxlIEF2ZSIsImxhdGl0dWRlIjo0Mi42NjAzNywibG9uZ2l0dWRlIjotNzEuMzM3NzM5LCJwb3N0YWxDb2RlIjoiMDE4MjY0NDI3IiwiY2l0eSI6IkRyYWN1dCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5Q29kZSI6IlVTQSIsImlzQXBvRnBvIjpmYWxzZSwiaXNQb0JveCI6ZmFsc2UsImFkZHJlc3NUeXBlIjoiUkVTSURFTlRJQUwiLCJsb2NhdGlvbkFjY3VyYWN5IjoiaGlnaCIsIm1vZGlmaWVkRGF0ZSI6MTY1NDY3MTA5NzAzNywiZ2lmdEFkZHJlc3MiOmZhbHNlLCJmaXJzdE5hbWUiOiJUZXh0aWxlIiwibGFzdE5hbWUiOiJBdmUifSwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0lOU1RPUkUiLCJQSUNLVVBfQ1VSQlNJREUiXSwiaW50ZW50IjoiUElDS1VQIn0sImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjI5MDMiLCJkaXNwbGF5TmFtZSI6IkNoZWxtc2ZvcmQgU3RvcmUiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMDE4MjQiLCJhZGRyZXNzTGluZTEiOiI2NiBQYXJraHVyc3QgUmQiLCJjaXR5IjoiQ2hlbG1zZm9yZCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjAxODI0LTE1MDgifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjQyLjYyMjg1MiwibG9uZ2l0dWRlIjotNzEuMzYwNzQyfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMjkwMyIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXX0sInJlZnJlc2hBdCI6MTY4NDk3OTcxNTk2NSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; assortmentStoreId=2903; hasLocData=1; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjgxMDk2NTczNjI0LCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W119LCJwcm9maWxlRGF0YSI6eyJpc0Fzc29jaWF0ZSI6ZmFsc2UsImlzVGVzdEFjY291bnQiOmZhbHNlLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In0sImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwifSwic2hvd1NpZ25VcFNwbGFzaCI6dHJ1ZSwiaWFwQXNzdXJlZCI6ZmFsc2V9; bm_mi=E84A9643A45D74A53ADA74633F86F3DC~YAAQzas0FxKf7i2IAQAAsRhoUBP+1eUAwsFqlDpFKZuMHGsqSSzXLMaGHmKlQfSLADPIh3asyG6Dhny/9C5OMLATajD8dpE7ctisp9ivZCeqFBniK+C8LYIFr7bKNDK9wjgFm4sWJfPZ3jlP6JCMdQRMMygAKP0u8PTXZbmacLqpFZoLYUEnNveT6U5Gknn96jbYVqTaAHs2fffXbRfUPyNvh1pvJ6nTAqa0BlXl4TxhSUFYqtKgEq2I9vG3Kqbmzm6P7R+pMf08OCAioWwrJhYlWpPb/xnioxRYi76wMSNNHWH/ihNbHHdN9DudReS90XXyxgw=~1; bm_sv=CC9E8C6F3F92A84A1FCB0E152287593A~YAAQzas0FxOf7i2IAQAAsRhoUBPiO6tzIf9d0kPVLmpdKIXHrY8uKPNqgsCglZfamW+fYK6zmnxr7IBqBBpBpSH87+GzBeP+DfP6OxvD/cMUN1tEZ4V221X8w7uishzBF24eyU3nWfnVNriSAEea+onuW6Wsix6ufTUVyZVBt3Ok2FYPWSa80wBuBYi80/MKMoN/TC69pQ6ky0AGVCcllAthPVEjCInUkXxGlJjIZHwiUFsmGXZxAAu1XUBlcT9Eow==~1; userAppVersion=main-1.73.0-38412e-0523T1931; ak_bmsc=ACD5BC9A67E5C6FEFDE42AB8C2AA169F~000000000000000000000000000000~YAAQ7as0F/bFU0mIAQAAQv1qUBNlGggMMMsTA+x7GsKWOsxDmoenU3r6hUchC+rJYw3nFRvCge23kRHYv/ErUasQzdqcbA02fu59Hxew2z0yma7+Sl8DhOr/c0/x5g5Qaa6j2fkGevSc9wft6FmRlCw5H2/86WXL4iMAtMvUtBeXM99hcDGkh7ngmh5cjwWWKc4XD+lv+6YqLfG7qajY+NWSeKjJnxMtDChL+N0V2RMlsYnabx+Skk+25O2oHn+IrLwBv0E5y8y4UO5aq2gjMHHawknRmAW5pwTEvNF1nZyff+oEctesW2glJhxCWQMX/KA1S8ewb4Xq3WgAfEcXhK5EbQ/AUcpivxBz9RG6vBrVImb8PXjfBZnxXi261uH7yPyAbBOds0UbAPbuSQywBcYJTH71NPdsFk3HYDKwRV8IBV5qcSI=; _astc=41de5caef2e27ecf93d039230c947d40; _tsc=MTQyODYyMDIyE9bQEEqX0MNc1950OJrFuqlRv%2BLsjPf08WjUwBcgzPdaFe8R%2FhUQGA8KP4iFG3k44XK76Md%2FBDvnefEXPX4PYlNxY61QkX6Ekmrb3Cy5kgv3VTdVwT2zp7VnWHJrnxA3ULZCbu4rdS5QZnCxuHGbAuQdhVdvI6m1OZtnQpmscxMaQCTReqRcYhr8YnCc6tZ4taZoz9m85DZ5vLevjHA%2FueSo39R41fVRMSsfBOYjyuf7m85sV7Z5ITJnsYNKgE%2Bl8UPIqCzh%2F7rxhMzeSd9HkQ7Kf4gtqwcGySmhYpivuFesTZTBacOVPZ9iVb5LmjQdmtSFPIUFtZsZoTMx5wm8X%2FEyaE6MCaIXN2UYhNztwOxuTnPKmN3idXl7mxXv0ImRysa9nEX%2FQeKyPpZsQXsb%2BKwga1pUKRT94XXa66kG3POOsiJH%2B101SByoSY2uVg%2BAAX9i1w%3D%3D; bstc=eKBnNYZChstWRg6ttULBbg; mobileweb=0; xptc=assortmentStoreId%2B2903; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; xpa=0uTG6|10hNA|2c-Ep|2cBFd|2s5aC|3caIW|5T7w_|5e9Fg|7jP_b|8xs3C|8xsUp|AZbwv|Aj49u|BucnY|Edk-I|FbQPo|GmDfi|GycPV|IhmrE|KfJKM|NAgtM|QFoSG|Q_BRA|RJgua|RbuWM|S9WVB|VY-6k|YnYws|Z3ba4|_0yBG|dayNl|eM5JI|eN87W|f8iOA|gEDF5|gFVlS|iTQRz|j3WGj|jJAPh|jyp9o|o_D8J|pWGxn|qi56T|tWK0P; exp-ck=0uTG6110hNA13caIW15T7w_37jP_b1BucnY1GycPV1NAgtM1RbuWM1YnYws4eM5JI1f8iOA2gEDF51gFVlS1j3WGj1jJAPh2pWGxn2qi56T1tWK0P1; xptwj=rq:2ca99a7bbec733b5c047:61qOPrR90IBZsQ8TQweS77fDaQINwOpAPwAJlSDGbrpHK3q3S2JVMKgtgMOW2tfDsVKPttKkl83Tf6yVJZmU9b/Zidd0oYVWZEyNfmwZYJ3EvJF5wK/Iry8mUFsX1JFP665SEwlt0+S8BvvjKMXczqHz7lQA+gDNwX6oR4segA==; akavpau_p2=1684980094~id=359b231426a1be18b3b5c6bcfe161918; adblocked=true; xpm=1%2B1684979493%2BZV4XF19kqR87hp6NvYWKOU~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4VzUsaEIK3J2L3XZg8Dom%2BHWfOprqUAvnyOSvF8JSnbYZSiGAHS9wJYWnfu1KqfRXLw88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWMnRXVGRouWAl1YL5Fdw372PnVlfrEZcQ62eR2S3yTaAej%2Bl%2BQ9i4R1I5ip1xo6064apihfJ4v39AjRxaUnL64F6lOlXegC42gYQZmKObPgMenq%2FDsrun5GSsoRDVBoALBRlGT8daMMLXdn9UrXbHZpqCAeNRK73xvOtmrIKcpk8%3D; TS01a90220=014dff5a5d59c0d0da6f87ad66bf4de96a2d0f11cbb1d523cfdbdda1fb91a201e2d8328f62eecce18d3d7f3883676124ed9166338b; _lat=3aaf17a3ad7b7bfff3958119ba759e2awmcxo; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1684979499000@firstcreate:1678157996592"; xptwg=2747920973:10FC9A8E6DCF1E0:2B4C794:2597528D:492E50AC:FB7BEF64:; TS012768cf=014dff5a5d59c0d0da6f87ad66bf4de96a2d0f11cbb1d523cfdbdda1fb91a201e2d8328f62eecce18d3d7f3883676124ed9166338b; TS2a5e0c5c027=085ea3cd67ab2000b649e588d948a183d84ac11684bd1c083f6fb3a6a4064fcf3821eab16cb681d9085efee6651130001f6b89e06a9b6efcbf206b779bfa689fea2cdddd110f06c181d78ac3e23d5c8603652643b90cc2364e94229a6087d84e'

while read line
do
  # array=(${line//|/ })
  while true
  do
    list=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'cookie: '$cookie'' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    list2=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'cookie: '$cookie'' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-7397a0a5fef6de55685b3d3eca6a245a-ffc7eb1e30e2892c-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'$line'' \
  -H 'wm_qos.correlation_id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    if [[ $list =~ "blocked" ]]
      then
        link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
        `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
        read -p "blocked"
        echo 'Thoát script'
        exit 1
      else
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TD-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TD-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TD-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TD-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TD-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TD-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TD-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TD-availabilityStatus.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TD-orderLimit.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TD-orderLimit.txt
        echo ${line[0]}
        break
    fi
  done
done < wm-TD-list.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
apiTD=`echo https://script.google.com/macros/s/AKfycbwjeDgCI1EMcwOCQoOqeIKyTa2zHJ3UOfGru0J_RfnHPjjQNaCYbsg1bX9q_8kL0k7ANQ/exec?`
apiFLY=`echo https://script.google.com/macros/s/AKfycbws0w4cG4jntUsWOBzKcy-2PM_vFKojfLtSyOVhp8PMbr4L3YXzpNZYDLb8ygS2WwBMQQ/exec?`
linkPostTD=$apiTD`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TD-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TD-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TD-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TD-orderLimit.txt\"\)
`
linkPostFLY=$apiFLY`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TD-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TD-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TD-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TD-orderLimit.txt\"\)
`

echo '[InternetShortcut]\
URL='$linkPostTD > wm-TD.url
open wm-TD.url
open https://app.clickup.com/9008002310/v/b/7-9008002310-2

echo '[InternetShortcut]\
URL='$linkPostFLY > wm-FLY.url
open wm-FLY.url