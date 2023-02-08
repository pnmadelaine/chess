#!/bin/sh

user=pnmadelaine
token=$(cat token.txt)

curl "https://lichess.org/api/games/user/$user?clocks=true&pgnInJson=true&sort=dateAsc" \
	-H "Authorization: Bearer $token" \
	-H "Accept: application/x-ndjson" \
	> lichess.json

jq ".pgn" -r < lichess.json > lichess.pgn
