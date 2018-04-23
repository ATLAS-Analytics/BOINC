#!/bin/bash

hdfs dfs -rm -R -f -skipTrash /atlas/analytics/ATLASatHOME/cms-dev

./sqoop-cms-dev.sh
rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with sqoop. Exiting."
    exit $rc
fi

pig -4 log4j.properties -f toESuc-cms-dev.pig
rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with pig indexer. Exiting."
    exit $rc
fi