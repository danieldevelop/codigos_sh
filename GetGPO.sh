#!/bin/bash
clear
echo "" #salto de linea

menu(){
	echo "###### Active Directory ######"
	echo "1.- Crear Usuario"
	echo "2.- Crear Grupo de Usuario"
	echo "3.- Ver Usuarios"
	echo "4.- Ver Grupos"
	echo "5.- Crear Archivo"
	echo "6.- Instalar Programa"
	echo "7.- Actualizar Systema"
	echo "0.- Salir"
	echo -n "Seleccione Opcion: "
	read opt
}
menu

case $opt in
	1) echo "---- Creacion de Usuario ----"
		echo "Nota: RECUERDE CREAR EL GRUPO ANTES DE CREAR EL USUARIO"
		echo -n "Ingreso Directorio a crear(nombre de usuario): "
		read usuario
		useradd -g $grupo -d /home/$usuario -m -s /bin/bash $usuario;;

	2) echo "---- Creacion Grupo de Usuario ----"
		echo -n "Ingrese nombre Grupo de Usuario: "
		read grupo
		groupadd $grupo;;

	3) echo "---- Lista de Usuarios ----"
		echo -n "Ingrese Usuario a buscar"
		read usuario
		grep $usuario /etc/passwd;;

	4) echo "---- Lista de Grupos ----"
		echo -n "Ingrese Grupo a buscar"
		read grupo
		grep $grupo /etc/group;;

	5) echo "---- Nuevo Archivo ----"
		echo -n "Usuario: "
		read usuario
		echo -n "Ingrese nombre archivo: "
		read file
		touch /home/$usuario/$file;;

	6) echo "---- Instalacion de Programas ----"
		echo -n "Ingrese nombre del programa  a instalar: "
		read programa
		echo -n "Desea que sea automatico: (s/N) "
		read argumento
		if [ $argumento = s ]
		then
			yum -y install $programa
		else
			yum install $programa
		fi;;

	7) echo "---- Actualizaciones ---- "
		echo -n "Desea que la actualizacion se automaticamente: (s/N) "
		read arg
		if [ $arg = s ]
		then
			yum -y update
		else
			yum update
		fi;;

	0) exit;;

	*) echo "!!Opcion no valida";;
esac

