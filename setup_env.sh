echo Welcome to Scott\'s environment setup script!

export HOME=$HOME
module load git

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

echo Setting up pip
python ./get-pip.py install --root $HOME
