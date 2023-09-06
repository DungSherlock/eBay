#!/bin/bash
# eval `ssh-agent -s`
git pull
: > wm-TEA-usItemId.txt
: > wm-TEA-currentPrice.txt
: > wm-TEA-wasPrice.txt
: > wm-TEA-availabilityStatus.txt
: > wm-TEA-orderLimit.txt

# curl -C - -Ls https://script.google.com/macros/s/AKfycbxLSohHO4ZCfamg0195s7GB77CsXz20Xa_gVlrNhKvh3EToDMarPCtgNRcsXa6W09M4nA/exec | jq '.content.names[]' | sed 's/"//g' | sed 's/.*\///g' > wm-TEA-list.txt

cookie='vtc=ZV4XF19kqR87hp6NvYWKOU; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; abqme=true; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; TBV=7; akehab=ipctrl; sod=torbit1688246583; hasACID=true; ACID=73c6d16e-43ae-4979-a706-187d831c76f9; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1688459160959; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjp0cnVlLCJwaWNrdXAiOnsibm9kZUlkIjoiMzA4MSIsInRpbWVzdGFtcCI6MTY4ODQ1NzkzNzE1MSwic2VsZWN0aW9uU291cmNlIjoiWklQX0NPREVfQllfVVNFUiJ9LCJzaGlwcGluZ0FkZHJlc3MiOnsidGltZXN0YW1wIjoxNjg4NDU3OTM3MTUxLCJ0eXBlIjoicGFydGlhbC1sb2NhdGlvbiIsImdpZnRBZGRyZXNzIjpmYWxzZSwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiZGVsaXZlcnlTdG9yZUxpc3QiOlt7Im5vZGVJZCI6IjMwODEiLCJ0eXBlIjoiREVMSVZFUlkiLCJ0aW1lc3RhbXAiOjE2ODg0NTc5MzcxNTAsInNlbGVjdGlvblR5cGUiOiJMU19TRUxFQ1RFRCIsInNlbGVjdGlvblNvdXJjZSI6IlpJUF9DT0RFX0JZX1VTRVIifV19LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY4ODQ1NzkzNzE1MSwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo3M2M2ZDE2ZS00M2FlLTQ5NzktYTcwNi0xODdkODMxYzc2ZjkifQ%3D%3D; ak_bmsc=482B9EA3C3B6096FE51BA3467F7FEDBA~000000000000000000000000000000~YAAQnAqrcQEqtyGJAQAAi97NKBQimbab2tMi1Ufa8sldOltVcxu2H5nDlMBzcIegqkUlTPCjKBkDbo8232dBe2LbEfsf0VBQXQ2kl0+RUf9EdtZRm2Px7rjnq4OxDN5ss+5bYpbymUcekQGkcKSUgpiNWmcSn20eGDUZxx4RWHOeG6yg135vyr4JYrw+ohS9vmHf+RUioxHZhceKIduAPpwVoINM3e68X8tmN8Y+D1vu1hPgShmNskj6gQ5FIKrF8tJa/dOb+ajx2yzUB05NNIf6ULr8OSHuKn2Y2Vb1sS9aLAqIdOPPjPtQnD1VnDZmGgCGxxGG8cMxefa6n8uB13wQF1kTXVtbSQR5gS20GPFHGpfkWQfrENJTkYR5//fRrcyTDj5Bs6oW9w==; pxcts=fe3bc1a2-1b9b-11ee-8475-7a4878554b48; _pxff_rf=1; _pxff_fp=1; _pxff_cfp=1; _pxff_tm=1; auth=MTAyOTYyMDE4YebgTKpaBg%2FgJjZIK0NdBvdFXCcZAVtcM5yo9sDpvUmEY899US54XB6i2U4l7qnb2VL8Xy9LG7L4PfYzfkI57hJB%2Foqseho%2FHvbBuUmIU5sDh%2BgnQfT0d0cKwwJEgo%2FM767wuZloTfhm7Wk2KcjygsAEeU%2BeKCMhfP9XV060SY8Faw%2BJa6B%2FJeDdNCz8ErdcnWCq1m6veg%2FKpSIa%2FcmNDxT5dMD8215NPViWZYZeOYQUMk70P8glgOEpLOprhDfMDCcb9mgycy9jtT1uIyOBHQChEtdvyK0rKo5XK7P8%2F8Da88FrzwZg9sdkkfBg0QKeTsCfPyCkN6e%2FqxABUdUW5Cdjg6CAJvvMD%2B71pcShXSqpuHYEiKSv%2BvX2fsME2g5kcFQQD5bw%2BiVZrw3DocKW8JE5WBBdZBCyKnCQAR7o6eg%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaXNFeHBsaWNpdCI6ZmFsc2UsImludGVudCI6IlNISVBQSU5HIiwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiOTU4MjkiLCJhZGRyZXNzTGluZTEiOiI4OTE1IEdlcmJlciBSb2FkIiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiI5NTgyOS0wMDAwIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjozOC40ODI2NzcsImxvbmdpdHVkZSI6LTEyMS4zNjkwMjZ9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIzMDgxIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9JTlNUT1JFIiwiUElDS1VQX0NVUkJTSURFIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ2LCJsb25naXR1ZGUiOi0xMjEuMzQzOCwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJpbnRlbnQiOiJQSUNLVVAifSwiaW5zdG9yZSI6ZmFsc2UsImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl0sInNlbGVjdGlvblR5cGUiOiJMU19TRUxFQ1RFRCJ9LCJyZWZyZXNoQXQiOjE2ODg2MTAzNTY0NDIsInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo3M2M2ZDE2ZS00M2FlLTQ5NzktYTcwNi0xODdkODMxYzc2ZjkifQ%3D%3D; assortmentStoreId=3081; hasLocData=1; userAppVersion=main-1.83.0-ad2574-0705T0036; bstc=YvuScULiO4S8CUvwjw2aS8; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; xpa=0Iadf|0KA3-|1hga_|2NYvd|5e9Fg|8cYMq|8gOdH|8oGja|9-5I8|BukPC|CMCyD|Cx7X5|IRAHO|IhmrE|JZq09|KvYZX|N0ixq|OFXXb|OpwGp|S7lM8|SoVwe|T93o8|TWhvb|YnYws|ZgSVh|_NzN8|_uNDy|a_rrh|dSU--|dayNl|gjQMr|jyp9o|kJc_t|qkVpx|u2iCd|vK1I8|wXvq0|zW-ys; exp-ck=0Iadf18cYMq18gOdH19-5I81BukPC1CMCyD1Cx7X51IRAHO1JZq092KvYZX1TWhvb1YnYws4ZgSVh1_NzN81_uNDy1a_rrh2kJc_t1qkVpx1u2iCd1vK1I81zW-ys1; _astc=7e56e6b1eb72998d6f97e40f3053fce0; xptc=assortmentStoreId%2B3081; xpm=1%2B1688606758%2BZV4XF19kqR87hp6NvYWKOU~%2B0; adblocked=true; akavpau_p2=1688607361~id=2a0b79b53c043cc851538990a740fc51; bm_mi=121AE51E511A63B55A537849C3F5FCBF~YAAQlwqrcd6MFwKJAQAApg3PKBRNsV+VEBaIMoOgl/LaOthgpsqZ6dmP6ZCKBfkfsH65b3ug3NW5dtNNB5XbZEW/M7IRpJVtb6tNCOjQz2SaW6pYij1LNoLEefQf/HexiPAsfO858V1PCiElx1+JBJpJd6TKofMFyklP+loipT6JSNjbOrH2ACQrd3B1ntVyv0ufX3Jd6XV4iJq+eZkgmM3IXfeXsG/ztLwcP0j3ZQ9IPjCjB7jkk4bTwyd07/PG5UM/BA/5RJ2tVENV2i00JINx3ITY+W90rqMfeTqhVUVa5x4Q/yxkvnoPH2xHCJP2pI6blHc=~1; _px3=cd8b14102aa3848f9864173f2f1d2e93fa9c8e3ea90405625ca2903f75684b7c:szZdIOAsI1sk8Fe7/7owgGAtfGiojx5Y2WMyXPmoAY5LbAsNACDnD76F0lMI9Fhl46pmzEzvRcr1Dp6EPZBwNw==:1000:6u1unSpiuUH7zxrETx4O5NZoJHpi8jeFwv0AIjkuzVPuk0BfGzQPPhWf+dXt0wCyK4sK26lJu+d8tS3pC6VAwkWbjsS3zWNGgJ0l1SljXzGd5u+pqValpzI618o6c1Y32ZJCZEf0crwu1/pH1sxpiFsXcHzk12FZkmvwF5E8jqIDFV3djVGX/7eD3M0kc554; _pxde=252706621c7ace67d56fb56d72d34db14f99d2e78facc2c1f3dd844b430d32d8:eyJ0aW1lc3RhbXAiOjE2ODg2MDY4MTgyOTV9; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1688606818166@firstcreate:1688459013106"; xptwg=1139704509:BED4872E2BB350:1E56049:F8FA1CE:E52EA0B8:68DEC83D:; xptwj=qq:2525cd2dbf1095249770:2pZOsxhifYcM6rg62aerKrNG2c3A9bEBbRIMYt6VTNas4nXvookTb2uZb4m5p74/gfGyFCglm8FNtxo0LGvG8WJlHyuejw0oH+U3m1LjrJrxdARVR6MJLyDnAigVlCvv66o2t3NSu+qq+4zOJzF5yRfu+oQVSZcykPkuEKNnEuIcMdmMsoepw6ZD1cMdzL+u9nJaAmLFZYr7NSX7MV3pv6aQ; TS012768cf=01f0f4a1f9eecfa74642c84d0a56d0c3e59638eb9cdf4c9b1876d9fe84e8d9b45caed3add41be2643e9d2a6ee8c1ace44d822ac31d; TS01a90220=01f0f4a1f9eecfa74642c84d0a56d0c3e59638eb9cdf4c9b1876d9fe84e8d9b45caed3add41be2643e9d2a6ee8c1ace44d822ac31d; TS2a5e0c5c027=084336ffa1ab20000ba1c6d7907d8791f564fdd470aa2f3fe1a2fc2d59c1ede4dc3f6f40603210fc085ce525b1113000eb784a639b938a79c1c7920e8a373ea4fde89168d1858c05bfa337351fa55603d2bbefb8fda4eec0cb2d352ec39109fd; bm_sv=39681A5B76E30F69CCE3220BC4EEAA5E~YAAQnAqrce82tyGJAQAA70LPKBTeuc3+gsSGChMyatB6wkwZ80P2e9w1B7TaJ3hgXkeIISh1KlcPXw6muKwPBfY60BRpusgZDV5SbSAxEjjWANmjdz93aUy4+lcpdybrdEnIdfwZMzqihSETeMxA5s2Jvzx/S2ODV3ebI7Jx31VmeRRE6qmBP8DGUrjJYp+2fbrYzNAx+ZvYoa+m4G8EQqmmC5le1m6xIYok9r3T61YU4ku9ecRX8qnTli+4owyLr+U=~1'

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