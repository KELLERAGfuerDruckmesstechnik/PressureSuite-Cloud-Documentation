---
title: KOLIBRI Desktop Roadmap
menu:
    main:
        parent: kolibri-ecosystem
        weight: 2
---

# KOLIBRI Desktop - Roadmap

- **Event-Trigger configurations** - Configure events and store/read configuration to/from device
- **Water Level configurations** - Configure Water levels and store it into the device. Introducing a new profile system only available for users that care about water calculations.
- **Cloud-to-Desktop connection** - Use KOLIBRI Desktop to store/backup data from the KOLIBRI Cloud and visualize them.
- **Purge obsolete data on the logger device** - Deletion of existing records stored on the device.
- **More languages** - Do you wish other languages? We can do that?
- **CCS30 functionality** - Such as "Zero function"
- **Desktop-to-Cloud connection** - Press a button and store records of your device in the cloud. Access this data using www.kolibricloud.ch

## Known limitations

- It is not possible to use Series30-transmitters directly like in the CCS30 tool
- Wireless connection over K114 BT does not work reliable



# recent updates



## Version 6.2.19057.1

### Description

In this version we focused on implementing *your* feedback requests and suggested design. We always welcome feedback and suggestions on how to improve the software.

### Features and Enhancements

- **[General]**: Auto-Update-Notification at start up to show when a new version is available  
- **[General]**: Simplified the default name of data records -> less confusing numbers  
- **[General]**: Improved navigation. Tabs [Settings] and [Help] can be clicked again to go back to previous page
- **[Read Data]**: Added indicator to see which records are already stored on the PC
- **[Read Data]**: Added link to directly visualize stored records
- **[Configuration]**: Calculates time until device memory is full when recording with selected configuration
- **[Live Data]**: Removed configuration dialog and added interval configuration to the front tile

### Bug fixes

- Device overview is updated after writing a configuration
- Translated all texts to German
- Conductivity channels of DCX CTD are now available in live data
- 

## Version 6.2.0

Version 6.2.0 is the first release
