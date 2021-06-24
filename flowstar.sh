#!/bin/bash
filename=$1
docker run --rm -it -v "${PWD}/models:/models/" flowstar bash -c "cd /models; cat /models/$filename.model | /flowstar/flowstar"
sed -i -e "s/set terminal postscript enhanced color/set terminal png/g" models/outputs/$filename.plt
sed -i -e "s/\.\/images\/$filename.eps/\.\/models\/images\/$filename.png/g" models/outputs/$filename.plt
echo "load \"models/outputs/$filename.plt\"" | gnuplot
echo "done."