#!/bin/bash

hdfs dfs -rm -R -f -skipTrash /atlas/analytics/ATLASatHOME/production
# hdfs dfs -rmdir  /atlas/analytics/ATLASatHOME/production

./sqoop-prod.sh
rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with sqoop. Exiting."
    exit $rc
fi

pig -4 log4j.properties -f toESuc-prod.pig
rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with pig indexer. Exiting."
    exit $rc
fi