ui_print " "
ui_print "------------------------------------------------"
ui_print " -- Smart Manager for Samsung Galaxy devices -- "
ui_print "------------------------------------------------"
ui_print " ---------- by saadelasfur @telegram ---------- "
ui_print "------------------------------------------------"
ui_print " "

if [ -d "/data/adb/modules/device_care" ]; then
    ui_print "-- Device Care module will be removed on next reboot!"
    ui_print " "
    touch /data/adb/modules/device_care/remove
fi

ui_print " -- Extracting files..."

package_extract_dir "packages" "$MODPATH/system"
copy "/system/etc/floating_feature.xml" "$MODPATH/system/etc/floating_feature.xml"

# Firewall doesn't work in module
delete "$MODPATH/system/etc/permissions/privapp-permissions-com.sec.android.app.firewall.xml"
delete_recursive "$MODPATH/system/priv-app/Firewall"

# Set values in floating_feature
ui_print " -- Applying floating_feature modifications..."

replace "    <SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>com.samsung.android.lool</SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>" \
        "    <SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>com.samsung.android.sm_cn</SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>" \
        "$MODPATH/system/etc/floating_feature.xml"

replace "    <SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>com.samsung.android.sm.devicesecurity</SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>" \
        "    <SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>com.samsung.android.sm.devicesecurity.tcm</SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>" \
        "$MODPATH/system/etc/floating_feature.xml"

replace "</SecFloatingFeatureSet>" \
        "    <SEC_FLOATING_FEATURE_COMMON_SUPPORT_NAL_PRELOADAPP_REGULATION>TRUE</SEC_FLOATING_FEATURE_COMMON_SUPPORT_NAL_PRELOADAPP_REGULATION>" \
        "$MODPATH/system/etc/floating_feature.xml"

add_lines_string "</SecFloatingFeatureSet>" "$MODPATH/system/etc/floating_feature.xml"

ui_print " -- Debloating old files..."

OLD_FILES="
system/etc/permissions/privapp-permissions-com.samsung.android.lool.xml
system/etc/permissions/privapp-permissions-com.samsung.android.sm.devicesecurity_v6.xml
system/etc/permissions/signature-permissions-com.samsung.android.lool.xml
system/app/SmartManager_v6_DeviceSecurity/SmartManager_v6_DeviceSecurity.apk
system/priv-app/SmartManager_v5/SmartManager_v5.apk
system/priv-app/SmartManager_v6_DeviceSecurity/SmartManager_v6_DeviceSecurity.apk
"

for file in $OLD_FILES; do
    create_file "$MODPATH/$file"
done

set_perm_recursive 0 0 0755 0644 "$MODPATH"

set_context /system "$MODPATH/system"

ui_print " "
ui_print "-------------------------------------------------"
ui_print " -- Installation complete, reboot your device!   "
ui_print "-------------------------------------------------"
ui_print " "
ui_print " -- Enjoy!!..."
ui_print " "
