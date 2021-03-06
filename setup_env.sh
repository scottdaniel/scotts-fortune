echo Welcome to Scott\'s environment setup script!

export HOME=$HOME
export INSTALL_DIR=$(pwd)

echo Setting gitconfig
cp ./gitconfig_default $HOME/.gitconfig
#NB: the git filter needs "conda install jq" to work
cp ./gitattributes_global $HOME/.gitattributes_global
echo Setting up dir_colors from solarized
cp ./dir_colors $HOME/.dir_colors
#echo Setting up newplrc for kyclark\'s new.pl script
#cp ./newplrc $HOME/.newplrc

echo Lets get some favorite gits
cd $HOME
if [ ! -d src ]; then
    mkdir -p src
fi
cd src

git clone git@github.com:huyz/dircolors-solarized.git
#git clone git@github.com:kyclark/metagenomics-book.git
git clone git@github.com:brentp/bio-playground.git
#cp ./kyclark/python/new_py/new_py.py $HOME #cool script for creating new pythons
git clone https://github.com/tj/git-extras.git
cd git-extras
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
make install PREFIX=$HOME
cd $INSTALL_DIR

echo And copy over some favorite programs \(extract and install needed\)
cp src/* $HOME/src/

if [ -e $HOME/.profile ] && [ ! -e $HOME/.profile.bkp ]; then
    cp $HOME/.profile $HOME/.profile.bkp
    cat ./profile_default >> $HOME/.profile
    echo Added stuff to .profile
    echo Make sure to check for mistakes
else
    cp ./profile_default $HOME/.profile
    echo Created a .profile for you
fi

if [ -e $HOME/.vimrc ] && [ ! -e $HOME/.vimrc.bkp ]; then
    cp $HOME/.vimrc $HOME/.vimrc.bkp
    cat ./vimrc_default >> $HOME/.vimrc
    echo Added stuff to .vimrc
    echo Make sure to check for mistakes
else
    cp ./vimrc_default $HOME/.vimrc
    echo Created a .profile for you
fi

echo Setting up pathogen for vim \(makes loading vim plugins easier\)

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/powerman/vim-plugin-AnsiEsc.git
cd $INSTALL_DIR

echo Setting up anaconda 
echo This may take a while
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
bash Miniconda3-latest-Linux-x86_64.sh

echo Setting up fortune
tar -xzf src/fortune.0.2.tar.gz
cd fortune-0.2
make
if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi
cp fortune ~/bin
cd $INSTALL_DIR
cp -r fortunes/ ~/

#echo Setting up perlbrew
##curl -L http://install.perlbrew.pl | bash
#sleep 1
##perlbrew init
#echo "#Added for perlbrew" >> ~/.profile
#echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.profile
#echo Have to do the rest on your own
#echo by opening a new terminal 
#echo and running setup_perlbrew.sh
#read -p "Press [Enter] key"
#
#Not needed with anaconda
#echo Setting up pip
#python ./get-pip.py install --root $HOME
#
#if [ -z $(which pip) ]; then
#    echo pip didn\'t install aborting
#    exit 1
#else
#    echo Setting up numpy ::crosses fingers::
#    pip install --root $HOME numpy
#    echo Setting up scipy
#    pip install --root $HOME scipy
#fi
#
echo All done! \{hopefully\}

