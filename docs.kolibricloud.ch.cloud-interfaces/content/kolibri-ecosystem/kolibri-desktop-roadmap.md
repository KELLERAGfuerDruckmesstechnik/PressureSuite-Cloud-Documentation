---
title: KOLIBRI Desktop Roadmap
menu:
    main:
        parent: kolibri-ecosystem
        weight: 3
---

# KOLIBRI Desktop - Roadmap

PLANNED  

- **Iot Configuration** - Configure KELLER IoT devices (ARC1, ADT1) directly with KOLIBRI Desktop. This replaces the current software 'GSM Setup'/'GSM Configuration'
- **Reporting** - new functionality to easily generate reports out of a record
- **Cloud-to-Desktop connection** - Use KOLIBRI Desktop to store/backup data from the KOLIBRI Cloud and visualize them.
- **Purge obsolete data on the logger device** - Deletion of existing records stored on the device.
- **Desktop-to-Cloud connection** - Press a button and store records of your device in the cloud. Access this data using https://www.kolibricloud.ch

## Known limitations
- It is not possible to use Series30-transmitters directly like in the CCS30 tool

-----

## Release History

## Version 6.2.22101.05

### Description

This update introduces the overflow report. This report summarizes overflow events of an overflow calculation in a PDF file. 
Another highly requested feature was to read multiple measurements at once, which is now possible.

### Features and Enhancements

- Overflow report
- Read multiple records from the device at once

### Bug fixes

- fixed: crash when no access to records directory
- fixed: filter on local measurements not working under certain circumstances
- fixed: name and description of overflow calculation can now be customized
- fixed: EUI of LoRa devices is now displayed correctly
- updated device names to official KELLER names

## Version 6.2.21314.3

### Description

This update introduces the device calibration. 

### Features and Enhancements

- New feature: Device calibration (Adjust / Zeroing)
- Device configuration: Device identification tile is now available for remote transmission unit (ADT1, ARC1, GSM2)
- New language: Japanese (machine translated)
- New language: Russian (machine translated)

### Bug fixes

- Fixed crash with double measurements caused by daylight saving time
- Fixed crash with corrupted user-config files

## Version 6.2.21127.1

#### Description

This update introduces the air pressure compensation and some "quality of life"-improvements.

#### Features and Enhancements

- Air pressure compensation with measurements from different devices
- Added new limited device support for: ADT-NB and ARC1-LoRa

#### Bug fixes

- Export: DOCX export does no longer print chart on a second page by default

## Version 6.2.20322.1

#### Description

This update introduces some requested features and various small bug fixes 

#### Features and Enhancements

- Major language update for Polish
- Added silent installer for KOLIBRI Desktop. Call installer with option "/quiet" to install KOLIBRI Desktop and drivers without any user interaction (Eg. "KolibriDesktopInstaller.exe /quiet")
- Added new Calculation: Pressure to Force
- Memory errors of KELLER Devices are now recognized and further actions suggested

#### Bug fixes

- Updated multiple labels in multiple languages
- Fixed: Communication problems with the timezone of IoT devices (ARC1, ADT1) that run with UTC instead of local time
- Fixed: Displayed CTD range not updating after configuration
- Fixed: Unsupported KELLER devices were not recognized

## Version 6.2.20225.1

#### Description

This update introduces an improved performance for the device search.

#### Features and Enhancements

- Device search performance improved. Devices can be selected before all ports finished the search
- Major language update for mandarin

#### Bug fixes

- Fixed some labels and translations


## Version 6.2.20191.1

#### Description

In this update we introduce the new DEMO MODE. This mode can be used to try out or present KOLIBRI Desktop without connected devices. 

#### Features and Enhancements

- DEMO MODE: Added a mode to use KOLIBRI Desktop without connected devices. This mode can be used to to try out KOLIBRI Desktop without devices.
- New button to delete multiple records at once.
- Configuration: When starting a record the device time is synchronized by default with the option to deselect the synchronisation.

#### Bug fixes

- Fixed: Exporting Files could generate default filenames that contained invalid symbols

- Fixed: Water configuration: Default values for gravity and density are indicated

- Fixed: Water configuration: When loading the water config for the first time many errors were shown

- Fixed: When exporting a .zip where a folder or zip with the same name existed the export would fail

## Version 6.2.20128.4

#### Description

With this version we introduce the compatibility of [KELLER remote transmission units](https://keller-druck.com/en/products/wireless-solutions). KOLIBRI Desktop can read the measurements from ADT1, ARC1 and GSM-1 & GSM-2 devices.  

#### Features and Enhancements

- **[General]**: New devices supported by KOLIBRI Desktop: ADT1, ARC1, GSM-1, GSM-2. Measurements can be read out but it can not be configured. For a configuration of the remote transmission units it is necessary to use the ["GsmSetup"-tool](https://keller-druck.com/en/downloads?id=nBhPS8HkSDJkB6azedxsAB#results).
- **[General]**: Connected KELLER devices that are not supported by KOLIBRI Desktop will now show up as "not supported KELLER device"
- **[Tools]**: Added the import function for Logger 5 and KOLIBRI JSON files  

#### Bug fixes

- fixed: export file name could contain invalid characters and the export would fail
- fixed: failed import of Logger 5 files now shows the error message why it failed

## Version 6.2.20100.2

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

## Version 6.2.19361.1

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

## Version 6.2.19200.1

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

## Version 6.2.19136.2

#### Description

This version introduces the Dutch translation and focuses on bugfixes. We always welcome feedback and suggestions on how to improve the software.

#### Features and Enhancements

- **[General]**: New language: KOLIBRI Desktop is now available in **Dutch**.
- **[Export]**: The export of large records is now considerably faster.

#### Bug fixes

- Sometimes a cable-connected K114-BT could end up with communication errors.
- Sometimes modifications in the visualization would not be recognized by the export.
- In rare occasions when a big record was read from a device only the first few measurements were shown afterwards.

## Version 6.2.19058.1

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

## Version 6.2.18355.1

Version 6.2.18355.1 is the first release with the basic functionalities.
