#!/bin/bash

## TODO(bdenning) add support for CentOS/RHEL 6
systemctl status iptables.service | grep enabled

if [ $? -eq 0 ]; then
    exit ${XCCDF_RESULT_PASS};
fi;

exit ${XCCDF_RESULT_FAIL};
