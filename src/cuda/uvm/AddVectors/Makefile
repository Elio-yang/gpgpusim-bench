#!/usr/bin/make

default:
	nvcc -g -arch=sm_75 add_vectors.cu -lcudart -o add_vectors

prefetch:
	nvcc -g -DPREF -arch=sm_75 add_vectors.cu -lcudart -o add_vectors

clean:
	rm -rf add_vectors gpgpusim_power_report* _cuobjdump_* *.txt
