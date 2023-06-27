#!/bin/bash
sudo apt update
sudo apt install zip -y
sudo apt install openjdk-17-jre-headless -y 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.zip
sudo unzip apache-tomcat-9.0.76.zip
sudo mv apache-tomcat-9.0.76 tomcat9
sudo chown -R ubuntu:ubuntu tomcat9
sudo chmod +x tomcat9/bin/*
./tomcat9/bin/startup.sh
 sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /home/ubuntu/tomcat9/webapps/manager/META-INF/context.xml
sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /home/ubuntu/tomcat9/webapps/host-manager/META-INF/context.xml
sed -i '/<\/tomcat-users>/i \
<role rolename="manager-gui"/>\
<role rolename="admin-gui"/>\
<user username="manager" password="12345" roles="manager-gui"/>\
<user username="admin" password="12345" roles="admin-gui"/>' /home/ubuntu/tomcat9/conf/tomcat-users.xml
./tomcat9/bin/catalina.sh
./tomcat9/bin/shutdown.sh
./tomcat9/bin/startup.sh
