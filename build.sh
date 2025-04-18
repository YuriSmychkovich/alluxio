#!/usr/bin/env bash

set -euo pipefail

mvn -T 2C clean install -Prelease -DskipTests -Dmaven.javadoc.skip=true -Dfindbugs.skip=true -Dcheckstyle.skip=true -Dlicense.skip=true -pl '!webui'

mkdir -p integration/docker/build
cp assembly/server/target/alluxio-assembly-server-2.9.5-jar-with-dependencies.jar integration/docker/build/alluxio-server-2.9.5.jar
cp lib/alluxio-underfs-s3a-2.9.5.jar integration/docker/build/

cd integration/docker
docker build -t localhost:5005/alluxio .
