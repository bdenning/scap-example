#!/bin/bash

getenforce | grep "Enforcing"

if [ $? -eq 0 ]; then
    exit ${XCCDF_RESULT_PASS};
else
    exit ${XCCDF_RESULT_FAIL};
fi;
