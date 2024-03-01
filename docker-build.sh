#!/bin/bash
# make temporary copy of source code
cp -r ./qalarsmm-api ./docker/qalarsmm/
cp -r ./qalarsmm-web-php ./docker/qalarsmm-web/
cd docker

# pull cached images
#docker pull qalarsmm:5051/sintelli/socioboard:latest
#docker pull qalarsmm:5051/sintelli/socioboard-web:latest

# build without caching
docker build -t sintelli/socioboard ./qalarsmm
docker build -t sintelli/socioboard-web ./qalarsmm-web

# build with caching
#docker build --cache-from qalarsmm:5051/sintelli/socioboard:latest -t sintelli/socioboard ./qalarsmm
#docker build --cache-from qalarsmm:5051/sintelli/socioboard-web:latest -t sintelli/socioboard-web ./qalarsmm-web
#docker tag sintelli/socioboard:latest qalarsmm:5051/sintelli/socioboard:latest
#docker tag sintelli/socioboard-web:latest qalarsmm:5051/sintelli/socioboard-web:latest
#docker push qalarsmm:5051/sintelli/socioboard:latest
#docker push qalarsmm:5051/sintelli/socioboard-web:latest

# remove temporary copy of source code
rm -rf ./qalarsmm/qalarsmm-api ./qalarsmm-web/qalarsmm-web-php