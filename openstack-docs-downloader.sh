#!/bin/bash

URL=https://docs.openstack.org

DIR="openstack-projects"

FILES="openstack-services bare_metal_sub_projects networking_sub_projects using_libraries"

VERSIONS="stein ocata"

NUM_THREADS=8

PACKAGES_FILE="packages"

echo "" > $PACKAGES_FILE

for file in $FILES
do
    NAMES=`cat $DIR/$file`
    for name in $NAMES
    do
        for version in $VERSIONS
        do
            echo $URL/$name/$version/ >> $PACKAGES_FILE
        done
    done
done

LOG_DIR="logs"

mkdir $LOG_DIR

WGET_PARAMETERS="--mirror --convert-links --adjust-extension --page-requisites --no-parent"

cat $PACKAGES_FILE | parallel -j $NUM_THREADS wget $WGET_PARAMETERS --output-file=$LOG_DIR/wget-{#}.log {}

rm -f $PACKAGES_FILE



