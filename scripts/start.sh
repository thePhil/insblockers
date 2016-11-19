#!/bin/sh

pwd=`pwd`

export chain_dir=$HOME/.eris/chains/simplechain
export chain_dir_this=$chain_dir/simplechain_full_000
export eris_home=$HOME/.eris

rm -rf ${eris_home}/apps/*

cp -R contracts/ ${eris_home}/apps/
# Why does the eris compiler wants another syntax then the original solidity compiler?
sed -E -i "s/^([[:space:]]*_);/\1/" ${eris_home}/apps/*.sol
cp epm.yaml ${eris_home}/apps/

cd ${eris_home}/apps/

eris pkgs do --chain simplechain --address $(cat ${eris_home}/chains/simplechain/addresses.csv | grep simplechain_full_000 | cut -d ',' -f 1)

rm -rf ${pwd}/abi
cp jobs_output.json $pwd
cp -R abi $pwd

cd $pwd

#copy the known accounts into the pwd folder
cp ${chain_dir}/accounts.json $pwd



node server/app.js
#ng serve
