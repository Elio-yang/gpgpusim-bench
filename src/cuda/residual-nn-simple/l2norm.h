#include <cuda_runtime.h>
#include <iostream>
#include <cmath>

__global__ void l2Norm(const float *x, float *result, int n);

float l2Norm(const float *d_x, int n);