#!/usr/bin/env bash
set -euo pipefail

curl "https://lichess.org/api/games/user/pnmadelaine?clocks=true&pgnInJson=true&sort=dateAsc" \
	-H "Accept: application/x-ndjson" \
	| jq '.pgn' -r > lichess.pgn
