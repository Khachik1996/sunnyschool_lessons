#!/bin/bash

# Update package index and install Nginx
apt-get update
apt-get install -y nginx

# Create a custom index.html file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to my website!</title>
</head>
<body>
    <h1>Hello from Terraform!</h1>
    <p>This is a custom HTML page deployed using Terraform.</p>
</body>
</html>
EOF

# Restart Nginx to apply changes
systemctl restart nginx

