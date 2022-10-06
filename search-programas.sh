#!/bin/bash

clear
echo -n "Ingrese programa que desea buscar: ";
read buscar;

aptitude search $buscar;
