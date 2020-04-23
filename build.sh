#!/bin/sh
set -e

OWNER=mspells
TAG=$(date +%Y%m%d)

for package in flowws-live;do
  core_tag="${OWNER}/${package}:${TAG}"
  latest_tag="${OWNER}/${package}:latest"
  docker build -f ${package}/Dockerfile -t "${core_tag}" .
  docker tag "${core_tag}" "${latest_tag}"
  docker push "${core_tag}"
  docker push "${latest_tag}"
done
