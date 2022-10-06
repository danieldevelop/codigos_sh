#!/bin/bash
clear

while : 
do
	echo "MENU"
	echo "1-VERIFICAR Y CREAR GRUPO"
	echo "2-VERIFICAR Y CREAR USUARIO"
	echo "3-ELIMINAR GRUPO"
	echo "0-SALIR"
	echo "INGRESE OPCION: "
	read opc
	
	case $opc in
		1) clear 
			echo "VERIFICACION DE GRUPO"
			echo "" #salto de linea
			#echo "INGRESE USUARIO ACTUAL: "
			#read usu
			echo "INGRESE GRUPO: "
			read grupo
			if grep -qi "^$grupo" /etc/group 
			then 
				echo "DIRECTORIO: $grupo EXISTE"
				echo "" #salto de linea
			else 
				echo "DIRECTORIO: $grupo NO EXISTE, ¿DESEA CREARLO S/N? "
				read rs
				echo "" #salto de linea
				if [ "$rs" = S ] 
				then
					groupadd "$grupo"
				fi
			fi;;

		2) clear
			echo "VERIFICACION DE USUARIO"
			echo "" #salto de linea
			echo "INGRESE USUARIO: "
			read usuario
			if grep -qi "^$usuario" /etc/passwd 
			then 
				echo "USUARIO: $usuario EXISTE"
				echo "" #salto de linea
			else 
				echo "USUARIO: $usuario NO EXISTE, ¿DESEA CREARLO S/N? "
				read rs
				echo "" #salto de linea
				if [ "$rs" = S ] 
				then
					echo "INGRESE GRUPO: "
					read grupo
					useradd -g "$grupo" -d /home/"$usuario" -m -s /bin/bash "$usuario"
				fi
			fi;;
			
		3) clear
			echo "ELIMINAR GRUPO"
			echo ""
			echo "INGRESE GRUPO: "
			read grupo
			if grep -qi "^$grupo" /etc/group
			then
				groupdel "$grupo"
				echo "GRUPO: $grupo ELIMNADO"
				echo ""
			else				
				echo "GRUPO: $grupo YA FUE ELIMINADO"
				echo ""
			fi;;

		0) echo "" #salto de linea
			echo "ADIOS!!"
			break;;
		
		*) echo "OPCION INVALIDA!!";;
	esac
done