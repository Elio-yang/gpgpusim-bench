
ifeq ($(GPUAPPS_SETUP_ENVIRONMENT_WAS_RUN), 0)
$(error You must run "source setup_environment before calling make")
endif




all: pannotia rodinia-3.1 ispass-2009 polybench cutlass Deepbench_nvidia graphBIG uvm

clean: clean_ispass-2009 clean_cutlass clean_rodinia-3.1 clean_graphbig clean_polybench clean_pannotia clean_deepbench clean_uvm clean_bin

clean_data:
	./clean_data.sh

data:
	mkdir -p $(BINDIR)/$(BINSUBDIR)/
	cd ../ && bash ./get_data.sh
uvm:
	mkdir -p $(BINDIR)/$(BINSUBDIR)/
	$(SETENV) cd cuda/uvm/; sh ./compileall.sh "$(MAKE_ARGS)"
	cp cuda/uvm/2DCONV/2dconv 	$(BINDIR)/$(BINSUBDIR)/uvm-2dconv
	cp cuda/uvm/AddVectors/add_vectors $(BINDIR)/$(BINSUBDIR)/uvm-add_vectors
	cp cuda/uvm/ATAX/atax $(BINDIR)/$(BINSUBDIR)/uvm-atax
	cp cuda/uvm/backprop/backprop $(BINDIR)/$(BINSUBDIR)/uvm-backprop
	cp cuda/uvm/bfs/bfs $(BINDIR)/$(BINSUBDIR)/uvm-bfs
	cp cuda/uvm/FDTD-2D/main $(BINDIR)/$(BINSUBDIR)/uvm-fdtd-2d
	cp cuda/uvm/hotspot/hotspot $(BINDIR)/$(BINSUBDIR)/uvm-hotspot
	cp cuda/uvm/nw/needle $(BINDIR)/$(BINSUBDIR)/uvm-needle
	cp cuda/uvm/pathfinder/pathfinder $(BINDIR)/$(BINSUBDIR)/uvm-pathfinder
	cp cuda/uvm/ra/main $(BINDIR)/$(BINSUBDIR)/uvm-ra
	cp cuda/uvm/srad_v2/srad $(BINDIR)/$(BINSUBDIR)/uvm-srad_v2
	cp cuda/uvm/sssp/sssp $(BINDIR)/$(BINSUBDIR)/uvm-sssp
	cp cuda/uvm/stencil/main $(BINDIR)/$(BINSUBDIR)/uvm-stencil
	cp cuda/uvm/StreamTriad/stream_triad $(BINDIR)/$(BINSUBDIR)/uvm-stream_triad

uvm-collect:
	mkdir -p $(BINDIR)/$(BINSUBDIR)2/
	$(SETENV) cd cuda/uvm/; sh ./compileall.sh "$(MAKE_ARGS)"
	cp cuda/uvm/2DCONV/2dconv 	$(BINDIR)/$(BINSUBDIR)2/uvm-2dconv
	cp cuda/uvm/AddVectors/add_vectors $(BINDIR)/$(BINSUBDIR)2/uvm-add_vectors
	cp cuda/uvm/ATAX/atax $(BINDIR)/$(BINSUBDIR)2/uvm-atax
	cp cuda/uvm/backprop/backprop $(BINDIR)/$(BINSUBDIR)2/uvm-backprop
	cp cuda/uvm/bfs/bfs $(BINDIR)/$(BINSUBDIR)2/uvm-bfs
	cp cuda/uvm/FDTD-2D/main $(BINDIR)/$(BINSUBDIR)2/uvm-fdtd-2d
	cp cuda/uvm/hotspot/hotspot $(BINDIR)/$(BINSUBDIR)2/uvm-hotspot
	cp cuda/uvm/nw/needle $(BINDIR)/$(BINSUBDIR)2/uvm-needle
	cp cuda/uvm/pathfinder/pathfinder $(BINDIR)/$(BINSUBDIR)2/uvm-pathfinder
	cp cuda/uvm/ra/main $(BINDIR)/$(BINSUBDIR)2/uvm-ra
	cp cuda/uvm/srad_v2/srad $(BINDIR)/$(BINSUBDIR)2/uvm-srad_v2
	cp cuda/uvm/sssp/sssp $(BINDIR)/$(BINSUBDIR)2/uvm-sssp
	cp cuda/uvm/stencil/main $(BINDIR)/$(BINSUBDIR)2/uvm-stencil
	cp cuda/uvm/StreamTriad/stream_triad $(BINDIR)/$(BINSUBDIR)2/uvm-stream_triad
