#!/bin/sh

# DNS SERVER をスペース区切りで入れとく。適宜置き換え。
DNS_SERVER="8.8.8.8"
sudo ~/scripts/write_resolv_conf.sh $DNS_SERVER
