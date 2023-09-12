#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/jaramy/ros_gazebo/src/turtlebot3/turtlebot3_example"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/jaramy/ros_gazebo/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/jaramy/ros_gazebo/install/lib/python3/dist-packages:/home/jaramy/ros_gazebo/build/turtlebot3_example/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/jaramy/ros_gazebo/build/turtlebot3_example" \
    "/usr/bin/python3" \
    "/home/jaramy/ros_gazebo/src/turtlebot3/turtlebot3_example/setup.py" \
     \
    build --build-base "/home/jaramy/ros_gazebo/build/turtlebot3_example" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/jaramy/ros_gazebo/install" --install-scripts="/home/jaramy/ros_gazebo/install/bin"
