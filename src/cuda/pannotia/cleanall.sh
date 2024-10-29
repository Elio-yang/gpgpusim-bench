#!/bin/bash

for bench in bc color fw mis pagerank sssp
do
	echo $bench
	pushd . >& /dev/null
	cd $bench
	make clean;
	popd >& /dev/null
done
