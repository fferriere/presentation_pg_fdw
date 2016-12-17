#!/bin/bash

/entrypoint.sh mongod &
sleep 3
mongoimport --db customers --collection customers --file=/opt/data1.json --jsonArray
mongoimport --db customers --collection customers --file=/opt/data2.json --jsonArray
mongo customers --eval 'db.customers.find().count()'
ls -lR /data
mongod --shutdown
ls -lR /data
