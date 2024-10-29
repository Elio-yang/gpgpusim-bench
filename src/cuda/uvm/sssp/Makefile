#!/usr/bin/make

default:
	nvcc -g -arch=sm_75 sssp.cu -lcudart -o sssp

prefetch:
	nvcc -g -DPREF -arch=sm_75 sssp.cu -lcudart -o sssp

clean:
	rm -rf sssp gpgpusim_power_report* _cuobjdump_* *.txt
