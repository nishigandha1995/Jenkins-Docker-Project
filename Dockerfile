FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Add a simple HTML file
RUN echo "<!DOCTYPE html><html><head><title>Welcome</title></head><body><h1>Hello, World!</h1></body></html>" > index.html

# Expose port 80
EXPOSE 80

# Command to run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
