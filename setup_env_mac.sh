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

if [ -e $HOME/.bashrc ] && [ ! -e $HOME/.bashrc.bkp ]; then
    cp $HOME/.bashrc $HOME/.bashrc.bkp
    cat ./bashrc_mac >> $HOME/.bashrc
    echo Added stuff to .bashrc
    echo Make sure to check for mistakes
else
    cp ./bashrc_mac $HOME/.bashrc
    echo Created a .bashrc for you
fi

if [ -e $HOME/.bash_profile ] && [ ! -e $HOME/.bash_profile.bkp ]; then
    cp $HOME/.bash_profile $HOME/.bash_profile.bkp
    cat ./bash_profile_mac >> $HOME/.bash_profile
    echo Added stuff to .bash_profile
    echo Make sure to check for mistakes
else
    cp ./bash_profile_mac $HOME/.bash_profile
    echo Created a .bash_profile for you
fi


if [ -e $HOME/.vimrc ] && [ ! -e $HOME/.vimrc.bkp ]; then
    cp $HOME/.vimrc $HOME/.vimrc.bkp
    cat ./vimrc_default_mac >> $HOME/.vimrc
    echo Added stuff to .vimrc
    echo Make sure to check for mistakes
else
    cp ./vimrc_default_mac $HOME/.vimrc
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
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o miniconda3.sh
bash miniconda3.sh

echo Setting up fortunes
cd $INSTALL_DIR
cp -r fortunes/ ~/

echo "RUN after_conda_setup!!!"

echo All done! \{hopefully\}