graphBIG:
	mkdir -p $(BINDIR)/$(BINSUBDIR)/
	$(SETENV) make -C cuda/graphBIG/gpu_bench
	cp cuda/graphBIG/gpu_bench/gpu_BetweennessCentr/betweenness $(BINDIR)/$(BINSUBDIR)/graphbig-betweenness
	cp cuda/graphBIG/gpu_bench/gpu_BFS/bfs_data_thread_centric $(BINDIR)/$(BINSUBDIR)/graphbig-fs_thread_centric
	cp cuda/graphBIG/gpu_bench/gpu_BFS/bfs_data_warp_centric $(BINDIR)/$(BINSUBDIR)/graphbig-bfs_warp_centric
	cp cuda/graphBIG/gpu_bench/gpu_ConnectedComp/connected_comp $(BINDIR)/$(BINSUBDIR)/graphbig-connected_comp
	cp cuda/graphBIG/gpu_bench/gpu_DegreeCentr/degree_centr $(BINDIR)/$(BINSUBDIR)/graphbig-degree_centr
	cp cuda/graphBIG/gpu_bench/gpu_GraphColoring/gc_topo_thread_centric $(BINDIR)/$(BINSUBDIR)/graphbig-gc_topo_thread_centric
	cp cuda/graphBIG/gpu_bench/gpu_kCore/kcore   $(BINDIR)/$(BINSUBDIR)/graphbig-kcore
	cp cuda/graphBIG/gpu_bench/gpu_SSSP/sssp_data_thread_centric    $(BINDIR)/$(BINSUBDIR)/graphbig-sssp_thread_centric
	cp cuda/graphBIG/gpu_bench/gpu_SSSP/sssp_data_warp_centric    $(BINDIR)/$(BINSUBDIR)/graphbig-sssp_warp_centric
	cp cuda/graphBIG/gpu_bench/gpu_SSSP/sssp_topo_thread_centric    $(BINDIR)/$(BINSUBDIR)/graphbig-sssp_topothread_centric
	cp cuda/graphBIG/gpu_bench/gpu_SSSP/sssp_topo_warp_centric    $(BINDIR)/$(BINSUBDIR)/graphbig-sssp_topowarp_centric
	cp cuda/graphBIG/gpu_bench/gpu_TriangleCount/triangle_count   $(BINDIR)/$(BINSUBDIR)/graphbig-triangle_count


Deepbench_nvidia:
	$(SETENV) make $(MAKE_ARGS) -C cuda/DeepBench/code/nvidia
	cp -r cuda/DeepBench/code/nvidia/bin/conv_bench* $(BINDIR)/$(BINSUBDIR)/
	cp -r cuda/DeepBench/code/nvidia/bin/gemm_bench* $(BINDIR)/$(BINSUBDIR)/
	cp -r cuda/DeepBench/code/nvidia/bin/rnn_bench* $(BINDIR)/$(BINSUBDIR)/

pannotia:
	$(SETENV) make $(MAKE_ARGS) -C cuda/pannotia/bc
	$(SETENV) export VARIANT="MAX"; make $(MAKE_ARGS) -C cuda/pannotia/color
	$(SETENV) export VARIANT="MAXMIN"; make $(MAKE_ARGS) -C cuda/pannotia/color
	$(SETENV) export VARIANT="DEFAULT"; make $(MAKE_ARGS) -C cuda/pannotia/fw
	$(SETENV) export VARIANT="BLOCK"; make $(MAKE_ARGS) -C cuda/pannotia/fw
	$(SETENV) make $(MAKE_ARGS) -C cuda/pannotia/mis
	$(SETENV) export VARIANT="DEFAULT"; make $(MAKE_ARGS) -C cuda/pannotia/pagerank
	$(SETENV) export VARIANT="SPMV"; make $(MAKE_ARGS) -C cuda/pannotia/pagerank
	$(SETENV) export VARIANT="CSR"; make $(MAKE_ARGS) -C cuda/pannotia/sssp
	$(SETENV) export VARIANT="ELL"; make $(MAKE_ARGS) -C cuda/pannotia/sssp

