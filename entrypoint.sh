#!/usr/bin/env bash

PATH=/srv/packagr:$PATH

# retrieve the latest releasr binary
asset_url=$(curl -s https://api.github.com/repos/PackagrIO/releasr/releases/latest \
	| grep browser_download_url | grep 'packagr-releasr-linux-amd64' | cut -d '"' -f 4)

# download the releasr asset here.
curl -L -o /srv/packagr/packagr-releasr $asset_url

# make releasr executable
chmod +x /srv/packagr/packagr-releasr

if [[ ! -z "${CUSTOM_WORKING_DIRECTORY}" ]]; then
  echo "using custom dir: ${CUSTOM_WORKING_DIRECTORY}"
  cd "${CUSTOM_WORKING_DIRECTORY}"
fi

echo "Starting Releasr $1"
packagr-releasr start --scm github --package_type node
