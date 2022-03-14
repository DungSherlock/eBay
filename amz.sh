#!/bin/bash
curl=`curl 'https://www.amazon.com/Weber-Original-Kettle-Charcoal-Grill/dp/B00004RALW' \
  # -H 'Accept-Encoding: gzip,deflate' \
  -H 'authority: www.amazon.com' \
  -H 'cache-control: max-age=0' \
  -H 'rtt: 0' \
  -H 'downlink: 10' \
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
  -H 'cookie: session-id=145-3440277-5257826; session-id-time=2082787201l; i18n-prefs=USD; ubid-main=135-0351932-9684740; session-token=CPuhT8lv2PaQaB8I0y9OoB7wlaGVQlPK8bJGCPMEPj96yNhBoN200+wt3Rtcg9vGUlKtjkG/ApfPxf+fSFLX5EwAGqKzWAFeczfVLY4C0wquhVlGu5mbsjXZrexd9mwa+qKVtVNuzRbxzNrV1485aPk82IA/wHtwEDCjG344hFwvJQH/QJ38+pE2F38UT6Ze; csm-hit=tb:s-NY3W9BBZ0H56C50SN3QQ|1647166433569&t:1647166438458&adb:adblk_no' \
  --compressed`
  
echo $curl | grep -Eo ">[$].*?<" | head -n 1 | sed 's/[^0-9.]//g'
# echo $curl | grep -Eo "dp\/.*?\/ref" | sed -E 's/dp\/|\/ref//g'
# echo $curl > /tmp/amz-all.txt