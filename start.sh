#! /bin/sh

#echo $JAVA_HOME
#echo $(ls $JAVA_HOME)
echo $(which java)
echo $(java -version)
cd ./WebGoat-5.4
sh ./webgoat-custom.sh start80