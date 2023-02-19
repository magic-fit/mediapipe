#!/bin/bash

cd ..

mkdir -p build

(cd mediapipe/magic/java/fit/magic/pose_tracking_magic && ./build-all.sh)

# Build .aar
rm -f build/mediapipe-pose-detection-all.aar
cp bazel-bin/mediapipe/magic/java/fit/magic/pose_tracking_magic/mediapipe_pose_detection.aar build/mediapipe-pose-detection-all.aar

# Build pose tracking gpu with overlay graph
bazelisk build -c opt mediapipe/graphs/pose_tracking_magic:pose_tracking_gpu_overlay_graph
rm -f build/pose_tracking_gpu_overlay.binarypb
cp bazel-bin/mediapipe/graphs/pose_tracking_magic/pose_tracking_gpu_overlay.binarypb build/pose_tracking_gpu_overlay.binarypb

# Build pose tracking gpu with no overlay graph
bazelisk build -c opt mediapipe/graphs/pose_tracking_magic:pose_tracking_gpu_graph
rm -f build/pose_tracking_gpu.binarypb
cp bazel-bin/mediapipe/graphs/pose_tracking_magic/pose_tracking_gpu.binarypb build/pose_tracking_gpu.binarypb

# Build pose tracking cpu with overlay graph
bazelisk build -c opt mediapipe/graphs/pose_tracking_magic:pose_tracking_cpu_overlay_graph
rm -f build/pose_tracking_cpu_overlay.binarypb
cp bazel-bin/mediapipe/graphs/pose_tracking_magic/pose_tracking_cpu_overlay.binarypb build/pose_tracking_cpu_overlay.binarypb

# Build pose tracking cpu with no overlay graph
bazelisk build -c opt mediapipe/graphs/pose_tracking_magic:pose_tracking_cpu_graph
rm -f build/pose_tracking_cpu.binarypb
cp bazel-bin/mediapipe/graphs/pose_tracking_magic/pose_tracking_cpu.binarypb build/pose_tracking_cpu.binarypb

# Build pose tracking npu with no overlay graph
bazelisk build -c opt mediapipe/graphs/pose_tracking_magic:pose_tracking_npu_graph
rm -f build/pose_tracking_npu.binarypb
cp bazel-bin/mediapipe/graphs/pose_tracking_magic/pose_tracking_npu.binarypb build/pose_tracking_npu.binarypb
