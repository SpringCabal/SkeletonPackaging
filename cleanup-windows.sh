#!/bin/bash
# Script to cleanup Windows packaging
pushd Windows
rm spring-dedicated.exe spring-headless.exe pr-downloader.exe
rm AI/Skirmish/{AAI,E323AI,HughAI,KAIK,RAI,Shard}* -rf
popd
