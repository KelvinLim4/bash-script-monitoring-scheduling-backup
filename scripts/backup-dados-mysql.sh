#!/bin/bash

CAMINHO_HOME=/home/kelvinsouza

cd $CAMINHO_HOME

if [ ! -d backup-mysql ]
then
	mkdir backup-mysql
fi

mysqldump -u root $1 > $CAMINHO_HOME/backup-mysql/$1.sql

#Verificando status de saida do comando de dump
if [ $? -eq 0 ] 
then
	echo "Backup realizado com sucesso"
else
	echo "Houve um problema no backup"
fi
