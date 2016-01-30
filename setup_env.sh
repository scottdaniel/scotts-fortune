echo Welcome to Scott\'s environment setup script!

export HOME=$HOME

echo Setting gitconfig
cp ./gitconfig $HOME/.gitconfig
cp ./dir_colors $HOME/.dir_colors  

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


