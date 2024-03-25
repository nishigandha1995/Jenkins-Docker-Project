FROM nginx:latest
LABEL maintainer="nishigandhakutemate1@gmail.com"

# Install unzip
RUN apt-get update && \
    apt-get install -y unzip

# Download and extract the website template
WORKDIR /usr/share/nginx/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page261/stride.zip /usr/share/nginx/html/
RUN unzip stride.zip && \
    rm stride.zip

# Expose port 80
EXPOSE 80

# Command to start nginx
CMD ["nginx", "-g", "daemon off;"]
