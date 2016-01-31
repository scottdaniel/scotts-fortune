#!/usr/bin/env bash
CWD=$(pwd)
cd $HOME
read -p "This might take a while, <CTRL-C> to abort, otherwise press [Enter]"
perlbrew install perl-5.22.1
perlbrew switch perl-5.22.1
perlbrew lib create default
perlbrew switch perl-5.22.1@default
perlbrew install-cpanm
perlbrew clean
cpanm --prompt Module::Build
cpanm --prompt Perl::Critic
cpanm --prompt Perl::Tidy
cpanm --prompt Bio::Perl
cpanm --prompt Text::Autoformat
cpanm --prompt common::sense
echo Done
cd $CWD
