#!/bin/bash

if [ ! "$(ls -A /usr/local/etc/alignak)" ]; then
  echo "=> Copying fresh config-files for /etc/alignak"
  cp -R /usr/local/etc/alignak.dist/* /usr/local/etc/alignak/
fi


sed -i 's/"MONGO_HOST": "localhost"/"MONGO_HOST": "db"/' /usr/local/etc/alignak-backend/settings.json
#sed -i 's#cfg_dir=arbiter/templates#cfg_dir=arbiter/objects/templates#' /usr/local/etc/alignak/alignak.cfg