rodinia-3.1:
	if [ ${CUDA_VERSION_MAJOR} -gt 5 ]; then \
		$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/huffman/; \
	fi
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/backprop 
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/bfs 
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/cfd 
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/hotspot 
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/kmeans
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/nw 
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/streamcluster
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/mummergpu
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/b+tree/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/dwt2d/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/heartwall/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/hybridsort/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/myocyte/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/nn/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/particlefilter/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/particlefilter/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/pathfinder/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/lavaMD/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/lud/cuda/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/hotspot3D/
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/gaussian
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/srad/srad_v1
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/srad/srad_v2
	if [ ${CUDA_VERSION_MAJOR} -gt 5 ]; then \
		mv cuda/rodinia/3.1/cuda/huffman/pavle $(BINDIR)/$(BINSUBDIR)/huffman-rodinia-3.1; \
	fi
	mv cuda/rodinia/3.1/cuda/b+tree/b+tree.out $(BINDIR)/$(BINSUBDIR)/b+tree-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/dwt2d/dwt2d $(BINDIR)/$(BINSUBDIR)/dwt2d-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/heartwall/heartwall $(BINDIR)/$(BINSUBDIR)/heartwall-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/hybridsort/hybridsort $(BINDIR)/$(BINSUBDIR)/hybridsort-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/myocyte/myocyte.out $(BINDIR)/$(BINSUBDIR)/myocyte-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/nn/nn $(BINDIR)/$(BINSUBDIR)/nn-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/particlefilter/particlefilter_float $(BINDIR)/$(BINSUBDIR)/particlefilter_float-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/particlefilter/particlefilter_naive $(BINDIR)/$(BINSUBDIR)/particlefilter_naive-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/pathfinder/pathfinder $(BINDIR)/$(BINSUBDIR)/pathfinder-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/lavaMD/lavaMD $(BINDIR)/$(BINSUBDIR)/lavaMD-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/lud/cuda/lud_cuda $(BINDIR)/$(BINSUBDIR)/lud-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/hotspot3D/3D $(BINDIR)/$(BINSUBDIR)/hotspot3D-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/gaussian/gaussian $(BINDIR)/$(BINSUBDIR)/gaussian-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/srad/srad_v1/srad $(BINDIR)/$(BINSUBDIR)/srad_v1-rodinia-3.1
	
	mv cuda/rodinia/3.1/cuda/srad/srad_v2/srad $(BINDIR)/$(BINSUBDIR)/srad_v2-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/backprop/backprop $(BINDIR)/$(BINSUBDIR)/backprop-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/bfs/bfs  $(BINDIR)/$(BINSUBDIR)/bfs-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/cfd/euler3d $(BINDIR)/$(BINSUBDIR)/cfd-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/hotspot/hotspot $(BINDIR)/$(BINSUBDIR)/hotspot-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/kmeans/kmeans $(BINDIR)/$(BINSUBDIR)/kmeans-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/nw/needle $(BINDIR)/$(BINSUBDIR)/nw-rodinia-3.1
	mv cuda/rodinia/3.1/cuda/streamcluster/sc_gpu $(BINDIR)/$(BINSUBDIR)/streamcluster-rodinia-3.1
	mv $(BINDIR)/mummergpu $(BINDIR)/$(BINSUBDIR)/mummergpu-rodinia-3.1

