#!/bin/bash

brew install pyqt@5 libusb pyenv pyenv-virtualenv curl

pyenv install 3.9.7

cd $HOME/.pyenv/versions/3.9.7/lib/python3.9/site-packages && echo "/opt/homebrew/lib/python3.9/site-packages" >>homebrew.pth

pyenv virtualenv 3.9.7 nut-3.9.7
pyenv local nut-3.9.7

# Install pycurl
PYCURL_SSL_LIBRARY=openssl LDFLAGS="-L/opt/homebrew/opt/openssl/lib" CPPFLAGS="-I/opt/homebrew/opt/openssl/include" pip install pycurl --no-cache-dir

# If the above fails just do it clean
# pip install pycurl

# Install other req
pip install -r requirements.txt

# Run python
python3 nut_gui.py
