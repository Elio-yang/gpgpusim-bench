#!/usr/bin/make

# CUDA compiler
NVCC = nvcc
NVCC_FLAGS = -g -arch=sm_75

default:
	$(NVCC) $(NVCC_FLAGS) ${KERNEL_DIM} needle.cu -lcudart -o needle

prefetch:
	$(NVCC) $(NVCC_FLAGS) ${KERNEL_DIM} -DPREF needle.cu -lcudart -o needle

clean:
	rm -f needle *.txt gpgpusim_power_report* _cuobjdump_*
