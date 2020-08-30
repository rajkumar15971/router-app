#!/bin/bash
sed "s/tagVersion/$1/g" pods.yml > react-app-pod.yml
