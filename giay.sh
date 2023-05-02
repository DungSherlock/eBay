#!/bin/bash

git pull
: > giay-id.txt
: > giay-productPath.txt
: > giay-size.txt
: > giay-price.txt
: > giay-stock.txt


list=`curl -s 'https://www.on-running.com/en-us/graphql' \
  -H 'authority: www.on-running.com' \
  -H 'accept: */*' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'cookie: on_uuid=00a03e10-25a2-4ce4-88e1-f5af1976bdc6; guest_token=IlFYOU81aTd4aEZESkkycVdOdkJMNlEi--9ed2e6fedd63c22d4e589b4d3c915231fb2cf1bd; locale=en-us; order_guest_token=QX9O5i7xhFDJI2qWNvBL6Q; v1_0_0=false; force_new_site_for_checkout=false; on_session_id=c2bf5e30-aa10-4e41-95c8-bbaca186c64d; access_token=eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxMDc1NjU4LCJqdGkiOiI1c2pZblZVVlk0Rzluc3hURU1aN1JmUFkiLCJpYXQiOjE2NjkzNjE2MzUsImV4cCI6MTY3MDU3MTIzNX0.ZGwpBU6hf0aK3BxNmyKJpPq6UW38O9gRqE-vomeiY9080W4ZOLtszkRyQEcbHdOUU3GYtxhhucwDCxtbTRw7Zg; CSRF-TOKEN=4J5ZG%2FvmE%2F0NzUWMNYlNt5JUFL%2FqcL5ukyQa9iFmT%2FOY%2Bnh1l2D0pygb6FdJdsUDpkhhj9VHoNaKNGIjr%2BFlng%3D%3D; _on_running_session=Y2JwSXR6RkEvd0JzNXp5UUZVTnVRbU0ySVFMOEl5WVJIOTZ3WnlaSXVNMHpBRUo0djBHa1BHNWJRV1l3bHNkOWE3bmREZGJ3cXd5RWYxOWVKaWdyZ2J0YTZvUVdxUTNxNStyd0kzbTRpMlpJVitEV1REay9yNnhHa1lqVzU2cFRPSDVmY0dsRjUyU0pwZnhSTDJHcHlQcXVaY2cwRGd5MFdxbEN0SFFSd0ZyNlEvSVFCeDlaR1ZxNjNYKzh3QXphN3ZnZXFKNE94c3hzNzFQa3lLalF3VS9yNEFBTjRSM2sxTzlTYTVMRTROQ1h5R3M2RWxkM2l5NFIxSVJlbm1JNnJyOFY0VEgyZUQ3cllPd0ZaZmxuV2paTnlYZXZvb1dzdVoxZ1hQMld4bWZoZXUvWWUyQXd1Q3JLc0t6RnZzMGQ4Uis2UWVrYkNIV1dTVTE1dFVCZmpMbjIvVkZQdm1ZZTZETytqeTFJVDY0MStEUGNXQkM2UTN4YnJzd1QxQ2pPU0RFRVVxeURveWpyUndvMTZscDZkbTM5eUNHM21WbmxPMWUxYWxvK0pQUkZmZll0dDlvUVRZb1hCaHVrNDQxYnM1VWRXWGgrU0lzS25Oa2hHbEVUSXc9PS0tNWI5ODhremNZVThtcElEaFdjUnZ6QT09--2c2670df759bf292f59a116fce82611acbc8c053' \
  -H 'dnt: 1' \
  -H 'on-client: frontend' \
  -H 'origin: https://www.on-running.com' \
  -H 'referer: https://www.on-running.com/en-us/cart' \
  -H 'sec-ch-ua: "Microsoft Edge";v="107", "Chromium";v="107", "Not=A?Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.28' \
  -H 'x-csrf-token: 4J5ZG/vmE/0NzUWMNYlNt5JUFL/qcL5ukyQa9iFmT/OY+nh1l2D0pygb6FdJdsUDpkhhj9VHoNaKNGIjr+Flng==' \
  --data-raw '{"operationName":null,"variables":{},"query":"{\n  currentOrder {\n    number\n    email\n    checkoutVersion\n    state\n    completedAt\n    containsSocks\n    isRegistrationValid\n    isShippingValid\n    isPaymentValid\n    adyenTotalAmount\n    guestToken\n    isPreorder\n    isExcludedFromStoreCredit\n    isCyclon\n    items {\n      id\n      variantId\n      variantSku\n      sku\n      color\n      name\n      groupName\n      imageUrl\n      price\n      productPath\n      productType\n      quantity\n      size\n      stock\n      giftCardMessage\n      isBackorderable\n      variant {\n        isPreorderable\n        __typename\n      }\n      __typename\n    }\n    promotionAdjustment {\n      ...promotionAdjustment\n      __typename\n    }\n    payments {\n      amount\n      paymentMethodType\n      __typename\n    }\n    __typename\n  }\n  paths {\n    explorePath\n    cartUrl\n    __typename\n  }\n}\n\nfragment promotionAdjustment on PromotionAdjustment {\n  id\n  amount\n  code\n  currency\n  __typename\n}\n"}' \
  --compressed`


# echo $list | jq '.data.currentOrder.items[]'
# sleep 20
echo $list | jq '.data.currentOrder.items[].id' >> giay-id.txt
echo $list | jq '.data.currentOrder.items[].productPath' >> giay-productPath.txt
echo $list | jq '.data.currentOrder.items[].size' >> giay-size.txt
echo $list | jq '.data.currentOrder.items[].price' >> giay-price.txt
echo $list | jq '.data.currentOrder.items[].stock' >> giay-stock.txt


git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/DungSherlock/eBay/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbwjeDgCI1EMcwOCQoOqeIKyTa2zHJ3UOfGru0J_RfnHPjjQNaCYbsg1bX9q_8kL0k7ANQ/exec?`
linkPost=$linkApi`echo id==IMPORTDATA\(\"`$linkGit`echo giay-id.txt\"\)\&productPath==IMPORTDATA\(\"`$linkGit`echo giay-productPath.txt\"\)\&size==IMPORTDATA\(\"`$linkGit`echo giay-size.txt\"\)\&price==IMPORTDATA\(\"`$linkGit`echo giay-price.txt\"\)\&stock==IMPORTDATA\(\"`$linkGit`echo giay-stock.txt\"\)`
echo $linkPost

echo '[InternetShortcut]
URL='$linkPost > giay.url
open giay.url