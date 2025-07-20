#!/bin/bash
set -e

echo "[00] Updating system..."
apt update && apt upgrade -y

echo "[01] Installing dependencies..."
apt -y install build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev \
locate libreadline6-dev libcurl4-openssl-dev git-core libssl-dev libyaml-dev \
openssl autoconf libtool ncurses-dev bison curl wget postgresql postgresql-contrib \
libpq-dev libapr1 libaprutil1 libsvn1 libpcap-dev

echo "[02] Installing ruby-dev..."
apt -y install ruby-dev

echo "[03] Changing to /opt..."
cd /opt

echo "[04] Cloning Metasploit Framework..."
git clone https://github.com/rapid7/metasploit-framework.git

echo "[05] Changing into metasploit-framework..."
cd metasploit-framework

echo "[06] Installing additional dependencies..."
apt -y install git-core postgresql curl nmap gem libsqlite3-dev

echo "[07] Installing Ruby gems: wirble, sqlite3, bundler..."
gem install wirble sqlite3 bundler

echo "[08] Installing nokogiri..."
gem install nokogiri

echo "[09] Installing bundle..."
gem install bundle

echo "[10] Running bundle install..."
bundle install

echo "[11] Launching Metasploit Console..."
./msfconsole
