#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purposes

# Load libraries
. /opt/bitnami/scripts/liblog.sh
. /opt/bitnami/scripts/libos.sh

# Load harbor-adapter-trivy environment
. /opt/bitnami/scripts/harbor-adapter-trivy-env.sh

CMD="$(command -v scanner-trivy)"

info "** Starting harbor-adapter-trivy **"
if am_i_root; then
    exec gosu "$SCANNER_TRIVY_DAEMON_USER" "$CMD" "$@"
else
    exec "$CMD" "$@"
fi
