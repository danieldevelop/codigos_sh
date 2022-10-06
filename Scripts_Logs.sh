#!/bin/bash

clear #Limpiamos Pantalla antes de ejecutar el scripts
echo "===== InforMatica Access ====="
echo " "

Menu(){
	echo "1) Execute files logs (Windows/PHP)"
	echo "2) Execute files logs (GNU-Linux/PHP)"
	echo "3) Remote Access SSH (GNU-Linux)"
	echo "0) Salir"
	echo  -n "Opcion: "
	read OPCION
}

Menu
if [ $OPCION -eq 1 ]; then
	echo " " #Salto de linea
	echo "Running logs - Windows/PHP":
	echo " " #Salto de linea

	tail -vf C:/xampp/apache/logs/error.log
else
	if [ $OPCION -eq 2 ]; then #Nos conectamos a otro equipo
		echo " " #Salto de linea
		echo "Running logs - GNU-Linux/PHP":
		echo " " #Salto de linea

		tail -vf /var/log/apache2/error.log
	else 
		if [ $OPCION -eq 3 ]; then
			echo " " #Salto de linea
			echo -n "Ingrese Usuario: "
			read usuario
			echo -n "Ingrese Equipo (IP Address): "
			read equipo

			ssh $usuario@$equipo
		else
			if [ $OPCION -eq 0 ]; then #Salimos del Programa
				exit
			fi
		fi
	fi
fi
echo

