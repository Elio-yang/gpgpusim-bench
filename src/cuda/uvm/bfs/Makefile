#!/usr/bin/make

# CUDA compiler
NVCC = nvcc
NVCC_FLAGS = -g -arch=sm_75

default:
	$(NVCC) $(NVCC_FLAGS) bfs.cu -lcudart -o bfs 

prefetch:
	$(NVCC) $(NVCC_FLAGS) -DPREF bfs.cu -lcudart -o bfs 

clean:
	rm -f bfs *.linkinfo *.txt gpgpusim_power_report* _cuobjdump_*
