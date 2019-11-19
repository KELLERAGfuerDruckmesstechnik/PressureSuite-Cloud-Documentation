---
title: KOLIBRI Desktop Roadmap
menu:
    main:
        parent: kolibri-ecosystem
        weight: 2
---

# KOLIBRI Desktop - Roadmap

- **Event-Trigger configurations** - Configure events and store/read configuration to/from device
- **Support for non-metric units** - Exported files use configured units
- **Water Level configurations** - Configure Water levels and store it into the device. Introducing a new profile system only available for users that care about water calculations.
- **Cloud-to-Desktop connection** - Use KOLIBRI Desktop to store/backup data from the KOLIBRI Cloud and visualize them.
- **Purge obsolete data on the logger device** - Deletion of existing records stored on the device.
- **More languages** - Do you wish other languages? We can do that?
- **CCS30 functionality** - Such as "Zero function"
- **Desktop-to-Cloud connection** - Press a button and store records of your device in the cloud. Access this data using http://www.kolibricloud.ch

## Known limitations

- It is not possible to use Series30-transmitters directly like in the CCS30 tool
- Wireless connection over K114 BT does not work reliable

-----

## Release History

### Version 6.2.19200.1

#### Description

In this update we introduce the event-triggered recording. We reworked the entire device configuration section and added various configuration settings. We also got a lot of feedback and based on that we fixed bugs and added usability features.

#### Features and Enhancements

- **[General]**: KOLIBRI Desktop no longer automatically searches for devices while communicating with another device
- **[General]**: Navigation is no longer limited while communicating
- **[Configuration]**: Added event-triggered recording
- **[Configuration]**: Reworked the existing configuration
- **[Settings]**: KOLIBRI Desktop settings are no longer reset after an update
- **[Live data]**: The Windows sleep mode is now disabled while recording live data
- **[Device overview]**: Device overview now refreshes after the device is configured 

#### Bug fixes

- If a converter (e.g. K-114) without a manometer is connected there will no longer be error messages
- Live data now uses the selected units instead of the default ones
- Using a customized unit now uses regional format

-----

### Version 6.2.19136.2

#### Description

This version introduces the Dutch translation and focuses on bugfixes. We always welcome feedback and suggestions on how to improve the software.

#### Features and Enhancements

- **[General]**: New language: KOLIBRI Desktop is now available in **Dutch**.
- **[Export]**: The export of large records is now considerably faster.

#### Bug fixes

- Sometimes a cable-connected K114-BT could end up with communication errors.
- Sometimes modifications in the visualization would not be recognized by the export.
- In rare occasions when a big record was read from a device only the first few measurements were shown afterwards.

-----

### Version 6.2.19058.1

#### Description

In this version we focused on implementing *your* feedback requests and suggested design. We always welcome feedback and suggestions on how to improve the software.

#### Features and Enhancements

- **[General]**: Auto-Update-Notification at start up to show when a new version is available  
- **[General]**: Simplified the default name of data records -> less confusing numbers  
- **[General]**: Improved navigation. Tabs [Settings] and [Help] can be clicked again to go back to previous page
- **[Read Data]**: Added indicator to see which records are already stored on the PC
- **[Read Data]**: Added link to directly visualize stored records
- **[Configuration]**: Calculates time until device memory is full when recording with selected configuration
- **[Live Data]**: Removed configuration dialog and added interval configuration to the front tile

#### Bug fixes

- Device overview is updated after writing a configuration
- Translated all texts to German
- Conductivity channels of DCX CTD are now available in live data

-----
### Version 6.2.18355.1

Version 6.2.18355.1 is the first release with the basic functionalities.
