FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm -rf /etc/nginx/conf.d/*

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy HTML files to Nginx HTML directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
