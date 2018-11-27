#!/bin/bash

if [ "$MONGO_URL" ]
then
  DUMP=mongodump
  OUT_DIR=/var/backups/mongodb/tmp
  TAR_DIR=/var/backups/mongodb     
  DATE=`date +%Y_%m_%d_%H_%M_%S`
  DAYS=14                           
  TAR_BAK="mongod_bak_$DATE.tar.gz"             
  rm -rf /var/backups/mongodb/tmp/*                 
  mkdir -p $OUT_DIR/$DATE           
  $DUMP --uri $MONGO_URL -o $OUT_DIR/$DATE 
  tar -zcPvf $TAR_DIR/$TAR_BAK $OUT_DIR/$DATE       
  find $TAR_DIR/ -mtime +$DAYS -delete
else
  echo "MONGO_URL should be set in env file!"
fi