#!/bin/bash

CAMINHO_RESTORE=/home/kelvinsouza/restore_mutillidae_amazon/2023-01-03
aws s3 sync s3://bucket-backup-server/$(date + %F) $CAMINHO_RESTORE

cd $CAMINHO_RESTORE
if [ -f $1.sql ]
then
    mysql -u root mutillidae < $1.sql
    if [ $? -eq 0 ]
    then
        echo "O restore foi realizado com sucesso"
    fi
else
    echo "O arquivo procurado não existe no diretório"
fi
