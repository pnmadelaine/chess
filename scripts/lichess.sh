#!/usr/bin/env bash
set -euo pipefail

curl "https://lichess.org/api/games/user/pnmadelaine?clocks=true&pgnInJson=true&sort=dateAsc" \
	-H "Accept: application/x-ndjson" \
	| jq '.pgn' -r > lichess.pgn

curl "https://lichess.org/api/study/65ikUc0b.pgn" > otb.pgn
