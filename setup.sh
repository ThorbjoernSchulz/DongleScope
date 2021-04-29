#!/usr/bin/env bash

# install necessary packages
sudo apt install -y curl python2 python2-dev libbluetooth-dev

# do we have pip? if not, install
pip2 --version
[[ $? -ne 0 ]] && {
	curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
	python2 get-pip.py
}

source $HOME/.profile
pip2 install -r requirement.txt

[[ $? -ne 0 ]] && exit

# comment out documentation. weird bug otherwise
PYTHON_USER_LIBRARY_PATH=$HOME/.local/lib/python2.7/site-packages
sed -i '51,$ s/^/#/' $PYTHON_USER_LIBRARY_PATH/bluetooth/__init__.py
rm -f $PYTHON_USER_LIBRARY_PATH/bluetooth/*.pyc

