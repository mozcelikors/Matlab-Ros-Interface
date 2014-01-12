Matlab-Ros-Interface
================

Matlab-Ros-Interface is a MATLAB graphical interface that communicates with rosbridge server in order to communicate between MATLAB and ROS. web-matlab-bridge, Java-WebSocket and jsonlab libraries and softwares are used in order to achieve MATLAB-ROS connection with MATLAB GUI.


Disclaimer
================

With Matlab-Ros-Interface project; web-matlab-bridge, Java-WebSocket and jsonlab libraries and software are used in order to achieve MATLAB-ROS connection with MATLAB GUI.
This project is developed by Mustafa Ozcelikors. Please use the disclaimer note as is, while using the project. For any problems or suggestions, please contact me using
Email: mozcelikors@gmail.com
Webpage: http://www.thewebblog.net


System Requirements
================

MATLAB R2010b or greater
Java 1.6 (SE6)
NOTE: MATLAB has compatibility problems with Java 1.7


Installation Instructions (Linux)
================

1) Install JDK using "sudo apt-get install openjdk-6-jdk"
2) Install JRE using "sudo apt-get install openjdk-6-jre"
3) Clone the repository to your MATLAB home folder
4) Execute "gedit `locate classpath.txt` to open your MATLAB static classpath include file.
5) Add <FullPathOfFiles>Java-WebSocket/dist/java_websocket.jar line to the classpath.txt
6) Start MATLAB.



Installation Instructions (Windows)
================

1) Install JRE 6 and JDK 1.6 to your computer from Oracle website.
2) Configure system variables in order to make MATLAB recognise Java libraries:
   
PATH          .......; C:\Program Files\Java\<JDK_Version>\bin
JAVA_HOME     C:\Program Files\Java\<JDK_Version>
MATLAB_JAVA   C:\Program Files\Java\jre6

3) Clone the files provided to your MATLAB home folder.
4) Copy the java_websocket.jar file in <FullPathOfFiles>/win folder into <FullPathOfFiles>/Java-WebSocket/dist/ and overwrite.
5) Open MATLAB and type "edit 'classpath.txt'".
6) Add the path <FullPathOfFiles>/Java-WebSocket/dist/java_websocket.jar into the text file.
7) Restart MATLAB.


Running The Client
================

To run the client, start untitled.m GUI file in MATLAB.


Rosbridge Server Installation & Running
================

To install rosbridge server to ROS Hydro,

sudo apt-get install git
cd ~/catkin_ws/src/
git clone https://github.com/RobotWebTools/rosbridge_suite.git
cd ~/catkin_ws/
catkin_make

To install rosbridge server to ROS Groovy,

sudo apt-get install git
cd ~/catkin_ws/src
git clone https://github.com/RobotWebTools/rosbridge_suite.git -b groovy-devel
cd ~/catkin_ws/
catkin_make

To start rosbridge server,

cd ~/catkin_ws/src/rosbridge_suite/rosbridge_server/scripts/
./rosbridge_websocket


