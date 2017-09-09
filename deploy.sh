#!/bin/bash
cd ~ && git clone https://github.com/Artemmkin/reddit.git reddit
cd reddit && bundle install
puma -d

# after start server status could be check:
# ps aux | grep puma