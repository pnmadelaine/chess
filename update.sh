#!/usr/bin/env bash

user=pnmadelaine
token=$(cat token.txt)

curl "https://lichess.org/api/games/user/$user?clocks=true&pgnInJson=true&sort=dateAsc" \
	-H "Authorization: Bearer $token" \
	-H "Accept: application/x-ndjson" \
	> games.json

cat games.json | jq ".pgn" -r > games.pgn
