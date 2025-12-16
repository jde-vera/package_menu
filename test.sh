#!/bin/env bash
# this is a test for new commands i'm unfamiliar with

date "+Start-Date: %Y-%m-%d"

test="is"

cat "/var/log/apt/history.log" | grep "^$test" test.txt
