#preparing for work
yum install -y mlocate
updatedb

#fix httpd.confvhost.conf
 sed -i '/\<VirtualHost /,/\<\VirtualHost>/d' /etc/httpd/conf/httpd.conf

#workers.properties
 sed -i 's/tomcat.worker/tomcat_worker/g' /etc/httpd/conf.d/workers.properties /etc/httpd/conf.d/vhost.conf
 sed -i 's/worker-jk@ppname/tomcat_worker/g' /etc/httpd/conf.d/workers.properties
 sed -i 's/192.168.56.100/192.168.56.10/g' /etc/httpd/conf.d/workers.properties

#vhost.conf
 sed -i 's/mntlab/*/g' /etc/httpd/conf.d/vhost.conf 

#fix java
   alternatives --set java /opt/oracle/java/x64//jdk1.7.0_79/bin/java

#set permissions
   chown -R tomcat:tomcat /opt/apache/tomcat/7.0.62/logs
   chown -R tomcat:tomcat /opt/apache/tomcat/7.0.62/logs/*

#auto
   chkconfig tomcat on

#restart services
   service httpd restart
   /opt/apache/tomcat/7.0.62/bin/shutdown.sh 
   /opt/apache/tomcat/7.0.62/bin/startup.sh 

#fix iptables
   iptables -I INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
   iptables -I INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
   chattr -i /etc/sysconfig/iptables
   service iptables save


