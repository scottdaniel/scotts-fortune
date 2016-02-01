#!/usr/bin/env bash
CWD=$(pwd)
cd $HOME
read -p "This might take a while, <CTRL-C> to abort, otherwise press [Enter]"
perlbrew perl-5.22.1
perlbrew switch perl-5.22.1
perlbrew lib create default
perlbrew switch perl-5.22.1@default
perlbrew-cpanm
perlbrew clean
cpanm --prompt Module::Build
cpanm --prompt Perl::Critic
cpanm --prompt Perl::Tidy
cpanm --prompt Algorithm::Munkres
cpanm --prompt Array::Compare
cpanm --prompt Bio::Phylo
cpanm --prompt Convert::Binary::C
cpanm --prompt Error
cpanm --prompt GD
cpanm --prompt Graph
cpanm --prompt GraphViz
cpanm --prompt HTML::Entities
cpanm --prompt HTML::HeadParser
cpanm --prompt HTML::TableExtract
cpanm --prompt HTTP::Request::Common
cpanm --prompt IO::Scalar
cpanm --prompt LWP::UserAgent
cpanm --prompt PostScript::TextBlock
cpanm --prompt SOAP::Lite
cpanm --prompt SVG
cpanm --prompt SVG::Graph
cpanm --prompt Set::Scalar
cpanm --prompt Sort::Naturally
cpanm --prompt Spreadsheet::ParseExcel
cpanm --prompt XML::DOM
cpanm --prompt XML::DOM::XPath
cpanm --prompt XML::LibXML
cpanm --prompt XML::Parser
cpanm --prompt XML::Parser::PerlSAX
cpanm --prompt XML::SAX
cpanm --prompt XML::SAX::Writer
cpanm --prompt XML::Simple
cpanm --prompt XML::Twig
cpanm --prompt XML::Writer
cpanm --prompt YAML
cpanm --prompt Bio::Perl
cpanm --prompt Text::Autoformat
cpanm --prompt common::sense
echo Done
cd $CWD
