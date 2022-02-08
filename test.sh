#!/bin/bash
curl -s 'https://www.amazon.com/Ninja-BL710WM-Professional-Countertop-Technology/dp/B08JQR8RWS' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62' | grep "priceAmount.*"