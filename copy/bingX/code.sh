#!/bin/bash
curl=`curl 'https://api-app.qq-os.com/api/statistics/v2/trader/risk-score?traderId=1132058319818604546&apiIdentity=1134551970661797889&recentDays=180' \
  -H 'authority: api-app.qq-os.com' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: vi' \
  -H 'app_version: 4.59.6' \
  -H 'appid: 30004' \
  -H 'channel: copychadingSEO' \
  -H 'cookie: __cfruid=2c5a8840e6327b2302fb47dc76259ae0fc045b43-1675957043; __cf_bm=12Y0Ks1MOOOJdo5KW.iMglJ1MdIsybzDsROyqxVSG0I-1675957043-0-AYlN/1EoDP6RobkPMemF6zIm2+aspHBPDJQZvfLdLmrtusOH1impPoOFNiMbz2L/JtLnqLDX/ZfcazWtcq17Jbw=' \
  -H 'device_id: 35b1f46c-5782-4ccc-82d9-5c47b0d27c3b' \
  -H 'dnt: 1' \
  -H 'lang: vi-VN' \
  -H 'mainappid: 10009' \
  -H 'origin: https://bingx.com' \
  -H 'platformid: 30' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Microsoft Edge";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sign: C9045523FCA1A4CA8B78E9B62FBAC69EC5425895EE550112E0BFEB31FF8B496A' \
  -H 'timestamp: 1675957085200' \
  -H 'timezone: 7' \
  -H 'traceid: d204428c-bec6-4cd8-9668-08dfee816e6f' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/111.0.1661.43' \
  -H 'visitorid: -1' \
  --compressed`
echo $curl | jq > /tmp/code.txt