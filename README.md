# theos on Ubuntu

Currently, theos on Linux does not support **arm64e**.

## Theos settings
You can write theos settings to `./theos/.nicrc`.
```
username="nanato12"
package_prefix="jp.nanato12"
```

## [Docker] compose & exec
```bash
$ docker-compose up -d
$ docker exec -it theos /bin/bash
```

## Initialize
sdks and toolchains are stored under `./tmp`.  
Only run for the first time because `./tmp` is mounted.

```
root@theos:/tweaks# ./init.sh
```

## Start to develop
```
root@theos:/tweaks# $THEOS/bin/nic.pl
NIC 2.0 - New Instance Creator
------------------------------
  [1.] iphone/activator_event
  [2.] iphone/activator_listener
  [3.] iphone/application_modern
  [4.] iphone/application_swift
  [5.] iphone/cydget
  [6.] iphone/flipswitch_switch
  [7.] iphone/framework
  [8.] iphone/library
  [9.] iphone/notification_center_widget
  [10.] iphone/notification_center_widget-7up
  [11.] iphone/preference_bundle_modern
  [12.] iphone/theme
  [13.] iphone/tool
  [14.] iphone/tool_swift
  [15.] iphone/tweak
  [16.] iphone/tweak_with_simple_preferences
  [17.] iphone/xpc_service
Choose a Template (required): 15
Project Name (required): Test Package
Package Name [jp.nanato12.testpackage]:
[iphone/tweak] MobileSubstrate Bundle filter [com.apple.springboard]:
[iphone/tweak] List of applications to terminate upon installation (space-separated, '-' for none) [SpringBoard]:
Instantiating iphone/tweak in testpackage/...
Done.
```

## test tweak
```
root@theos:/tweaks# cd testpackage/
root@theos:/tweaks/testpackage# make package
```
```bash
> Making all for tweak TestPackage…
==> Preprocessing Tweak.x…
==> Preprocessing Tweak.x…
==> Compiling Tweak.x (armv7)…
==> Compiling Tweak.x (arm64)…
==> Linking tweak TestPackage (armv7)…
rm /tweaks/testpackage/.theos/obj/debug/armv7/Tweak.x.m
==> Linking tweak TestPackage (arm64)…
rm /tweaks/testpackage/.theos/obj/debug/arm64/Tweak.x.m
==> Merging tweak TestPackage…
==> Signing TestPackage…
> Making stage for tweak TestPackage…
dm.pl: building package `jp.nanato12.testpackage:iphoneos-arm' in `./packages/jp.nanato12.testpackage_0.0.1-1+debug_iphoneos-arm.deb'
```
