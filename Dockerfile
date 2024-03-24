FROM centos:latest
MAINTAINER nishigandhakutemate1@gmail.com

# Install Apache HTTP Server, zip, and unzip directly from CentOS repositories
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
