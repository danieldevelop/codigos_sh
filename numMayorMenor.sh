#!/bin/bash

clear

echo "Ejercicio 3 - LINUX"
echo " "

echo -n "Ingrese primer valor: "
read numUno
echo -n "Ingrese segundo valor: "
read numDos
echo -n "Ingrese tercer valor: "
read numTres


if [ $numUno -gt $numDos && $numUno -gt $numTres ];
then
	echo "El valor $numUno es mayor";

else
	if [ "$numDos" -gt "$numUno" && "$numDos" -gt "$numTres" ];
	then
		echo "El valor $numDos es mayor";

	else
		echo "El valor $numTres es mayor";
	fi
fi



