# Use the official NGINX image as the base image
FROM nginx:latest

# Set the working directory to NGINX html directory
WORKDIR /usr/share/nginx/html

# Create a simple HTML file
RUN echo "<!DOCTYPE html><html><head><title>Welcome</title></head><body><h1>Hello, World!</h1></body></html>" > index.html

# Expose port 80
EXPOSE 80

# Health check instruction to verify that NGINX is running
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost/ || exit 1

# CMD instruction to start NGINX server in the foreground
CMD ["nginx", "-g", "daemon off;"]
