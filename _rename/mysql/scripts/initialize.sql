CREATE DATABASE IF NOT EXISTS dmnetdb;
USE dmnetdb;

CREATE USER 'dmnet'@'localhost' IDENTIFIED BY 'dmnet';
GRANT ALL PRIVILEGES ON * . * TO 'dmnet'@'localhost';
ALTER USER 'dmnet'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dmnet';

