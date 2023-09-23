#!/bin/bash
# eval `ssh-agent -s`
git pull
: > wm-TD-usItemId.txt
: > wm-TD-currentPrice.txt
: > wm-TD-wasPrice.txt
: > wm-TD-availabilityStatus.txt
: > wm-TD-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TD-list.txt

cookie='_ga=GA1.1.300905581.1695259774; _pxvid=52047718-581e-11ee-a865-3179d1b7486f; _m=9; userAppVersion=us-web-1.100.0-514b355-0919T0537; abqme=true; vtc=dqFmWjR_dkyGj5e05yWJtE; _pxhd=753ddcddd6a1c9ec8a1a9850d43e85b337b6f91ea10bd920ef44c4d43daf9ed1:52047718-581e-11ee-a865-3179d1b7486f; TBV=7; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1695260163550; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; SPID=ab021261b4c8afdde86284d2d502024799686edbfd234ac272494459a8bffd6bdbd9a9e9599c479081f48340941df3b6cprof; type=REGISTERED; _vc=fmjsFwT3KJXTBXLTAVtUjUl%2B3yJ%2BiDOz9NU3ypNHbkk%3D; sod=torbit1688246583; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjgxMDk2NTczNjI0LCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W119LCJwcm9maWxlRGF0YSI6eyJpc0Fzc29jaWF0ZSI6ZmFsc2UsImlzVGVzdEFjY291bnQiOmZhbHNlLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In0sImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwifSwic2hvd1NpZ25VcFNwbGFzaCI6dHJ1ZSwic29kT3B0ZWRPdXQiOnRydWUsImlhcEFzc3VyZWQiOmZhbHNlfQ%3D%3D; _astc=b3ed01c4262509a2c55d76ea1afa2aa7; pxcts=8bde898b-5855-11ee-a533-41d305ff6976; bm_mi=AB57FA6858DCF0803692BE63F7124B25~YAAQbFnKF5dEt46KAQAA9EbJthUQTGORBVu5uF0ODz0QOMNhRCwLOPDJTiZ35cwSPnceqNqyPsG6fECLFWopFk8wkTMqedwcgIl34V/SsI3RU3avJqNnUNDzXnSlE2jxMs2aA2QZCi/+QWzcJrdRvsUTcDM5nIr5mfE2R9BJLuDD25aIOxQyj69n3yxSLnr2Wk04L6aM6JF7ZJj3JRoBBCDY+ZDrlPFCD8feCUn2smNU4/t7c6eFbDSrpoBPJOlI123QR75HzG5jxZQID6pKJEI/YccNcHsk7DA0d5kXT13vIVHxqewlAeBkmlAAskzqlkeXb0PhyV2LKkvm3vOvUIEH/2Zz+xPK7xFyLlly5egDZZUWPs/DwXF/ZdZSHEgy4ppV~1; bm_sv=7E4648022B49FA176436C8870FD5BE5A~YAAQbFnKF9dEt46KAQAAiWTJthXb9BftXlgiZqfeHur+4/cDN2G/AydbBjtqtuYk3Wz5i+Lp3tra5+jsPnb+EESXpuqzsJUVYAReP/IxgCFfIK5H8Wz+3bB+VO0+atKKOIeWS4iR4DbSOjyqFW6WRKJNgZ3htiCvpqV7hrsEmdd9iHbr5YOMcwUKIk0G63NS1A/b5nXrHAgGKVjPA1HQO+NlMOaVG+LwL/Bkd1en3QuszgRfMzCJ4pQdHeklRu2k8KU=~1; ak_bmsc=98B1A1AF84DB6095B96E6FEB6DEB7789~000000000000000000000000000000~YAAQbVnKF2TvjI+KAQAA0vHXthVAhZT2GDYZeGKw4I6R4HuuesOX4k54GmlK+i0tpeKjuRXrm9l9NcVFmo535SDHd32KG9TZviq91Js6wtFNe2XCg5DGhDypfSjgmMsIH1+CemzQYyMkSOQDmJoyUM2jz5C7OKfjgTjZsGvY0fXSh3AgbZynXVvtTeIbj9rSCrW7U7oC5vbdIuP5vsBtkfO3hRwNv7qfOq/7h5v2WuhNdExwZMyPAb4SMw0XdrauvkS4qXPvLG7c/Y/zoFBGmC7q87zjnHhFnxk1v0cT68iZMW+I1bw83/NO4ba300fJK+WGO+hX9IulXk7dEWXbUeg4j4at1hu/2W4fBhB0h/NdUHQq6Negcv8trehlxLXysBtkHm8ufiYA1WjUEP5X1Fm6vndbH6k9Ra+iHkRiRIFWaWc89PCba9HY5qi9CXO9m9vV4IdrzHyCqHrS9mjI4dPwNQ3PBm0c+62mEhiSLTkvZ9s=; akavpau_p1=1695285933~id=31209115e99da66b1b6ff9e0431ab515; adblocked=true; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjAxODI0IiwiYWRkcmVzc0xpbmUxIjoiNjYgUGFya2h1cnN0IFJkIiwiY2l0eSI6IkNoZWxtc2ZvcmQiLCJzdGF0ZSI6Ik1BIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIwMTgyNC0xNTA4In0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0Mi42MjI4NTIsImxvbmdpdHVkZSI6LTcxLjM2MDc0Mn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjI5MDMiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn1dLCJzaGlwcGluZ0FkZHJlc3MiOnsiaWQiOiIzN2ZlOGMwMS0wNjc5LTRkOGUtOGFiMS1iMDAxZDNjZGI5ZGQiLCJhZGRyZXNzTGluZU9uZSI6IjQzMCBUZXh0aWxlIEF2ZSIsImxhdGl0dWRlIjo0Mi42NjAzNywibG9uZ2l0dWRlIjotNzEuMzM3NzM5LCJwb3N0YWxDb2RlIjoiMDE4MjY0NDI3IiwiY2l0eSI6IkRyYWN1dCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5Q29kZSI6IlVTQSIsImlzQXBvRnBvIjpmYWxzZSwiaXNQb0JveCI6ZmFsc2UsImFkZHJlc3NUeXBlIjoiUkVTSURFTlRJQUwiLCJsb2NhdGlvbkFjY3VyYWN5IjoiaGlnaCIsIm1vZGlmaWVkRGF0ZSI6MTY1NDY3MTA5NzAzNywiZ2lmdEFkZHJlc3MiOmZhbHNlLCJmaXJzdE5hbWUiOiJUZXh0aWxlIiwibGFzdE5hbWUiOiJBdmUiLCJ0aW1lWm9uZSI6IkFtZXJpY2EvTmV3X1lvcmsifSwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwiaW50ZW50IjoiUElDS1VQIn0sImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjI5MDMiLCJkaXNwbGF5TmFtZSI6IkNoZWxtc2ZvcmQgU3RvcmUiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMDE4MjQiLCJhZGRyZXNzTGluZTEiOiI2NiBQYXJraHVyc3QgUmQiLCJjaXR5IjoiQ2hlbG1zZm9yZCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjAxODI0LTE1MDgifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjQyLjYyMjg1MiwibG9uZ2l0dWRlIjotNzEuMzYwNzQyfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMjkwMyIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn0sInJlZnJlc2hBdCI6MTY5NTI5MTU3NzA4OCwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; assortmentStoreId=2903; hasLocData=1; bstc=at512ICIaCNdXbQ0AVKEWo; mobileweb=0; xpth=x-o-mverified%2Bfalse~x-o-mart%2BB2C; xpa=-59NS|0Ppta|0kBe-|2c-Ep|41DH3|4oEVY|59tZU|5x_R7|7I8F8|7qUrE|8iEA9|AbLeI|Aj49u|BukPC|CTVU6|DZwRW|E_BK-|G-Rah|G1GxF|IYDqk|IfIls|IhmrE|JrjSN|K-KBY|K1hnx|KvYZX|L_UiE|N3ofr|N6Yhp|NFQye|PLRdE|QpMSg|S1tu0|UON2y|V8_4H|WaXaa|ZHPJB|ZQWjT|_DLQn|a7htt|bZGEj|dayNl|ein1O|g_6UP|gfN83|h-Rwh|hJuSF|htn72|hzfx4|ibyjh|ixZdu|jtmH3|kD964|kOzES|lEUOy|lKy7O|mX919|msfO8|pwlab|pyVOq|rDWW0|tkCQg|zZps3|zvNIk; exp-ck=-59NS10Ppta10kBe-141DH314oEVY159tZU15x_R717I8F817qUrE18iEA91AbLeI2BukPC1CTVU61E_BK-1G1GxF1JrjSN1K1hnx1KvYZX1L_UiE1N6Yhp2QpMSg1S1tu01UON2y1WaXaa1ZHPJB1a7htt1ein1O1g_6UP1gfN831h-Rwh1hzfx41ibyjh2ixZdu1jtmH32kD9643lEUOy1lKy7O1mX9191msfO84rDWW02tkCQg1zZps31; xptc=assortmentStoreId%2B2903; xpm=1%2B1695287978%2BdqFmWjR_dkyGj5e05yWJtE~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; _pxff_ccc=1; akavpau_p2=1695289757~id=e0a6d2de25779fa318578645a69d947d; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4Vw5MfvgFQ%2FlUyMXsrzGOTE211joUUj9x9%2Fpls%2Bv4FzBO6gHVfIpMA%2B9IJuFiikzL4w88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWmxe0d5CZrMuO6Amtf4CX%2BZ3vV4JA253mCwupA200jUcej%2Bl%2BQ9i4R1I5ip1xo6067bj2drS%2FFmEuYcJdQ3ez%2FQKLpEPlv6mLJQbL%2BBgourjteUp9TB6iN7wxi6BK%2FO72NvQGVBqGfSSO9jd%2BffvV%2BiVgMT6bIhqKDpxu2PMUdWw%3D; _tsc=MTQyODYyMDIy0J5IhF0D8IBWp1gJvTB%2F%2FXXs7CsrYuDxY9ECCBK%2BDeo9t1H3qi%2FbXdNeCarmAUVrjGPVN1JeGH%2BjLiD%2BQwC8xFat1PNYu97zgjpY6rBn%2B5DNyx6CBVNyFDTaF3jYYPJXfHgx1fndSfYwt%2BwbECbTf0T8F8KslFBYCBCQV4Ut%2BAtcvkdizn71ni3xYELjl8sII6XxzRpDd5qnthXorxRMo2wZ5dxBqk4GOcyQUJL%2Fft8c%2FCgduikGQo2eRShzh86R5rjlzcy%2Fi4FcGdDWAf4XhYSnkXE5czeBezdMC5lObzAHaOYk%2BbQam71qR%2BwyeLUsjLGan3PRX3Yh0UVjeM%2BioDIYVtRcelTqaMt1Q8SzHOJ1G%2FAe4H6OEn%2BnGJd8WponTmtkXpSeMl%2F5w1lvevjCKrLgNs%2BAqQxdvHOuxHBsFCdQnivfs5qs5sgOPQ0kCvhSchXc%2BOyjtBM4nNQIHdnPB5zwoPTg%2BK0c%2FVpDkpI%3D; _px3=600a35d1e282301b6d40bd6bb021a87d4f167ada1f7f2d75276d3d4f3ce343d3:tRxIUao8LdlEB36pgGq2jfeuApvBBpeJDvXLnaGjXtpr/OBe812ORiNtRbkhQ2o3iLAaTnQ/OOUoMeehoKGo1g==:1000:ryfBs2QS5k4Irdjnf27bC2ssGvjhn1neE2eprdLFN8gQ6p4VabzdqMWY8gEvflba8K9Ddj7mzlg+4pHkZmpMQRQA8eQEJoWYt17Siw+D9AJCRkCY7qhkSraxg10PnLsQRP1yH9ULAh/SzoVm4bhCrHerWfLJY//vTlK0qSS2RtI5T24mqTjOhq2QmRYTm69qvf4+LRZomg/GrW+tNrIQxlWaBkDIFQzvO9RpGrFYuZc=; _pxde=15e95ec73271a7186f8188580016c901c8f18fca6fda0f3527ff1ca5472f7004:eyJ0aW1lc3RhbXAiOjE2OTUyODkxNjk3Mzh9; xptwj=qq:b5b514b05c3d2526b80a:pLSb8wBXef6Ga9gQxFGb8G7XWwCiHuPoZ/tWy+PgHUZP8kxTrPBLBjplbrVM63g9bLfP3DmKIxcYbalgvVmK63ejN3ve+y5FBGfcAm/eMdyezMGRJrhrhJVNBJqddfcr1G7PkmQ0Y+vhCOhbt72OvhbtPv33Ougey8zmA5Ep49Q8ztGhF1xXbA==; TS012768cf=0178545c9019a876c77882cefd4197a16b05a78dd0f2b1f2bc0d7ea96331e8df1513c938601e4da226fcd1c576b1b15afdacae875e; TS01a90220=0178545c9019a876c77882cefd4197a16b05a78dd0f2b1f2bc0d7ea96331e8df1513c938601e4da226fcd1c576b1b15afdacae875e; _ga_PJYG13CDGZ=GS1.1.1695283351.2.1.1695289295.0.0.0; _lat=e2898108a163b6944fe0d8bb50dc4578wmart; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1695289295000@firstcreate:1695260033434"; xptwg=3361857545:1D0751C83E39A90:498B097:F0247BCC:F4C28870:56E3505A:; TS2a5e0c5c027=0881c5dd0aab2000836ddcf70da02df5f1ff29e4e4f9a908fdc7fb1d3beff480362b0a23e9e3791d0869672d87113000f25a6d14df477ea1a10b6ea787d99114d22d3debed69b2f0e35e496a52d48b8e905975b0ef8b7cf57208a88e2f3dc6a4'

