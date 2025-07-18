FROM raisewise0211/isaac-sim-ros2:v1

ENV DEBIAN_FRONTEND=noninteractive

ENV ROS_DISTRO=humble
ENV ROS_VERSION=2
ENV ROS_LOCALHOST_ONLY=0
ENV AMENT_PREFIX_PATH=/opt/ros/humble
ENV COLCON_PREFIX_PATH=/ros2_ws/install
ENV PYTHONPATH=/opt/ros/humble/lib/python3.10/site-packages:/opt/ros/humble/local/lib/python3.10/dist-packages
ENV LD_LIBRARY_PATH=/opt/ros/humble/lib:/opt/ros/humble/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ENV PATH=/opt/ros/humble/bin:$PATH

# 필수 APT 패키지
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libeigen3-dev \
    libflann-dev \
    libopencv-dev \
    libboost-all-dev \
    libassimp-dev \
    libbullet-dev \
    libglew-dev \
    libgl1-mesa-dev \
    libdrm-dev \
    python3-pip \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-turtlebot3* \
    ros-humble-rqt* \
    ros-humble-gazebo-ros \
    ros-humble-gazebo-ros2-control \
    ros-humble-tf-transformations \
    ros-humble-rmw-cyclonedds-cpp \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# pip 패키지 설치
RUN pip install --no-cache-dir \
    numpy \
    matplotlib \
    scipy \
    pandas \
    jsonschema \
    networkx \
    rospkg \
    catkin_pkg \
    pyquaternion \
    transforms3d \
    opencv-python \
    jupyterlab \
    scikit-learn
# ROS 2 environment setting
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc &&\
    echo "source ~/ros2_ws/install/setup.sh" >> ~/.bashrc &&\
    echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc &&\
    echo "alias sb='source ~/.bashrc'" >> ~/.bashrc &&\
    echo "alias sds='source ~/ros2_ws/install/setup.bash'" >> ~/.bashrc &&\
    echo "alias cw='cd ~/ros2_ws'" >> ~/.bashrc &&\
    echo "alias cs='cd ~/ros2_ws/src'" >> ~/.bashrc &&\
    echo "alias cb='cd ~/ros2_ws && colcon build --symlink-install'" >> ~/.bashrc &&\
    echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc &&\
    echo "export ROS_DOMAIN_ID=123" >> ~/.bashrc

WORKDIR /ros2_ws

CMD ["/bin/bash"]
