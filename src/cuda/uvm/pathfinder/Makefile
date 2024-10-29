#!/usr/bin/make

# CUDA compiler
NVCC = nvcc
NVCC_FLAGS = -g -arch=sm_75

default:
	$(NVCC) $(NVCC_FLAGS) pathfinder.cu -lcudart -o pathfinder

prefetch:
	$(NVCC) $(NVCC_FLAGS) -DPREF pathfinder.cu -lcudart -o pathfinder

clean:
	rm -f pathfinder *.txt gpgpusim_power_report* _cuobjdump_*
