cd ~/Desktop

# kill gui
ps -aux |grep xrrobot-gui | awk '{print $2}' | xargs kill -9

if [ -d ./releas_20200929 ] 
then
	echo "delete exsit releas file"
	rm -rf releas_20200929
fi

mkdir releas_20200929 
cd releas_20200929

# download gui file
wget https://github.com/xr-ros/nano_ros_gui_app/archive/ros-gui-for-nano-v1.0.zip

if [ ! $? -eq 0 ]
then
	echo "download failed, Check the network"
	exit 1
fi

# install gui
echo "install gui"
unzip ros-gui-for-nano-v1.0.zip && rm ros-gui-for-nano-v1.0.zip && cd nano_ros_gui_app-ros-gui-for-nano-v1.0
sudo cp ros /opt/xrapp/xrrobot-gui

if [ ! $? -eq 0 ]
then
	echo "install failed"
	exit 1
fi

cd ..

# download xrjserver file
wget https://github.com/xr-ros/XRJservo/archive/xrjserver-v1.0.zip

if [ ! $? -eq 0 ]
then
	echo "download failed, Check the network"
	exit 1
fi

# install xrjserver
unzip xrjserver-v1.0.zip && rm xrjserver-v1.0.zip && cd XRJservo-xrjserver-v1.0

if [ -d /opt/xrapp/xrJserver-b0.0 ]
then
	echo "delete exsit xrjserver"
	sudo rm -rf /opt/xrapp/xrJserver-b0.0
fi

echo "install xrjserver"
sudo cp -r xrJserver-b0.0 /opt/xrapp/

if [ ! $? -eq 0 ]
then
	echo "install failed"
	exit 1
fi

echo "install success"


