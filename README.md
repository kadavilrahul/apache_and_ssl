# HTML Subdomain Setup (Debian)

This repository contains a script ([setup_debian.sh](cci:7://file:///home/rahuldineshk/wordpress_on_lamp/setup_debian.sh:0:0-0:0)) to automate the setup of an HTML subdomain on a Debian-based system using Apache2 and Certbot for SSL.

## Prerequisites

- A Debian-based system (e.g., Debian, Ubuntu)
- Root or sudo privileges
- A registered domain name
- DNS records configured to point the subdomain to your server's IP address

## Usage

1.  Clone this repository to your Debian system:

    ```bash
    git clone https://github.com/kadavilrahul/apache_and_ssl.git && cd apache_and_ssl
    ```

2.  Run the setup script with sudo privileges:

    ```bash
    bash setup_debian.sh
    ```

    The script will prompt you for the following information:

    -   `Subdomain`: The subdomain you want to set up (e.g., `new.example.com`).
    -   `Main Domain`: The main domain (e.g., `example.com`).
    -   `Web Root Path`: The directory where the subdomain's files will be stored (default: `/var/www/$SUBDOMAIN`).
    -   `Apache Config Path`: The location where the Apache configuration file will be created (default: `/etc/apache2/sites-available/$SUBDOMAIN.conf`).

    The script will then:

    -   Update the system's package list.
    -   Install Apache2, Certbot, and Python3-Certbot-Apache.
    -   Create the web root directory.
    -   Set permissions on the web root directory.
    -   Create a sample `index.html` file in the web root directory.
    -   Create an Apache virtual host configuration file.
    -   Enable the new site in Apache.
    -   Reload Apache to apply the changes.
    -   Obtain an SSL certificate for the subdomain using Certbot.
    -   Reload Apache again to apply the SSL certificate.
	  
3.  Test the SSL certificate

    ```bash
    sudo certbot certificates
    ```
 	

## Configuration

You can customize the following settings by modifying the variables within the [setup_debian.sh](cci:7://file:///home/rahuldineshk/wordpress_on_lamp/setup_debian.sh:0:0-0:0) script or by providing input when prompted:

-   `SUBDOMAIN`: The subdomain to be created.
-   `MAIN_DOMAIN`: The main domain.
-   `WEB_ROOT`: The web root directory for the subdomain.
-   `APACHE_CONF`: The path to the Apache configuration file.

## Important Notes

-   Ensure that the DNS records for your subdomain are properly configured before running the script.
-   This script assumes that you have a registered domain name and that you have configured the necessary DNS records to point the subdomain to your server's IP address.
-   The script will install Certbot and attempt to obtain an SSL certificate for the subdomain. Make sure your domain is properly configured before running the script.

## Security Considerations

-   This script uses Certbot to obtain an SSL certificate, which helps secure your subdomain with HTTPS.
-   It's recommended to keep your system and installed packages up to date to prevent security vulnerabilities.
-   Consider implementing additional security measures such as a firewall and regular backups.

## License

[Specify the license under which the code is released]
