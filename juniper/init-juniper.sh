#/bin/sh

DIR2=$(dirname $0)
DIR3=`pwd $DIR2`

DIR="$DIR3/$DIR2"

echo $DIR2
echo $DIR3
echo $DIR

rm -rf $HOME/.juniper_networks
ln -s $DIR/.juniper_networks/ $HOME
rm -rf $HOME/.vpn.default.cfg
ln -s $DIR/.vpn.default.cfg $HOME
rm -rf $DIR/../junipernc
ln -s $DIR/junipernc $DIR/../junipernc