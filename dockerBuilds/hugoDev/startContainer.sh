#!/bin/bash
service ssh start
service nginx start
tail -f /var/log/alternatives.log
