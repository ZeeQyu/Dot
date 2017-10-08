#!/bin/bash
for f in ./nim/client/*; do
	nim js -o:"./public/${f##*/}.js" $f
done
for f in ./nim/server/*; do
	nim js -o:"./server/${f##*/}.js" $f
done
node server
