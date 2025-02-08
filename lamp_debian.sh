#!/bin/bash  

  # Update system packages  
  echo "Updating system packages..."  
  sudo apt update && sudo apt upgrade -y  

    # Install Apache web server  
    echo "Installing Apache..."  
    sudo apt install apache2 -y  

      # Enable Apache modules  
      sudo a2enmod rewrite  
      sudo systemctl restart apache2  

        # Install MySQL server  
        echo "Installing MySQL..."  
        sudo apt install mysql-server -y  

          # Secure MySQL installation  
          echo "Securing MySQL installation..."  
          sudo mysql_secure_installation  

            # Install PHP and required modules  
            echo "Installing PHP and common modules..."  
            sudo apt install php libapache2-mod-php php-mysql php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc -y  

              # Create info.php file to test PHP  
              echo "Creating PHP info page..."  
              echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php  

                # Set proper permissions  
                echo "Setting permissions..."  
                sudo chown -R www-data:www-data /var/www/html/  
                sudo chmod -R 755 /var/www/html/  

                  # Restart Apache  
                  echo "Restarting Apache..."  
                  sudo systemctl restart apache2  

                    # Print status  
                    echo "LAMP installation completed!"  
                    echo "Apache status:"  
                    sudo systemctl status apache2 | grep Active  
                    echo "MySQL status:"  
                    sudo systemctl status mysql | grep Active  
                    echo "PHP version:"  
                    php -v  

                      echo "You can test PHP by visiting: http://localhost/info.php" 
                      sudo rm /var/www/html/info.php
