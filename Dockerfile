FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm -rf /etc/nginx/conf.d/*

# Copy custom Nginx configuration file and set permissions
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod 777 /etc/nginx/nginx.conf

# Copy HTML files to Nginx HTML directory and set permissions
COPY index.html /usr/share/nginx/html/
RUN chmod 644 /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80 

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

