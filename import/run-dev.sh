#!/bin/bash

hdfs dfs -rm -R -f -skipTrash /atlas/analytics/ATLASatHOME/test

./sqoop-dev.sh

pig -4 log4j.properties -f toESuc-dev.pig