echo Welcome to Scott\'s environment setup script!

export HOME=$HOME
export INSTALL_DIR=$(pwd)

echo Setting gitconfig
cp ./gitconfig $HOME/.gitconfig
echo Setting up dir_colors from solarized
cp ./dir_colors $HOME/.dir_colors
echo Setting up newplrc for kyclark\'s new.pl script
cp ./newplrc $HOME/.newplrc

echo Lets get some favorite gits
cd $HOME
if [ ! -d src ];
    mkdir -p src
fi
cd src
git clone git@github.com:huyz/dircolors-solarized.git
git clone git@github.com:kyclark/abe487.git kyclark
cd $INSTALL_DIR

echo And copy over some favorite programs \(extract and install needed\)
cp src/* $HOME/src/

if [ -e $HOME/.profile ] && [ ! -e $HOME/.profile.bkp ];
    cp $HOME/.profile $HOME/.profile.bkp
    cat ./profile_default >> $HOME/.profile
    echo Added stuff to .profile
    echo Make sure to check for mistakes
else
    cp ./profile_default $HOME/.profile
    echo Created a .profile for you
fi

if [ -e $HOME/.vimrc ] && [ ! -e $HOME/.vimrc.bkp ];
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

echo Setting up perlbrew
\curl -L http://install.perlbrew.pl | bash

echo Setting up anaconda 
echo This may take a while
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.4.1-Linux-x86_64.sh
bash Anaconda2-2.4.1-Linux-x86_64.sh

echo Setting up pip
python ./get-pip.py install --root $HOME

if [ -z $(which pip) ]; then
    echo pip didn\'t install aborting
    exit 1
else
    echo Setting up numpy ::crosses fingers::
    pip install --root $HOME numpy
    echo Setting up scipy
    pip install --root $HOME scipy
fi

echo All done! \{hopefully\}

