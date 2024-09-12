#!/usr/bin/env bash
set -euo pipefail

true>tmp.json

curl "https://lichess.org/api/games/user/pnmadelaine?clocks=true&pgnInJson=true" -H "Accept: application/x-ndjson" | jq '{ "pgn": .pgn, "time": .lastMoveAt }' >> tmp.json

archives=$(curl https://api.chess.com/pub/player/pnmadelaine/games/archives | jq -r '.archives[]')
for url in $archives
do
    curl "$url" | jq '.games | map({ "pgn": .pgn, "time": (.end_time*1000) }) | .[]' >> tmp.json
done

cat tmp.json | jq --slurp -r 'sort_by(.time) | reverse | .[].pgn' > tmp.pgn

vim -c ':%s/\[Site "https:\/\/lichess.org\//\[Site "Lichess"\]\r\[Link "https:\/\/lichess.org\//' -c ':wq' tmp.pgn

pgn-extract tmp.pgn -o online.pgn -R roster.txt --xroster --fencomments --commentlines -w 1000

vim -c ':g/^{/-1j' -c ':%s/ {[^{}]*}$//' -c ':wq' online.pgn

rm tmp*
