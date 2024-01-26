#!/usr/bin/env bash
set -euo pipefail

path=$(dirname "${BASH_SOURCE[0]}")
path="$path/.."

cd "$path"

scripts/lichess.sh
scripts/chesscom.sh
scripts/ratings.sh
