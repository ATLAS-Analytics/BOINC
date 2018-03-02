#!/bin/bash

hdfs dfs -rm -R -f -skipTrash /atlas/analytics/ATLASatHOME/test

./sqoop-dev.sh

pig -4 log4j.properties -f toESuc-dev.pig
rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with pig indexer. Exiting."
    exit $rc
fi