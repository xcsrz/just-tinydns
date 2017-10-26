#!/bin/sh

cd /srv/dns/root
make
cd /srv/dns
./run
