#!/bin/bash
cp -rv ./mtcnn /tmp
docker run -d -t --rm -p 8503:8501 -v /tmp/mtcnn/pnet:/models/pnet -e MODEL_NAME=pnet tensorflow/serving >pnet_server.log 3>&1 &
docker run -d -t --rm -p 8504:8501 -v /tmp/mtcnn/rnet:/models/rnet -e MODEL_NAME=rnet tensorflow/serving >rnet_server.log 3>&1 &
docker run -d -t --rm -p 8505:8501 -v /tmp/mtcnn/onet:/models/onet -e MODEL_NAME=onet tensorflow/serving >onet_server.log 3>&1 &
