#!/usr/bin/env bash
set -e
export toolName='ubuntu_test'
export toolVersion='0.1.1'
 
if [ "$1" != "" ]; then
echo "Entering Debug mode"
export debug=$1
fi
 
source ../main_setup.sh
 
neurodocker generate ${neurodocker_buildMode} \
--base-image ubuntu:22.04 \
--pkg-manager apt \
--env DEBIAN_FRONTEND=noninteractive \
--run="printf '#!/bin/bash\nls -la' > /usr/bin/ll" \
--run="chmod +x /usr/bin/ll \
--run="mkdir -p ${mountPointList}" \
