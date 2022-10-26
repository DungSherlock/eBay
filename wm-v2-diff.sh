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
    list=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
    -H 'authority: www.walmart.com' \
    -H 'accept: application/json' \
    -H 'accept-language: vi' \
    -H 'content-type: application/json' \
    -H 'cookie: auth=MTAyOTYyMDE44FEIMNzHJXa%2Bnvu3lJ%2FJ8zKYNeyDqZHWQueq8QAZuTT%2FXc9acXPXMeiz7Wzcw6L9dWLf%2F8WPkVWz%2BNjsgfxqNwFVCrPKVOv0sSpz%2FcDjRKSr%2BAp0qgfcZAhEPTPaHj%2Bv767wuZloTfhm7Wk2KcjyglM949MaUzwsNnQKx2EXSLk%2BW0FjBCaYVL7jvq9w2Ov6zXAV639nGT3W6j6DjGxshL91rIGm8kaJ3%2B%2FuRsrcXekUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrrB%2Fv3No4iK2y7l1KFcNtW3EdE%2FLRKxAvXjPpyR2yJof8XX7KhbQygUbIkflpAqPhInvp9xAUNk1PovCTSKVGnUdT3oWppD7U6Mruk9Lvc13mWNaPYJYONhP1pqFmvAsI0jyrOXbKKhH072NS%2FW0j%2FU%3D; ACID=0e292ca9-29d4-4313-831d-59eabf9be466; hasACID=true; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjMwODEiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2NzY2MjkwMjIyLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6MGUyOTJjYTktMjlkNC00MzEzLTgzMWQtNTllYWJmOWJlNDY2In0%3D; assortmentStoreId=3081; hasLocData=1; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInN0b3JlU2VsZWN0aW9uVHlwZSI6IkRFRkFVTFRFRCIsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjY2NzQ0NjkwMjIxfSwic2hpcHBpbmdBZGRyZXNzIjp7ImlkIjpudWxsLCJ0aW1lc3RhbXAiOjE2NjY3NDQ2OTAyMjEsImNyZWF0ZVRpbWVzdGFtcCI6bnVsbCwidHlwZSI6InBhcnRpYWwtbG9jYXRpb24iLCJnaWZ0QWRkcmVzcyI6ZmFsc2UsInBvc3RhbENvZGUiOiI5NTgyOSIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImRlbGl2ZXJ5U3RvcmVMaXN0IjpbeyJub2RlSWQiOiIzMDgxIiwidHlwZSI6IkRFTElWRVJZIn1dfSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NjY3NDQ2OTAyMjEsImJhc2UiOiI5NTgyOSJ9LCJtcCI6W10sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowZTI5MmNhOS0yOWQ0LTQzMTMtODMxZC01OWVhYmY5YmU0NjYifQ%3D%3D; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=by-P9_VD0VNCpmU7eA_uF0; bstc=by-P9_VD0VNCpmU7eA_uF0; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=; _pxhd=bddcf3675d823359f5de13b6d26bd999c5614664fb3c38c6960a4e9a69b98b69:77582c39-54c6-11ed-8691-616761567865; xptwj=rq:2c3d2c2cf012e8ddaa49:3beR7I52SFS6IrjdPF4mXTqu/kgJ0OCnKM86lxCixqi91T95zEyyQP7FnML6RfDQ24R+ng8QHKunH+V/O5V2cllPYfwMkGJgDwFGuq9kENi3RzQ1q/4HOPsBR+KopgY=; ak_bmsc=53C59BF7395F33188939A6AA0178E915~000000000000000000000000000000~YAAQni43F41zt9CDAQAAxKi5ERHYuJ14WswkPMbqC0T6x9zb5oo6CNoTGm0EygviMr2Y7xJRZcB1SEIV92PHo33RcYdhDm4x6Y6XvYFzNLkEMgqG2covo513EKIdxb68LkZvijROWQIrQbqkrfz07dHTli1nToFhyIg1UpEfuvSJfnYP4C2gXKtqe5oxDuqA1LI6+oKn9QeNsiJ/i/TcFgyzAlxUJ3JdYed0JqCFhwd1l5mdJXBVZZagMAPqwsd9cnOOwgpEPkdNvhkNw7zTpIrHlOhuZ1e53GgGAIFBEq6bs8K0509GH8YalZSjcfH9YXp/PIaWlnBYcDG36m7Ptq99ZhXT+Kc6U5GNm/g+eLMXTeFcmeZJIILm9Url6F8YfiYRSVkFhVfggpwF; _astc=61f495db31e4726e711676cb59698e49; TBV=7; xptc=assortmentStoreId%2B3081; xpm=3%2B1666744693%2Bby-P9_VD0VNCpmU7eA_uF0~%2B0; xptwg=3382980907:1A20244CCC023B0:4352674:324B0854:B3D938FB:B9F55E39:; TS012768cf=018292bac0cd554511eebcd707b1903279a225e0f8a3463c1b280a5fc32edcb3a2b649814ff6a43f0540c0a9eef4a9fb69484d81c3; TS01a90220=018292bac0cd554511eebcd707b1903279a225e0f8a3463c1b280a5fc32edcb3a2b649814ff6a43f0540c0a9eef4a9fb69484d81c3; TS2a5e0c5c027=084cc9981dab2000c6a009eca29bbd3ee4be0f1a4b30d483f92d5b203303a108fdf9f25f7b2f875308d3faefe31130000fb73cfdd4d5b3770c3e2d125695b31f1e0a4394096c7a39c13c72f356245cdb4816aecef90fca5b3ce0293e03aaee4d; bm_sv=B942FC94DD0FFBC7106CEA2A0F463F62~YAAQni43F8tzt9CDAQAA9bW5ERGkCFeS/HaamRQbhxH2eerDpE0aeBQvIcm1RYxdcp9Hwv1z8PF4zyrp5CnA42KcAGvEqslm2/AuqkGE+9VkukW+lqY2+VAPl2bagGSWxESR5s9pG/VAk1LO0bWGhZgeARQkvFXIc4XvkVX6df8JiYkDs8eWBC2cUkqZRBrqZzpJ/0NfKL9NHShXnVj09RecbBSCe+Ac3dKE4fNLsezqS/pU+6PIoYkeymccHGpGqg==~1' \
    -H 'device_profile_ref_id: BvERijzBgCk5OBbWkXRoTUNCKHk3yDw4VnH0' \
    -H 'dnt: 1' \
    -H 'lists-device-type: desktop' \
    -H 'referer: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
    -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-origin' \
    -H 'traceparent: 00-d2290c653eb3b3c33691dccd957bbc5a-66cfd7984cf7710d-00' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
    -H 'wm_mp: true' \
    -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
    -H 'wm_qos.correlation_id: QuvDgLzJY1YDAQGkiHhLFb4qgosV26fux1a0' \
    -H 'x-apollo-operation-name: getListDetails' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-latency-trace: 1' \
    -H 'x-o-bu: WALMART-US' \
    -H 'x-o-ccm: server' \
    -H 'x-o-correlation-id: QuvDgLzJY1YDAQGkiHhLFb4qgosV26fux1a0' \
    -H 'x-o-gql-query: query getListDetails' \
    -H 'x-o-mart: B2C' \
    -H 'x-o-platform: rweb' \
    -H 'x-o-platform-version: main-1.26.0-be17f7' \
    -H 'x-o-segment: oaoh' \
    --compressed`

    list2=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
    -H 'authority: www.walmart.com' \
    -H 'accept: application/json' \
    -H 'accept-language: vi' \
    -H 'content-type: application/json' \
    -H 'cookie: auth=MTAyOTYyMDE44FEIMNzHJXa%2Bnvu3lJ%2FJ8zKYNeyDqZHWQueq8QAZuTT%2FXc9acXPXMeiz7Wzcw6L9dWLf%2F8WPkVWz%2BNjsgfxqNwFVCrPKVOv0sSpz%2FcDjRKSr%2BAp0qgfcZAhEPTPaHj%2Bv767wuZloTfhm7Wk2KcjyglM949MaUzwsNnQKx2EXSLk%2BW0FjBCaYVL7jvq9w2Ov6zXAV639nGT3W6j6DjGxshL91rIGm8kaJ3%2B%2FuRsrcXekUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrrB%2Fv3No4iK2y7l1KFcNtW3EdE%2FLRKxAvXjPpyR2yJof8XX7KhbQygUbIkflpAqPhInvp9xAUNk1PovCTSKVGnUdT3oWppD7U6Mruk9Lvc13mWNaPYJYONhP1pqFmvAsI0jyrOXbKKhH072NS%2FW0j%2FU%3D; ACID=0e292ca9-29d4-4313-831d-59eabf9be466; hasACID=true; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjMwODEiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2NzY2MjkwMjIyLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6MGUyOTJjYTktMjlkNC00MzEzLTgzMWQtNTllYWJmOWJlNDY2In0%3D; assortmentStoreId=3081; hasLocData=1; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInN0b3JlU2VsZWN0aW9uVHlwZSI6IkRFRkFVTFRFRCIsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjY2NzQ0NjkwMjIxfSwic2hpcHBpbmdBZGRyZXNzIjp7ImlkIjpudWxsLCJ0aW1lc3RhbXAiOjE2NjY3NDQ2OTAyMjEsImNyZWF0ZVRpbWVzdGFtcCI6bnVsbCwidHlwZSI6InBhcnRpYWwtbG9jYXRpb24iLCJnaWZ0QWRkcmVzcyI6ZmFsc2UsInBvc3RhbENvZGUiOiI5NTgyOSIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImRlbGl2ZXJ5U3RvcmVMaXN0IjpbeyJub2RlSWQiOiIzMDgxIiwidHlwZSI6IkRFTElWRVJZIn1dfSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NjY3NDQ2OTAyMjEsImJhc2UiOiI5NTgyOSJ9LCJtcCI6W10sInZhbGlkYXRlS2V5IjoicHJvZDp2MjowZTI5MmNhOS0yOWQ0LTQzMTMtODMxZC01OWVhYmY5YmU0NjYifQ%3D%3D; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=by-P9_VD0VNCpmU7eA_uF0; bstc=by-P9_VD0VNCpmU7eA_uF0; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=; _pxhd=bddcf3675d823359f5de13b6d26bd999c5614664fb3c38c6960a4e9a69b98b69:77582c39-54c6-11ed-8691-616761567865; xptwj=rq:2c3d2c2cf012e8ddaa49:3beR7I52SFS6IrjdPF4mXTqu/kgJ0OCnKM86lxCixqi91T95zEyyQP7FnML6RfDQ24R+ng8QHKunH+V/O5V2cllPYfwMkGJgDwFGuq9kENi3RzQ1q/4HOPsBR+KopgY=; ak_bmsc=53C59BF7395F33188939A6AA0178E915~000000000000000000000000000000~YAAQni43F41zt9CDAQAAxKi5ERHYuJ14WswkPMbqC0T6x9zb5oo6CNoTGm0EygviMr2Y7xJRZcB1SEIV92PHo33RcYdhDm4x6Y6XvYFzNLkEMgqG2covo513EKIdxb68LkZvijROWQIrQbqkrfz07dHTli1nToFhyIg1UpEfuvSJfnYP4C2gXKtqe5oxDuqA1LI6+oKn9QeNsiJ/i/TcFgyzAlxUJ3JdYed0JqCFhwd1l5mdJXBVZZagMAPqwsd9cnOOwgpEPkdNvhkNw7zTpIrHlOhuZ1e53GgGAIFBEq6bs8K0509GH8YalZSjcfH9YXp/PIaWlnBYcDG36m7Ptq99ZhXT+Kc6U5GNm/g+eLMXTeFcmeZJIILm9Url6F8YfiYRSVkFhVfggpwF; _astc=61f495db31e4726e711676cb59698e49; TBV=7; xptc=assortmentStoreId%2B3081; xpm=3%2B1666744693%2Bby-P9_VD0VNCpmU7eA_uF0~%2B0; xptwg=3382980907:1A20244CCC023B0:4352674:324B0854:B3D938FB:B9F55E39:; TS012768cf=018292bac0cd554511eebcd707b1903279a225e0f8a3463c1b280a5fc32edcb3a2b649814ff6a43f0540c0a9eef4a9fb69484d81c3; TS01a90220=018292bac0cd554511eebcd707b1903279a225e0f8a3463c1b280a5fc32edcb3a2b649814ff6a43f0540c0a9eef4a9fb69484d81c3; TS2a5e0c5c027=084cc9981dab2000c6a009eca29bbd3ee4be0f1a4b30d483f92d5b203303a108fdf9f25f7b2f875308d3faefe31130000fb73cfdd4d5b3770c3e2d125695b31f1e0a4394096c7a39c13c72f356245cdb4816aecef90fca5b3ce0293e03aaee4d; bm_sv=B942FC94DD0FFBC7106CEA2A0F463F62~YAAQni43F8tzt9CDAQAA9bW5ERGkCFeS/HaamRQbhxH2eerDpE0aeBQvIcm1RYxdcp9Hwv1z8PF4zyrp5CnA42KcAGvEqslm2/AuqkGE+9VkukW+lqY2+VAPl2bagGSWxESR5s9pG/VAk1LO0bWGhZgeARQkvFXIc4XvkVX6df8JiYkDs8eWBC2cUkqZRBrqZzpJ/0NfKL9NHShXnVj09RecbBSCe+Ac3dKE4fNLsezqS/pU+6PIoYkeymccHGpGqg==~1' \
    -H 'device_profile_ref_id: BvERijzBgCk5OBbWkXRoTUNCKHk3yDw4VnH0' \
    -H 'dnt: 1' \
    -H 'lists-device-type: desktop' \
    -H 'referer: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
    -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-origin' \
    -H 'traceparent: 00-d2290c653eb3b3c33691dccd957bbc5a-66cfd7984cf7710d-00' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
    -H 'wm_mp: true' \
    -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
    -H 'wm_qos.correlation_id: QuvDgLzJY1YDAQGkiHhLFb4qgosV26fux1a0' \
    -H 'x-apollo-operation-name: getListDetails' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-latency-trace: 1' \
    -H 'x-o-bu: WALMART-US' \
    -H 'x-o-ccm: server' \
    -H 'x-o-correlation-id: QuvDgLzJY1YDAQGkiHhLFb4qgosV26fux1a0' \
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
        read -n 1 -p "blocked"
      else
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo ${array[0]}
        break
    fi

  done
done < input-wm-list-diff.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbz8KpKxkoZYQieBmAgWkgSvFjRmaX6XrmgZobjeMMrjltO2xbLVYBCXrIs9CodSEskRkA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost

# eBay-CO Rác: https://script.google.com/macros/s/AKfycbzsiGXaclu6CAFaAAQEIuR7io8UuGMP1jNM_flgD5uWrv8P4rIlhabx4B3AOdZ7kKw/exec
# EBAY TD T11: https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec