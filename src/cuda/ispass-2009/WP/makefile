#SHELL = csh
##################### intel compiler #############
#CC      = icc
#FC      = ifort 
#CFLAGS  = -w -O3 -ip  -c
#FCFLAGS =  -align all -FR -convert big_endian -fno-alias -fno-fnalias
#OPT     =  -O3
#LD      = $(FC)
#LDOPT   = 
# settings for GTX 280
#XXX = 32
#YYY = 8
# settings for 5600 Quadro and GTX 8800
XXX = 8
YYY = 8
##################### gcc/gfortran ###############
CC      = gcc
FC      = gfortran
FCFLAGS = -fconvert=big-endian -frecord-marker=4 -ffree-form
OPT     =  -O3
LD      = $(FC)
LDOPT   = 
##################################################
# do not change this definition, change the one further down
FLOAT   = float
RWORDSIZE = 4
##################### cuda location ##############
# eces-shell
#CUDALIBPATH =  ~/emu/cuda/lib
# ncsa
#CUDALIBPATH =  /usr/local/cuda/lib
#LIBCUBLAS = $(CUDALIBPATH)/libcublas.so
#LIBCUBLASEMU = $(CUDALIBPATH)/libcublasemu.so


########################  THIS SECTION YOU CAN CHANGE ##################
#
# Hard coded number of levels  (35 for conus, 28 for jan00)
MKX = 28

# uncomment this to use FLOAT4 data type (optimization)
#FLOAT4 = -DFLOAT_4=4 

# this must always be defined but they do not do anything unless
# other settings are set
DEBUG_I = 59
DEBUG_J = 45
DEBUG_K = 1
DEBUGOUTPUT = -DDEBUG_I=$(DEBUG_I) -DDEBUG_J=$(DEBUG_J) -DDEBUG_K=$(DEBUG_K) $(FLOAT4)

# uncomment to run on emulator instead of the device
#DEVICEEMU       = -DDEVICEEMU
#DEVICEEMU_NVCC  = -deviceemu $(DEVICEEMU)
#LIBCUBLAS = $(LIBCUBLASEMU)

# uncomment to output detailed debug data output
# must have DEVICEEMU settings uncommented above
#DEBUGOUTPUT = -DDEBUGOUTPUT -DDEBUG_I=$(DEBUG_I) -DDEBUG_J=$(DEBUG_J) -DDEBUG_K=$(DEBUG_K) $(FLOAT4)

# uncomment to allow settings to force closer agreement
#DEBUGDEBUG = -DDEBUGDEBUG

# uncomment for to promote to 8 byte floats
# note, if you do this without DEVICE EMU above, compiler will complain it does not have enough shared mem
#PROMOTE = -DPROMOTE
#FLOAT = double
#FCFLAGS = -fconvert=big-endian -frecord-marker=4 -fdefault-real-8
#RWORDSIZE = 8
########################  END OF SECTION YOU CAN CHANGE ################

#NVCC   = nvcc -DCUDA
NVCC    = $(CUDA_INSTALL_PATH)/bin/nvcc -DCUDA #--ptxas-options=-v
PHASE   = -cuda --compiler-options -fno-strict-aliasing  
NVOPT   = $(DEVICEEMU_NVCC) $(PROMOTE) $(DEBUGDEBUG) $(DEBUGOUTPUT) \
          -DXXX=$(XXX) -DYYY=$(YYY) -DMKX=$(MKX) --use_fast_math
#          -DXXX=$(XXX) -DYYY=$(YYY) -DMKX=$(MKX) --host-compilation 'C++' --use_fast_math
ifeq ($(noinline),1)
   NVOPT   += -Xopencc -noinline
   # Compiler-specific flags, when using noinline, we don't build for SM1x
   GENCODE_SM10 := 
   GENCODE_SM20 := -gencode=arch=compute_20,code=\"sm_20,compute_20\"
else
   # Compiler-specific flags (by default, we always use sm_10 and sm_20), unless we use the SMVERSION template
   GENCODE_SM10 := -gencode=arch=compute_10,code=\"sm_10,compute_10\"
   GENCODE_SM20 := -gencode=arch=compute_20,code=\"sm_20,compute_20\"
endif
PHASE  += -arch=sm_75


ROOTBINDIR ?= bin
BINDIR     ?= $(ROOTBINDIR)
BINSUBDIR  := release
TARGETDIR  := $(BINDIR)/$(BINSUBDIR)
ROOTOBJDIR ?= obj
LIBDIR     := $(NVIDIA_COMPUTE_SDK_LOCATION)/lib
COMMONDIR  := $(NVIDIA_COMPUTE_SDK_LOCATION)/common
GPGPUSIM_ROOT ?= ../../..
INTERMED_FILES := *.cpp*.i *.cpp*.ii *.cu.c *.cudafe*.* *.fatbin.c *.cubin *.hash
CUDAHOME=$(CUDA_INSTALL_PATH)

