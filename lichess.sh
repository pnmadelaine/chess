#!/bin/sh

user=pnmadelaine

curl "https://lichess.org/api/games/user/$user?clocks=true&pgnInJson=true&sort=dateAsc" \
	-H "Accept: application/x-ndjson" \
	| jq > lichess.json

jq ".pgn" -r < lichess.json > lichess.pgn
