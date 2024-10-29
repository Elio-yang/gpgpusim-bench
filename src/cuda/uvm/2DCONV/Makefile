#!/usr/bin/make

default:
	nvcc -g -arch=sm_75 2DConvolution.cu -lcudart -o 2dconv

clean:
	rm -rf 2dconv gpgpusim_power_report* _cuobjdump_* *.txt
