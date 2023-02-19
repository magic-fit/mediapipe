load("//mediapipe/java/com/google/mediapipe:mediapipe_aar.bzl", "mediapipe_aar")

mediapipe_aar(
    name = "mediapipe_pose_detection",
    calculators = ["//mediapipe/graphs/pose_tracking_magic:pose_tracking_gpu_overlay_deps",
                   "//mediapipe/graphs/pose_tracking_magic:pose_tracking_gpu_deps",
                   "//mediapipe/graphs/pose_tracking_magic:pose_tracking_cpu_deps"],
)
