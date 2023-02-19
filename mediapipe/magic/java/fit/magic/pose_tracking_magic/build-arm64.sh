#!/bin/bash

bazelisk build -c opt --strip=ALWAYS \
    --host_crosstool_top=@bazel_tools//tools/cpp:toolchain \
    --fat_apk_cpu=arm64-v8a \
    --legacy_whole_archive=0 \
    --features=-legacy_whole_archive \
    --copt=-fvisibility=hidden \
    --copt=-ffunction-sections \
    --copt=-fdata-sections \
    --copt=-fstack-protector \
    --copt=-Oz \
    --copt=-fomit-frame-pointer \
    --copt=-DABSL_MIN_LOG_LEVEL=2 \
    --linkopt=-Wl,--gc-sections,--strip-all \
     //mediapipe/magic/java/fit/magic/pose_tracking_magic:mediapipe_pose_detection.aar