ispass-2009:
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/AES
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/BFS
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/LIB
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/LPS
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/MUM
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/NN
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/NQU
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/RAY
	$(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/STO
	PID=$$$$ && cp -r cuda/ispass-2009/WP cuda/ispass-2009/WP-$$PID && $(SETENV) make $(MAKE_ARGS) noinline=$(noinline) -C cuda/ispass-2009/WP-$$PID && rm -rf cuda/ispass-2009/WP-$$PID
	
polybench:
	mkdir -p $(BINDIR)/$(BINSUBDIR)/
	$(SETENV) cd cuda/polybench-gpu-1.0/CUDA/; sh ./compileCodes.sh "$(MAKE_ARGS)"
	mv cuda/polybench-gpu-1.0/CUDA/2DCONV/2DConvolution.exe $(BINDIR)/$(BINSUBDIR)/polybench-2DConvolution
	mv cuda/polybench-gpu-1.0/CUDA/2MM/2mm.exe $(BINDIR)/$(BINSUBDIR)/polybench-2mm
	mv cuda/polybench-gpu-1.0/CUDA/3DCONV/3DConvolution.exe $(BINDIR)/$(BINSUBDIR)/polybench-3DConvolution
	mv cuda/polybench-gpu-1.0/CUDA/3MM/3mm.exe $(BINDIR)/$(BINSUBDIR)/polybench-3mm
	mv cuda/polybench-gpu-1.0/CUDA/ATAX/atax.exe $(BINDIR)/$(BINSUBDIR)/polybench-atax
	mv cuda/polybench-gpu-1.0/CUDA/BICG/bicg.exe $(BINDIR)/$(BINSUBDIR)/polybench-bicg
	mv cuda/polybench-gpu-1.0/CUDA/CORR/correlation.exe $(BINDIR)/$(BINSUBDIR)/polybench-correlation
	mv cuda/polybench-gpu-1.0/CUDA/COVAR/covariance.exe $(BINDIR)/$(BINSUBDIR)/polybench-covariance
	mv cuda/polybench-gpu-1.0/CUDA/FDTD-2D/fdtd2d.exe $(BINDIR)/$(BINSUBDIR)/polybench-fdtd2d
	mv cuda/polybench-gpu-1.0/CUDA/GEMM/gemm.exe $(BINDIR)/$(BINSUBDIR)/polybench-gemm
	mv cuda/polybench-gpu-1.0/CUDA/GESUMMV/gesummv.exe $(BINDIR)/$(BINSUBDIR)/polybench-gesummv
	mv cuda/polybench-gpu-1.0/CUDA/GRAMSCHM/gramschmidt.exe $(BINDIR)/$(BINSUBDIR)/polybench-gramschmidt
	mv cuda/polybench-gpu-1.0/CUDA/MVT/mvt.exe $(BINDIR)/$(BINSUBDIR)/polybench-mvt
	mv cuda/polybench-gpu-1.0/CUDA/SYR2K/syr2k.exe $(BINDIR)/$(BINSUBDIR)/polybench-syr2k
	mv cuda/polybench-gpu-1.0/CUDA/SYRK/syrk.exe $(BINDIR)/$(BINSUBDIR)/polybench-syrk

cutlass:
	mkdir -p $(BINDIR)/$(BINSUBDIR)/
	git submodule init && git submodule update
	$(SETENV) mkdir -p cuda/cutlass-bench/build && cd cuda/cutlass-bench/build && cmake .. -DUSE_GPGPUSIM=1 -DCUTLASS_NVCC_ARCHS=75 && make cutlass_perf_test
	cd cuda/cutlass-bench/build/tools/test/perf && ln -s -f ../../../../binary.sh . && ./binary.sh
	cp cuda/cutlass-bench/build/tools/test/perf/cutlass_perf_test $(BINDIR)/$(BINSUBDIR)/



clean_cutlass:
	rm -fr cuda/cutlass-bench/build

clean_polybench:
	$(SETENV) cd cuda/polybench-gpu-1.0/CUDA/; sh ./cleanCodes.sh

clean_ispass-2009:
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/AES
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/BFS
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/LIB
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/LPS
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/MUM
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/NN
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/NQU
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/RAY
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/STO
	$(SETENV) make $(MAKE_ARGS) clean noinline=$(noinline) -C cuda/ispass-2009/WP

clean_rodinia-3.1:
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/backprop -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/bfs -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/cfd -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/hotspot -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/kmeans -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/nw -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/streamcluster -f Makefile_nvidia
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/mummergpu
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/b+tree/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/dwt2d/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/heartwall/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/huffman/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/hybridsort/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/myocyte/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/nn/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/particlefilter/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/particlefilter/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/pathfinder/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/lavaMD/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/lud/cuda/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/leukocyte/CUDA/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/hotspot3D/
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/gaussian
	$(SETENV) make clean $(MAKE_ARGS) noinline=$(noinline) -C cuda/rodinia/3.1/cuda/srad/

clean_pannotia: 
clean_deepbench:
clean_graphbig:
	$(SETENV) make clean -C cuda/graphBIG/gpu_bench
clean_uvm:
	$(SETENV) cd cuda/uvm/; sh ./cleanall.sh
clean_bin:
	rm -f $(BINDIR)/$(BINSUBDIR)/*