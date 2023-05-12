#!/bin/zsh

set -e

ARM_SHA_LINK=$(curl -s https://api.github.com/repos/mentimeter/linkup/releases/latest | jq -r '.assets[] | select(.name | test("aarch64-apple-darwin.tar.gz.sha256$")) | .browser_download_url')
ARM_LINK=$(curl -s https://api.github.com/repos/mentimeter/linkup/releases/latest | jq -r '.assets[] | select(.name | test("aarch64-apple-darwin.tar.gz$")) | .browser_download_url')
ARM_SHA=$(curl -L -s $ARM_SHA_LINK)
echo "Latest ARM Linkup:"
echo $ARM_LINK
echo $ARM_SHA

X_SHA_LINK=$(curl -s https://api.github.com/repos/mentimeter/linkup/releases/latest | jq -r '.assets[] | select(.name | test("x86_64-apple-darwin.tar.gz.sha256$")) | .browser_download_url')
X_LINK=$(curl -s https://api.github.com/repos/mentimeter/linkup/releases/latest | jq -r '.assets[] | select(.name | test("x86_64-apple-darwin.tar.gz$")) | .browser_download_url')
X_SHA=$(curl -L -s $X_SHA_LINK)
echo "Latest x86 Linkup:"
echo $X_LINK
echo $X_SHA
