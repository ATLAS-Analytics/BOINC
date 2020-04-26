#!/bin/bash

echo "========== executing =========="
python Jobs/job_indexer.py

rc=$?; if [[ $rc != 0 ]]; then 
    echo "problem with the job. Exiting."
    exit $rc; 
fi

echo "All DONE."