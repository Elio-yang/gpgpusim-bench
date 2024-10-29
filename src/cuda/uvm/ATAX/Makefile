#!/usr/bin/make

default:
	nvcc -g -arch=sm_75 atax.cu -lcudart -o atax

clean:
	rm -rf atax gpgpusim_power_report* _cuobjdump_* *.txt
