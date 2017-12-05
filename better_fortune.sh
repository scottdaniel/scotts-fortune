#!/usr/bin/env bash

WD=$(pwd)

echo Setting up fortune

if [[ -z $(which pip) ]]; then
    echo Might need pip
else
    pip install fortune
fi

cd ~

git clone git@github.com:ruanyf/fortunes.git fortunes

cd fortunes


