echo Welcome to Scott\'s conda setup script!

export HOME=$HOME
export INSTALL_DIR=$(pwd)

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels biobakery

conda install -c asmeurer fortune
conda install -c bioconda coreutils
