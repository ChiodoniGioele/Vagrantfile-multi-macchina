#!/bin/bash

# Aggiorna il sistema
sudo apt-get update -y

# Installa Nginx (o Apache) e altri pacchetti necessari
sudo apt-get install -y nginx python3 python3-pip


# Installa Flask
pip3 install Flask

# Crea una semplice applicazione Flask
#  sudo mkdir -p /var/www/html
#  cat <<EOF | sudo tee /var/www/html/app.py
#  from flask import Flask
#  app = Flask(__name__)#
#  @app.route('/')
#  def hello():
#      return "Hello from Flask!"#
#  if __name__ == '__main__':
#      app.run(host='0.0.0.0', port=5000)
#  EOF#
#  # Configura il firewall (se necessario)
#  sudo ufw allow 'Nginx Full'#
#  # Avvia Flask come servizio (opzionale)
#  sudo tee /etc/systemd/system/flask-app.service > /dev/null <<EOF
#  [Unit]
#  Description=A simple Flask web application
#  After=network.target#
#  [Service]
#  User=vagrant
#  WorkingDirectory=/var/www/html
#  ExecStart=/usr/bin/python3 /var/www/html/app.py#
#  [Install]
#  WantedBy=multi-user.target
#  EOF#
#  sudo systemctl enable flask-app
#  sudo systemctl start flask-app
