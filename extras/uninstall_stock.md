# Windows method

## Open command prompt in the [platform-tools](https://developer.android.com/tools/releases/platform-tools) folder and type the commands below:

- adb devices
- adb shell pm uninstall --user 0 com.samsung.android.lool
- adb shell pm uninstall --user 0 com.samsung.android.sm.devicesecurity
- exit


# Root method

## Grant [Termux](https://github.com/termux/termux-app/releases) root access and open it, then type the commands below:

- su
- pm uninstall --user 0 com.samsung.android.lool
- pm uninstall --user 0 com.samsung.android.sm.devicesecurity
- exit
