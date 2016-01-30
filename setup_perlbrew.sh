#!/usr/bin/env bash
CWD=$(pwd)
cd $HOME
perlbrew install perl-5.22.1
perlbrew switch perl-5.22.1
perlbrew lib create default
perlbrew switch perl-5.22.1@default
perlbrew install-cpanm
echo Done
cd $CWD
