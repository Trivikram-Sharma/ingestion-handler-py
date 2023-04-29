#!/bin/bash
pid=pidof $(ps | grep 'python3 /ingestionhandler/ingestionhandler.py')
if [ $(pid) ]
    then
        if [ $(pid) ]
            then
                pkill pid
        else
             pkill 'python3 /ingestionhandler/ingestionhandler.py'
        fi
else
    echo 'No python ingestion process running'
fi
