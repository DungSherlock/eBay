#!/bin/bash
#'${array[1]}'
# eBay-CO Rác: https://script.google.com/macros/s/AKfycbzsiGXaclu6CAFaAAQEIuR7io8UuGMP1jNM_flgD5uWrv8P4rIlhabx4B3AOdZ7kKw/exec
# EBAY TD T11: https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec

git pull
: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

while read line
do
  array=(${line//|/ })
  list=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'cookie: ACID=eef00a43-e841-40ad-956f-814fce40ff57; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=YreJszvyJbZsfsv39iLKdQ; bstc=YreJszvyJbZsfsv39iLKdQ; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=; _pxhd=d278dafdb45fb4ca057f674a4ed773bccf844d539fcc7183b8278c42782bf575:84319539-54cf-11ed-b9c2-6e484a4e5255; TBV=f; xptc=assortmentStoreId%2B3081; _pxvid=84319539-54cf-11ed-b9c2-6e484a4e5255; _astc=dabf5b9c0a87ec580d49f3fba8bafc2e; bm_mi=3A099C41C0B72B91CBEA78F31E0CBB04~YAAQrC43F438z+iDAQAAmtz2ERH9W9PRQypDZTdUwvSSkwzXR2HaOAllahLA20Z/xW09UI43Dvi6Smviwzu8rSTAD9Nv+qBUHzf9jXrs5W5mZH8hNHk98zkQVtyNb198T43sW16uD2dFsuc/c5YGJzEJbUNp0GOAjl30BbZeAUCZG+w4Hi4PqC/6boP/EhA1FlmWX9XHv/8Gb0OEUMdoUE19QkIuLpk9yvx2nBHY+tsLH1of9niMmW+xkwNKX0Zi9HMZVBekrBEnM46yZPtTN70zQygp5t++ZJ8TCxJaVBescXqa0fvCbQ65fG/sRAcaJAmSMP8wZgXv4Oqo7BBR0KrtbhF61IuDIyi7QbuQYXjQIfHvaJ4hPMz33JnMXBklC2v2~1; bm_sv=FBCC16001A2A355EC3A62134249F2219~YAAQrC43F579z+iDAQAAY+r2ERH8h6g04IKPUXE43O45dpQ2RT5Jkb62xObIhMXjeZI7SJHcIgU9XBbKhdaDAlI06ibG/8wo6Ix6pI68NIgaKkt48EEm13uChhAipPvgSqayo3m6e2gGIMNekOQBLh4U+cWApSt0aH4YT3RJVgS4q9v+TegKldKdKuJuWQfZXH2wVCiLwCd23+pdiSDdwgvsZDTsExcfS07Pb9lXGkmfmLZXeXNGEWqIWRKI7c9Fmdg=~1; pxcts=d2e22c04-54cf-11ed-993d-43454f735375; ak_bmsc=54412F095FB9CF99BB53180CAE957743~000000000000000000000000000000~YAAQrC43FxEC0OiDAQAAdzv3ERGbJWswJz4lHBNE25GyEv7FhQKWl9R6Eab+py8U0wmeJZxIdpnpYHusB/wVdK8itEfB2x9H7Duk3iwOxqWsapzukjjTl6WXGIDyD9ISP/2R7Nvi56h3BQcD7q14x3ARLjDnB4FCgKArxgLmC43bV+2S8Q6Vm6Nrc60k6rrUd+7NuIh2jy7ivjWubJv7PAbLYHt4CgNFAK/aiFye8o7jeroNXrQhlUalexfyqKtbn32PdCjPhF0UZrN7Z1a6fqPHZq02amfvoUBO9wtl16t2NP1MQEm+XfwEVWHfnl90Z6PLi7rpX7GrKaG9W6ZMkOFdtMd2+J5/M8f8l/lZghVQL6HH8GvdVAEgvrzipetZas1roqabC5klTwmPhio2tTOZFUneRnqVm7/ZkdtJ4uw3MI2HQnbL54EfN2e3ZIaxWmLzd/cK3ioFmGsRjZYKQpI7dZR2GtNDmk5WRmoz9w5sNQvIVQ==; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjp0cnVlLCJzdG9yZVNlbGVjdGlvblR5cGUiOiJERUZBVUxURUQiLCJwaWNrdXAiOnsibm9kZUlkIjoiMzA4MSIsInRpbWVzdGFtcCI6MTY2Njc0ODU3NzIxN30sInNoaXBwaW5nQWRkcmVzcyI6eyJpZCI6bnVsbCwidGltZXN0YW1wIjoxNjY2NzQ4NTc3MjE3LCJjcmVhdGVUaW1lc3RhbXAiOm51bGwsInR5cGUiOiJwYXJ0aWFsLWxvY2F0aW9uIiwiZ2lmdEFkZHJlc3MiOmZhbHNlLCJwb3N0YWxDb2RlIjoiOTU4MjkiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJkZWxpdmVyeVN0b3JlTGlzdCI6W3sibm9kZUlkIjoiMzA4MSIsInR5cGUiOiJERUxJVkVSWSJ9XX0sInBvc3RhbENvZGUiOnsidGltZXN0YW1wIjoxNjY2NzQ4NTc3MjE3LCJiYXNlIjoiOTU4MjkifSwibXAiOltdLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6ZWVmMDBhNDMtZTg0MS00MGFkLTk1NmYtODE0ZmNlNDBmZjU3In0%3D; xpm=3%2B1666753118%2BYreJszvyJbZsfsv39iLKdQ~%2B0; auth=MTAyOTYyMDE4%2FN2yYPPI4Yy4G1meVrt6KRu40%2FBEX2my8ev5BQNgNh5Kc4FoPZGERr6ssu45O3IrrpheKGOyN0XBeM4QV2EHQ%2Fd3PdJGfPzwNwODvq2aERJ%2F7eAOyE%2B%2FhOLoZMsd8VB6767wuZloTfhm7Wk2KcjygqjPQjfEaB1WK%2FMFlTnguVWEHbvrM7dNy8D5nKqmQ1PpJ4QfLj01UZ%2FLkT4BvakgIUEx5arBAc8jPOHjZDNCNGoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrspxa2nhpwnHN54a2lXVToNhgtHz8443eLvQ0Ea%2Bs6KLo76m69HfDM%2BomAxhI91DyY3va3gYdtwU%2Buj1HEUn28MaEE7B3JOgKRXIVDoRL7jvN5nwixU15kM1jCtOwIrM4kjyrOXbKKhH072NS%2FW0j%2FU%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaXNFeHBsaWNpdCI6ZmFsc2UsImludGVudCI6IlNISVBQSU5HIiwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiOTU4MjkiLCJhZGRyZXNzTGluZTEiOiI4OTE1IEdlcmJlciBSb2FkIiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiI5NTgyOS0wMDAwIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjozOC40ODI2NzcsImxvbmdpdHVkZSI6LTEyMS4zNjkwMjZ9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIzMDgxIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9JTlNUT1JFIiwiUElDS1VQX0NVUkJTSURFIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ0LCJsb25naXR1ZGUiOi0xMjEuMzQzNywicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2Nzc0Nzk5NjEwLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6ZWVmMDBhNDMtZTg0MS00MGFkLTk1NmYtODE0ZmNlNDBmZjU3In0%3D; xptwj=rq:447954d59e42a7834760:lRZgH5I6i6+hdRSZtvfre4SijGWXjte2G8VtNUxIBhGopW137pn+JkK7h29bAJyW+5HVXTBOQ8a3lipWoB6do/lkgkcC5b+STPvMFl5BfhYwA+wotsrD; xptwg=2856628653:806986188FF268:14AE5FE:FC6881DB:58CE50F7:99676EB0:; TS012768cf=0178545c905d10f65a873a422f133bc7743ab97fafded88c60e8ae2f9acdbc37f1b4437a4af85fc9dbedcc5f60d7937f80a04b71a0; TS01a90220=0178545c905d10f65a873a422f133bc7743ab97fafded88c60e8ae2f9acdbc37f1b4437a4af85fc9dbedcc5f60d7937f80a04b71a0; TS2a5e0c5c027=0881c5dd0aab20008f4dfeb88d32bab7a1399841fa80088d2c218a7f1cc7c9d2f6a10e966ac0217c086daf01311130000ad2914ce6ba74ea7a1da791606c8e230f42033c5eb9e8d55290ad538058c9fa69f1b0b30995df6ef12870c802f78436' \
  -H 'device_profile_ref_id: ih2TgkNeOksE68tAczbite81v1WDiGKm2TYR' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-b9d12ff4c9cd54acda80ded767d16d3e-2a7004425350b675-00' \
  -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'wm_qos.correlation_id: nhQo_i6zo1YExY95VjjFfskmC5f5Q32haGdO' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: nhQo_i6zo1YExY95VjjFfskmC5f5Q32haGdO' \
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
  -H 'cookie: ACID=eef00a43-e841-40ad-956f-814fce40ff57; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=YreJszvyJbZsfsv39iLKdQ; bstc=YreJszvyJbZsfsv39iLKdQ; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=; _pxhd=d278dafdb45fb4ca057f674a4ed773bccf844d539fcc7183b8278c42782bf575:84319539-54cf-11ed-b9c2-6e484a4e5255; TBV=f; xptc=assortmentStoreId%2B3081; _pxvid=84319539-54cf-11ed-b9c2-6e484a4e5255; _astc=dabf5b9c0a87ec580d49f3fba8bafc2e; bm_mi=3A099C41C0B72B91CBEA78F31E0CBB04~YAAQrC43F438z+iDAQAAmtz2ERH9W9PRQypDZTdUwvSSkwzXR2HaOAllahLA20Z/xW09UI43Dvi6Smviwzu8rSTAD9Nv+qBUHzf9jXrs5W5mZH8hNHk98zkQVtyNb198T43sW16uD2dFsuc/c5YGJzEJbUNp0GOAjl30BbZeAUCZG+w4Hi4PqC/6boP/EhA1FlmWX9XHv/8Gb0OEUMdoUE19QkIuLpk9yvx2nBHY+tsLH1of9niMmW+xkwNKX0Zi9HMZVBekrBEnM46yZPtTN70zQygp5t++ZJ8TCxJaVBescXqa0fvCbQ65fG/sRAcaJAmSMP8wZgXv4Oqo7BBR0KrtbhF61IuDIyi7QbuQYXjQIfHvaJ4hPMz33JnMXBklC2v2~1; bm_sv=FBCC16001A2A355EC3A62134249F2219~YAAQrC43F579z+iDAQAAY+r2ERH8h6g04IKPUXE43O45dpQ2RT5Jkb62xObIhMXjeZI7SJHcIgU9XBbKhdaDAlI06ibG/8wo6Ix6pI68NIgaKkt48EEm13uChhAipPvgSqayo3m6e2gGIMNekOQBLh4U+cWApSt0aH4YT3RJVgS4q9v+TegKldKdKuJuWQfZXH2wVCiLwCd23+pdiSDdwgvsZDTsExcfS07Pb9lXGkmfmLZXeXNGEWqIWRKI7c9Fmdg=~1; pxcts=d2e22c04-54cf-11ed-993d-43454f735375; ak_bmsc=54412F095FB9CF99BB53180CAE957743~000000000000000000000000000000~YAAQrC43FxEC0OiDAQAAdzv3ERGbJWswJz4lHBNE25GyEv7FhQKWl9R6Eab+py8U0wmeJZxIdpnpYHusB/wVdK8itEfB2x9H7Duk3iwOxqWsapzukjjTl6WXGIDyD9ISP/2R7Nvi56h3BQcD7q14x3ARLjDnB4FCgKArxgLmC43bV+2S8Q6Vm6Nrc60k6rrUd+7NuIh2jy7ivjWubJv7PAbLYHt4CgNFAK/aiFye8o7jeroNXrQhlUalexfyqKtbn32PdCjPhF0UZrN7Z1a6fqPHZq02amfvoUBO9wtl16t2NP1MQEm+XfwEVWHfnl90Z6PLi7rpX7GrKaG9W6ZMkOFdtMd2+J5/M8f8l/lZghVQL6HH8GvdVAEgvrzipetZas1roqabC5klTwmPhio2tTOZFUneRnqVm7/ZkdtJ4uw3MI2HQnbL54EfN2e3ZIaxWmLzd/cK3ioFmGsRjZYKQpI7dZR2GtNDmk5WRmoz9w5sNQvIVQ==; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjp0cnVlLCJzdG9yZVNlbGVjdGlvblR5cGUiOiJERUZBVUxURUQiLCJwaWNrdXAiOnsibm9kZUlkIjoiMzA4MSIsInRpbWVzdGFtcCI6MTY2Njc0ODU3NzIxN30sInNoaXBwaW5nQWRkcmVzcyI6eyJpZCI6bnVsbCwidGltZXN0YW1wIjoxNjY2NzQ4NTc3MjE3LCJjcmVhdGVUaW1lc3RhbXAiOm51bGwsInR5cGUiOiJwYXJ0aWFsLWxvY2F0aW9uIiwiZ2lmdEFkZHJlc3MiOmZhbHNlLCJwb3N0YWxDb2RlIjoiOTU4MjkiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJkZWxpdmVyeVN0b3JlTGlzdCI6W3sibm9kZUlkIjoiMzA4MSIsInR5cGUiOiJERUxJVkVSWSJ9XX0sInBvc3RhbENvZGUiOnsidGltZXN0YW1wIjoxNjY2NzQ4NTc3MjE3LCJiYXNlIjoiOTU4MjkifSwibXAiOltdLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6ZWVmMDBhNDMtZTg0MS00MGFkLTk1NmYtODE0ZmNlNDBmZjU3In0%3D; xpm=3%2B1666753118%2BYreJszvyJbZsfsv39iLKdQ~%2B0; auth=MTAyOTYyMDE4%2FN2yYPPI4Yy4G1meVrt6KRu40%2FBEX2my8ev5BQNgNh5Kc4FoPZGERr6ssu45O3IrrpheKGOyN0XBeM4QV2EHQ%2Fd3PdJGfPzwNwODvq2aERJ%2F7eAOyE%2B%2FhOLoZMsd8VB6767wuZloTfhm7Wk2KcjygqjPQjfEaB1WK%2FMFlTnguVWEHbvrM7dNy8D5nKqmQ1PpJ4QfLj01UZ%2FLkT4BvakgIUEx5arBAc8jPOHjZDNCNGoUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrspxa2nhpwnHN54a2lXVToNhgtHz8443eLvQ0Ea%2Bs6KLo76m69HfDM%2BomAxhI91DyY3va3gYdtwU%2Buj1HEUn28MaEE7B3JOgKRXIVDoRL7jvN5nwixU15kM1jCtOwIrM4kjyrOXbKKhH072NS%2FW0j%2FU%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaXNFeHBsaWNpdCI6ZmFsc2UsImludGVudCI6IlNISVBQSU5HIiwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiOTU4MjkiLCJhZGRyZXNzTGluZTEiOiI4OTE1IEdlcmJlciBSb2FkIiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiI5NTgyOS0wMDAwIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjozOC40ODI2NzcsImxvbmdpdHVkZSI6LTEyMS4zNjkwMjZ9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIzMDgxIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9JTlNUT1JFIiwiUElDS1VQX0NVUkJTSURFIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ0LCJsb25naXR1ZGUiOi0xMjEuMzQzNywicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2Nzc0Nzk5NjEwLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6ZWVmMDBhNDMtZTg0MS00MGFkLTk1NmYtODE0ZmNlNDBmZjU3In0%3D; xptwj=rq:447954d59e42a7834760:lRZgH5I6i6+hdRSZtvfre4SijGWXjte2G8VtNUxIBhGopW137pn+JkK7h29bAJyW+5HVXTBOQ8a3lipWoB6do/lkgkcC5b+STPvMFl5BfhYwA+wotsrD; xptwg=2856628653:806986188FF268:14AE5FE:FC6881DB:58CE50F7:99676EB0:; TS012768cf=0178545c905d10f65a873a422f133bc7743ab97fafded88c60e8ae2f9acdbc37f1b4437a4af85fc9dbedcc5f60d7937f80a04b71a0; TS01a90220=0178545c905d10f65a873a422f133bc7743ab97fafded88c60e8ae2f9acdbc37f1b4437a4af85fc9dbedcc5f60d7937f80a04b71a0; TS2a5e0c5c027=0881c5dd0aab20008f4dfeb88d32bab7a1399841fa80088d2c218a7f1cc7c9d2f6a10e966ac0217c086daf01311130000ad2914ce6ba74ea7a1da791606c8e230f42033c5eb9e8d55290ad538058c9fa69f1b0b30995df6ef12870c802f78436' \
  -H 'device_profile_ref_id: ih2TgkNeOksE68tAczbite81v1WDiGKm2TYR' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-b9d12ff4c9cd54acda80ded767d16d3e-2a7004425350b675-00' \
  -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'wm_qos.correlation_id: nhQo_i6zo1YExY95VjjFfskmC5f5Q32haGdO' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: nhQo_i6zo1YExY95VjjFfskmC5f5Q32haGdO' \
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
      echo 'sleep 5'
      echo $list
      sleep 5
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