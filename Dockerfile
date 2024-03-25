FROM nginx:latest
LABEL maintainer="vikashashoke@gmail.com"

# Install unzip
RUN apt-get update && \
    apt-get install -y unzip

# Download and extract the website template
WORKDIR /usr/share/nginx/html
ADD https://example.com/template.zip /usr/share/nginx/html/
RUN unzip template.zip && \
    rm template.zip

# Expose port 80
EXPOSE 80

# Command to start nginx
CMD ["nginx", "-g", "daemon off;"]

