#!/bin/sh

true>chesscom.json
true>chesscom.pgn

archives=$(curl https://api.chess.com/pub/player/pnmadelaine/games/archives | jq -r ".archives[]")

for url in $archives
do
    json=$(curl "$url")
    echo "$json" >> chesscom.json
    echo "$json" | jq -r ".games[].pgn" >> chesscom.pgn
done
