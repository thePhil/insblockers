#!/bin/bash
pwd=`pwd`

rm -rf ~/.eris/apps/*

cp -R contracts/ ~/.eris/apps/
cp epm.yaml ~/.eris/apps/

cd ~/.eris/apps/

eris pkgs do --chain simplechain --address $(cat ~/.eris/chains/simplechain/addresses.csv | grep simplechain_full_000 | cut -d ',' -f 1)

rm -r $pwd/abi
cp jobs_output.json $pwd
cp -R abi/ $pwd

cd $pwd

#copy the known accounts into the pwd folder
cp ~/.eris/chains/simplechain/accounts.json $pwd



ng serve
