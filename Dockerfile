FROM centos:latest
MAINTAINER nishigandhakutemate1@gmail.com

# Update CentOS repository configuration with reliable mirrors
RUN echo -e "[base]\nname=CentOS-8 - Base\nbaseurl=http://mirror.centos.org/centos/8/BaseOS/x86_64/os/\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-8" > /etc/yum.repos.d/CentOS-Base.repo \
    && echo -e "[appstream]\nname=CentOS-8 - AppStream\nbaseurl=http://mirror.centos.org/centos/8/AppStream/x86_64/os/\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-8" > /etc/yum.repos.d/CentOS-AppStream.repo

# Clean yum cache to avoid any issues
RUN yum clean all

# Install required packages
RUN yum install -y httpd zip unzip

# Add website content
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80




 
