#!/bin/sh
#TODO: add maps and games or this won't work! fullpaths only
declare -a GAMES=()
declare -a MAPS=()

#Example:
#declare -a GAMES=("$HOME/.spring/games/Hunted.sdd")
#declare -a MAPS=("$HOME/.spring/maps/Hunted-Map.sdd")

echo "Cleaning up Base..."
rm -rf Base/games/* Base/maps/*
echo "Preparing games..."
for i in "${GAMES[@]}"
do
    cp "$i" -r ./Base/games/
done

pushd ./Base/games
for i in *.sdd
do
    pushd "$i"
        rm -rf .git*
        7z a -ms=off "$i.sd7" *
        mv "$i.sd7" ../
    popd
    rm -rf "$i"
    rename .sdd.sd7 .sd7 "$i.sd7"
done
popd

echo "Preparing maps..."
for i in "${MAPS[@]}"
do
    cp "$i" -r ./Base/maps/
done

pushd ./Base/maps
for i in *.sdd
do
    pushd "$i"
    rm -rf .git*
    7z a -ms=off "$i.sd7" *
    mv "$i.sd7" ../
    popd
    rm -rf "$i"
    rename .sdd.sd7 .sd7 "$i.sd7"
done
popd

echo "Packaging architectures..."
cp Base/* -r Windows/
cp Base/* -r Linux/
echo "Packaging complete."
