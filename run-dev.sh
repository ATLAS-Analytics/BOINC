#!/bin/bash

echo "Setting up BOINC dev data collector"
git clone https://github.com/ATLAS-Analytics/BOINC.git

echo "========= running kinit =========="
kinit analyticssvc@CERN.CH -k -t /tmp/keytab/analyticssvc.keytab

echo "========= all set up. ============"

cd BOINC/import/
ls
echo "========== executing =========="
./run-dev.sh

echo "All DONE."