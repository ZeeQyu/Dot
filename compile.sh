#!/bin/bash
for f in ./nim/client/*.nim; do
	echo "\nnim js -o:./public/${f##*/}.js" $f
	nim js -o:"./public/${f##*/}.js" $f
done
for f in ./nim/server/*.nim; do
	echo "\nnim js -o:./server/${f##*/}.js" $f
	nim js -o:"./server/${f##*/}.js" $f
done
echo
echo "node server"
node server
