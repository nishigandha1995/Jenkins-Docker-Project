# Use the official NGINX image as the base image
FROM nginx:latest

# Expose port 80
EXPOSE 80

# Copy custom configuration file to NGINX configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# CMD instruction to start NGINX server in the foreground
CMD ["nginx", "-g", "daemon off;"]

