#!/bin/bash

mvn clean package -U -Dmaven.test.skip
#scp -r scripts/open-platform-face root@172.31.1.80:/data/workspace/
scp -r target/*.jar root@172.31.1.80:/data/workspace/open-platform-face/app.jar