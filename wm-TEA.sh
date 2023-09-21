#!/bin/bash
# eval `ssh-agent -s`
git pull
: > wm-TEA-usItemId.txt
: > wm-TEA-currentPrice.txt
: > wm-TEA-wasPrice.txt
: > wm-TEA-availabilityStatus.txt
: > wm-TEA-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TEA-list.txt

cookie='ak_bmsc=4A27494B0DA3FA04562B09806314E808~000000000000000000000000000000~YAAQZVnKF6FZMoeKAQAAHElbtRWGV9GDMfRueaBw/vYgF4WruggF7Tj/nGxu2EhdxcKocgLAGgawOFHZIByM8STTmelK0DCrHvXofevLs+XTise6m+uDJ8AhZB/GgJJOhm1gpOvP1ZpLeAMyyJ6KEI8IggF70UUP1vjqafwADlZPwCtHdBXptih41/sr5hgcyjbaJbfi2dsYZFbaYHtLX9DYRHT/IovdCHkf/ce0YUGzNYAS7irFaSNbOcUUX8lW2Ru4lu4pyfU7qwz3qls5hMKYvgUJOQLN6oToMBOj5h/PASN9hCaWFQexFVp7R30YWeKeDoAX/mdr9lzG5Y7WH6/L/CxjuI/0lyVzDr1Qia6UBdC7RLPMmonyjPzGAfu5tLiQKRPFJUFoU/DlBVO9PZqLc9cJ8gvLK8RPqLArFsJSSbqvWdHNSfrhc46JEVzmQT2CzGMc0VYL7LdFPeWttmwszFd1AnbQc1blLerwxs9vgXm7MFz21KmKQg==; _ga=GA1.1.300905581.1695259774; pxcts=52048371-581e-11ee-a865-0c3fb6d47b83; _pxvid=52047718-581e-11ee-a865-3179d1b7486f; hasLocData=1; _m=9; userAppVersion=us-web-1.100.0-514b355-0919T0537; abqme=true; vtc=dqFmWjR_dkyGj5e05yWJtE; bstc=dqFmWjR_dkyGj5e05yWJtE; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; _pxhd=753ddcddd6a1c9ec8a1a9850d43e85b337b6f91ea10bd920ef44c4d43daf9ed1:52047718-581e-11ee-a865-3179d1b7486f; TBV=7; _astc=b3ed01c4262509a2c55d76ea1afa2aa7; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1695260163550; slToken=318ff9234dd287c037d5a6ff3252f6d4a743d570ae60b47616f1b80460537ba9; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; SPID=ab021261b4c8afdde86284d2d502024799686edbfd234ac272494459a8bffd6bdbd9a9e9599c479081f48340941df3b6cprof; type=REGISTERED; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4Vw5MfvgFQ%2FlUyMXsrzGOTE211joUUj9x9%2Fpls%2Bv4FzBO6gHVfIpMA%2B9IJuFiikzL4w88%2FbreJ29hxGEqOcjsqKoyCxJ8KA0EFpRk1vGFvU2uLOgHYYzvgpjuovn2ufTXK1H%2FikNvixn%2FIlPV%2F%2FqftXJG2Rd9NTgjBgree9M2BVo21lpKTy53YbGniYURx2QtzBDF97YZiYTuGgDMv3RaddwWS3JW4tMwtrbZX5Vtfybk%2F%2BeabFsRzMos489VlnEW3vcE19d4zItjCPHUsNgJOb4%3D; _vc=fmjsFwT3KJXTBXLTAVtUjUl%2B3yJ%2BiDOz9NU3ypNHbkk%3D; sod=torbit1688246583; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; _tsc=MTQyODYyMDIyLbh%2FanqcGsmW3J7ZTicPHk3KzJtoxOoU2ctMrpaFsKTE3UD14pYPi7wJRIHyUJxIpUjFs5Ct%2BsnSe0v0gbWXihevzif0PBeFv%2FSw5LhVZ%2F%2Br9mbSxToc2XIqVCvaRqdRUwfI1RXx2FLff633rXymNfCrN7bPWyfPVmqXwNDZM6HW1lhSGSNmYwxp3KBY9t3MtHYrRPs3Si9BBYDqYWIC5zxMIg3G4XI9AlARq5RYL6LPcLW8YxuaYA9D%2FscahG0FRomD4zXP8TXNCG0q0SS9JBS25GJUVi14wOcphxxyXvx%2Bqbhnte1E5aHOLg619GhIyngPclNKujV4VDP%2Fw9CfRbOjMRpIk%2BIidnsttrnVY3fU4RxJXglIvt1Ennf%2FYAT2BYI7z0tja93dVMaWlgSjFhTxOqVKK%2FvlbBQCdlcQFcIAFbfH%2FfNyM5XTTLqQOOOjy%2FgwVBj%2B3Tajcaq%2BQyh8923NtaqVFxbM9qifIKs%3D; assortmentStoreId=2903; hasLocData=1; xpa=-59NS|0Ppta|0kBe-|2c-Ep|41DH3|4oEVY|59tZU|5x_R7|7I8F8|7qUrE|8iEA9|AbLeI|Aj49u|BukPC|CTVU6|DZwRW|E_BK-|G-Rah|G1GxF|IYDqk|IfIls|IhmrE|JrjSN|K-KBY|K1hnx|KvYZX|L_UiE|N3ofr|N6Yhp|NFQye|PLRdE|QpMSg|S1tu0|UON2y|V8_4H|WaXaa|ZHPJB|ZQWjT|_DLQn|a7htt|bZGEj|dayNl|ein1O|g_6UP|gfN83|h-Rwh|hJuSF|htn72|hzfx4|ibyjh|ixZdu|jtmH3|kD964|kOzES|lEUOy|lKy7O|mX919|msfO8|pwlab|pyVOq|rDWW0|tkCQg|zZps3|zvNIk; exp-ck=-59NS10Ppta10kBe-141DH314oEVY159tZU15x_R717I8F817qUrE18iEA91AbLeI2BukPC1CTVU61E_BK-1G1GxF1JrjSN1K1hnx1KvYZX1L_UiE1N6Yhp2QpMSg1S1tu01UON2y1WaXaa1ZHPJB1a7htt1ein1O1g_6UP1gfN831h-Rwh1hzfx41ibyjh2ixZdu1jtmH32kD9643lEUOy1lKy7O1mX9191msfO84rDWW02tkCQg1zZps31; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjgxMDk2NTczNjI0LCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W119LCJwcm9maWxlRGF0YSI6eyJpc0Fzc29jaWF0ZSI6ZmFsc2UsImlzVGVzdEFjY291bnQiOmZhbHNlLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In0sImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwifSwic2hvd1NpZ25VcFNwbGFzaCI6dHJ1ZSwic29kT3B0ZWRPdXQiOnRydWUsImlhcEFzc3VyZWQiOmZhbHNlfQ%3D%3D; locDataV3=eyJyZWZyZXNoQXQiOjE2OTUyNjQyMzYzNjMsImludGVudCI6IlNISVBQSU5HIiwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwiaW50ZW50IjoiUElDS1VQIn0sInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjAxODI0IiwiYWRkcmVzc0xpbmUxIjoiNjYgUGFya2h1cnN0IFJkIiwiY2l0eSI6IkNoZWxtc2ZvcmQiLCJzdGF0ZSI6Ik1BIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIwMTgyNC0xNTA4In0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0Mi42MjI4NTIsImxvbmdpdHVkZSI6LTcxLjM2MDc0Mn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjI5MDMiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0lOU1RPUkUiLCJQSUNLVVBfQ1VSQlNJREUiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn1dLCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjI5MDMiLCJkaXNwbGF5TmFtZSI6IkNoZWxtc2ZvcmQgU3RvcmUiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMDE4MjQiLCJhZGRyZXNzTGluZTEiOiI2NiBQYXJraHVyc3QgUmQiLCJjaXR5IjoiQ2hlbG1zZm9yZCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjAxODI0LTE1MDgifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjQyLjYyMjg1MiwibG9uZ2l0dWRlIjotNzEuMzYwNzQyfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMjkwMyIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn0sInNoaXBwaW5nQWRkcmVzcyI6eyJpZCI6IjM3ZmU4YzAxLTA2NzktNGQ4ZS04YWIxLWIwMDFkM2NkYjlkZCIsImFkZHJlc3NMaW5lT25lIjoiNDMwIFRleHRpbGUgQXZlIiwibGF0aXR1ZGUiOjQyLjY2MDM3LCJsb25naXR1ZGUiOi03MS4zMzc3MzksInBvc3RhbENvZGUiOiIwMTgyNjQ0MjciLCJjaXR5IjoiRHJhY3V0Iiwic3RhdGUiOiJNQSIsImNvdW50cnlDb2RlIjoiVVNBIiwiaXNBcG9GcG8iOmZhbHNlLCJpc1BvQm94IjpmYWxzZSwiYWRkcmVzc1R5cGUiOiJSRVNJREVOVElBTCIsImxvY2F0aW9uQWNjdXJhY3kiOiJoaWdoIiwibW9kaWZpZWREYXRlIjoxNjU0NjcxMDk3MDM3LCJnaWZ0QWRkcmVzcyI6ZmFsc2UsImZpcnN0TmFtZSI6IlRleHRpbGUiLCJsYXN0TmFtZSI6IkF2ZSIsInRpbWVab25lIjoiQW1lcmljYS9OZXdfWW9yayJ9LCJhbGxFcnJvcnMiOltdLCJpc0V4cGxpY2l0IjpmYWxzZSwiaW5zdG9yZSI6ZmFsc2UsImlzRGVmYXVsdGVkIjpmYWxzZSwidXBkYXRlVHMiOjE2ODU2NzM1MzY0MDcsImVycm9ycyI6W10sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo0MzE3YzIyYi01MjI1LTQxN2YtYmMzMy02Njg0N2Q4ZmU2NmIifQ%3D%3D; assortmentStoreId=2903; _px3=8fdbdd8c1fff1087e43ab3858548edacb79b34b0a52debe1d6e950fcf66661d8:ywS5y1gQBSAuV+GqVMgw317ggxJTiV+1dszfaWzrDqvBpbDQap3u5NmCQXqKASm9MRcDjwQ5fCcGZduaLFD4AA==:1000:beMlaImHci+Kgbw8YJPoz3ZwcBmwPiwIFeLwDrPga0XoRHBpRjE7vtlcKdGqCb7tl/rIkd/rkFM6ooJBJes4Frf5pNkiBE1gcEbDr5WOk77MKASzoEmW0dooxe5QuZmM980pQAzdTalhuWDdRrSGkMaqV/gz+BeMfSPdiLHpni7/5PRTuVFFxFKJn5m+1MQYhNqIhRhLI2hrt0UBSokr6+idveeIDqxDzGHynPCSzw8=; xptc=assortmentStoreId%2B2903; TS012768cf=014e9abc5b2df55b4ba710de3f3817117664e931fb1e1aa32b9df56621486e6c90a2862ca46ac195e08272dc54bbd813f4f6ec3fca; TS01a90220=014e9abc5b2df55b4ba710de3f3817117664e931fb1e1aa32b9df56621486e6c90a2862ca46ac195e08272dc54bbd813f4f6ec3fca; _pxde=bf0ee9a57b4b913813c84100218c721cf7c9ce7c8611001194a37e905b46b5af:eyJ0aW1lc3RhbXAiOjE2OTUyNjA2NTY5MTF9; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1695260693855@firstcreate:1695260033434"; _lat=5dd6ec069c6a2f6916fdc5a73d5fc959cprof; xpm=1%2B1695260637%2BdqFmWjR_dkyGj5e05yWJtE~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; xptwg=689806976:21C5A1B8667CA40:558FD50:CD7FAD8A:28D27E:54884663:; xptwj=qq:678679ee1c462ce2116a:UxInwPnmzv+vo5IG9N8lk3cb9aLBtmOW19wccygmyfOyRe9pNev8CzrmsFLzwYb9kxEjLVVNYzm++LYoktQ8w83nkPtE0KzG+cx2MmO1EGD7GHR0JuU1cyNPS6t+B/4dRS24BolhgeAS8qQTF2mKLJeX6rj79aV1ncg+ifOxk9tft768sJ4JQA==; TS2a5e0c5c027=08754faef6ab2000307a272835299b3a450d056d48fb33477fe356d54c62bfc2e57bdd305f9cccdc08440c1385113000e998fce9c257f705434e65fb2389b332e4fccf6e4e1e0e847414a702ef056cdae549b4b772b5dd99313a4d7b48bb92ee; bm_sv=68C75D7E6F6E50CC6C5341F8A67C96AD~YAAQbVnKFyOgio+KAQAAJFlptRXeNakha9hlPoRMS54Y+5I/9Heayc0DaByCom5De9EWdXfsBjIzxfqfVxcGRHSAWd12/ziE4PM8R3axm7WxzXtBRIY7FwGdOUqDmxk561yS4cRZkhliYujVfpxtzhwyTrBAiHGBMb3NOvp5jtsRaZI+LhX+x/NG67BFHnJb6/Vc9UJ/UG1jMjs5cIZyY71FpeS4D+0zswiFoOcGW/GuLJh2AummV0twNrTqh0pfMLA=~1; _ga_PJYG13CDGZ=GS1.1.1695259773.1.1.1695260694.0.0.0'

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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188' \
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
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TEA-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> wm-TEA-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TEA-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> wm-TEA-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TEA-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> wm-TEA-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TEA-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> wm-TEA-availabilityStatus.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TEA-orderLimit.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.orderLimit' >> wm-TEA-orderLimit.txt
        echo ${line[0]}
        break
    fi
  done
done < input-TEA-list.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
apiTEA=`echo https://script.google.com/macros/s/AKfycbwZhHTYAL-sJk_aksJrXbxwrsiOwp4Hn6kUU0fpgKQiDPU7gH5LjoaujT2jBAf-rvIy/exec?`
apiMILK=`echo https://script.google.com/macros/s/AKfycbwqVEwK8UXmhfZmhFVoNs97bIVKLqGUoAtQm8tBEbHEIit4QcHVywZxcXSZaxn0n5g8cA/exec?`
linkPostTEA=$apiTEA`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TEA-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TEA-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TEA-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TEA-orderLimit.txt\"\)
`
linkPostMILK=$apiMILK`echo LinkID==IMPORTDATA\(\"`$linkGit`echo wm-TEA-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo wm-TEA-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo wm-TEA-availabilityStatus.txt\"\)\
\&Quantity==IMPORTDATA\(\"`$linkGit`echo wm-TEA-orderLimit.txt\"\)
`

# echo '[InternetShortcut]\
# URL='$linkPostTEA > wm-TEA.url
# open wm-TEA.url

echo '[InternetShortcut]\
URL='$linkPostMILK > wm-MILK.url
open wm-MILK.url