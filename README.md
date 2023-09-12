# ROS_gazebo_learn


### Install catkin tools 
https://catkin-tools.readthedocs.io/en/latest/installing.html


### Link 
https://automaticaddison.com/setting-up-the-ros-navigation-stack-for-a-simulated-robot/


### Turtlebot link 
https://github.com/ROBOTIS-GIT/turtlebot3

https://github.com/ROBOTIS-GIT/turtlebot3_simulations


https://cmake.org/download/



#### command run robot 
```bash
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

##### command robot's velocity using "rqt" and robot steering to control movement 


#### SLAM 
```bash
export TURTLEBOT3_MODEL=waffle
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

##### install SLAM
```bash
sudo apt-get install ros-noetic-gmapping
```


##### run SLAM
```bash
export TURTLEBOT3_MODEL=waffle

```

```bash
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

#### Install map server 
```bash
sudo apt-get install ros-noetic-map-server

```

##### Save map
```bash
export TURTLEBOT3_MODEL=waffle   
```

```bash
rosrun map_server map_saver -f ~/map       #(map is filename, you can edit!)

```



### Navigation

#### install amcl for localization 
```bash
sudo apt-get install ros-noetic-amcl
```
#### install movebase
```bash
sudo apt-get install ros-noetic-move-base
```
#### install dwa local planner
```bash
 sudo apt-get install ros-noetic-dwa-local-planner
```


#### run navigation 
```bash
export TURTLEBOT3_MODEL=waffle
```

```bash
roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml 
```

#### Record ROS Bag 
```bash
 
 rosbag record -a 

```

-a is record all





#### Play ROS bag
Note!! You have to run roscore first

```bash
rosbag play filename.bag
```