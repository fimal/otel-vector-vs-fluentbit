#!/bin/bash

# Wait for envoy to get ready
/bin/sleep 3
# start test
k6 run -e DURATION=10s -e RATE=10 /tests/http_case_01.js -e MY_HOST='envoy:9000' -e USER_IP='100.100.100.100' -e CASE=vector -e DOMAIN=kwaf-demo.test > /dev/null 2>&1
/bin/sleep 60
