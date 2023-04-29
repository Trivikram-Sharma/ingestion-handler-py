#!/bin/bash

	
HOME_PATH= "/opt/codedeploy-agent/deployment-root"
SUFFIX= "deployment-archive"

SERVICE_PATH= "/ingestionhandler"
LOCAL_PREFIX= "$HOME_PATH/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/$SUFFIX"
CODE_PATH= "$LOCAL_PREFIX/ingestionhandler"

#COPY _FILES = "$CODE_PATH/."

SOURCE_FILE= "ingestionhandler.py"
SOURCE_PATH= "$CODE_PATH/$SOURCE_FILE"

ARTIFACT="ingestionhandler.zip"
ARTIFACT_PATH="$HOME_PATH/$DEPLOYMENY_GROUP_ID/$DEPLOYMENT_ID/$SUFFIX/$ARTIFACT"

if [ ! -d "/ingestionhandler" ]
then
    sudo mkdir "/ingestionhandler"
fi

sudo pwd
sudo unzip -o $ARTIFACT_PATH -d $LOCAL_PREFIX
sudo cp $SOURCE_PATH $SERVICE_PATH/$SOURCE_FILE

sudo pip3 install boto3