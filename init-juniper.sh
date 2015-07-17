#/bin/sh

DIR=`pwd $(dirname $0)`

rm -rf $HOME/.juniper_networks
ln -s $DIR/.juniper_networks/ $HOME
rm -rf $HOME/.vpn.default.cfg
ln -s $DIR/.vpn.default.cfg $HOME