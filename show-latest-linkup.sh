#!/bin/zsh

set -e

ASSETS=$(curl -s https://api.github.com/repos/mentimeter/linkup/releases/latest | jq -r '.assets[]')

MAC_ARM_SHA_LINK=$(echo $ASSETS | jq -r 'select(.name | test("aarch64-apple-darwin.tar.gz.sha256$")) | .browser_download_url')
MAC_ARM_LINK=$(echo $ASSETS | jq -r 'select(.name | test("aarch64-apple-darwin.tar.gz$")) | .browser_download_url')
MAC_ARM_SHA=$(curl -L -s $MAC_ARM_SHA_LINK)
printf "Latest Mac ARM Linkup:\n"
printf "%s\n" $MAC_ARM_LINK
printf "%s\n" $MAC_ARM_SHA

printf "\n"

MAC_X86_SHA_LINK=$(echo $ASSETS | jq -r 'select(.name | test("x86_64-apple-darwin.tar.gz.sha256$")) | .browser_download_url')
MAC_X86_LINK=$(echo $ASSETS | jq -r 'select(.name | test("x86_64-apple-darwin.tar.gz$")) | .browser_download_url')
MAC_X86_SHA=$(curl -L -s $MAC_X86_SHA_LINK)
printf "Latest Mac x86 Linkup:\n"
printf "%s\n" $MAC_X86_LINK
printf "%s\n" $MAC_X86_SHA

printf "\n"

LINUX_ARM_SHA_LINK=$(echo $ASSETS | jq -r 'select(.name | test("aarch64-unknown-linux-gnu.tar.gz.sha256$")) | .browser_download_url')
LINUX_ARM_LINK=$(echo $ASSETS | jq -r 'select(.name | test("aarch64-unknown-linux-gnu.tar.gz$")) | .browser_download_url')
LINUX_ARM_SHA=$(curl -L -s $LINUX_ARM_SHA_LINK)
printf "Latest Linux ARM Linkup:\n"
printf "%s\n" $LINUX_ARM_LINK
printf "%s\n" $LINUX_ARM_SHA

printf "\n"

LINUX_X86_SHA_LINK=$(echo $ASSETS | jq -r 'select(.name | test("x86_64-unknown-linux-gnu.tar.gz.sha256$")) | .browser_download_url')
LINUX_X86_LINK=$(echo $ASSETS | jq -r 'select(.name | test("x86_64-unknown-linux-gnu.tar.gz$")) | .browser_download_url')
LINUX_X86_SHA=$(curl -L -s $LINUX_X86_SHA_LINK)
printf "Latest Linux x86 Linkup:\n"
printf "%s\n" $LINUX_X86_LINK
printf "%s\n" $LINUX_X86_SHA
