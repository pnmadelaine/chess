#!/usr/bin/env bash

curl "https://lichess.org/api/games/user/pnmadelaine?clocks=true&pgnInJson=true&sort=dateAsc" \
	-H "Accept: application/x-ndjson" \
	| jq > lichess.json

jq ".pgn" -r < lichess.json > lichess.pgn
