#!/usr/bin/env bash
CWD=$(pwd)
cd $HOME
read -p "This might take a while, <CTRL-C> to abort, otherwise press [Enter]"
perlbrew install perl-5.22.1
perlbrew switch perl-5.22.1
perlbrew lib create default
perlbrew switch perl-5.22.1@default
perlbrew install-cpanm
cpanm Bio::Index::Fastq
echo Done
cd $CWD
