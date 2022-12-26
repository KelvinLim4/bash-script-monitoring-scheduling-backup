#!/bin/bash

cd ~/repos-git/bash-script-monitoring-scheduling-backup/apache-log


# Verificando se o parâmetro esta vazio
if [ -z $1 ]
then
	#Forçando usuário a passar o parâmetro
	while [ -z $requisicao ]
	do
		read -p "Você esqueceu de colocar um parâmetro (GET,PUT,POST,DELETE): " requisicao
		letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1) }')
	done
else
	#transformando letras em maiusculas
	letra_maiuscula=$(echo $1 | awk '{ print toupper($1) }')
fi


case $letra_maiuscula in
	GET)
	cat apache.log | grep GET
	;;
	
	POST)
	cat apache.log | grep POST
	;;
	
	PUT) 
	cat apache.log | grep PUT
	;;
	
	DELETE)
	cat apache.log | grep DELETE
	;;
	
	*)
	echo "O parãmetro passado não é válido"
	;;
	
esac
