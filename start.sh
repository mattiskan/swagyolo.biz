#!/bin/bash

#remove previously running server                                               
if [ -f nodeserver.pid ]
then
    id=`cat nodeserver.pid`

    if ps -p $id > /dev/null
    then
        kill $id
    fi
fi

#start server
cmd='npm start &>node.log' # & echo $! > nodeserver.pid'
echo $cmd | at now 2> /dev/null

echo -n "Starting node server..."
sleep 1 #give time for server to start


if ps -p $(cat nodeserver.pid) > /dev/null
then
    echo 'Done.'
else
    cat node.log
fi
