include ../../common/make.config
CC := $(CUDA_DIR)/bin/nvcc

ifdef VERIFY
override VERIFY = -DVERIFY
endif

ifdef OUTPUT
override OUTPUT = -DOUTPUT
endif

ifdef TIMER
override TIMER = -DTIMER
endif


hybridsort: main.cu  bucketsort.cu bucketsort.cuh bucketsort_kernel.cu histogram1024_kernel.cu  mergesort.cu mergesort.cuh mergesort_kernel.cu
	$(CC) -arch=sm_75 $(VERIFY) $(OUTPUT) $(TIMER) $(HISTO_WG_SIZE_0) $(BUCKET_WG_SIZE_0) $(BUCKET_WG_SIZE_1) $(MERGE_WG_SIZE_0) $(MERGE_WG_SIZE_1) bucketsort.cu mergesort.cu main.cu -o hybridsort


clean:
	rm	-f *.o hybridsort
