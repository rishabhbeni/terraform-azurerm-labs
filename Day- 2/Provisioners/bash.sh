sudo apt-get update
sudo apt-get install -y apache
sudo systemctl start apache
sudo systemctl enable apache
echo "<h1> hello world: deployed via TF </h1>" | sudo tee var/www/html/html.index