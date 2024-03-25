FROM nginx:latest
LABEL maintainer="vikashashoke@gmail.com"

# Install unzip
RUN apt-get update && apt-get install -y unzip

# Set working directory
WORKDIR /usr/share/nginx/html

# Add the URL of the website template ZIP file here
ARG WEBSITE_TEMPLATE_URL="https://www.free-css.com/assets/files/free-css-templates/download/page251/excel.zip"

# Download and extract the website template
RUN apt-get update && apt-get install -y wget \
    && wget -O template.zip $WEBSITE_TEMPLATE_URL \
    && unzip template.zip \
    && rm template.zip

# Expose port 80
EXPOSE 80

# Command to run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

