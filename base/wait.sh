#!/bin/bash
set -e

while ! nc -z lemp-mysql 3306 ;
do
    echo "############# Waiting for lemp-mysql to start.";
    sleep 3;
done;