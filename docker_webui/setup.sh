#!/bin/bash

sed -i "s|; alignak_backend = http://127.0.0.1:5000|alignak_backend = http://core:5000|" /usr/local/etc/alignak-webui/settings.cfg
