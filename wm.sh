#!/bin/bash
  # --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus,imageInfo{thumbnailUrl}}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \

list1=`curl 'https://www.walmart.com/orchestra/home/graphql' \
  -H 'authority: www.walmart.com' \
  -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
  -H 'x-o-platform: rweb' \
  -H 'dnt: 1' \
  -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
  -H 'x-latency-trace: 1' \
  -H 'wm_mp: true' \
  -H 'x-o-market: us' \
  -H 'x-o-platform-version: main-253-ebbb47' \
  -H 'x-o-gql-query: query shoppingListTotal' \
  -H 'x-apollo-operation-name: shoppingListTotal' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53' \
  -H 'x-o-segment: oaoh' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-o-ccm: server' \
  -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
  -H 'origin: https://www.walmart.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'accept-language: vi' \
  --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"5235469c-9c94-4bc9-96cc-e0f44ade3b9e","permission":"VIEW"}}}' \
  --compressed`

# list2=`curl 'https://www.walmart.com/orchestra/home/graphql' \
#   -H 'authority: www.walmart.com' \
#   -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
#   -H 'x-o-platform: rweb' \
#   -H 'dnt: 1' \
#   -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
#   -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
#   -H 'x-latency-trace: 1' \
#   -H 'wm_mp: true' \
#   -H 'x-o-market: us' \
#   -H 'x-o-platform-version: main-253-ebbb47' \
#   -H 'x-o-gql-query: query shoppingListTotal' \
#   -H 'x-apollo-operation-name: shoppingListTotal' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53' \
#   -H 'x-o-segment: oaoh' \
#   -H 'content-type: application/json' \
#   -H 'accept: application/json' \
#   -H 'x-enable-server-timing: 1' \
#   -H 'x-o-ccm: server' \
#   -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
#   -H 'origin: https://www.walmart.com' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'accept-language: vi' \
#   --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"35f6f25d-5c2a-49bb-a9f2-0c78204a2099","permission":"VIEW"}}}' \
#   --compressed`

# list3=`curl 'https://www.walmart.com/orchestra/home/graphql' \
#   -H 'authority: www.walmart.com' \
#   -H 'sec-ch-ua: "Microsoft Edge";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
#   -H 'x-o-platform: rweb' \
#   -H 'dnt: 1' \
#   -H 'x-o-correlation-id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
#   -H 'device_profile_ref_id: LlDy6XxmkLbb-fmOqyGUoK6NnHex3B5W_2Zu' \
#   -H 'x-latency-trace: 1' \
#   -H 'wm_mp: true' \
#   -H 'x-o-market: us' \
#   -H 'x-o-platform-version: main-253-ebbb47' \
#   -H 'x-o-gql-query: query shoppingListTotal' \
#   -H 'x-apollo-operation-name: shoppingListTotal' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53' \
#   -H 'x-o-segment: oaoh' \
#   -H 'content-type: application/json' \
#   -H 'accept: application/json' \
#   -H 'x-enable-server-timing: 1' \
#   -H 'x-o-ccm: server' \
#   -H 'wm_qos.correlation_id: GXeAU7LQidNgZ1VdBU6c5RdFinx2rlrmzcdc' \
#   -H 'origin: https://www.walmart.com' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'accept-language: vi' \
#   --data-raw '{"query":"query shoppingListTotal($input:ListTotalInput){shoppingListTotal(input:$input){products{priceInfo{currentPrice{price}},priceInfo{wasPrice{price}},name,usItemId,availabilityStatus}}}","variables":{"input":{"id":"caf523c1-f70a-4d38-aa12-029147e94b16","permission":"VIEW"}}}' \
#   --compressed`

if [[ $list1 =~ "blocked" || $list2 =~ "blocked" || $list3 =~ "blocked" ]]
then
  echo "Lỗi rồi!"
  exit
fi


# echo $output | jq '.data.shoppingListTotal.products[].imageInfo.thumbnailUrl' | sed 's/\,//g' > ebay-thumbnailUrl
# echo $output | jq '.data.shoppingListTotal.products[].name' | sed 's/\,//g' > ebay-name
echo $list1 | jq '.data.shoppingListTotal.products[].usItemId' > ebay-usItemId.txt
echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' > ebay-currentPrice.txt
echo $list1 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g'> ebay-wasPrice.txt
echo $list1 | jq '.data.shoppingListTotal.products[].availabilityStatus' > ebay-availabilityStatus.txt

echo $list2 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list2 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list2 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

echo $list3 | jq '.data.shoppingListTotal.products[].usItemId' >> ebay-usItemId.txt
echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.currentPrice.price' >> ebay-currentPrice.txt
echo $list3 | jq '.data.shoppingListTotal.products[].priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
echo $list3 | jq '.data.shoppingListTotal.products[].availabilityStatus' >> ebay-availabilityStatus.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?`
linkPost=$linkApi`echo Link ID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\&Giá hiện tại==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\&Trạng thái hàng==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\&Giá gốc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)`
echo $linkPost
# curl POST `https://script.google.com/macros/s/AKfycby_hOHVU89OzlCdtECUuqy3pSW83BtIPJmoW2UGMC7PWmLdxErG1Fn5niiyRyPnUgGqYA/exec?Link ID==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-usItemId.txt")&Giá hiện tại==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-currentPrice.txt")&Trạng thái hàng==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-availabilityStatus.txt")&Giá gốc==IMPORTDATA("https://raw.githubusercontent.com/DungSherlock/eBay/ea474c5affcfa46bdd9fa86d49ccb2f14f1aa5cc/ebay-wasPrice.txt")`