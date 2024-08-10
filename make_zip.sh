#!/usr/bin/env bash
#
# Copyright (C) 2024 saadelasfur

date=$(date +%Y%m%d)

VERIFY_7Z()
{
    if ! command -v 7z &> /dev/null; then
        echo "7z (7-Zip) is not installed. Installing it now..."
        
        if [ -x "$(command -v pkg)" ]; then
            pkg install -y p7zip
        elif [ -x "$(command -v apt-get)" ]; then
            sudo apt-get install -y p7zip-full
        elif [ -x "$(command -v yum)" ]; then
            sudo yum install -y p7zip
        elif [ -x "$(command -v dnf)" ]; then
            sudo dnf install -y p7zip
        elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S --noconfirm p7zip
        else
            echo "Unsupported package manager. Please install 7z manually."
            exit 1
        fi
    else
        echo "7z (7-Zip) is already installed."
    fi
}

EXTRACT_INSTALLER()
{
    local dir_name=$1
    local zip_name="Installers/Installer.zip"
    
    if [ -f "$zip_name" ]; then
        7z x "$zip_name" -o"$dir_name"
        echo "Extracted $zip_name to $dir_name"
        
        cp "Installers/$dir_name/updater-script" "$dir_name/META-INF/com/google/android/updater-script"
        echo "Copied updater-script to $dir_name/META-INF/com/google/android/"
    else
        echo "$zip_name does not exist."
    fi
}

MAKE_ZIP()
{
    local dir_name=$1
    local zip_name="${dir_name}-$date.zip"
    
    cd "$dir_name" || exit 1
    7z a -tzip -mx=5 "$zip_name" -x!'version' *
    mv "$zip_name" "$output_dir"
    echo "$zip_name has been moved to $output_dir"
    rm -rf META-INF
    cd ..
}

read -p "Provide the directory where you want to move the ZIP files: " output_dir

if [ ! -d "$output_dir" ]; then
    echo "Directory $output_dir does not exist. Creating it now..."
    mkdir -p "$output_dir"
fi

echo "Verifying 7z (7-Zip)..."
VERIFY_7Z

echo "Making SmartManagerCN zip..."
EXTRACT_INSTALLER "SmartManagerCN"
MAKE_ZIP "SmartManagerCN"

echo "Making StockDeviceCare zip..."
EXTRACT_INSTALLER "StockDeviceCare"
MAKE_ZIP "StockDeviceCare"

echo "Build finished, exiting..."
sleep 5
exit 0
