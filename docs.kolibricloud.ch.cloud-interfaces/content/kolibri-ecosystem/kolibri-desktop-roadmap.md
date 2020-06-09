---
title: KOLIBRI Desktop Roadmap
menu:
    main:
        parent: kolibri-ecosystem
        weight: 2
---

# KOLIBRI Desktop - Roadmap
PLANNED with goal Q3/2020
- **Adjust** - Adjust function "zeroing" and "gain factor". Also adjust of CDT sensors.  
- **UX Enhancements** - Various improvements to help with configuration of complex settings.
- **Compensation with multiple records** - Subtraction of pressure values of multiple record files from multiple devices. This is mostly used to compensate the barometric pressure from another device.
- **Chinese**

PLANNED  

- **Cloud-to-Desktop connection** - Use KOLIBRI Desktop to store/backup data from the KOLIBRI Cloud and visualize them.
- **Purge obsolete data on the logger device** - Deletion of existing records stored on the device.
- **CCS30 functionality**
- **Desktop-to-Cloud connection** - Press a button and store records of your device in the cloud. Access this data using http://www.kolibricloud.ch

## Known limitations
- It is not possible to use Series30-transmitters directly like in the CCS30 tool
- Wireless connection over K114 BT does not work reliable

-----

## Release History

### Version 6.2.20128.4
#### Description
With this version we introduce the compatibility of [KELLER remote transmission units](https://keller-druck.com/en/products/wireless-solutions). KOLIBRI Desktop can read the measurements from ADT1, ARC1 and GSM-1 & GSM-2 devices.  

#### Features and Enhancements
- **[General]**: New devices supported by KOLIBRI Desktop: ADT1, ARC1, GSM-1, GSM-2. Measurements can be read out but it can not be configured. For a configuration of the remote transmission units it is necessary to use the ["GsmSetup"-tool](https://keller-druck.com/en/downloads?id=nBhPS8HkSDJkB6azedxsAB#results).
- **[General]**: Connected KELLER devices that are not supported by KOLIBRI Desktop will now show up as "not supported KELLER device"
- **[Tools]**: Added the import function for Logger 5 and KOLIBRI JSON files  

#### Bug fixes
- fixed: export file name could contain invalid characters and the export would fail
- fixed: failed import of Logger 5 files now shows the error message why it failed

-----

### Version 6.2.20100.2

#### Description
With this update we introduce many features that were requested and some quality of life upgrades.

#### Features and Enhancements
- **[Devices]**: Lifted restriction to only have one device connected: Multiple devices can now be connected and will be displayed in the list of ports. It can be switched between devices.
- **[Devices]**: KELLER devices that are not compatible with KOLIBRI Desktop will be recognized and an information will be displayed.
- **[Import]**: Import Logger5 (.dx5) and KOLIBRI (.json) files was has now a summary after the import and the import is way faster
- **[Export]**: Added more information about the record and device to the excel export
- **[Export]**: Export will now export the Units in the KOLIBRI Desktop settings (instead of just bar and celsius)
- **[Export]**: New export format: Hydras, KOLIBRI Format
- **[Configuration]**: CTD measuring is now configurable for DCX CTD
- **[Configuration]**: Added new images to overflow configuration
- **[Language] New languages: Italian, French and Spanish
- **[K-114BT]**: The K-114 Bluetooth can now reliably communicate with KOLIBRI Desktop
- **[Support tools]**: Added functionalities to "read memory" tool: option to read configuration, option to send directly to KELLER after reading and option to add log files when sending to KELLER.

#### Bug fixes
- Convert overview: shows basic information like connected port, serial number, firmware version...
- Sometimes data records were shown with wrong time because of a wrong timezone conversion
- fixed a bug where interval configuration could not be configured because of a nonsense validation
- Exported Charts now contains an axis for calculated water channels
- Added missing unit to event triggering configuration
- The export now suggests a filename
- fixed: export for multiple records would ignore some of the selected records
- added log file path when error message says: further infos in the log file
- KOLIBRI Desktop no longer crashes if the [Logo.jpg] is missing

-----

### Version 6.2.19361.1

#### Description

With this update we introduce the water configuration. It is now possible to configure the water configuration on the devices and calculate the water level.
#### Features and Enhancements
- **[General]**: KOLIBRI Desktop now shows an icon during startup
- **[Configuration]**: Added water configuration
- **[Configuration]**: Rearranged the existing configuration tiles
- **[Import]**: Implemented a experimental feature to import the old Logger 5 files (.dx5)
#### Bug fixes
- fixed various translation errors
- fixed bug where the window was invisible even after restart

-----

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
