#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hi from sravani!</h1>
<h2>EC2 instance created using terraform in us-west-2 Oregon</h2>" > /var/www/html/index.html
