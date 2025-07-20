#!/bin/bash
set -e

echo "Updating system..."
apt update && apt upgrade -y

echo "Installing dependencies..."
apt -y install build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev \
locate libreadline6-dev libcurl4-openssl-dev git-core libssl-dev libyaml-dev \
openssl autoconf libtool ncurses-dev bison curl wget postgresql postgresql-contrib \
libpq-dev libapr1 libaprutil1 libsvn1 libpcap-dev

echo "Installing ruby-dev..."
apt -y install ruby-dev

echo "Changing to /opt..."
cd /opt

echo "Cloning Metasploit Framework..."
git clone https://github.com/rapid7/metasploit-framework.git

echo "Changing into metasploit-framework..."
cd metasploit-framework

echo "Installing additional dependencies..."
apt -y install git-core postgresql curl nmap gem libsqlite3-dev

echo "Installing Ruby gems: wirble, sqlite3, bundler..."
gem install wirble sqlite3 bundler

echo "Installing nokogiri..."
gem install nokogiri

echo "Installing bundle..."
gem install bundle

echo "Running bundle install..."
bundle install

echo "Launching Metasploit Console..."
./msfconsole
