#!/bin/bash

echo "  *******************************  importing ATLAS@HOME table  *******************************"
#echo " between $1 and $2 "
sqoop import \
    --connect $BOINC_CONNECTION_STRING \
    --username $BOINC_USER --password $BOINC_PASS \
    --query 'select * FROM analyticsTable WHERE $CONDITIONS' \
    --where 'outcome!=0' \
    --as-avrodatafile \
    --target-dir /atlas/analytics/ATLASatHOME/production \
    -m 1

rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with sqoop. Exiting."
    exit $rc
fi