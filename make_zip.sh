#!/bin/bash
#
# Copyright (C) 2024 saadelasfur

# [
MAKE_ZIP()
{
    local SRC_DIR="$(pwd)"
    local OUT_DIR="$SRC_DIR/out"
    local OUT_ZIP="$1-$(date +%Y%m%d).zip"
    local INSTALLER_ZIP="$SRC_DIR/Installers/Installer.zip"
    export PATH="$SRC_DIR/.github/tools/bin:$PATH"

    mkdir -p "$OUT_DIR/$1"
    cp -a "$SRC_DIR/$1/"* "$OUT_DIR/$1"
    unzip -q "$INSTALLER_ZIP" -d "$OUT_DIR/$1"
    cat "$SRC_DIR/Installers/$1/updater-script" > "$OUT_DIR/$1/META-INF/com/google/android/updater-script"
    cd "$OUT_DIR/$1"
    zip -r -9 "$OUT_ZIP" . -x "version"
    signapk -w "$SRC_DIR/signature/signature_testkey.x509.pem" "$SRC_DIR/signature/signature_testkey.pk8" \
        "$OUT_ZIP" "$OUT_DIR/$OUT_ZIP"
    cd "$SRC_DIR"
}
# ]

[ -d "out" ] && rm -rf out
mkdir out

echo "Making SmartManagerCN zip"
MAKE_ZIP "SmartManagerCN" &> /dev/null

echo "Making StockDeviceCare zip"
MAKE_ZIP "StockDeviceCare" &> /dev/null

echo "Build finished. Exiting..."
sleep 1 && exit 0
