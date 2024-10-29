
#include "l2norm.h"

__global__ void l2NormKernel(const float *x, float *result, int n) {
    extern __shared__ float shared_data[]; // Shared memory for block-level reduction

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Each thread loads an element into shared memory
    shared_data[tid] = (i < n) ? x[i] * x[i] : 0.0f;
    __syncthreads();

    // Perform reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            shared_data[tid] += shared_data[tid + stride];
        }
        __syncthreads();
    }

    // First thread in each block writes the block's partial sum to result
    if (tid == 0) {
        atomicAdd(result, shared_data[0]);
    }
}

float l2Norm(const float *d_x, int n) {
    int threads_per_block = 256;
    int blocks = (n + threads_per_block - 1) / threads_per_block;

    float *d_result;
    float h_result = 0.0f;

    // Allocate device memory for result
    cudaMalloc((void **)&d_result, sizeof(float));
    cudaMemcpy(d_result, &h_result, sizeof(float), cudaMemcpyHostToDevice);

    // Launch kernel to calculate sum of squares
    l2NormKernel<<<blocks, threads_per_block, threads_per_block * sizeof(float)>>>(d_x, d_result, n);
    cudaDeviceSynchronize();
    // Copy result back to host and compute square root
    cudaMemcpy(&h_result, d_result, sizeof(float), cudaMemcpyDeviceToHost);
    h_result = std::sqrt(h_result);

    // Clean up
    cudaFree(d_result);

    return h_result;
}
