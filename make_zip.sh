#!/bin/bash
#
# Copyright (C) 2024 saadelasfur

SUDO=false
[[ "$1" == "--sudo" ]] && SUDO=true

VERIFY_7Z()
{
    if ! command -v 7z &> /dev/null; then
        echo ""
        echo "7z (7-Zip) is not installed. Installing it now..."

        if $SUDO; then
            sudo apt update && sudo apt install -y p7zip-full
        else
            apt update && apt install -y p7zip
        fi
    else
        echo ""
        echo "7z (7-Zip) is already installed."
        echo "Skipping 7-Zip installation."
    fi
}

MAKE_ZIP()
{
    local SOURCE_DIR=$1
    local SRC=$(pwd)
    local OUT_DIR=$SRC/out
    local OUTPUT_ZIP="$SOURCE_DIR-$(date +%Y%m%d).zip"
    local INSTALLER_ZIP="$SRC/Installers/Installer.zip"

    mkdir -p "$OUT_DIR/$SOURCE_DIR"
    cp -a --preserve=all "$SRC/$SOURCE_DIR/." "$OUT_DIR/$SOURCE_DIR/"
    7z x "$INSTALLER_ZIP" -o"$OUT_DIR/$SOURCE_DIR/"
    cat "$SRC/Installers/$SOURCE_DIR/updater-script" > "$OUT_DIR/$SOURCE_DIR/META-INF/com/google/android/updater-script"
    cd "$OUT_DIR/$SOURCE_DIR"
    find . -exec touch -a -c -m -t 200812311700.00 {} +
    7z a -tzip -mx=5 "$OUTPUT_ZIP" -x!"version" .
    mv -f "$OUTPUT_ZIP" "$OUT_DIR/$OUTPUT_ZIP"
    echo "$OUTPUT_ZIP has been moved to out dir"
    cd $SRC
}

[[ -d "out" ]] && rm -rf out
mkdir out

echo ""
echo "Verifying 7z (7-Zip)..."
VERIFY_7Z

echo ""
echo "Making SmartManagerCN zip..."
MAKE_ZIP "SmartManagerCN"

echo ""
echo "Making StockDeviceCare zip..."
MAKE_ZIP "StockDeviceCare"

echo ""
echo "Build finished, exiting..."
sleep 1 && exit 0
