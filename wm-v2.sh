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
    -H 'cookie: auth=MTAyOTYyMDE46w9Bm%2BemZ22loisJQ967LbnpaMY6p6CvPTvvb4lOPTQTN9VFoKGRjhBrID0bqZEQlB5U%2Ff%2F7WVtdmezKDZJA1ItMv4t%2BPBbTzQF5azRygizPNZe60HOO8d5KX9YgFsTq767wuZloTfhm7Wk2KcjyglM949MaUzwsNnQKx2EXSLnzGFnnEx%2BthGQTwWUlWA5GsA0U%2FQWRUFjzKRRmtCWZ2tjfwSzdlnzRIWHn1BmAPhcUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrnD4rvA43JuOFpNa8qdbeeaF4XGTmghdeBckMBw2CDaIgbJpisXSC3Tf4GJ165qbIK5wxjd%2FmF4p3FkZXRhIuvQkhbC8OcusRArYrGvsJGd6GhcAtVfHbbugr21xkAfyFUjyrOXbKKhH072NS%2FW0j%2FU%3D; ACID=4aace666-880d-41ac-b7ca-a9f5d261586c; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=ehsX7LfSDzprr0k6mHF7H4; bstc=ehsX7LfSDzprr0k6mHF7H4; mobileweb=0; xpa=0NcOK|0l7ho|1A0pE|3N8tX|3PDIm|43yFS|4umko|5_9FA|5mXkC|6EWr4|6X-MK|7ck4z|927zv|AIud-|AQhLM|AYraE|D-rsV|DuuJN|EnFRj|EyvKe|IGH-j|IouYg|KVFRn|Nnski|P_fCM|RWwzc|S3bS1|UyDqn|V-nnO|VCwdZ|VZPZz|X4nSu|YF3pN|a0tqZ|bcl64|cfVAR|d6VMJ|dm6DU|fZHdi|gVG-b|kFqfr|lqVt_|mWm7X|pisnD|qyn67|r8csb|sQWPT|uru_L|vwMwa|yxNJ6; exp-ck=0NcOK10l7ho13N8tX33PDIm143yFS15_9FA26EWr436X-MK2927zv1AQhLM1D-rsV1IouYg2Nnski1RWwzc1S3bS11V-nnO1a0tqZ1d6VMJ1dm6DU1fZHdi2gVG-b1kFqfr1mWm7X1pisnD1qyn672r8csb1yxNJ65; _pxhd=48c01b44426b28b09b1dd60df3436eff10567bc21ddcb2742d2de92b7898f772:570f03c8-274d-11ed-8cee-4a784b677063; ak_bmsc=29CE25AEEB9E6ACD13AE1A8272E0D806~000000000000000000000000000000~YAAQk+arcZCy+LSCAQAAm1625xBmVOYc/TKT3l8diGkvI/bC5gJqKFwd/dD9zQpTn6UQ1bPTLR6mlBOf8QT91VJa96C9Rnov8WwHT25EWtdwyF0dNRs5K32jl8wexKAeHY+xbMsdgvKy1UqjmIqowMRPzX0urmfnZ0FBrvBOM5Y5oOZngVQUob2iMLL/JMtdwnkKElpVGTH60cqTN7G1gb5U/wB/2m8qLR/Oy+b7FNO+CaHw1QXWj9QmD11+Ja2UYMG34kQpbWMTdpdjbKK7g5iYSP6rVoFmQyvsMrObfVs9RdEWzBGF8q1VE9+mOdTU1G0DTTLXoy22exxAtYlo0cQVGzljyGbkWdeJgNvLQYdQpGSJgFTwgxr9H/TqSDQJwY2l9nr3yCvg5NQAdA==; TBV=7; xpm=1%2B1661744864%2BehsX7LfSDzprr0k6mHF7H4~%2B0; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIzMDgxIiwiZGlzcGxheU5hbWUiOiJTYWNyYW1lbnRvIFN1cGVyY2VudGVyIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6Ijk1ODI5IiwiYWRkcmVzc0xpbmUxIjoiODkxNSBHZXJiZXIgUm9hZCIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiOTU4MjktMDAwMCJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6MzguNDgyNjc3LCJsb25naXR1ZGUiOi0xMjEuMzY5MDI2fSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiaHViTm9kZUlkIjoiMzA4MSIsInN0b3JlSHJzIjoiMDY6MDAtMjM6MDAiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJQSUNLVVBfSU5TVE9SRSIsIlBJQ0tVUF9DVVJCU0lERSIsIlBJQ0tVUF9TUEVDSUFMX0VWRU5UIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ0LCJsb25naXR1ZGUiOi0xMjEuMzQzNywicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjYxNzY2NDY3NjE3LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6NGFhY2U2NjYtODgwZC00MWFjLWI3Y2EtYTlmNWQyNjE1ODZjIn0%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NjE3NDQ4Njc2MDh9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY2MTc0NDg2NzYwOCwiYmFzZSI6Ijk1ODI5In0sIm1wIjpbXSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjRhYWNlNjY2LTg4MGQtNDFhYy1iN2NhLWE5ZjVkMjYxNTg2YyJ9; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1661744981880; _astc=c8497b4dcd1486629dad7882e9b7d22d; akavpau_p2=1661745751~id=ca9fc3e8555730771933fad6313bb9d9; bm_mi=7674B6A9F8DFE81A7CFDAE21A89D17C4~YAAQgearccJXFrOCAQAAlLy65xCL7tQyXhZ1CKFqBMKiLqZFvB67kJZ5WqZe71ncbWuJMu4CB0spAK+WrTu4MsvCkztHNUj/xcR+lUH3trpvENzsB/Qec0SOCdqm3K/Gez8zkDIMIp7DilifaKM+ClQiTJQ3pUVbVJpdrNwCBF6/3lDfnuPJWgh3Y5obyo33rjp7JM+BEaIysLoGLYdifX2PZXAdBuK8IucrAt/rNEFyWNQBApV1EV+ahrfBZedC8f20o5zPU3U6hAE2d0eixuSfAyGlmi5qmBsjncl8CDdQlcYKoGNI8UE2cDLs5XskY6zNO9bm2l0A09HrDxxF~1; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1661745153000@firstcreate:1661744864525"; xptwg=1994274442:111EB1F9C79A740:2C3F91A:B1F8E3A:6D66BDA6:3C16596B:; TS012768cf=01e30cfaf0a119c71841a3fc96b8fc9dfdf455f5e5a24c2037b90bbbd90259c639ef8ef9db04257927e102223ed3c5669b7662829d; TS01a90220=01e30cfaf0a119c71841a3fc96b8fc9dfdf455f5e5a24c2037b90bbbd90259c639ef8ef9db04257927e102223ed3c5669b7662829d; TS2a5e0c5c027=08604f4c92ab2000458f64d385689760c873be6653dc2a88de6a0fc361b47cba97be0c30ae1e651708ac1a7be3113000f3b10efee14bc8def251e429c1c5d0b86ff0d8615a9b2966952ba121ee599428f4b9bdf2210b6a478844a1be04c716e0; bm_sv=F574C5C1CB484B0B0D28BBFF617B5D09~YAAQgearcehXFrOCAQAAHse65xBujRRN5XQJKpsmVvQ8Fip7xio9UugPLhVoEFirDMoYcXAZ34qhp1CTatAnI8ieQYHxUopdnG5lEZOU+8zHbnbMfERcmaXAuphSuLBX1pjq7COrkt9PtVQw5Ngc0DWwScdH1T0FEEAUC6v5VtJHBGLzpbi3OeMSN1ztj4l9bhHYtkEpW+lt1elWkU50vTcI+gWQGKNuFEkWSZUfvGddOPhRgaqxnm/rekvshEWMUQ==~1' \
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
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.42' \
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
    -H 'cookie: auth=MTAyOTYyMDE46w9Bm%2BemZ22loisJQ967LbnpaMY6p6CvPTvvb4lOPTQTN9VFoKGRjhBrID0bqZEQlB5U%2Ff%2F7WVtdmezKDZJA1ItMv4t%2BPBbTzQF5azRygizPNZe60HOO8d5KX9YgFsTq767wuZloTfhm7Wk2KcjyglM949MaUzwsNnQKx2EXSLnzGFnnEx%2BthGQTwWUlWA5GsA0U%2FQWRUFjzKRRmtCWZ2tjfwSzdlnzRIWHn1BmAPhcUMk70P8glgOEpLOprhDfMM%2FFHGZ2dCNmxWrdkwqEKrnD4rvA43JuOFpNa8qdbeeaF4XGTmghdeBckMBw2CDaIgbJpisXSC3Tf4GJ165qbIK5wxjd%2FmF4p3FkZXRhIuvQkhbC8OcusRArYrGvsJGd6GhcAtVfHbbugr21xkAfyFUjyrOXbKKhH072NS%2FW0j%2FU%3D; ACID=4aace666-880d-41ac-b7ca-a9f5d261586c; hasACID=true; assortmentStoreId=3081; hasLocData=1; TB_Latency_Tracker_100=1; TB_Navigation_Preload_01=1; TB_SFOU-100=; vtc=ehsX7LfSDzprr0k6mHF7H4; bstc=ehsX7LfSDzprr0k6mHF7H4; mobileweb=0; xpa=0NcOK|0l7ho|1A0pE|3N8tX|3PDIm|43yFS|4umko|5_9FA|5mXkC|6EWr4|6X-MK|7ck4z|927zv|AIud-|AQhLM|AYraE|D-rsV|DuuJN|EnFRj|EyvKe|IGH-j|IouYg|KVFRn|Nnski|P_fCM|RWwzc|S3bS1|UyDqn|V-nnO|VCwdZ|VZPZz|X4nSu|YF3pN|a0tqZ|bcl64|cfVAR|d6VMJ|dm6DU|fZHdi|gVG-b|kFqfr|lqVt_|mWm7X|pisnD|qyn67|r8csb|sQWPT|uru_L|vwMwa|yxNJ6; exp-ck=0NcOK10l7ho13N8tX33PDIm143yFS15_9FA26EWr436X-MK2927zv1AQhLM1D-rsV1IouYg2Nnski1RWwzc1S3bS11V-nnO1a0tqZ1d6VMJ1dm6DU1fZHdi2gVG-b1kFqfr1mWm7X1pisnD1qyn672r8csb1yxNJ65; _pxhd=48c01b44426b28b09b1dd60df3436eff10567bc21ddcb2742d2de92b7898f772:570f03c8-274d-11ed-8cee-4a784b677063; ak_bmsc=29CE25AEEB9E6ACD13AE1A8272E0D806~000000000000000000000000000000~YAAQk+arcZCy+LSCAQAAm1625xBmVOYc/TKT3l8diGkvI/bC5gJqKFwd/dD9zQpTn6UQ1bPTLR6mlBOf8QT91VJa96C9Rnov8WwHT25EWtdwyF0dNRs5K32jl8wexKAeHY+xbMsdgvKy1UqjmIqowMRPzX0urmfnZ0FBrvBOM5Y5oOZngVQUob2iMLL/JMtdwnkKElpVGTH60cqTN7G1gb5U/wB/2m8qLR/Oy+b7FNO+CaHw1QXWj9QmD11+Ja2UYMG34kQpbWMTdpdjbKK7g5iYSP6rVoFmQyvsMrObfVs9RdEWzBGF8q1VE9+mOdTU1G0DTTLXoy22exxAtYlo0cQVGzljyGbkWdeJgNvLQYdQpGSJgFTwgxr9H/TqSDQJwY2l9nr3yCvg5NQAdA==; TBV=7; xpm=1%2B1661744864%2BehsX7LfSDzprr0k6mHF7H4~%2B0; locDataV3=eyJpc0RlZmF1bHRlZCI6ZmFsc2UsImlzRXhwbGljaXQiOmZhbHNlLCJpbnRlbnQiOiJTSElQUElORyIsInBpY2t1cCI6W3siYnVJZCI6IjAiLCJub2RlSWQiOiIzMDgxIiwiZGlzcGxheU5hbWUiOiJTYWNyYW1lbnRvIFN1cGVyY2VudGVyIiwibm9kZVR5cGUiOiJTVE9SRSIsImFkZHJlc3MiOnsicG9zdGFsQ29kZSI6Ijk1ODI5IiwiYWRkcmVzc0xpbmUxIjoiODkxNSBHZXJiZXIgUm9hZCIsImNpdHkiOiJTYWNyYW1lbnRvIiwic3RhdGUiOiJDQSIsImNvdW50cnkiOiJVUyIsInBvc3RhbENvZGU5IjoiOTU4MjktMDAwMCJ9LCJnZW9Qb2ludCI6eyJsYXRpdHVkZSI6MzguNDgyNjc3LCJsb25naXR1ZGUiOi0xMjEuMzY5MDI2fSwiaXNHbGFzc0VuYWJsZWQiOnRydWUsInNjaGVkdWxlZEVuYWJsZWQiOnRydWUsInVuU2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwiaHViTm9kZUlkIjoiMzA4MSIsInN0b3JlSHJzIjoiMDY6MDAtMjM6MDAiLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJQSUNLVVBfSU5TVE9SRSIsIlBJQ0tVUF9DVVJCU0lERSIsIlBJQ0tVUF9TUEVDSUFMX0VWRU5UIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ0LCJsb25naXR1ZGUiOi0xMjEuMzQzNywicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJhY2Nlc3NQb2ludHMiOm51bGwsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbXSwiaW50ZW50IjoiUElDS1VQIiwic2NoZWR1bGVFbmFibGVkIjpmYWxzZX0sImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl19LCJpbnN0b3JlIjpmYWxzZSwicmVmcmVzaEF0IjoxNjYxNzY2NDY3NjE3LCJ2YWxpZGF0ZUtleSI6InByb2Q6djI6NGFhY2U2NjYtODgwZC00MWFjLWI3Y2EtYTlmNWQyNjE1ODZjIn0%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjpmYWxzZSwicGlja3VwIjp7Im5vZGVJZCI6IjMwODEiLCJ0aW1lc3RhbXAiOjE2NjE3NDQ4Njc2MDh9LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY2MTc0NDg2NzYwOCwiYmFzZSI6Ijk1ODI5In0sIm1wIjpbXSwidmFsaWRhdGVLZXkiOiJwcm9kOnYyOjRhYWNlNjY2LTg4MGQtNDFhYy1iN2NhLWE5ZjVkMjYxNTg2YyJ9; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1661744981880; _astc=c8497b4dcd1486629dad7882e9b7d22d; akavpau_p2=1661745751~id=ca9fc3e8555730771933fad6313bb9d9; bm_mi=7674B6A9F8DFE81A7CFDAE21A89D17C4~YAAQgearccJXFrOCAQAAlLy65xCL7tQyXhZ1CKFqBMKiLqZFvB67kJZ5WqZe71ncbWuJMu4CB0spAK+WrTu4MsvCkztHNUj/xcR+lUH3trpvENzsB/Qec0SOCdqm3K/Gez8zkDIMIp7DilifaKM+ClQiTJQ3pUVbVJpdrNwCBF6/3lDfnuPJWgh3Y5obyo33rjp7JM+BEaIysLoGLYdifX2PZXAdBuK8IucrAt/rNEFyWNQBApV1EV+ahrfBZedC8f20o5zPU3U6hAE2d0eixuSfAyGlmi5qmBsjncl8CDdQlcYKoGNI8UE2cDLs5XskY6zNO9bm2l0A09HrDxxF~1; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1661745153000@firstcreate:1661744864525"; xptwg=1994274442:111EB1F9C79A740:2C3F91A:B1F8E3A:6D66BDA6:3C16596B:; TS012768cf=01e30cfaf0a119c71841a3fc96b8fc9dfdf455f5e5a24c2037b90bbbd90259c639ef8ef9db04257927e102223ed3c5669b7662829d; TS01a90220=01e30cfaf0a119c71841a3fc96b8fc9dfdf455f5e5a24c2037b90bbbd90259c639ef8ef9db04257927e102223ed3c5669b7662829d; TS2a5e0c5c027=08604f4c92ab2000458f64d385689760c873be6653dc2a88de6a0fc361b47cba97be0c30ae1e651708ac1a7be3113000f3b10efee14bc8def251e429c1c5d0b86ff0d8615a9b2966952ba121ee599428f4b9bdf2210b6a478844a1be04c716e0; bm_sv=F574C5C1CB484B0B0D28BBFF617B5D09~YAAQgearcehXFrOCAQAAHse65xBujRRN5XQJKpsmVvQ8Fip7xio9UugPLhVoEFirDMoYcXAZ34qhp1CTatAnI8ieQYHxUopdnG5lEZOU+8zHbnbMfERcmaXAuphSuLBX1pjq7COrkt9PtVQw5Ngc0DWwScdH1T0FEEAUC6v5VtJHBGLzpbi3OeMSN1ztj4l9bhHYtkEpW+lt1elWkU50vTcI+gWQGKNuFEkWSZUfvGddOPhRgaqxnm/rekvshEWMUQ==~1' \
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
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.42' \
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
linkApi=`echo https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost