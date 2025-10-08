#!/bin/bash

# Author: Airat Halitov @AiratTop
# GitHub: https://github.com/AiratTop/phpmyadmin-update
# License: MIT

# Ensure script runs with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Variables
VER=5.2.2
FNAME=phpMyAdmin-$VER-all-languages
PMADIR=/usr/share/phpmyadmin

# Clean up previous files
rm -rf $FNAME $FNAME.zip

# Download the specified version
echo "Downloading phpMyAdmin version $VER..."
wget -q https://files.phpmyadmin.net/phpMyAdmin/$VER/$FNAME.zip
if [ ! -f $FNAME.zip ]; then
  echo "Failed to download phpMyAdmin version $VER. Please check the version or your internet connection."
  exit 1
fi

# Unzip the downloaded file
echo "Extracting files..."
unzip -q $FNAME.zip && rm -rf $FNAME.zip

# Check if phpMyAdmin directory exists
if [ -d $PMADIR ]; then
  BACKUP_DIR="$PMADIR.backup-$(date +%s)"
  echo "Creating a backup of the current phpMyAdmin directory: $BACKUP_DIR"
  sudo mv $PMADIR $BACKUP_DIR
else
  echo "phpMyAdmin directory not found. Proceeding with a fresh installation."
fi

# Move the new version
echo "Installing phpMyAdmin $VER..."
sudo mv $FNAME $PMADIR

# Set up permissions and configuration
cd $PMADIR
sudo mkdir tmp && sudo chmod 777 tmp -R
sudo cp config.sample.inc.php config.inc.php

# Generate a random blowfish_secret
echo "Configuring phpMyAdmin..."
KEY=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
SRC="blowfish_secret'] = '';"
DST="blowfish_secret'] = '$KEY';"
sudo sed "s/$SRC/$DST/g" -i config.inc.php

echo "phpMyAdmin $VER installed successfully!"
exit 0
