#!/usr/bin/env bash
# iron-frontier.html을 앱용 www/로 복사하고, 지도 라이브러리를 앱 안에 넣어 오프라인에서도 열리게 한다.
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf www
mkdir -p www/lib
cp iron-frontier.html www/index.html

D3=https://cdnjs.cloudflare.com/ajax/libs/d3/7.8.5/d3.min.js
TOPO=https://cdn.jsdelivr.net/npm/topojson-client@3.1.0/dist/topojson-client.min.js
curl -fsSL "$D3" -o www/lib/d3.min.js
curl -fsSL "$TOPO" -o www/lib/topojson-client.min.js

sed -i "s#$D3#lib/d3.min.js#; s#$TOPO#lib/topojson-client.min.js#" www/index.html
grep -q 'src="lib/d3.min.js"' www/index.html
grep -q 'src="lib/topojson-client.min.js"' www/index.html
echo "www/ 준비 완료"
