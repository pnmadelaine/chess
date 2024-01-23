#!/usr/bin/env bash
set -euo pipefail

chesscom_stats=$(curl https://api.chess.com/pub/player/pnmadelaine/stats)
chesscom_rapid=$(echo "$chesscom_stats" | jq '.chess_rapid.last.rating')
chesscom_blitz=$(echo "$chesscom_stats" | jq '.chess_blitz.last.rating')

lichess_stats=$(curl https://lichess.org/api/user/pnmadelaine | jq '.perfs')
lichess_rapid=$(echo "$lichess_stats" | jq '.rapid.rating')
lichess_blitz=$(echo "$lichess_stats" | jq '.blitz.rating')

cat > README.md <<EOF
|          | rapid | blitz |
|----------|-------|-------|
| lichess  | $lichess_rapid | $lichess_blitz |
| chesscom | $chesscom_rapid | $chesscom_blitz |
EOF
