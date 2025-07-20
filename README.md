# Metasploit Framework Installer Script

This script automates the installation of the Metasploit Framework on Debian-based systems (e.g., Ubuntu, Kali, Parrot).

---

## Features

- Updates the system
- Installs all required dependencies
- Clones the Metasploit Framework from GitHub
- Installs Ruby and required gems
- Runs `bundle install`
- Launches `msfconsole`

---

## Usage

1. **Make the script executable:**
    ```bash
    chmod +x install_metasploit.sh
    ```

2. **Run it as root or with sudo:**
    ```bash
    sudo ./install_metasploit.sh
    ```

> **Tip:**  
> Run as root or with sudo. Make sure you have a working internet connection.

---

## Script Location

The Metasploit Framework will be cloned to:

```
/opt/metasploit-framework
```

---

## PostgreSQL (Optional but Recommended)

To enable Metasploit database features, run:

```bash
sudo systemctl enable postgresql
sudo systemctl start postgresql
```

---

## Note

This script is intended for local or lab use. **Do not** run random scripts on production systems unless you know what you're doing.