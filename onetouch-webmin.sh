#!/bin/bash

## OneTouch-Webmin
## Con este script puedes instalar de manera automatica Webmin para administrar tu servidor

clear
figlet OneTouch-Web
ipserver= $(hostname -I)
echo ""

### ELeccion de que quieres hacer
read -p "Deseas continuar con la instalación de Webmin Y/N--> " eleccion

if [[ $eleccion == "Y" ]] || [[ $eleccion == "y" ]]
then
echo "Ejecutando instalador..."
echo ""
echo "[*]Actualizando el sistema..."
sudo apt-get update -y &> /dev/null 
sudo apt-get upgrade -y &> /dev/null
echo "[/]Actualizaciones realizadas"
echo ""
echo "Instalando recursos necerarios..."
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python unzip -y &> /dev/null
echo "Recursos Instalados"
echo ""
echo "Instando webmin..."
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.999-2_all.deb -y
dpkg --install webmin_1.999-2_all.deb -y
echo "Instalacion completada"
echo ""
echo "Para acceder a Webmin dirigete a esta url https://$ipserver:10000"
echo "El nombre de usuario sera root y la contraseña la de tu usuario root"

elif [[ $eleccion == "N" ]] || [[ $eleccion == "n" ]]
then
echo "Saliendo del instalador..."
sleep 1
exit

else
echo "Argumento invalido, Introduzca de nuevo un argumento"
sleep 0.5
bash onetouch-webmin.sh

fi
