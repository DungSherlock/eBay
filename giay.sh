#!/bin/bash
# eval `ssh-agent -s`
git pull
: > giay-id.txt
: > giay-productPath.txt
: > giay-sku.txt
: > giay-isBackorderable.txt
: > giay-sizeIdentifier.txt
: > giay-price.txt
: > giay-stock.txt


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
  -H 'x-access-token: eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxNDQwOTM5LCJqdGkiOiIyU1NKRW1NMWVYTnFhYWlFRjh2UVU0TG8iLCJpYXQiOjE2ODYyMDc1MTQsImV4cCI6MTY4NzQxNzExNH0.7qO0WFYilN2mSUIh8GK86Bd34JtIkQQbV3oK9V-22cz9hCJamBEVFwYfsm2hbSU-G5B9Mt4PL8nNEbOxBZvAdQ' \
  --data-raw $'{"operationName":"updateCart","variables":{"setSubscription":false,"setRegular":true,"subscription":{},"variantId":16194,"quantity":-1},"query":"mutation updateCart($setSubscription: Boolean = false, $setRegular: Boolean = false, $subscription: JSON\u0021, $variantId: Int\u0021, $quantity: Int\u0021, $lineItemId: Int) {\\n  subscription: storeSubscriptionCart(cart: $subscription) @include(if: $setSubscription) {\\n    errors {\\n      ...Error\\n      __typename\\n    }\\n    message\\n    success\\n    subscriptionCartToken\\n    __typename\\n  }\\n  regular: populateOrder(\\n    variantId: $variantId\\n    quantity: $quantity\\n    lineItemId: $lineItemId\\n  ) @include(if: $setRegular) {\\n    message\\n    order {\\n      number\\n      guestToken\\n      total\\n      items {\\n        ...OrderItem\\n        __typename\\n      }\\n      __typename\\n    }\\n    success\\n    __typename\\n  }\\n}\\n\\nfragment Error on Error {\\n  extensions {\\n    code\\n    fieldErrors\\n    messageExtension\\n    __typename\\n  }\\n  message\\n  __typename\\n}\\n\\nfragment OrderItem on OrderItem {\\n  id\\n  ean\\n  sku: masterSku\\n  name\\n  productName\\n  groupName\\n  imageUrl\\n  color\\n  size: displaySize\\n  sizeIdentifier\\n  currency\\n  amount: displayAmount\\n  quantity\\n  price\\n  productPath\\n  productType\\n  stock\\n  giftCardMessage\\n  isBackorderable\\n  variantId\\n  variantSku\\n  errors\\n  __typename\\n}"}' \
  --compressed`


echo $list | jq '.data.regular.order.items[].id' >> giay-id.txt
echo $list | jq '.data.regular.order.items[].productPath' >> giay-productPath.txt
echo $list | jq '.data.regular.order.items[].sku' >> giay-sku.txt
echo $list | jq '.data.regular.order.items[].isBackorderable' >> giay-isBackorderable.txt
echo $list | jq '.data.regular.order.items[].sizeIdentifier' >> giay-sizeIdentifier.txt
echo $list | jq '.data.regular.order.items[].price' >> giay-price.txt
echo $list | jq '.data.regular.order.items[].stock' >> giay-stock.txt


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbxw6ks67mRZMYmbprI4rgVyqLcM3rHWXgJvvgGNkQCubDFVT8sszLPJwPs4IATZUmcpgw/exec?`
linkPost=$linkApi`echo \
\id==IMPORTDATA\(\"`$linkGit`echo giay-id.txt\"\)\
\&productPath==IMPORTDATA\(\"`$linkGit`echo giay-productPath.txt\"\)\
\&sku==IMPORTDATA\(\"`$linkGit`echo giay-sku.txt\"\)\
\&isBackorderable==IMPORTDATA\(\"`$linkGit`echo giay-isBackorderable.txt\"\)\
\&sizeIdentifier==IMPORTDATA\(\"`$linkGit`echo giay-sizeIdentifier.txt\"\)\
\&price==IMPORTDATA\(\"`$linkGit`echo giay-price.txt\"\)\
\&stock==IMPORTDATA\(\"`$linkGit`echo giay-stock.txt\"\)\
`
linkApiFly=`echo https://script.google.com/macros/s/AKfycbwwR3gPp-UqPXt8PDWLkC0ZI0TwY4Xb2dmdZ6xbGSdk_fTgyTfsDi5Ak_QHe5WLmt85nw/exec?`
linkPostFly=$linkApiFly`echo \
\id==IMPORTDATA\(\"`$linkGit`echo giay-id.txt\"\)\
\&productPath==IMPORTDATA\(\"`$linkGit`echo giay-productPath.txt\"\)\
\&sku==IMPORTDATA\(\"`$linkGit`echo giay-sku.txt\"\)\
\&isBackorderable==IMPORTDATA\(\"`$linkGit`echo giay-isBackorderable.txt\"\)\
\&sizeIdentifier==IMPORTDATA\(\"`$linkGit`echo giay-sizeIdentifier.txt\"\)\
\&price==IMPORTDATA\(\"`$linkGit`echo giay-price.txt\"\)\
\&stock==IMPORTDATA\(\"`$linkGit`echo giay-stock.txt\"\)\
`

echo '[InternetShortcut]
URL='$linkPost > giay.url
open giay.url

echo '[InternetShortcut]
URL='$linkPostFly > giayFly.url
open giayFly.url