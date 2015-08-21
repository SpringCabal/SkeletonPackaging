#!/bin/bash
# Script to cleanup Linux packaging
pushd Linux
rm spring-dedicated spring-headless bin/pr-downloader
rm AI/Skirmish/{AAI,E323AI,KAIK,RAI,Shard}* -rf
popd
