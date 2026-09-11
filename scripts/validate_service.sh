#!/bin/bash

sleep 5

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)

if [ "$STATUS" -ne 200 ]; then
    echo "Validation failed, got HTTP $STATUS"
    exit 1
fi

echo "Validation succeeded"
exit 0
