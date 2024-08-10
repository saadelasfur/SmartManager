echo "Uninstalling old apps..."
su pm uninstall --user 0 com.sec.android.app.firewall
su pm uninstall --user 0 com.samsung.android.applock
su pm uninstall --user 0 com.samsung.android.sm.devicesecurity.tcm
su pm uninstall --user 0 com.samsung.android.sm_cn
exit
