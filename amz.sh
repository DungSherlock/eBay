#!/bin/bash
curl=`curl 'https://www.amazon.com/gp/product/B08HZ3W36X/ref=ewc_pr_img_1?smid=AJE1XFPPGWEBV&psc=1' \
  -H 'Accept-Encoding: gzip,deflate' \
  -H 'authority: www.amazon.com' \
  -H 'cache-control: max-age=0' \
  -H 'rtt: 0' \
  -H 'downlink: 1' \
  -H 'ect: 4g' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Microsoft Edge";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'dnt: 1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.39' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'sec-fetch-site: none' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-user: ?1' \
  -H 'sec-fetch-dest: document' \
  -H 'accept-language: vi' \
  --compressed`
  
echo $curl > /tmp/amz.txt
echo $curl | grep -Eo ">[$].*?<" | head -n 1 | sed 's/[^0-9.]//g'
# echo $curl | grep -Eo "dp\/.*?\/ref" | sed -E 's/dp\/|\/ref//g'
