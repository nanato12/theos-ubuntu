# theos on Ubuntu

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
Choose a Template (required):
```
