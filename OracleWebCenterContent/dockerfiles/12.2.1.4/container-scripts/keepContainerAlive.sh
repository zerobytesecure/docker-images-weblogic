#!/bin/bash
# Copyright (c) 2021, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl
#
# This keeps the container running and alive
# while true; do sleep 30; done;
# Tail on dummy log and wait (otherwise container will exit)

usage() {
    echo "Usage:"
    echo " keepContainerAlive.sh logs_dir hostname server_name"
}

if [ $# -ne 3 ]; then
    usage
    exit 1
fi	

# Read the argument values
# Logs directory where log file will be created
LOGS_DIR=$1

# hostname
HOST_NAME=$2

# Server name
SERVER_NAME=$3

# Timestamp to make file name unique
TIMESTAMP=$(date +%y%m%d%H%M)

CONTAINER_LOG="${LOGS_DIR}/WC_Container-success-${HOST_NAME}-${SERVER_NAME}-${TIMESTAMP}.log"

# Delete the file if it exists already
rm -f $CONTAINER_LOG

CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")
cat > $CONTAINER_LOG << EOF
===============================================
POD Server    : $SERVER_NAME 
POD IP Address: $hostname 
Set up time   : $CURRENT_TIME
WCC POD Container is in running state...
===============================================
EOF
tail -f $CONTAINER_LOG &

childPID=$!
wait ${childPID}

