# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Remove the default Nginx index page
RUN rm /usr/share/nginx/html/*

# Copy your HTML file into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
