FROM centos:latest
MAINTAINER nishigandhakutemate1@gmail.com

# Install Apache, unzip, and other necessary packages
RUN yum install -y httpd \
    zip \
    unzip

# Download and extract the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache server
CMD ["httpd", "-D", "FOREGROUND"]
EXPOSE 80
