echo Welcome to Scott\'s environment setup script!

export HOME=$HOME
export INSTALL_DIR=$(pwd)

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda install fortune
conda install -c bioconda coreutils
