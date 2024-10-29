all:
	nvcc *.cu -o ResNet  -arch=sm_70 -lcudart

run:
	./ResNet
clean:
	rm -f ResNet _app* _cudaobjdump_* fig-*.txt *.ptx* _cuobjdump_*