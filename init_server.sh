#!/bin/bash

clear;
echo "Deteniendo servidor apacha2...";
sudo service apache2 stop

echo "";
echo "Iniciando servidor apacha2...";
sudo service apache2 start

echo "";
echo "Iniciando DMBS MySQL";
sudo service mysql start

echo "";
