#!/bin/bash

echo "========== executing =========="

startDate=$(date -u '+%Y-%m-%d %H:00:00' -d "-2hour")
endDate=$(date -u '+%Y-%m-%d %H:00:00' -d "-1hour")
echo "start date: ${startDate}"
echo "end date: ${endDate}"

python3.6 Jobs/job_indexer.py "${startDate}" "${endDate}" 

rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with the job. Exiting."
    exit $rc; 
fi

echo "All DONE."