# ofox_device_realme_RMX1931
realme x2 Pro OrangeFox device tree.

## Features

Works:

- ADB
- Decryption of /data
- Screen brightness settings
- Correct screenshot color
- MTP
- Flashing (opengapps, roms, images and so on)
- Backup/Restore
- Vibration support
- USB OTG

TO-DO:

- You tell me

## Compile

First initialize OrangeFox Recovery repos:

```
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_9.0
repo sync -j$(nproc --all)
```

Then clone device tree:

```
git clone https://github.com/Jerry1908/ofox_device_realme_RMX1931 -b fox_9.0 device/realme/RMX1931
```

Finally execute these to build OrangeFox Recovery:

``` 
. build/envsetup.sh && export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_RMX1931-eng && mka recoveryimage

```

Now flash image via fastboot or zip package via custom recovery.

## Other Sources

Using precompiled stock kernel.

## Thanks

