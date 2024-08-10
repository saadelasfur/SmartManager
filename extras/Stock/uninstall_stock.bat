echo off
echo Uninstalling old apps...
adb shell pm uninstall --user 0 com.samsung.android.lool
adb shell pm uninstall --user 0 com.samsung.android.sm.devicesecurity
exit
