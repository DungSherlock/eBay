#!/bin/bash
# eval `ssh-agent -s`
git pull
: > wm-TD-usItemId.txt
: > wm-TD-currentPrice.txt
: > wm-TD-wasPrice.txt
: > wm-TD-availabilityStatus.txt
: > wm-TD-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TD-list.txt

cookie='vtc=ZV4XF19kqR87hp6NvYWKOU; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; abqme=true; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; sod=torbit1688246583; CID=4317c22b-5225-417f-bc33-66847d8fe66b; hasCID=1; SPID=e72a7623e54464d760da3d399eddf12595203d6c23b34ba855f6675a38abd17c1c9f08f9a7316b6cc5feef8598a6300bwmjet; type=REGISTERED; _vc=INyeesqCy8Hx5s3pFvvSg2L4nY5EDmBALwChOq3Lem0%3D; customer=%7B%22firstName%22%3A%22Dung%22%2C%22lastNameInitial%22%3A%22D%22%7D; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1690340755413; userContext=eyJhZGRyZXNzRGF0YSI6bnVsbCwiaGFzSXRlbVN1YnNjcmlwdGlvbiI6ZmFsc2UsImhhc01lbWJlcnNoaXBJbmZvIjpmYWxzZSwiaXNEZWZhdWx0IjpmYWxzZSwicGF5bWVudERhdGEiOnsiY2FwaXRhbE9uZUJhbm5lclNub296ZVRTIjoxNjgxMDk2NTczNjI0LCJoYXNDYXBPbmUiOmZhbHNlLCJoYXNDYXBPbmVMaW5rZWQiOmZhbHNlLCJoYXNDcmVkaXRDYXJkIjpmYWxzZSwiaGFzRGlyZWN0ZWRTcGVuZENhcmQiOmZhbHNlLCJoYXNFQlQiOmZhbHNlLCJoYXNHaWZ0Q2FyZCI6ZmFsc2UsInNob3dDYXBPbmVCYW5uZXIiOnRydWUsIndwbHVzTm9CZW5lZml0QmFubmVyIjp0cnVlLCJwYXltZW50TWV0aG9kVGFncyI6W119LCJwcm9maWxlRGF0YSI6eyJpc0Fzc29jaWF0ZSI6ZmFsc2UsImlzVGVzdEFjY291bnQiOmZhbHNlLCJtZW1iZXJzaGlwT3B0SW4iOnsiaXNPcHRlZEluIjpmYWxzZSwib3B0ZWRJbkF0dHJpYnV0ZUlkIjoiNjQyMGJiNDYtNDYwNi00MjY1LThiZTctODY4YTIxMTcwMjE0In0sImN1c3RvbWVyVHlwZSI6IklORElWSURVQUwifSwic2hvd1NpZ25VcFNwbGFzaCI6dHJ1ZSwic29kT3B0ZWRPdXQiOnRydWUsImlhcEFzc3VyZWQiOmZhbHNlfQ%3D%3D; _ga=GA1.1.1888489577.1692236874; TBV=7; _ga_PJYG13CDGZ=deleted; auth=MTAyOTYyMDE4EoLi71GU904F%2Bl97x8R4%2B6w8cb%2F6co7%2BAxbK9YgJF1LMcR%2FMdXQ6QBaL3dgp85SNOB3hhbbRmROGoRlfMJgXAzAxll6p58K75cKoQBqK4VPSEKCrJp1xdiMCoIH%2BXg3plrvBbkT8GAVfcnvLIPG4V4nOMeCw%2FClY2drihVIF3p33bybjHfuXwmIycN8XBTZ6ivBZc3m8gNCQ2uZ%2BtkgoHg88%2FbreJ29hxGEqOcjsqKqHmjo7qhYaSiPcVAAu%2FbQWmxe0d5CZrMuO6Amtf4CX%2BWRILL8Td%2BEVUt2iKGzi4Zcej%2Bl%2BQ9i4R1I5ip1xo606LtyF6IfHJHStxFk9hcgUTTD9002nhiM3df5l98RGizW5hZIKMioCt5HDouiSs6Tn0sQTd4E%2BIUaiBq68k5Xfi5qCAeNRK73xvOtmrIKcpk8%3D; _tsc=MTQyODYyMDIyYPAz8ot2J4aXuLe4D9aLGSu%2BhN%2FiCkmL22KLlH%2F5lOgCRchJI%2BlLlkYprQkxkFFCDjMYQb6P5WnxrOag2Oqd8wprbDKM2J4ai7qHUfIIA7No0km7iGFEolhaIL54k75CW6LAlZCZ36j7vJODq0tNia0TxwrGJ8cztaqU6kNL9eWj6qLxX7BETWKfWJQRO9F8PEyGySH%2FFUssrqY6uKEH5ygb02PQY%2F3UOi5aYxkXLPRNampVmkBTCXAZgBbdp%2Bmmaw%2F9ysZZLDOqpCiIqwrKqpc%2BAfSfFnb3WIVjOQQxCyXRcpsZT6bxoN%2BeVjm5Jb9TuLdMNwdtk7tw3rlhQkSFjHH%2BVAYJOTffmJOzkqRvV%2F3g4dlN1SmcJNFTSUACEUq2K5ah1g6S86KZZJiP5C3YndNtK7keRqttWg0RSESd%2BkIVTHElgraD28oT1bkvNs8tx7FEbq2aotDv5U%2Bb8mgYyhli86dN0WkHmYvYWFk%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6IjAxODI0IiwiYWRkcmVzc0xpbmUxIjoiNjYgUGFya2h1cnN0IFJkIiwiY2l0eSI6IkNoZWxtc2ZvcmQiLCJzdGF0ZSI6Ik1BIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiIwMTgyNC0xNTA4In0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjo0Mi42MjI4NTIsImxvbmdpdHVkZSI6LTcxLjM2MDc0Mn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjI5MDMiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn1dLCJzaGlwcGluZ0FkZHJlc3MiOnsiaWQiOiIzN2ZlOGMwMS0wNjc5LTRkOGUtOGFiMS1iMDAxZDNjZGI5ZGQiLCJhZGRyZXNzTGluZU9uZSI6IjQzMCBUZXh0aWxlIEF2ZSIsImxhdGl0dWRlIjo0Mi42NjAzNywibG9uZ2l0dWRlIjotNzEuMzM3NzM5LCJwb3N0YWxDb2RlIjoiMDE4MjY0NDI3IiwiY2l0eSI6IkRyYWN1dCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5Q29kZSI6IlVTQSIsImlzQXBvRnBvIjpmYWxzZSwiaXNQb0JveCI6ZmFsc2UsImFkZHJlc3NUeXBlIjoiUkVTSURFTlRJQUwiLCJsb2NhdGlvbkFjY3VyYWN5IjoiaGlnaCIsIm1vZGlmaWVkRGF0ZSI6MTY1NDY3MTA5NzAzNywiZ2lmdEFkZHJlc3MiOmZhbHNlLCJmaXJzdE5hbWUiOiJUZXh0aWxlIiwibGFzdE5hbWUiOiJBdmUiLCJ0aW1lWm9uZSI6IkFtZXJpY2EvTmV3X1lvcmsifSwiYXNzb3J0bWVudCI6eyJub2RlSWQiOiIyOTAzIiwiZGlzcGxheU5hbWUiOiJDaGVsbXNmb3JkIFN0b3JlIiwiaW50ZW50IjoiUElDS1VQIn0sImluc3RvcmUiOmZhbHNlLCJkZWxpdmVyeSI6eyJidUlkIjoiMCIsIm5vZGVJZCI6IjI5MDMiLCJkaXNwbGF5TmFtZSI6IkNoZWxtc2ZvcmQgU3RvcmUiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiMDE4MjQiLCJhZGRyZXNzTGluZTEiOiI2NiBQYXJraHVyc3QgUmQiLCJjaXR5IjoiQ2hlbG1zZm9yZCIsInN0YXRlIjoiTUEiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6IjAxODI0LTE1MDgifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjQyLjYyMjg1MiwibG9uZ2l0dWRlIjotNzEuMzYwNzQyfSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiYWNjZXNzUG9pbnRzIjpbeyJhY2Nlc3NUeXBlIjoiREVMSVZFUllfQUREUkVTUyJ9XSwiaHViTm9kZUlkIjoiMjkwMyIsImlzRXhwcmVzc0RlbGl2ZXJ5T25seSI6ZmFsc2UsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIkRFTElWRVJZX0FERFJFU1MiXSwic2VsZWN0aW9uVHlwZSI6IkxTX1NFTEVDVEVEIn0sInJlZnJlc2hBdCI6MTY5NTE3Njc3ODE5MSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjQzMTdjMjJiLTUyMjUtNDE3Zi1iYzMzLTY2ODQ3ZDhmZTY2YiJ9; assortmentStoreId=2903; hasLocData=1; userAppVersion=us-web-1.99.2-248511b-0915T2259; bstc=XaWoPI2jjGPgLybOlp8b-Y; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; xpa=-59NS|-5ZDV|0Ppta|0kBe-|2c-Ep|3t4dV|AbLeI|Aj49u|BUIT2|B_CjR|BukPC|CRAHa|Cvn2u|DZwRW|E_BK-|G-Rah|G1GxF|IfIls|IhmrE|Jw2Ba|K-KBY|KIhv2|KvYZX|L_UiE|N3ofr|N6Yhp|NFQye|NSfRD|PKm8U|Pm4tk|Pnp2d|SK3g0|Svv7-|UDyQy|V8_4H|XCdGw|YnYws|ZMf5y|aL6h-|bZGEj|dayNl|df1SI|gfN83|h9ALg|htn72|jtmH3|jyp9o|kD964|kOzES|lEUOy|moB_U|o_Rht|pwlab|tSXX5|tkCQg|xGG9_|yUqGy|yXP-R|zZps3; exp-ck=-59NS1-5ZDV10Ppta10kBe-1AbLeI2BUIT21B_CjR1BukPC1CRAHa1Cvn2u1E_BK-1G1GxF1Jw2Ba1KIhv23KvYZX1L_UiE1N6Yhp2NSfRD1PKm8U2Pm4tk1SK3g01UDyQy1YnYws4aL6h-1gfN831h9ALg4jtmH32kD9643lEUOy1moB_U4o_Rht1tSXX51tkCQg1xGG9_1yXP-R1zZps31; ak_bmsc=7FBB2AD7A4EFE61EDB5B2CF06FB07C5B~000000000000000000000000000000~YAAQVFnKF3XYyIaKAQAACPcxsBW40jKfNDvht+siSyQoxnp2xSMTeAN//k0r7zNVelN13TsirT6cr5DwfPl33GPIRadu94xgrjdHWv9z7KrFJOPjtaLAlcpeYblBfh5ZdXMfg9v0/KO1TK/eLaOEoSI8+oyqWmhDmJ2sdrw/ZTHgXCtcjIj/sNUe2q9GtaftN2ACqWRkE94gJFbs0VxxBEsFBCaxFVP9m9mLWjSnP1S3THbqx0LkjuU3wLTwltR8pcCgMRC9MdlJbCxkZifVecZg9k+jgVEI/dGS8Rs5C+Boea6GZni5bOGxD+q+oewur0N+HUWhdhfUr5P1UD5XEspKXw34Hbq7WtdOksKrjS2P5Mkm00jSIwNr5gWrzwqYpm6NMrD0/y+Cgg==; _astc=b3ed01c4262509a2c55d76ea1afa2aa7; xptc=assortmentStoreId%2B2903; xpm=1%2B1695173181%2BZV4XF19kqR87hp6NvYWKOU~4317c22b-5225-417f-bc33-66847d8fe66b%2B0; TS012768cf=016ea84bd2d6d7e754ab20b8ee02ccca55fc430b372a27872a5a0949f294ff29c10e6a25863c5c73b08a3d9b722af9993835e413aa; TS01a90220=016ea84bd2d6d7e754ab20b8ee02ccca55fc430b372a27872a5a0949f294ff29c10e6a25863c5c73b08a3d9b722af9993835e413aa; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1695173217466@firstcreate:1688459013106"; _lat=ced8df9b451080718db628a4fe04771dmyacc; xptwg=2071277421:23BAA56119CE980:5A865AD:D57799CC:37270649:C5E5ACDF:; xptwj=qq:da75fb2830f4b60213af:6jhTpp1rf28NJ7rw5JtKdy+xbLewk/ooeL2FZoxFCdg5HuTK5fGcizX/5NSfrLzc9xug1GYxAcv40/L9m3dPotRJbKjXRT29CHrxHYTIwrYLinLPd4MIihJIurfvAwlnnoSBoXIkjrZkeLSJg7lU3VjDaSQ9uGHlIdV+dDKbh482cwuYPhxt75RadtBlOsoL4ZGJ6plKsLPChmGcJCn2f0Ls; TS2a5e0c5c027=08039d86dcab2000e9d13088a04d0d6df7184d87db4f6d9a969e85de7ea6ad7737cda692c7d2cf6e0822b75efc1130005f0b3ecc9e207bdcd152c3785c24a6bb14f96e768cb4d4520944b764f53f20fed1806205490958d029c5b14c2d31cff3; bm_mi=3844538277AFDB82FDF0C860EBFB2BCE~YAAQVFnKF2vbyIaKAQAAuZAysBUQuJIrNtIwUi0MxinJuPClMFkDSCkd3CMZ5q0NY98WbacW5KkrVLTuFrUzt0TjUtGG0+XoF2ss/xkmj12BurySb9/kKwpOVVBDFKwrfYB/84EyNlkdu5L8hnt6SL5T8S3ZXahMGiVssSGI8jsUiPL4DcpKVxNlUnuZqMz04m2aVW8u0Lb4QWgT3pERhOlt2N5vZStniuJLWYHor2fc2fIPjk7XpPHliml2Tf/RqD6UqO2UinUUnevKWTW1GiPqnMJeek0WDZYsalXd4GJpYi4qELSY4nGFWR1EU1Ryw63GqUu72uIrY4M+WmwOtWBtGCIRqIMQTUxzfgMXFO81luonKTgY4nnWGZ/H3dL6hSH+~1; bm_sv=E07DA7239B6458C3D433CC06E0F38031~YAAQVFnKF2zbyIaKAQAAuZAysBXVx41ozBAgAPce8/YcIaEu5GZXTdkPf5xsFdw7bcqj2+b9P79KeqGvtKQzt1z9x/J7tfCLcs5dDSP9AD434Y2Cvx9/ExzowS9YkITNCkBSvRtFQc9VqazwdRw98iCZSdtHH/uTugVKHTztYy8SAtq+arBtkjLFtOge6KZMmUdUQSSqHkj0WBzdHuPQVQuLX684sxQs+ij8hmG7d6NKh+D8zQb/2GYMGGMatKvqSQ==~1; _ga_PJYG13CDGZ=GS1.1.1695173181.9.1.1695173218.0.0.0'

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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.35' \
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
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.35' \
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