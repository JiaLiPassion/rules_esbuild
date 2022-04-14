#!/usr/bin/env bash
# Produce a dictionary for the current esbuild release,
# suitable for appending to esbuild/private/versions.bzl

set -o errexit

echo "    $(curl --silent "https://registry.npmjs.org/esbuild/latest" | jq ".version"): {"
echo "        \"npm\": $(curl --silent "https://registry.npmjs.org/esbuild/latest" | jq ".dist.integrity"),"
for pkg in darwin-{,arm}64 linux-{,arm}64 windows-64; do
    echo "        \"$pkg\": $(curl --silent "https://registry.npmjs.org/esbuild-${pkg}/latest" | jq ".dist.integrity"),"
done
echo "    },"