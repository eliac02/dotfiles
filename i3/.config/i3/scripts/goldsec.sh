#!/bin/bash

# Conta le finestre aperte nel workspace attuale
WINDOW_COUNT=$(i3-msg -t get_tree | jq '.. | select(.focused?) | .nodes | length')

# Se non ci sono finestre, esci
if [ "$WINDOW_COUNT" -eq 0 ]; then
    exit 0
fi

# Se il numero di finestre è pari, splitta verticalmente e ridimensiona
if [ $((WINDOW_COUNT % 2)) -eq 0 ]; then
    i3-msg split v
    i3-msg resize set 100 ppt 62 ppt
else
    i3-msg split h
    i3-msg resize set 62 ppt 100 ppt
fi

