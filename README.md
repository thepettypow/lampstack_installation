# LAMP Stack Auto-Install Script

This is a Bash script to automatically install and configure a LAMP stack (Linux, Apache, MySQL, PHP) on a fresh Ubuntu/Debian server. The script also sets up a simple "Hello, World!" web page and configures MySQL with a user-defined database and user.

---

## Features

- **Automatic Installation**: Installs Apache, MySQL, and PHP with minimal user input.
- **MySQL Configuration**: Secures MySQL and creates a database and user based on user input.
- **Web Page Setup**: Creates a simple PHP web page that displays "Hello, World!".
- **Permissions Management**: Sets proper permissions for the web directory.
- **User-Friendly**: Prompts the user for necessary inputs (e.g., database name, username, and password).

---

## Prerequisites

- A fresh Ubuntu/Debian server.
- Root or sudo access.

---

## How to Use

1. **Download the Script**:
   ```bash
    git clone https://github.com/thepettypow/lampstack_installation.git
   ```

2. **Make the Script Executable**:
   Run the following command to make the script executable:
   ```bash
   cd lampstack_installation/
   chmod +x install_lamp.sh
   ```

3. **Run the Script**:
   Execute the script with sudo privileges:
   ```bash
   sudo ./install_lamp.sh
   ```

4. **Follow the Prompts**:
   - Enter a name for the MySQL database.
   - Enter a username for the MySQL database.
   - Enter a password for the MySQL user.

5. **Access the Web Page**:
   Once the script completes, open your browser and navigate to:
   ```
   http://your_server_ip/index.php
   ```
   You should see a "Hello, World!" message.

---

## Script Details

### What the Script Does:
1. **Updates the System**: Ensures the system is up-to-date.
2. **Installs Apache**: Installs and configures the Apache web server.
3. **Installs MySQL**: Installs MySQL and runs the `mysql_secure_installation` script.
4. **Installs PHP**: Installs PHP and necessary modules for Apache and MySQL.
5. **Creates a MySQL Database and User**: Prompts the user for a database name, username, and password, then creates them in MySQL.
6. **Sets Up a Web Page**: Creates a simple PHP file (`index.php`) in the web root directory.
7. **Sets Permissions**: Configures proper permissions for the `/var/www/html` directory.

---

## Customization

- **PHP Version**: If you need a specific PHP version, modify the `apt-get install php` line to include the desired version (e.g., `php7.4`).
- **Web Page Content**: Edit the `index.php` file located at `/var/www/html/index.php` to customize the web page.

---

## Troubleshooting

- **Apache Not Running**: If the web page is not accessible, ensure Apache is running:
  ```bash
  sudo systemctl status apache2
  ```
- **MySQL Access Issues**: If you cannot access MySQL, verify the username and password, and ensure MySQL is running:
  ```bash
  sudo systemctl status mysql
  ```

---

Enjoy your brand new LAMP 💡
