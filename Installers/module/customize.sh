#!/sbin/sh

SKIPUNZIP=1

SHARED_VARS="
MODPATH
SKIPUNZIP
SKIPMOUNT
PROPFILE
POSTFSDATA
LATESTARTSERVICE
KSU
KSU_VER
KSU_VER_CODE
KSU_KERNEL_VER_CODE
"

export SHARED_VARS $SHARED_VARS
binary="META-INF/com/google/android/update-binary"
binaryout="$TMPDIR/$binary"
unzip -qo "$ZIPFILE" "$binary" -d "$TMPDIR"
if [ -f "$binaryout" ]; then
   . "$binaryout"
else
    abort "SETUP: Can't get update-binary"
fi
