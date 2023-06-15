#!/bin/bash
# eval `ssh-agent -s`
git pull
: > wm-TD-usItemId.txt
: > wm-TD-currentPrice.txt
: > wm-TD-wasPrice.txt
: > wm-TD-availabilityStatus.txt
: > wm-TD-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TD-list.txt

cookie='vtc=ZV4XF19kqR87hp6NvYWKOU; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; type=REGISTERED; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; SPID=2b1e79311f9f4458e4e7d273218bd2281a67a19c7c65e3f0585183b0fe65d2d82e572a1141b9aed67e19ca9b2ab7e48cwmart; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; _vc=jg%2FqNdJcplr1yZ0awAeHZi4BfiSrquCjY3jVDz%2Bp9PQ%3D; abqme=true; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjgxMDk2NTczNjI0LCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W119LCJwcm9maWxlRGF0YSI6eyJpc0Fzc29jaWF0ZSI6ZmFsc2UsImlzVGVzdEFjY291bnQiOmZhbHNlLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In0sImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwifSwic2hvd1NpZ25VcFNwbGFzaCI6dHJ1ZSwiaWFwQXNzdXJlZCI6ZmFsc2V9; TBV=7; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1686644943600; ak_bmsc=3936CB42C7DF52B08D85F2A2683FA1AA~000000000000000000000000000000~YAAQY+ercaJUqJ2IAQAAbnqLvBRQKBuxxo3ny1Wy8r944CwGkKlGEfnPy8aM4/A1bfDXYVdxsYpX4cqTfZ218bknmK3dFBLfiUXss3P2ovEBBJlrbvK5n6bbtQKkUB4Ex6Rde6XTKby1nPP4AkCwOQL/Uj794IfjOzamOoq5GIiiNrn86Ad4mBAX01oIkJlF/5RB7cYJUV+TnTfmbtefrWd39Pd9e11aEz/CFrStdn/1nP26muhpMYWtOHsgMQH1rAbyW0tpW8xIT3/TQ4ZEgR0mdsQS2leV+wXfZWU02rT+zaFpB7wRDSquKepsNZR8vPCyOZ/umN3GSwhuEEkRLOmFwOhowdkHOR+Qy47qwRidd3exVpO057worlrcKXq+gvEQrJCAnUSar+H8; bm_mi=6EEC00B14D65180E4B39765F6548B817~YAAQY+ercaBWqJ2IAQAACa+OvBRfh2QMxkajWjEpyx1VU70I2w2/sugmMEzLxaXHLdJc9zW2Ch/OWmCigk1oTBAaJgtlRSP7AnZyBaWlMCWpjFl3dL2OrTAwnwnzBh+XXNIpCMNdgwhI8dSg+hww3I5cA08qpu+C3OHVIefn5Ia/EuuQ+3+uZ+n4KmEvs9QudbpenjdwRayCm/PIDX1NmuKvnR+DrtBuh4CmxhXsmU2B3pvWJHl4rXGTrfNb82M6YlZAlDRrtdsh0b4siZ0L6rs+0YA+CBGaz/MuYpcPIDGW/v6vhjpq8EimSnbzUWs=~1; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4VzUsaEIK3J2L3XZg8Dom%2BHWfOprqUAvnyOSvF8JSnbYZSiGAHS9wJYWnfu1KqfRXLw88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWMnRXVGRouWAl1YL5Fdw372PnVlfrEZcQ62eR2S3yTaAej%2Bl%2BQ9i4R1I5ip1xo606mTn%2FZlS7uZ%2F39xfvSacJmbMIV9zTi7KWKa5pl3lw%2Fl5DeFA8W6gcPOvUvO9%2BKTLaayhGVl9tA2%2BSbCwR1MVsgSVgMT6bIhqKDpxu2PMUdWw%3D; _tsc=MTQyODYyMDIyDBOEY9HAABvYrRmQv%2BWVBwZe%2Bienp6P7HUJPrFkrIeTWMz3wb7bQiNVO86obzCt9rjKmxAGurethvV8WASGMQFW%2FOqZPI75AbL1AJMJM4EUeUImh7tPqhqGsEnAGAVuLfmpQRra3%2FKAAI%2B8HkDAMNvp8LzYALyNNssgOFuNTDEubmQkw3syeBWQcJLPiFkESAwKIY5gZWSjRysaJ1ecRqbBKo%2Fa4hc%2BDmqtWTb1MXsx3qvOoKGn5c%2FJD9SjTX%2BLfbXCqrgyN4aDOfJc56mxxInzrCWOQxqQyxPdk53C2B38BugpvuzNkPtasylExrpkgwpR2KqwPLlNMaNAnh9qU42koQk7Ko2%2FQAHBu69DBxQxoO1xvyuFXlgGpEqiEoVwIHpoAPPUMVl8Yumc7XrJhejCsOPp6fDQcnZ%2FGWxFQP7LJ7kPY8G33NHW%2BK6H1S7PYpFk%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjAxODI0IiwiYWRkcmVzc0xpbmUxIjoiNjYgUGFya2h1cnN0IFJkIiwiY2l0eSI6IkNoZWxtc2ZvcmQiLCJzdGF0ZSI6Ik1BIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIwMTgyNC0xNTA4In0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0Mi42MjI4NTIsImxvbmdpdHVkZSI6LTcxLjM2MDc0Mn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjI5MDMiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0lOU1RPUkUiLCJQSUNLVVBfQ1VSQlNJREUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsiaWQiOiIzN2ZlOGMwMS0wNjc5LTRkOGUtOGFiMS1iMDAxZDNjZGI5ZGQiLCJhZGRyZXNzTGluZU9uZSI6IjQzMCBUZXh0aWxlIEF2ZSIsImxhdGl0dWRlIjo0Mi42NjAzNywibG9uZ2l0dWRlIjotNzEuMzM3NzM5LCJwb3N0YWxDb2RlIjoiMDE4MjY0NDI3IiwiY2l0eSI6IkRyYWN1dCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5Q29kZSI6IlVTQSIsImlzQXBvRnBvIjpmYWxzZSwiaXNQb0JveCI6ZmFsc2UsImFkZHJlc3NUeXBlIjoiUkVTSURFTlRJQUwiLCJsb2NhdGlvbkFjY3VyYWN5IjoiaGlnaCIsIm1vZGlmaWVkRGF0ZSI6MTY1NDY3MTA5NzAzNywiZ2lmdEFkZHJlc3MiOmZhbHNlLCJmaXJzdE5hbWUiOiJUZXh0aWxlIiwibGFzdE5hbWUiOiJBdmUifSwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwiaW50ZW50IjoiUElDS1VQIn0sImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjI5MDMiLCJkaXNwbGF5TmFtZSI6IkNoZWxtc2ZvcmQgU3RvcmUiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMDE4MjQiLCJhZGRyZXNzTGluZTEiOiI2NiBQYXJraHVyc3QgUmQiLCJjaXR5IjoiQ2hlbG1zZm9yZCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjAxODI0LTE1MDgifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjQyLjYyMjg1MiwibG9uZ2l0dWRlIjotNzEuMzYwNzQyfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMjkwMyIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn0sInJlZnJlc2hBdCI6MTY4Njc5NDI1MDIyMSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; assortmentStoreId=2903; hasLocData=1; bstc=eRtX8PdwiUfWPlHd9af_SQ; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; xpa=0Iadf|0uTG6|1AbeE|2MK6h|2SeeK|2c-Ep|2s5aC|341Uk|3caIW|4CECO|5e9Fg|7Zo3P|8ibpT|8oGja|8xs3C|8xsUp|9-5I8|90Fip|A9HA3|AZbwv|Aj49u|DcdL-|Edk-I|FbQPo|GmDfi|Gvy-2|GycPV|IhmrE|JHbjS|LrNhq|MlPcb|N6Yhp|NAgtM|O4zXd|OMi7h|QFoSG|RJgua|RbuWM|S9WVB|U255N|U3NAT|VDAFc|V_WLZ|VyZuz|WTebC|YnYws|ZEhBK|ZPpPJ|_0yBG|_eCI2|a_rrh|cR4f9|dayNl|eM5JI|fkoSf|jJAPh|jQFYj|jyp9o|kpr0y|lUxY5|mCT_N|pMZ8e|pcXyb|plw_V|qi56T|u2iCd|v4Ppy|xTsTj; exp-ck=0Iadf10uTG611AbeE32SeeK1341Uk13caIW27Zo3P18ibpT19-5I81A9HA32GmDfi2Gvy-21GycPV1JHbjS3LrNhq1MlPcb1N6Yhp1NAgtM1O4zXd1OMi7h2RbuWM1U255N1VDAFc1V_WLZ1YnYws4_eCI22a_rrh2eM5JI1jJAPh2kpr0y1mCT_N1pcXyb1qi56T1u2iCd1v4Ppy2; xptc=assortmentStoreId%2B2903; xpm=1%2B1686790651%2BZV4XF19kqR87hp6NvYWKOU~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; akavpau_p2=1686791255~id=e84bcd49d40eb4b3c4612e736da04bc8; userAppVersion=main-1.78.0-d9e590-0613T0712; xptwj=qq:3ca12b31986883d7ad38:WCNLA9CInHzA+xdkjY1aQ03ouyx4vKGQHs9sl+fQ0cGBgxhcXtbxGvDvg6DBZcl0mpUWLX7Dps6g52fnHNTxeAFounobxmR7SQMUZkQwCzXFsfcn2sqLqp8etItFO1bzNfPgIJa+yRjidfVHB6U6IVcgFqX5Q5DfGzvSX/UblyTMJRaSlV8pZ9Wvvcy127/ZruvX2+RWX7iwfep7nq+Cc7tb; _astc=55007faa74940ee03c523a6734c98de6; adblocked=true; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1686790662000@firstcreate:1678157996592"; _lat=8606a1405de4366ffd47c0232a066babwmart; xptwg=564916487:118CD6F379C4200:2CAFD4A:E1104BAC:7FFA4E8A:3D4F8474:; TS012768cf=0182ee2d34de77c0f36e743738b3a54e8ec4d4e61818a4336df5b44e8d9d0fffde74ecf4df10aafa629783e63719d3d2b687c53cf3; TS01a90220=0182ee2d34de77c0f36e743738b3a54e8ec4d4e61818a4336df5b44e8d9d0fffde74ecf4df10aafa629783e63719d3d2b687c53cf3; TS2a5e0c5c027=085c66c60eab2000e96f930d0c8268b60cbd857d6c5577ae8763448f2c58f40c205929fcb736b5090822e72d8c1130000821e78d2a3000b3540e87210826d18ace2e7876ba6f45c9c066602ca571afcc6dbbbd0a92b1a3ed5781ff9ab41583e0; bm_sv=1EB32188952955898DE9D32EBAA20E9D~YAAQY+ercdVWqJ2IAQAA9uqOvBTQl1lx3xzEpc5NloKT9r7ZNUpeN3V426wR4CvbBMi7oI0OYi6IkM2HqC185mjwO9mkcA68ADO8XQF/IVPH0Dol6FPrqSVZms/I2QX5y75CFr5yr+oU+wOy6+fF41IfMxlNj28AHUrFx5LG0XlMSj8z17uqh8A0WJHeufTFNmcd9wALLbJJMWciEE5f3T8fCAkyBhgqsyXyfAqXtzWvpFM/Tjuv1dJ0wYuUf530Av8=~1'

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