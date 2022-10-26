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
    list=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
    -H 'authority: www.walmart.com' \
    -H 'accept: application/json' \
    -H 'accept-language: vi' \
    -H 'content-type: application/json' \
    -H 'cookie: auth=MTAyOTYyMDE4qHXs1jXJN4XP0Bw7qfrggjn4tQeSshHN%2B9rNiE7UkkOzrtT%2FYsTHplDoMeKp52Maxa3keiTbAmdpl0D9BHF7BME4hEnbl6nrrmc5Mh58y5X79W8mZI0jqYB986RooWNm767wuZloTfhm7Wk2Kcjygp0i2CSRVbB3L7ys%2FtvUzQfQzEJw9fHd9uG3EId7SD4KAqgdrMEBg6Qucws643ooXLESQ5cSuMRdjp57RN8e4pgUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrl0MnFXiV8hYhZkRy%2FpacZ%2FU6xEQMQ6DBDaR8Ee0Szw46xkEEiPQn8mnngc1UubXep8JJTynwA9ZP4vjercb7Sj4pVhhQmDvPmnfzbxqCY1FQYR9a5Xj7zC8GhcLCEbr5JE5WBBdZBCyKnCQAR7o6eg%3D; ACID=5d75041b-70da-4a8b-91eb-24340e8990d8; hasACID=true; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjMwODEiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2NzA3NzgzNzgxLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6NWQ3NTA0MWItNzBkYS00YThiLTkxZWItMjQzNDBlODk5MGQ4In0%3D; assortmentStoreId=3081; hasLocData=1; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInN0b3JlU2VsZWN0aW9uVHlwZSI6IkRFRkFVTFRFRCIsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjY2Njg2MTgzNzk0fSwic2hpcHBpbmdBZGRyZXNzIjp7ImlkIjpudWxsLCJ0aW1lc3RhbXAiOjE2NjY2ODYxODM3OTQsImNyZWF0ZVRpbWVzdGFtcCI6bnVsbCwidHlwZSI6InBhcnRpYWwtbG9jYXRpb24iLCJnaWZ0QWRkcmVzcyI6ZmFsc2UsInBvc3RhbENvZGUiOiI5NTgyOSIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImRlbGl2ZXJ5U3RvcmVMaXN0IjpbeyJub2RlSWQiOiIzMDgxIiwidHlwZSI6IkRFTElWRVJZIn1dfSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NjY2ODYxODM3OTQsImJhc2UiOiI5NTgyOSJ9LCJtcCI6W10sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo1ZDc1MDQxYi03MGRhLTRhOGItOTFlYi0yNDM0MGU4OTkwZDgifQ%3D%3D; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=T_6skvQ25Vde3owwsnsbRI; bstc=T_6skvQ25Vde3owwsnsbRI; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=3mpU4|510q1|5f4tU|6uuLa|9YFWs|Al6-8|CQWzm|DJvKV|Epx0e|EyvKe|Gsq0D|JCPlz|JnuDC|NBAls|NW1C9|PVce5|SPL_W|ZMsWU|_PuEf|_k6Nd|c6tgM|c8HYq|dyzN8|g0dgr|g9hic|gjcSc|hYHrN|hfG5k|jfF1F|o7VCR|oEDIj|qb-IF|s4Kzt|tyeB4|u8ztl|vTmRC|x8pDk|xKmey|xdwD5|xlLfn|z3Jnp|zYSzT; exp-ck=3mpU41510q126uuLa1Al6-81CQWzm1DJvKV1Gsq0D1JnuDC1NBAls1NW1C91PVce51ZMsWU1_PuEf2_k6Nd1c6tgM3c8HYq1g0dgr2gjcSc1hfG5k1jfF1F1oEDIj1qb-IF3s4Kzt1tyeB41u8ztl1vTmRC1x8pDk3xdwD51z3Jnp1zYSzT1; xpkdw=1; _pxhd=f62364b6bdbe633f0e38abc03e19b98804d4467f6b69facbed9e97f433bc5330:3ecfdeef-543e-11ed-a272-435273554769; ak_bmsc=93CDA430251096BC846D6FDEFD3DBFA9~000000000000000000000000000000~YAAQrQyrcRuyZwmEAQAAhuo8DhGb+hr4df7WxGbw7lRYVHW3sqfzZQOfXvFiz602LPJkHKLFTHR0y/d+qP1n5A/eM/BNiAQNgtYGpcZXXuotSH79wjRKd2x5OVHpLFHL3Uh2AqB1u4duRpFsioUnPY0WNc49mDbzspIMjAU8jo2SJgGoaPhYdis4w08HQQXViQhZzMUMErdMxNqureWOri2FSAJ/2QteunYHX3hhP5ZX7K7QsY8etxyKOjm8yiNVOlCxALLmZJ5P9Fsp1tqOIzH1q2f1zsWLVqV/zq+cB/61AhAtaXLeRK/IMwxpwCJ0hpOABNZixKCoEzDUrP8dLu3sgj5ERBapeFeI4xqUg67ij7Q4WPANVRRua2EorjN16KybUB5ZjLVf0oAu; TBV=7; xptc=assortmentStoreId%2B3081; xpm=1%2B1666686185%2BT_6skvQ25Vde3owwsnsbRI~%2B0; _astc=dabf5b9c0a87ec580d49f3fba8bafc2e; akavpau_p2=1666686817~id=adcf8ea977fd72c064c4ed4fd648af5c; adblocked=true; xptwg=2745508601:227022647363880:58BEBCF:3F1A52E6:E2F21254:56A87571:; xptwj=rq:0d61ff294d886b6ce7b9:nsZwZMrQ1Bf6oUwQu9xQZ9ZhAe7a4YPWEht2OwwXkVU634RmQQXip1uvTPghrjvKHz0O93bvCJfwz9SuODSnWTUVLAMw5ZdtQZpNOEZDDaIcJbnagMU=; TS012768cf=0152a7eeaf0370f64fc37e01d22cfe8292d3da2a53025c4a880852696f4959fb094f1ca940c2ec1cb136112b9ac2041108534e132a; TS01a90220=0152a7eeaf0370f64fc37e01d22cfe8292d3da2a53025c4a880852696f4959fb094f1ca940c2ec1cb136112b9ac2041108534e132a; TS2a5e0c5c027=08649fb8c8ab20002fb74019a3af5a2d06c4841e5c77e22ea070a69689bf26b8dd67d06ebb6c410f08dc9c44ff113000596f6639d856985765f12133c7742d83e6d1b2f80bc1421b2a29aee215abd760c40eef6f06f216dbe9c7ef192658430d; bm_mi=6EB9542465963344EFE081D2D49A4E67~YAAQrQyrcSK0ZwmEAQAAOjA+DhE43th/WA0Fc5h3zMdilJQ+JUj1hqX45O5D4QWrI1DRnnCveG/Qd8AHd/GmressCvmJtK9t7veRUIYKjHlM4G2yoaadXt/Kh4Ka6pDM+M4ATWpozK8Bb4cwf+WtU0IVOVCEBBoboAaOszZeBNEkcIOEgq7xGW8XN2pcj4JDxnuycH6ilN1jv0dGHBAfKvmX/nqEcmxXTwR3c0GOK8LoNu1vRd6pLtgNn1YVwIFbwyTQuGbEayVkCOvqsSWZ6Lmhg+pNVvKzuzYI/nVyqxO0AogIhkJDw5Az4jCc7p6WA9uXvxentK57oUtuAPpHCpWpK8BLGojRoYy+7upqcIstM7g5i4leVgRnlD6OgjjEbaJu~1; bm_sv=56E2956540B09C8FFB8471ED908ADB7C~YAAQrQyrcSO0ZwmEAQAAOjA+DhHPnMaL0GaW4fFt7uH9QQ02hQdPScb5aHwwMd7JMeJPjBZSCTahl7wZP/mfnMmTSv91Y2eO7TMEmgNamKWUjj3/HqnnB/SbfiwVVxNReb8ghWmdSnrZ+4H3inENRqsxEXpjrgDBe/HqZQXyJ94bIEQ2iOcNM1V364hC9U7Hz2QlSpbMgt0/m7EiEPQfkBnMehUvSEqY0q+C8sXYxpke/oALramzzdj/p+oYDHlzKug=~1' \
    -H 'device_profile_ref_id: 91pRNOBgL4QDdLEm4riFSmrYLsqB2bl_IvX_' \
    -H 'dnt: 1' \
    -H 'lists-device-type: desktop' \
    -H 'origin: https://www.walmart.com' \
    -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="103", "Chromium";v="103"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-origin' \
    -H 'traceparent: 00-8460e63dd0cc45954ed860e5f978ffec-12f151435acffd37-00' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
    -H 'wm_mp: true' \
    -H 'wm_qos.correlation_id: -AmEx86VnHJqJySNR3lVERGwp5TzzZPcxerF' \
    -H 'x-apollo-operation-name: getListDetails' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-latency-trace: 1' \
    -H 'x-o-bu: WALMART-US' \
    -H 'x-o-ccm: server' \
    -H 'x-o-correlation-id: -AmEx86VnHJqJySNR3lVERGwp5TzzZPcxerF' \
    -H 'x-o-gql-query: query getListDetails' \
    -H 'x-o-mart: B2C' \
    -H 'x-o-platform: rweb' \
    -H 'x-o-platform-version: main-1.15.0-5ca038' \
    -H 'x-o-segment: oaoh' \
    --data-raw '{"query":"query getListDetails($input:ShoppingListInput){shoppingListDetails(input:$input){pagination{page pageSize}list{id type name lineItemCount primary ownerDetails{firstName lastName caller}maxItemsReached}items{...f_listItems}collaborators{displayPermission firstName lastName owner caller}}}fragment f_listItems on ProductList{listItems{...f_listItem product{...f_product priceInfo{...f_priceInfo}imageInfo{...f_imageInfo}rewards{...f_rewards}}secondaryProduct{...f_secondaryProduct}}}fragment f_listItem on ListItem{listItemId genericItemName requestedQuantity}fragment f_imageInfo on ProductImageInfo{thumbnailUrl allImages{url}}fragment f_priceInfo on ProductPriceInfo{priceDisplayCodes{unitOfMeasure unitPriceDisplayCondition finalCostByWeight submapType}priceRange{minPrice}currentPrice{price...f_price}linePrice{...f_price}wasPrice{...f_price}}fragment f_price on ProductPrice{priceString}fragment f_rewards on Rewards{eligible state minQuantity rewardAmt promotionId selectionToken cbOffer term expiry description}fragment f_product on Product{availabilityMessage availabilityStatus averageWeight buyBoxSuppression category{categoryPathId path{name}}criteria{name value}classType giftingEligibility hasPriceRange id itemType name offerId offerType orderLimit orderMinLimit salesUnitType showAtc usItemId weightIncrement productLocation{displayValue}groupMetaData{groupComponents{quantity offerId}}}fragment f_secondaryProduct on SecondaryProduct{imageWhenAdded itemType nameWhenAdded linePriceString currentPriceString}","variables":{"input":{"id":"'${array[1]}'","listType":"WL","pagination":{"page":1,"pageSize":1},"sortOrder":"MOST_RECENT","maxItems":true,"skipGeneric":true,"permission":"VIEW"}}}' \
    --compressed`

    list2=`curl -s 'https://www.walmart.com/orchestra/home/graphql' \
    -H 'authority: www.walmart.com' \
    -H 'accept: application/json' \
    -H 'accept-language: vi' \
    -H 'content-type: application/json' \
    -H 'cookie: auth=MTAyOTYyMDE4qHXs1jXJN4XP0Bw7qfrggjn4tQeSshHN%2B9rNiE7UkkOzrtT%2FYsTHplDoMeKp52Maxa3keiTbAmdpl0D9BHF7BME4hEnbl6nrrmc5Mh58y5X79W8mZI0jqYB986RooWNm767wuZloTfhm7Wk2Kcjygp0i2CSRVbB3L7ys%2FtvUzQfQzEJw9fHd9uG3EId7SD4KAqgdrMEBg6Qucws643ooXLESQ5cSuMRdjp57RN8e4pgUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrl0MnFXiV8hYhZkRy%2FpacZ%2FU6xEQMQ6DBDaR8Ee0Szw46xkEEiPQn8mnngc1UubXep8JJTynwA9ZP4vjercb7Sj4pVhhQmDvPmnfzbxqCY1FQYR9a5Xj7zC8GhcLCEbr5JE5WBBdZBCyKnCQAR7o6eg%3D; ACID=5d75041b-70da-4a8b-91eb-24340e8990d8; hasACID=true; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjMwODEiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2NzA3NzgzNzgxLCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6NWQ3NTA0MWItNzBkYS00YThiLTkxZWItMjQzNDBlODk5MGQ4In0%3D; assortmentStoreId=3081; hasLocData=1; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInN0b3JlU2VsZWN0aW9uVHlwZSI6IkRFRkFVTFRFRCIsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjY2Njg2MTgzNzk0fSwic2hpcHBpbmdBZGRyZXNzIjp7ImlkIjpudWxsLCJ0aW1lc3RhbXAiOjE2NjY2ODYxODM3OTQsImNyZWF0ZVRpbWVzdGFtcCI6bnVsbCwidHlwZSI6InBhcnRpYWwtbG9jYXRpb24iLCJnaWZ0QWRkcmVzcyI6ZmFsc2UsInBvc3RhbENvZGUiOiI5NTgyOSIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImRlbGl2ZXJ5U3RvcmVMaXN0IjpbeyJub2RlSWQiOiIzMDgxIiwidHlwZSI6IkRFTElWRVJZIn1dfSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NjY2ODYxODM3OTQsImJhc2UiOiI5NTgyOSJ9LCJtcCI6W10sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo1ZDc1MDQxYi03MGRhLTRhOGItOTFlYi0yNDM0MGU4OTkwZDgifQ%3D%3D; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=T_6skvQ25Vde3owwsnsbRI; bstc=T_6skvQ25Vde3owwsnsbRI; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=3mpU4|510q1|5f4tU|6uuLa|9YFWs|Al6-8|CQWzm|DJvKV|Epx0e|EyvKe|Gsq0D|JCPlz|JnuDC|NBAls|NW1C9|PVce5|SPL_W|ZMsWU|_PuEf|_k6Nd|c6tgM|c8HYq|dyzN8|g0dgr|g9hic|gjcSc|hYHrN|hfG5k|jfF1F|o7VCR|oEDIj|qb-IF|s4Kzt|tyeB4|u8ztl|vTmRC|x8pDk|xKmey|xdwD5|xlLfn|z3Jnp|zYSzT; exp-ck=3mpU41510q126uuLa1Al6-81CQWzm1DJvKV1Gsq0D1JnuDC1NBAls1NW1C91PVce51ZMsWU1_PuEf2_k6Nd1c6tgM3c8HYq1g0dgr2gjcSc1hfG5k1jfF1F1oEDIj1qb-IF3s4Kzt1tyeB41u8ztl1vTmRC1x8pDk3xdwD51z3Jnp1zYSzT1; xpkdw=1; _pxhd=f62364b6bdbe633f0e38abc03e19b98804d4467f6b69facbed9e97f433bc5330:3ecfdeef-543e-11ed-a272-435273554769; ak_bmsc=93CDA430251096BC846D6FDEFD3DBFA9~000000000000000000000000000000~YAAQrQyrcRuyZwmEAQAAhuo8DhGb+hr4df7WxGbw7lRYVHW3sqfzZQOfXvFiz602LPJkHKLFTHR0y/d+qP1n5A/eM/BNiAQNgtYGpcZXXuotSH79wjRKd2x5OVHpLFHL3Uh2AqB1u4duRpFsioUnPY0WNc49mDbzspIMjAU8jo2SJgGoaPhYdis4w08HQQXViQhZzMUMErdMxNqureWOri2FSAJ/2QteunYHX3hhP5ZX7K7QsY8etxyKOjm8yiNVOlCxALLmZJ5P9Fsp1tqOIzH1q2f1zsWLVqV/zq+cB/61AhAtaXLeRK/IMwxpwCJ0hpOABNZixKCoEzDUrP8dLu3sgj5ERBapeFeI4xqUg67ij7Q4WPANVRRua2EorjN16KybUB5ZjLVf0oAu; TBV=7; xptc=assortmentStoreId%2B3081; xpm=1%2B1666686185%2BT_6skvQ25Vde3owwsnsbRI~%2B0; _astc=dabf5b9c0a87ec580d49f3fba8bafc2e; akavpau_p2=1666686817~id=adcf8ea977fd72c064c4ed4fd648af5c; adblocked=true; xptwg=2745508601:227022647363880:58BEBCF:3F1A52E6:E2F21254:56A87571:; xptwj=rq:0d61ff294d886b6ce7b9:nsZwZMrQ1Bf6oUwQu9xQZ9ZhAe7a4YPWEht2OwwXkVU634RmQQXip1uvTPghrjvKHz0O93bvCJfwz9SuODSnWTUVLAMw5ZdtQZpNOEZDDaIcJbnagMU=; TS012768cf=0152a7eeaf0370f64fc37e01d22cfe8292d3da2a53025c4a880852696f4959fb094f1ca940c2ec1cb136112b9ac2041108534e132a; TS01a90220=0152a7eeaf0370f64fc37e01d22cfe8292d3da2a53025c4a880852696f4959fb094f1ca940c2ec1cb136112b9ac2041108534e132a; TS2a5e0c5c027=08649fb8c8ab20002fb74019a3af5a2d06c4841e5c77e22ea070a69689bf26b8dd67d06ebb6c410f08dc9c44ff113000596f6639d856985765f12133c7742d83e6d1b2f80bc1421b2a29aee215abd760c40eef6f06f216dbe9c7ef192658430d; bm_mi=6EB9542465963344EFE081D2D49A4E67~YAAQrQyrcSK0ZwmEAQAAOjA+DhE43th/WA0Fc5h3zMdilJQ+JUj1hqX45O5D4QWrI1DRnnCveG/Qd8AHd/GmressCvmJtK9t7veRUIYKjHlM4G2yoaadXt/Kh4Ka6pDM+M4ATWpozK8Bb4cwf+WtU0IVOVCEBBoboAaOszZeBNEkcIOEgq7xGW8XN2pcj4JDxnuycH6ilN1jv0dGHBAfKvmX/nqEcmxXTwR3c0GOK8LoNu1vRd6pLtgNn1YVwIFbwyTQuGbEayVkCOvqsSWZ6Lmhg+pNVvKzuzYI/nVyqxO0AogIhkJDw5Az4jCc7p6WA9uXvxentK57oUtuAPpHCpWpK8BLGojRoYy+7upqcIstM7g5i4leVgRnlD6OgjjEbaJu~1; bm_sv=56E2956540B09C8FFB8471ED908ADB7C~YAAQrQyrcSO0ZwmEAQAAOjA+DhHPnMaL0GaW4fFt7uH9QQ02hQdPScb5aHwwMd7JMeJPjBZSCTahl7wZP/mfnMmTSv91Y2eO7TMEmgNamKWUjj3/HqnnB/SbfiwVVxNReb8ghWmdSnrZ+4H3inENRqsxEXpjrgDBe/HqZQXyJ94bIEQ2iOcNM1V364hC9U7Hz2QlSpbMgt0/m7EiEPQfkBnMehUvSEqY0q+C8sXYxpke/oALramzzdj/p+oYDHlzKug=~1' \
    -H 'device_profile_ref_id: 91pRNOBgL4QDdLEm4riFSmrYLsqB2bl_IvX_' \
    -H 'dnt: 1' \
    -H 'lists-device-type: desktop' \
    -H 'origin: https://www.walmart.com' \
    -H 'sec-ch-ua: " Not;A Brand";v="99", "Microsoft Edge";v="103", "Chromium";v="103"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-origin' \
    -H 'traceparent: 00-8460e63dd0cc45954ed860e5f978ffec-12f151435acffd37-00' \
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
    -H 'wm_mp: true' \
    -H 'wm_qos.correlation_id: -AmEx86VnHJqJySNR3lVERGwp5TzzZPcxerF' \
    -H 'x-apollo-operation-name: getListDetails' \
    -H 'x-enable-server-timing: 1' \
    -H 'x-latency-trace: 1' \
    -H 'x-o-bu: WALMART-US' \
    -H 'x-o-ccm: server' \
    -H 'x-o-correlation-id: -AmEx86VnHJqJySNR3lVERGwp5TzzZPcxerF' \
    -H 'x-o-gql-query: query getListDetails' \
    -H 'x-o-mart: B2C' \
    -H 'x-o-platform: rweb' \
    -H 'x-o-platform-version: main-1.15.0-5ca038' \
    -H 'x-o-segment: oaoh' \
    --data-raw '{"query":"query getListDetails($input:ShoppingListInput){shoppingListDetails(input:$input){pagination{page pageSize}list{id type name lineItemCount primary ownerDetails{firstName lastName caller}maxItemsReached}items{...f_listItems}collaborators{displayPermission firstName lastName owner caller}}}fragment f_listItems on ProductList{listItems{...f_listItem product{...f_product priceInfo{...f_priceInfo}imageInfo{...f_imageInfo}rewards{...f_rewards}}secondaryProduct{...f_secondaryProduct}}}fragment f_listItem on ListItem{listItemId genericItemName requestedQuantity}fragment f_imageInfo on ProductImageInfo{thumbnailUrl allImages{url}}fragment f_priceInfo on ProductPriceInfo{priceDisplayCodes{unitOfMeasure unitPriceDisplayCondition finalCostByWeight submapType}priceRange{minPrice}currentPrice{price...f_price}linePrice{...f_price}wasPrice{...f_price}}fragment f_price on ProductPrice{priceString}fragment f_rewards on Rewards{eligible state minQuantity rewardAmt promotionId selectionToken cbOffer term expiry description}fragment f_product on Product{availabilityMessage availabilityStatus averageWeight buyBoxSuppression category{categoryPathId path{name}}criteria{name value}classType giftingEligibility hasPriceRange id itemType name offerId offerType orderLimit orderMinLimit salesUnitType showAtc usItemId weightIncrement productLocation{displayValue}groupMetaData{groupComponents{quantity offerId}}}fragment f_secondaryProduct on SecondaryProduct{imageWhenAdded itemType nameWhenAdded linePriceString currentPriceString}","variables":{"input":{"id":"'${array[1]}'","listType":"WL","pagination":{"page":2,"pageSize":1},"sortOrder":"MOST_RECENT","maxItems":true,"skipGeneric":true,"permission":"VIEW"}}}' \
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
done < input-wm-list.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbzsiGXaclu6CAFaAAQEIuR7io8UuGMP1jNM_flgD5uWrv8P4rIlhabx4B3AOdZ7kKw/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost

# eBay-CO Rác: https://script.google.com/macros/s/AKfycbzsiGXaclu6CAFaAAQEIuR7io8UuGMP1jNM_flgD5uWrv8P4rIlhabx4B3AOdZ7kKw/exec
# EBAY TD T11: https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec


curl 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22230e4ddf-dca8-4e6c-9a2e-3897c1924bb4%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'cookie: auth=MTAyOTYyMDE4jK4pYb8XVPAqNu%2Bd1RU5oAai%2BGsnHjJYH5BM8cMCi8G%2BgJYW3iVwpW9Qyy0eUVBtKpAnbWx7ZmC1ub%2BHJZVxrfO6i4HuLKTswmMsau3uUqptBp1k1yhjdfkCnGvIBidk767wuZloTfhm7Wk2Kcjygp0i2CSRVbB3L7ys%2FtvUzQfSCdPm6SQCbJDDK5VHaFeHtUPtwjIT1gVBHCPGPmYymDtFKgQPi3Mb9i3G81O1kf8UMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKro%2BPBl7FE5yeG8TceHINW%2BwJv1FkXH0GcXcfIfv0kFlK3XM7rSVj2gSUl%2B%2FEpTdV0SJ51Tl%2FzGM%2BphQVjSt%2BCN%2Fwxz9eLVyB%2FSfDuZekG%2FkQ4dZhtt3H7g5A0XleXds5OJE5WBBdZBCyKnCQAR7o6eg%3D; ACID=44ae853d-a34e-483c-8896-e6d8447cbc6f; hasACID=true; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaW50ZW50IjoiU0hJUFBJTkciLCJwaWNrdXAiOlt7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImh1Yk5vZGVJZCI6IjMwODEiLCJzdG9yZUhycyI6IjA2OjAwLTIzOjAwIiwic3VwcG9ydGVkQWNjZXNzVHlwZXMiOlsiUElDS1VQX0NVUkJTSURFIiwiUElDS1VQX0lOU1RPUkUiXX1dLCJzaGlwcGluZ0FkZHJlc3MiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNiwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVUyIsImxvY2F0aW9uQWNjdXJhY3kiOiJsb3ciLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjY2NzMwNTc5NDg0LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6NDRhZTg1M2QtYTM0ZS00ODNjLTg4OTYtZTZkODQ0N2NiYzZmIn0%3D; assortmentStoreId=3081; hasLocData=1; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsInN0b3JlSW50ZW50IjoiUElDS1VQIiwibWVyZ2VGbGFnIjpmYWxzZSwiaXNEZWZhdWx0ZWQiOnRydWUsInN0b3JlU2VsZWN0aW9uVHlwZSI6IkRFRkFVTFRFRCIsInBpY2t1cCI6eyJub2RlSWQiOiIzMDgxIiwidGltZXN0YW1wIjoxNjY2NzA4OTc5NDQ3fSwic2hpcHBpbmdBZGRyZXNzIjp7ImlkIjpudWxsLCJ0aW1lc3RhbXAiOjE2NjY3MDg5Nzk0NDcsImNyZWF0ZVRpbWVzdGFtcCI6bnVsbCwidHlwZSI6InBhcnRpYWwtbG9jYXRpb24iLCJnaWZ0QWRkcmVzcyI6ZmFsc2UsInBvc3RhbENvZGUiOiI5NTgyOSIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImRlbGl2ZXJ5U3RvcmVMaXN0IjpbeyJub2RlSWQiOiIzMDgxIiwidHlwZSI6IkRFTElWRVJZIn1dfSwicG9zdGFsQ29kZSI6eyJ0aW1lc3RhbXAiOjE2NjY3MDg5Nzk0NDcsImJhc2UiOiI5NTgyOSJ9LCJtcCI6W10sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo0NGFlODUzZC1hMzRlLTQ4M2MtODg5Ni1lNmQ4NDQ3Y2JjNmYifQ%3D%3D; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=SMQLwm91_gegea0QrvOi14; bstc=SMQLwm91_gegea0QrvOi14; mobileweb=0; xpth=x-o-mverified%2Bfalse; xpa=3WA5l|3mpU4|4y_zO|5f4tU|7Mi3H|9YFWs|9ZpcO|CQWzm|Dtw1C|FjF6L|Gsq0D|GzUv6|K2IBM|NBAls|SmVSa|Sz1Ci|UFGUc|XA_S7|XmJLH|ZCMn_|ZMsWU|_PuEf|_k6Nd|c6tgM|c8HYq|dyzN8|femTp|g0dgr|gjcSc|hfG5k|iYS_W|jfF1F|k5Qv9|m27Rv|pSCez|rwZnR|s4Kzt|tyeB4|u8ztl|wexEY|xI7yg|xKmey|xlLfn; exp-ck=3WA5l23mpU414y_zO27Mi3H19ZpcO3CQWzm1Dtw1C2Gsq0D1K2IBM2NBAls1SmVSa1XA_S71ZMsWU1_PuEf2_k6Nd1c6tgM3c8HYq1g0dgr2gjcSc1hfG5k1jfF1F1k5Qv91m27Rv4pSCez1rwZnR2s4Kzt1tyeB41u8ztl1wexEY5; _pxhd=698ff87d93a93ed9f89a73e4e6c77a5c734c81ba99a922395548a8eb2aa7e00b:52154282-5473-11ed-b9f2-59735a52634c; xptwj=rq:c0230cf264b719665373:s710SFT60lhqEPonfVuvr2B6ctv5sq+9dXTnViH5kLJpLC4Fy10M1FN8dJ4ZSr7GnvlQIR/DwOD52/4SqFzca/shUpkJDSNYqNgr3Wp4VvHDryb7b4T/tEyPcYtQU2E=; ak_bmsc=F7BDA4A3C3117052261031E78D38D00B~000000000000000000000000000000~YAAQvQyrcd+YYgOEAQAAo8GYDxEk3DyINqqdCrVzFyUmPaAfKIc+6CDLCl3ImopM1zOTC50l7EGpDH6805a05a6nPzBleKsVc9tuq91fYITjrAMxVMVqoubhZbQPqh7l0VezTuCPdsKoMVB+IhthwpV1NxeJYi4e7I1CTakHZjFm3xPnnF6uJNoP7l97qZ7h7BlmkWSK/cMaZNsgMsuKNQmFpTERbebL7Rb2hxvvBytMcXNnRQwssNxzwBIBjiwsASi4dFP6Pf2Ia+RRLGa8O1E1M1+JSY1d7piTAmLKdXFA5OyOQqYNHovpc6SxAR64xqxuJgl8fHwFQsi5fNBE25tR7kyxPzccvyywWlSTsw0T2YUlCJ2YK3mN7wx09TioCeNfNn21uOkaFQ==; TBV=7; _astc=b7110d78d40e6b2888ab5c09c28dd0ec; xptc=assortmentStoreId%2B3081; xpm=0%2B1666708981%2BSMQLwm91_gegea0QrvOi14~%2B0; xptwg=1297167773:1150BC51E2598E0:2C9EC86:B943FD47:27A900D9:5A9724AD:; TS012768cf=01ecfe58772179bdd27a7c8002ecdff53a07e60aa5c07b01a3ddca983234daeea4bebb3121959bbc4e954ecf2706fa7419c53580dc; TS01a90220=01ecfe58772179bdd27a7c8002ecdff53a07e60aa5c07b01a3ddca983234daeea4bebb3121959bbc4e954ecf2706fa7419c53580dc; TS2a5e0c5c027=08cbf8645fab2000e40808b7ae8c03aad4350848f8dfdb6248b6a4081af360ed1b6e349ceafbf5e508983d5056113000287cb65d10172377274a5949ce486c4740a35adc79dbc8d9e049a1345acdbb17889663ff1ddabb3e1788187b031722b4; bm_sv=A52F25F6B8F7EECACE91D7D8263851B4~YAAQvQyrcfKYYgOEAQAA5siYDxEX6e6FveIM2AsclOCrKWm31m469tWEi9y/BwiGNUc5z3FivRZqhLfvkB71CCQQQVIIkZpNai7CH9NRUlpnzqR3HP2yPhZh1uoT0rPYDk4I+oz8ILpDHitadUkM6Ak5MZhmyTEQdMFRBR6uNrWpEs2yYeD0URWk01trEbktmxjdorKwiyVB6rTRR+ITzOvtFwlOy7XaTtK8IcBS2RPbiyuQMgZx2QJ9ymABIChLDg==~1' \
  -H 'device_profile_ref_id: STpER---mCdAIPfqDm3CiulpLdcqCEWVG71V' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/230e4ddf-dca8-4e6c-9a2e-3897c1924bb4' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-f97b816181c2d4f482d20bde169a8962-15554fee2c1fd957-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.52' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/230e4ddf-dca8-4e6c-9a2e-3897c1924bb4' \
  -H 'wm_qos.correlation_id: w_9mBJla0VBh4UG4IlE8rlDucO3IgGoEj7mK' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: w_9mBJla0VBh4UG4IlE8rlDucO3IgGoEj7mK' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed