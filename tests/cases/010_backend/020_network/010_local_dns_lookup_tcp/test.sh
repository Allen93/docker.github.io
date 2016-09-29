#!/bin/sh
# SUMMARY: Test that DNS using the local DNS server works over TCP
# this tests [docker/docker#24344]
# LABELS:
# AUTHOR: Dave Scott <dave.scott@docker.com>

set -e
. "${RT_PROJECT_ROOT}/_lib/lib.sh"
IMAGE_NAME=remote_dns_lookup_tcp

clean_up() {
    docker rmi "${IMAGE_NAME}" || true
}
trap clean_up EXIT

docker build -t "${IMAGE_NAME}" .
docker run --rm -t "${IMAGE_NAME}" /run.sh -t docker.io MX 192.168.65.1 aspmx.l.google.com

exit 0