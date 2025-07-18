# Isaac Sim ROS2 Docker Environment

Isaac Sim과 ROS2 Humble이 통합된 Docker 환경입니다. 로봇 시뮬레이션, 네비게이션, SLAM 등의 ROS2 개발에 최적화되어 있습니다.

## 🚀 Features

- **Isaac Sim**: NVIDIA의 강력한 로봇 시뮬레이션 플랫폼
- **ROS2 Humble**: 최신 ROS2 배포판
- **Navigation2**: 로봇 네비게이션 스택
- **TurtleBot3**: 시뮬레이션 및 실제 로봇 지원
- **Gazebo**: 물리 시뮬레이션
- **Python 패키지**: numpy, matplotlib, scipy, pandas, opencv-python 등

## 📋 Prerequisites

- Docker
- NVIDIA GPU (권장)
- NVIDIA Container Toolkit

## 🛠️ Installation

### 1. Docker 설치
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

### 2. NVIDIA Container Toolkit 설치 (GPU 사용 시)
```bash
# NVIDIA Container Toolkit 설치
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
```

## 🚀 Usage

### 1. Docker 이미지 빌드
```bash
cd docker_isaac
docker build -t isaac-sim-ros2 .
```

### 2. 컨테이너 실행 (CPU)
```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -p 6080:6080 \
  isaac-sim-ros2
```

### 3. 컨테이너 실행 (GPU)
```bash
docker run -it --rm \
  --gpus all \
  -v $(pwd):/workspace \
  -p 6080:6080 \
  isaac-sim-ros2
```

## 📦 Included Packages

### ROS2 Packages
- `ros-humble-navigation2`: Navigation2 스택
- `ros-humble-nav2-bringup`: Nav2 실행 도구
- `ros-humble-turtlebot3*`: TurtleBot3 관련 패키지
- `ros-humble-rqt*`: RQT GUI 도구
- `ros-humble-gazebo-ros`: Gazebo ROS 통합
- `ros-humble-gazebo-ros2-control`: Gazebo ROS2 제어
- `ros-humble-tf-transformations`: TF 변환 도구
- `ros-humble-rmw-cyclonedds-cpp`: CycloneDDS RMW

### Python Packages
- numpy, matplotlib, scipy, pandas
- jsonschema, networkx
- rospkg, catkin_pkg
- pyquaternion, transforms3d
- opencv-python
- jupyterlab, scikit-learn

## 🔧 Environment Setup

컨테이너 내부에서 사용할 수 있는 유용한 alias들:

```bash
sb          # source ~/.bashrc
sds         # source ~/ros2_ws/install/setup.bash
cw          # cd ~/ros2_ws
cs          # cd ~/ros2_ws/src
cb          # colcon build --symlink-install
```

## 🎯 Quick Start

### 1. Isaac Sim 실행
```bash
# 컨테이너 내부에서
./runapp.sh
```

### 2. ROS2 환경 설정
```bash
# 컨테이너 내부에서
source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash
```

### 3. TurtleBot3 시뮬레이션 실행
```bash
# Gazebo TurtleBot3 월드 실행
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py

# Navigation2 실행
ros2 launch nav2_bringup bringup_launch.py
```

## 🌐 Network Configuration

- **ROS_DOMAIN_ID**: 123
- **RMW_IMPLEMENTATION**: rmw_cyclonedds_cpp
- **ROS_LOCALHOST_ONLY**: 0 (네트워크 통신 허용)

## 📁 Directory Structure

```
/ros2_ws/
├── src/          # ROS2 패키지 소스
├── build/        # 빌드 파일
├── install/      # 설치된 패키지
└── log/          # 빌드 로그
```

## 🔍 Troubleshooting

### GPU 관련 문제
```bash
# GPU 상태 확인
nvidia-smi

# NVIDIA Container Toolkit 확인
docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

### ROS2 네트워크 문제
```bash
# ROS_DOMAIN_ID 설정
export ROS_DOMAIN_ID=123

# RMW 구현체 확인
echo $RMW_IMPLEMENTATION
```

### Isaac Sim 실행 문제
```bash
# Isaac Sim 버전 확인
isaac-sim --version

# GPU 드라이버 확인
nvidia-smi
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

문제가 발생하거나 질문이 있으시면:
- GitHub Issues를 통해 문의해 주세요
- 또는 이메일로 연락해 주세요

---

**Happy Robotics Development! 🤖** 