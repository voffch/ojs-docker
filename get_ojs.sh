#!/bin/bash

OJS_VERSION="3.3.0-10"
HTML_DIR="./volumes/html"

set -xe
if [ -d "${HTML_DIR}" ]; then
  echo "${HTML_DIR} exists, backup your files manually, remove it, then run this."
else
  mkdir ${HTML_DIR}
  cd ${HTML_DIR}
  wget https://pkp.sfu.ca/ojs/download/ojs-${OJS_VERSION}.tar.gz
  tar -xvf ojs-${OJS_VERSION}.tar.gz --strip-components=1 -C .
  rm -f ojs-${OJS_VERSION}.tar.gz
fi