#!/bin/bash

#
# Script to remove projects from AOSPA source and sync few 
# AOSP projects to let us build AOSPA for non-Qualcomm devices
# Author: @sarthakroy2002
#
# Usage: bash sync_aosp_repos.sh
#
# Note: This script is meant to be run from the root of the AOSPA source
#

projects=(
  "external/libchrome"
  "external/libcxx"
  "external/obex"
  "system/librustutils"
  "packages/services/Telecomm"
  "packages/services/Telephony"
  "hardware/google/pixel"
)

branch="android-14.0.0_r20"

for path in "${projects[@]}"; do
  rm -rf "$path"

  git clone "https://android.googlesource.com/platform/$path" -b "$branch" "$path"
done
