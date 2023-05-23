#!/bin/bash
eval `ssh-agent -s`
git pull
: > giay-TEA-id.txt
: > giay-TEA-productPath.txt
: > giay-TEA-sku.txt
: > giay-TEA-isBackorderable.txt
: > giay-TEA-sizeIdentifier.txt
: > giay-TEA-price.txt
: > giay-TEA-stock.txt


list=`curl -s 'https://on-graphql-gateway.on-running.com/' \
  -H 'authority: on-graphql-gateway.on-running.com' \
  -H 'accept: */*' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'dnt: 1' \
  -H 'locale: en-us' \
  -H 'order-guest-token: 9lFVCGTA_AvTEvVA_0qHBw' \
  -H 'origin: https://www.on-running.com' \
  -H 'original-url: https:://www.on-running.com/en-us/cart' \
  -H 'referer: https://www.on-running.com/' \
  -H 'sec-ch-ua: "Microsoft Edge";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'session-id: c49d3183-a581-45b8-bd88-12d654dd6111' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 Edg/111.0.1661.43' \
  -H 'uuid: 00a03e10-25a2-4ce4-88e1-f5af1976bdc6' \
  -H 'x-access-token: eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxNTM2NzU4LCJqdGkiOiJ6VG5iZDIzS3hzY3lQWHRjM2c3M1oyckMiLCJpYXQiOjE2ODQ4MDE5MzUsImV4cCI6MTY4NjAxMTUzNX0.ODtOpUVyEN3s7OARWEYKmVbDAJ1nv1gpPMfb9Q0mVDQewm-TjfWOWIoLCowiik0CaAH4DJyZcClHmTMDWQaUWQ' \
  --data-raw $'{"operationName":"updateCart","variables":{"setSubscription":false,"setRegular":true,"subscription":{},"variantId":16194,"quantity":-1},"query":"mutation updateCart($setSubscription: Boolean = false, $setRegular: Boolean = false, $subscription: JSON\u0021, $variantId: Int\u0021, $quantity: Int\u0021, $lineItemId: Int) {\\n  subscription: storeSubscriptionCart(cart: $subscription) @include(if: $setSubscription) {\\n    errors {\\n      ...Error\\n      __typename\\n    }\\n    message\\n    success\\n    subscriptionCartToken\\n    __typename\\n  }\\n  regular: populateOrder(\\n    variantId: $variantId\\n    quantity: $quantity\\n    lineItemId: $lineItemId\\n  ) @include(if: $setRegular) {\\n    message\\n    order {\\n      number\\n      guestToken\\n      total\\n      items {\\n        ...OrderItem\\n        __typename\\n      }\\n      __typename\\n    }\\n    success\\n    __typename\\n  }\\n}\\n\\nfragment Error on Error {\\n  extensions {\\n    code\\n    fieldErrors\\n    messageExtension\\n    __typename\\n  }\\n  message\\n  __typename\\n}\\n\\nfragment OrderItem on OrderItem {\\n  id\\n  ean\\n  sku: masterSku\\n  name\\n  productName\\n  groupName\\n  imageUrl\\n  color\\n  size: displaySize\\n  sizeIdentifier\\n  currency\\n  amount: displayAmount\\n  quantity\\n  price\\n  productPath\\n  productType\\n  stock\\n  giftCardMessage\\n  isBackorderable\\n  variantId\\n  variantSku\\n  errors\\n  __typename\\n}"}' \
  --compressed`


echo $list | jq '.data.regular.order.items[].id' >> giay-TEA-id.txt
echo $list | jq '.data.regular.order.items[].productPath' >> giay-TEA-productPath.txt
echo $list | jq '.data.regular.order.items[].sku' >> giay-TEA-sku.txt
echo $list | jq '.data.regular.order.items[].isBackorderable' >> giay-TEA-isBackorderable.txt
echo $list | jq '.data.regular.order.items[].sizeIdentifier' >> giay-TEA-sizeIdentifier.txt
echo $list | jq '.data.regular.order.items[].price' >> giay-TEA-price.txt
echo $list | jq '.data.regular.order.items[].stock' >> giay-TEA-stock.txt


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycby6T3TFT3sLAYlRPCzHlS8ovaYzYRZXEXesDV5NzN-AiqlehaAWcedVkPvqXHjm9kZv/exec?`
linkPost=$linkApi`echo \
\id==IMPORTDATA\(\"`$linkGit`echo giay-TEA-id.txt\"\)\
\&productPath==IMPORTDATA\(\"`$linkGit`echo giay-TEA-productPath.txt\"\)\
\&sku==IMPORTDATA\(\"`$linkGit`echo giay-TEA-sku.txt\"\)\
\&isBackorderable==IMPORTDATA\(\"`$linkGit`echo giay-TEA-isBackorderable.txt\"\)\
\&sizeIdentifier==IMPORTDATA\(\"`$linkGit`echo giay-TEA-sizeIdentifier.txt\"\)\
\&price==IMPORTDATA\(\"`$linkGit`echo giay-TEA-price.txt\"\)\
\&stock==IMPORTDATA\(\"`$linkGit`echo giay-TEA-stock.txt\"\)\
`

echo '[InternetShortcut]
URL='$linkPost > giay-TEA.url
open giay-TEA.url