 #!/bin/bash
 FROM amazonlinux:latest

 #Install dependencies
 RUN yum update -y \
     && yum install httpd -y
 
 # Copy files into httpd public directory. 
 COPY web/* /var/www/html/
 
 # Expose Port 80 to allow http traffic to the container.
 EXPOSE 80
 
 # Restart httpd at the background while the container runs.
 ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]


 # NB: This Dockerfile is for amazonlinux 2