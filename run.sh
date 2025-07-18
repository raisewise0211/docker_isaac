#!/bin/bash

#  DISPLAY 환경 변수 자동 설정 (WSLg 또는 X11 사용)
if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
fi

# Docker 컨테이너 실행
docker run --name isaac-sim \
    --entrypoint bash -it --runtime=nvidia \
    --gpus all --rm \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="ACCEPT_EULA=Y" \
    --env="PRIVACY_CONSENT=Y" \
    --volume="$HOME/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache" \
    --volume="$HOME/docker/isaac-sim/cache/ov:/root/.cache/ov" \
    --volume="$HOME/docker/isaac-sim/cache/pip:/root/.cache/pip" \
    --volume="$HOME/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache" \
    --volume="$HOME/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache" \
    --volume="$HOME/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs" \
    --volume="$HOME/docker/isaac-sim/data:/root/.local/share/ov/data" \
    --volume="$HOME/docker/isaac-sim/documents:/root/Documents"   raisewise0211/isaac-sim-ros2:v1