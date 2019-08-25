#!/bin/bash

mysql -uroot -p"$(sudo grep -oP "temporary password is generated for root@localhost: \K(.*)" /var/log/mysqld.log)" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Onstak@123'; FLUSH PRIVILEGES;" --connect-expired-password

mysql -uroot -p"Onstak@123" -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'Onstak@123'; FLUSH PRIVILEGES;" --connect-expired-password

mysql -uroot -p"Onstak@123" -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'; FLUSH PRIVILEGES;" --connect-expired-password

mysql -uadmin -p"Onstak@123" -e "CREATE DATABASE enova_db" --connect-expired-password

mysql -uadmin -p"Onstak@123" -D enova_db < /tmp/database.sql --connect-expired-password