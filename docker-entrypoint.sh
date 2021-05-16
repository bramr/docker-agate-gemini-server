#!/bin/bash

set -e

if [ "$1" = "agate" ]; then
  echo "Running Agate"

  IFS=',' read -r -a hostnames <<< "$AGATE_HOSTNAME"

  for hostname in "${hostnames[@]}"; do
    hostname_param="${hostname_param} --hostname $hostname ";
  done

  [[ ! -z "${AGATE_LANG}" ]] && lang_param=" --lang ${AGATE_LANG} "

  exec agate 0.0.0.0:1965 $hostname_param --content "${AGATE_CONTENT}" --certs "${AGATE_CERTS}" $lang_param
fi

exec "$@"
