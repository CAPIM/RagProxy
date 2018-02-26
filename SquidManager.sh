#!/bin/bash
clear
#MENSAGEM INICIAL	
	tput setaf 7 ; tput setab 1 ; tput bold ; printf '%35s%s%-20s\n' "NNET Proxy Installer 1.2 © @Nilbertocs" ; tput sgr0
	tput setaf 6 ; tput bold ; echo "" ; echo "Este script irá:" ; echo ""
	echo "● Instalar e configurar o Proxy Squid nas portas 3128, 8080 e 8799"
	echo "● Instalar e Configurar o Webmin na porta 10000"
	echo "● Instalar e configurar o SARG" ; tput sgr0
	echo ""
#CONFIGURAÇÃO INICIAL
	tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
	clear
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
	sleep 3
	tput setaf 6
#ATUALIZANDO O SISTEMA E INSTALANDO DEPENDENCIAS
	apt-get install sudo
	echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
	echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
	wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
	apt-get update -y
	apt-get install squid3 nano webmin wget webmin apache2 sarg -y
#CONFIGURANDO SQUID E SARG
	rm /var/www/html/index.html
	rm /etc/squid3/squid.conf
	wget https://raw.githubusercontent.com/CAPIM/RagProxy/master/squid.conf -O /etc/squid3/squid.conf
	rm /etc/sarg/sarg.conf
	wget https://raw.githubusercontent.com/CAPIM/RagProxy/master/sarg.conf -O /etc/sarg/sarg.conf
	squid3 -k reconfigure
	sarg
	clear
#MENSAGEM DE CONFIRMAÇÃO
	echo ""
	tput setaf 2 ; tput setab 1 ; tput bold ; echo "                        Script configurado                       " ; tput sgr0
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "Proxy Squid Instalado e rodando nas portas: 3128, 8080 e 8799    " ; tput sgr0
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "SARG configurado na porta padrão do apache (80)                  " ; tput sgr0
sleep 3