#!/bin/bash

clear

echo -n "Ingrese el o los programas que desea instalar: ";
read programas;

if [ "$programas" = "" ]
then
	echo "E: Debe especificar los programas instalar";
else
	echo "";
	apt-get -y install $programas;
fi
