#!/usr/bin/make

default:
	nvcc -g -arch=sm_75 fdtd2d.cu -lcudart -o main

clean:
	rm -rf main gpgpusim_power_report* _cuobjdump_* *.txt