NVOPENCC_VER:=$(shell $$CUDAHOME/open64/bin/nvopencc --version 2>&1 | awk '/GPGPU-Sim/ {printf("_nvopencc_CL%d", $$3);}')
#GPGPULINK = -L$(CUDAHOME)/lib64/ -lcudart -L$(NVIDIA_COMPUTE_SDK_LOCATION)/C/lib/ -lcutil_x86_64 -lm -lz -ldl -lGL -lstdc++ $(NEWLIBDIR) $(LIB) # /usr/lib64/libstdc++.so.6 
GPGPULINK = -L$(CUDAHOME)/lib64/ -lcudart -L$(NVIDIA_COMPUTE_SDK_LOCATION)/C/lib/ -lm -lz -ldl -lGL -lstdc++ $(NEWLIBDIR) $(LIB) # /usr/lib64/libstdc++.so.6 
.SUFFIXES :

all : vanilla $(BINDIR)/$(BINSUBDIR)/ispass-2009-WP compare_snaps

wsm5.f.cu : wsm5.cu
	m4 wsm5.cu | sed "s/float/$(FLOAT)/g" > wsm5.f.cu

wsm5.cu.o : wsm5.f.cu
	$(NVCC) $(PHASE) $(NVOPT) wsm5.f.cu
	$(CC) $(CFLAGS) -o wsm5.cu.o -c wsm5.f.cu.cpp.ii


wsm5_gpu.f.cu : wsm5_gpu.cu spt.h
	m4 wsm5_gpu.cu | ./spt.pl | sed "s/float/$(FLOAT)/g" > wsm5_gpu.f.cu

wsm5_gpu.cu.o : wsm5_gpu.f.cu
	$(NVCC) $(PHASE) $(NVOPT) wsm5_gpu.f.cu
	$(CC) $(CFLAGS) -o wsm5_gpu.cu.o -c wsm5_gpu.f.cu.cpp.ii


libmassv.o : libmassv.F
	$(FC) -E -C -P libmassv.F > libmassv.f90
	$(FC) -c $(OPT) $(FCFLAGS) libmassv.f90

microclock.o : microclock.c
	$(CC) -c $(CFLAGS) -DMKX=$(MKX) microclock.c

vanilla : module_mp_wsm5.F libmassv.o microclock.o
	$(FC) -E -C -P $(DEBUGDEBUG) $(DEVICEEMU) $(DEBUGOUTPUT) -DRWORDSIZE=$(RWORDSIZE) module_mp_wsm5.F > module_mp_wsm5.f90
	$(FC) -c $(OPT) $(FCFLAGS) module_mp_wsm5.f90
	$(LD) -o wsm5_driver_vanilla $(LDOPT) module_mp_wsm5.o libmassv.o microclock.o $(LIBCUBLASEMU) $(GPGPULINK)

$(BINDIR)/$(BINSUBDIR)/ispass-2009-WP : module_mp_wsm5.F wsm5.cu.o wsm5_gpu.cu.o libmassv.o microclock.o
	$(FC) -E -C -P $(DEBUGDEBUG) $(DEVICEEMU) $(DEBUGOUTPUT) -DRUN_ON_GPU -DRWORDSIZE=$(RWORDSIZE) module_mp_wsm5.F > module_mp_wsm5.f90
	$(FC) -c $(OPT) $(FCFLAGS) module_mp_wsm5.f90
	mkdir -p $(TARGETDIR)
	$(LD) -o $(TARGETDIR)/ispass-2009-WP $(LDOPT) module_mp_wsm5.o wsm5.cu.o wsm5_gpu.cu.o libmassv.o microclock.o $(LIBCUBLAS) $(GPGPULINK)

compare_snaps : compare_snaps.F
	cp compare_snaps.F compare_snaps.f90
	$(FC) -o compare_snaps $(FCFLAGS) compare_snaps.f90
	rm -f compare_snaps.f90

clean :
	rm -f *.o *.cu.cpp *.f.cu wsm5_driver_* *.mod *.f90 gpgpu_ptx_sim__wsm5_standalone* compare_snaps gpgpu_inst_stats.txt snap_gpu_010 gpgpu_inst_stats.txt *.log *.ptx
	rm -f $(TARGETDIR)/ispass-2009-WP
	make clean_imm
clean_imm :
	rm -f $(INTERMED_FILES)

tar: 
	tar cvf wsm5gpu_`date +"%Y%m%d"`.tar *.cu *.F *.h *.m4 *.pl makefile
