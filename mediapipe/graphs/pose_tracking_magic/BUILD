# Copyright 2020 The MediaPipe Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load(
    "//mediapipe/framework/tool:mediapipe_graph.bzl",
    "mediapipe_binary_graph",
)

licenses(["notice"])

package(default_visibility = ["//visibility:public"])

# Pose tracking on GPU with overlay
cc_library(
    name = "pose_tracking_gpu_overlay_deps",
    deps = [
        "//mediapipe/calculators/core:constant_side_packet_calculator",
        "//mediapipe/calculators/core:flow_limiter_calculator",
        "//mediapipe/graphs/pose_tracking_magic/subgraphs:pose_renderer_gpu",
        "//mediapipe/modules/pose_landmark:pose_landmark_gpu",
    ],
)

mediapipe_binary_graph(
    name = "pose_tracking_gpu_overlay_graph",
    graph = "pose_tracking_gpu_overlay.pbtxt",
    output_name = "pose_tracking_gpu_overlay.binarypb",
    deps = [":pose_tracking_gpu_overlay_deps"],
)

# Pose tracking on GPU with no overlay
cc_library(
    name = "pose_tracking_gpu_deps",
    deps = [
        "//mediapipe/calculators/core:constant_side_packet_calculator",
        "//mediapipe/calculators/core:flow_limiter_calculator",
        "//mediapipe/calculators/core:pass_through_calculator",
        "//mediapipe/modules/pose_landmark:pose_landmark_gpu",
    ],
)

mediapipe_binary_graph(
    name = "pose_tracking_gpu_graph",
    graph = "pose_tracking_gpu.pbtxt",
    output_name = "pose_tracking_gpu.binarypb",
    deps = [":pose_tracking_gpu_deps"],
)

# Pose tracking on CPU with overlay
cc_library(
    name = "pose_tracking_cpu_overlay_deps",
    deps = [
        "//mediapipe/calculators/core:constant_side_packet_calculator",
        "//mediapipe/calculators/core:flow_limiter_calculator",
        "//mediapipe/gpu:gpu_buffer_to_image_frame_calculator",
        "//mediapipe/gpu:image_frame_to_gpu_buffer_calculator",
        "//mediapipe/graphs/pose_tracking_magic/subgraphs:pose_renderer_cpu",
        "//mediapipe/modules/pose_landmark:pose_landmark_cpu",
    ],
)

mediapipe_binary_graph(
    name = "pose_tracking_cpu_overlay_graph",
    graph = "pose_tracking_cpu_overlay.pbtxt",
    output_name = "pose_tracking_cpu_overlay.binarypb",
    deps = [":pose_tracking_cpu_overlay_deps"],
)

# Pose tracking on CPU with no overlay
cc_library(
    name = "pose_tracking_cpu_deps",
    deps = [
        "//mediapipe/calculators/core:constant_side_packet_calculator",
        "//mediapipe/calculators/core:flow_limiter_calculator",
        "//mediapipe/calculators/core:pass_through_calculator",
        "//mediapipe/gpu:gpu_buffer_to_image_frame_calculator",
        "//mediapipe/modules/pose_landmark:pose_landmark_cpu",
    ],
)

mediapipe_binary_graph(
    name = "pose_tracking_cpu_graph",
    graph = "pose_tracking_cpu.pbtxt",
    output_name = "pose_tracking_cpu.binarypb",
    deps = [":pose_tracking_cpu_deps"],
)

# Pose tracking on NPU with no overlay
cc_library(
    name = "pose_tracking_npu_deps",
    deps = [
        "//mediapipe/calculators/core:constant_side_packet_calculator",
        "//mediapipe/calculators/core:flow_limiter_calculator",
        "//mediapipe/calculators/core:pass_through_calculator",
        "//mediapipe/modules/pose_landmark:pose_landmark_npu",
    ],
)

mediapipe_binary_graph(
    name = "pose_tracking_npu_graph",
    graph = "pose_tracking_npu.pbtxt",
    output_name = "pose_tracking_npu.binarypb",
    deps = [":pose_tracking_npu_deps"],
)
