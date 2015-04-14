#!/usr/bin/env bash

# Send the content of the tests.log file to the port 5000
# In this case, Logstash only output to the stdout
nc localhost 5010 < ./logstash-conf/tests.log
