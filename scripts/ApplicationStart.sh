#!/bin/bash


SERVICE_PATH="/ingestionhandler"
SOURCE="ingestionhandler.py"
SOURCE_PATH="$SERVICE_PATH/$SOURCE"

sudo python3 $SOURCE >/dev/null 2>&1 &