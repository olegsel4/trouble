# trouble
|                              Issue                             |                       How to find                       | Time to find |                                         How to fix                                         | Time to fix |
|:--------------------------------------------------------------:|:-------------------------------------------------------:|:------------:|:------------------------------------------------------------------------------------------:|:-----------:|
|          Site is not working (redirect to babycry.png)         |                    Curl 192.168.56.10                   |     2 min    |                              Exclude redirect from httpd.conf                              |    3 min    |
|                        Java unavailable                        | update-alternatives --config java (wrong(bad?) version) |     5 min    |                              alternatives --set /path/to/java                              |    3 min    |
|            Site is not working (Tomcat unavailable)            |                    Curl 192.168.56.10                   |     2 min    |  Fix mistake in tomcat worker(worker.properties) Fix mistake in tomcat worker(vhost.conf)  |    10 min   |
|                        Wrong IP-address                        |        Discovered while repairing     vhost.conf        |     2 min    |          Fixed mistake in the IP address (192.168.56.10 instead of 192.168.56.100)         |    1 min    |
|                    Tomcat cannot write logs                    |           Detect while reading  Tomcat's logs           |    10 min    |                    chown -R "tomcat" user and group to directory "logs"                    |    3 min    |
|          Cannot see Tomcat's main page on the 80 port          |                    Curl 192.168.56.10                   |     2 min    |          Set in vhost.conf listening not only mntlab, but all requests on 80 port.         |    3 min    |
| Site is unavailable by ssl and http        from external hosts |                      http://mntlab                      |     3 min    |                      Add 22 and 80 port by iptables rules in iptables                      |    5 min    |
|                    Iptables don't save rules                   |                       sudo reboot                       |     5 min    | Remove "immutable" flag from /sysconfig/iptables  by a chattr command and save rules again |    7 min    |
|           Tomcat don't start after  server's restart           |                       sudo reboot                       |     3 min    |                      Add write routes for CATALINA_HOME and JAVA_HOME                      |    5 min    |
|               Wrong tomcat's availability status               |                  service tomcat status                  |     5 min    |                exclude wrong echo("tomcat is running") from etc/init.tomcat                |    3 min    |

##What java version is installed?
####java 1.7.9 x64

##How was it installed and configured?
####It was installed before.It may be installed by yum or by unzip and install from local rpm packet.
####Current version of Java confidured by "alternatives" command.

##Where are log files of tomcat and httpd?
####Apache tomcat - /opt/apache/tomcat/current/logs
####Httpd - /var/log/httpd/

##Where is JAVA_HOME and what is it?
####JAVA_HOME - the environment variable to create aliases for shell commands, and set the default permissions for newly created files.
####For each user in a system must set their own JAVA_HOME path.
####Path to JAVA_Home - path to current for this system Java.

##Where is tomcat installed?
####/opt/apache/tomcat/7.0.62/

##What is CATALINA_HOME?
####CATALINA_HOME - the environment variable.Must point to a directory with installed Tomcat

##What users run httpd and tomcat processes? How is it configured?
####For Tomcat process - user tomcat,for httpd - user apache.

##What configuration files are used to make components work with each other?
####Config files such as vhost.conf,httpd.conf,worker.properties.

##What does it mean: “load average: 1.18, 0.95, 0.83”?
####The load average represents the average system load over a period of time. 1.18 0.95 0.83-value for 1 5 and 15 minutes respectively