while read line
do
  # array=(${line//|/ })
  while true
  do
    list=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/9c473c83d05f86b605d982c553d220cd0d7014a0cdd727836da8bf91eaecc121?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A100%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Afalse%2C%22skipGeneric%22%3Afalse%2C%22permission%22%3A%22VIEW%22%7D%2C%22groupsEnable%22%3Afalse%7D' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: en-US' \
  -H 'content-type: application/json' \
  -H 'cookie: '$cookie'' \
  -H 'device_profile_ref_id: 4vihg2lpwwbzggqeow3rjzv_ag2eguz6cz-t' \
  -H 'dnt: 1' \
  -H 'downlink: 10' \
  -H 'dpr: 2' \
  -H 'lists-device-type: desktop' \
  -H 'sec-ch-ua: "Microsoft Edge";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-c61c2a326098db40a1d3eebea54bfeba-a29e9a8c600bafc1-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.35' \
  -H 'wm_mp: true' \
  -H 'wm_qos.correlation_id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: us-web-1.100.0-514b355-0919T0537' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    list2=`curl -C - -Ls 'https://www.walmart.com/orchestra/home/graphql/getListDetails/9c473c83d05f86b605d982c553d220cd0d7014a0cdd727836da8bf91eaecc121?variables=%7B%22input%22%3A%7B%22id%22%3A%22'$line'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A100%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Afalse%2C%22skipGeneric%22%3Afalse%2C%22permission%22%3A%22VIEW%22%7D%2C%22groupsEnable%22%3Afalse%7D' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: en-US' \
  -H 'content-type: application/json' \
  -H 'cookie: '$cookie'' \
  -H 'device_profile_ref_id: 4vihg2lpwwbzggqeow3rjzv_ag2eguz6cz-t' \
  -H 'dnt: 1' \
  -H 'downlink: 10' \
  -H 'dpr: 2' \
  -H 'lists-device-type: desktop' \
  -H 'sec-ch-ua: "Microsoft Edge";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-c61c2a326098db40a1d3eebea54bfeba-a29e9a8c600bafc1-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.35' \
  -H 'wm_mp: true' \
  -H 'wm_qos.correlation_id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: YIKkB93kLuv1cIGDbKAo9KuGwIf4l3jAp00o' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: us-web-1.100.0-514b355-0919T0537' \
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
open -a "Microsoft Edge" wm-TD.url
# open https://app.clickup.com/9008002310/v/b/7-9008002310-2

echo '[InternetShortcut]\
URL='$linkPostFLY > wm-FLY.url
open -a "Microsoft Edge" wm-FLY.url