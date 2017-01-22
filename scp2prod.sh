#!/bin/bash

mvn clean package -U -Dmaven.test.skip
#scp -r scripts/open-platform-face root@face.51ishare.com:/data/workspace/
#scp -r scripts/open-platform-face/start.sh root@face.51ishare.com:/data/workspace/open-platform-face/
scp -r target/*.jar root@face.51ishare.com:/data/workspace/open-platform-face/app.jar