#!/bin/bash

# Debug
set -x

# Create tmp dir
mkdir -p ./.tmp

OC_DIR=../EFI/OC
TMP_DST=./.tmp/WhateverGreen.zip
EXTRACT_DST=./.tmp/WhateverGreen

DL_URL=$(curl -s "https://api.github.com/repos/acidanthera/WhateverGreen/releases/latest" |
  grep "browser_download_url.*-RELEASE.zip" | cut -d : -f 2,3 |
  tr -d \" | tr -d " ")

curl -sL $DL_URL -o $TMP_DST
unzip -qo $TMP_DST -d $EXTRACT_DST

cp -rp $EXTRACT_DST/WhateverGreen.kext $OC_DIR/Kexts/
