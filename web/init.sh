#!/bin/bash
dir_test=./node_modules

if [ ! -d $dir_test ]
then
  echo "NPM UPDATE!"
  yarn install
fi

if [ "$NODE_ENV" == 'dev' ]
then
  echo "DEV MODE ::."
  yarn server
else
  echo "PRODUCTION MODE ::."
  yarn build
  yarn deploy
fi
