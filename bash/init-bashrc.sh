#!/bin/sh

DIR=$(dirname $0)

rm -rf $HOME/.bash_perso 
ln -s $DIR/.bash_perso $HOME/

count=`grep -c bash_perso $HOME/.bashrc`

if [ "$count" -eq 0 ] 
then
	echo "source $HOME/.bash_perso" >> $HOME/.bashrc
fi
