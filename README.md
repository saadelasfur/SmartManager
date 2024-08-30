## SmartManagerCN Recovery Flashable ZIP
A simple recovery flashable ZIP to install the Chinese Smart Manager (SmartManagerCN) on your Samsung device with OneUI 6.x

SmartManagerCN is a replacement for Device Care on standard OneUI ROMs (except for China ROMs where SmartManagerCN is already pre-installed or added by the custom ROM maker).

Features not present in Device Care include:

- More advanced app management, applock, and auto-run apps
- Data usage tracking, plan addition, and app data usage tracking
- Advanced call and message blocking, and smart blocking
- Storage management with a cleaner UI

This flashable ZIP replaces Device Care with SmartManagerCN easily and requires little to no setup.

It includes the following apps:

- Smart Manager
- Smart Device Security
- AppLock
- Firewall

## Downloads
[Releases](https://github.com/saadelasfur/SmartManager/releases) and the [Galaxy Apks Telegram channel](https://t.me/galaxyapks) are the only sources for official downloads.

## Installation
Simply download the SmartManagerCN installer from the releases page and flash it with a custom recovery. If you have root access, download this [script](https://github.com/saadelasfur/SmartManager/blob/master/extras/Stock/uninstall_stock.sh) and run it in Termux (bash /sdcard/Download/uninstall_stock.sh). Otherwise, you can download the [Windows script](https://github.com/saadelasfur/SmartManager/blob/master/extras/Stock/uninstall_stock.bat), copy it into the [platform-tools](https://developer.android.com/tools/releases/platform-tools) folder, and run it.

## Return to Device Care
Simply download the StockDeviceCare installer from the releases page and flash it with a custom recovery. If you have root access, download this [script](https://github.com/saadelasfur/SmartManager/blob/master/extras/China/uninstall_china.sh) and run it in Termux (bash /sdcard/Download/uninstall_china.sh). Otherwise, you can download the [Windows script](https://github.com/saadelasfur/SmartManager/blob/master/extras/China/uninstall_china.bat), copy it into the [platform-tools](https://developer.android.com/tools/releases/platform-tools) folder, and run it.

## Screenshots
<p float="left">
  <img src="readme-res/img1.jpg" width="195" />
  <img src="readme-res/img2.jpg" width="195" />
  <img src="readme-res/img3.jpg" width="195" />
</p>

## Credits
- [@salvogiangri](https://github.com/salvogiangri) for his assistance and the base [action](https://github.com/Mesa-Labs-Archive/proprietary_vendor_samsung_a54x/blob/main/.github/workflows/check.yml) script.
- [BlassGO](https://xdaforums.com/m/blassgo.11402469/) for the awesome [Dynamic Installer](https://xdaforums.com/t/zip-dual-installer-dynamic-installer-stable-5-1-android-10-or-earlier.4279541/).
- [@jesec](https://github.com/jesec) and [@corsicanu](https://github.com/corsicanu) for the original GitHub Actions script.
- [@unix3dgforce](https://github.com/unix3dgforce) for his [lpunpack.py](https://github.com/unix3dgforce/lpunpack) script.
