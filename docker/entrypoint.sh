#!/bin/bash

python3 $(pwd)/create_migrations.py

cron

python3 $(pwd)/polling.py
# >> $(pwd)/runtime/test.log 2>&1
