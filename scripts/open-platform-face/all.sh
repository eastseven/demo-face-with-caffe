#!/bin/bash

imgName=$1
imgFile=`pwd`/images/${imgName}
imgUrl=$2
if [ ! -f "$imgFile" ]; then 
  wget -P `pwd`/images $imgUrl;
fi

imgLog=`pwd`/images.log
if [ ! -f "$imgLog" ]; then
  mkdir -p $imgLog;
fi

docker run --rm \
 -v $(pwd):/workspace caffe:cpu bash -c "/opt/caffe/build/examples/cpp_classification/classification.bin /workspace/age_deploy.prototxt /workspace/age_net.caffemodel /workspace/mean.binaryproto /workspace/age_labels.txt /workspace/images/"$imgName > $imgLog/${imgName}-age.log

docker run --rm \
 -v $(pwd):/workspace caffe:cpu bash -c "/opt/caffe/build/examples/cpp_classification/classification.bin /workspace/gender_deploy.prototxt /workspace/gender_net.caffemodel /workspace/mean.binaryproto /workspace/gender_labels.txt /workspace/images/"$imgName > $imgLog/${imgName}-gender.log

echo 'done'
