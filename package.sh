#!/bin/sh
#TODO: add maps and games or this won't work! fullpaths only
declare -a GAMES=()
declare -a MAPS=()

echo "Preparing games..."
for i in "${GAMES[@]}"
do
    cp "$i" -r ./Base/games/
done
echo "Preparing maps..."
for i in "${MAPS[@]}"
do
    cp "$i" -r ./Base/maps/
done
echo "Done."
