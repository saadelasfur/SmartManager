echo off
echo Uninstalling old apps...
adb shell pm uninstall --user 0 com.sec.android.app.firewall
adb shell pm uninstall --user 0 com.samsung.android.applock
adb shell pm uninstall --user 0 com.samsung.android.sm.devicesecurity.tcm
adb shell pm uninstall --user 0 com.samsung.android.sm_cn
exit
