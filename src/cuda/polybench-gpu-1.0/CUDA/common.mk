# Compiler-specific flags (by default, we always use sm_10, sm_20, and sm_30), unless we use the SMVERSION template
GENCODE_SM75 ?= -gencode=arch=compute_75,code=\"sm_75,compute_75\"

all:
	nvcc -O3 ${GENCODE_SM75} ${NVCC_ADDITIONAL_ARGS} ${CUFILES} -o ${EXECUTABLE} 
clean:
	rm -f *~ *.exe
