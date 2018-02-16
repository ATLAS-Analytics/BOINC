#!/bin/bash

hdfs dfs -rm -R -f -skipTrash /atlas/analytics/ATLASatHOME/production
# hdfs dfs -rmdir  /atlas/analytics/ATLASatHOME/production

./sqoop-prod.sh

pig -4 log4j.properties -f toESuc-prod.pig