#! /bin/bash

mkdir .gitClones
wget --no-check-certificate http://instal.ohmyz.sh -O - | sh
wget -o- https://toolbelt.heroku.com/install.sh | sh