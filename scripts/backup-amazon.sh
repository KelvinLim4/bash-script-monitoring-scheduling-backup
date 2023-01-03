#!/bin/bash

CAMINHO_BACKUP=/home/kelvinsouza/
cd $CAMINHO_BACKUP
if [ ! -d backup_mutillidae_amazon ]
then
	mkdir backup_mutillidae_amazon
fi

tabelas=$(sudo mysql -u root mutillidae -e "show tables;" | grep -v Tables)

for tabela in $tabelas
do
	mysqldump -u root mutillidae $tabela > $tabela.sql
done

