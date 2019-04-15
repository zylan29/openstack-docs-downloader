#!/bin/bash

URL=https://developer.openstack.org/api-ref/

DIR="openstack-projects"

FILE="openstack-api"

NUM_THREADS=8

PACKAGES_FILE="packages"

rm -f $PACKAGES_FILE

touch $PACKAGES_FILE

NAMES=`cat $DIR/$FILE`
for name in $NAMES
do
    echo $URL/$name/ >> $PACKAGES_FILE
done

LOG_DIR="logs"

mkdir $LOG_DIR

WGET_PARAMETERS="--mirror --convert-links --adjust-extension --page-requisites --no-parent"

cat $PACKAGES_FILE | parallel -j $NUM_THREADS wget $WGET_PARAMETERS --output-file=$LOG_DIR/wget-{#}.log {}

rm -f $PACKAGES_FILE