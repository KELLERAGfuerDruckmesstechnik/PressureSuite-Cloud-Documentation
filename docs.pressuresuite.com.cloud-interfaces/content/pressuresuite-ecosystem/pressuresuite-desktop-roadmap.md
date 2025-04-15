---
title: PressureSuite Desktop Roadmap
menu:
    main:
        parent: pressuresuite-ecosystem
        weight: 3
---

# PressureSuite Desktop - Roadmap

PLANNED  

- **Reporting** - new functionality to easily generate reports out of a record
- **Cloud-to-Desktop connection** - Use PressureSuite Desktop to store/backup data from the PressureSuite Cloud and visualize them.
- **Desktop-to-Cloud connection** - Press a button and store records of your device in the cloud. Access this data using https://www.pressuresuite.com

## Known limitations
- It is not possible to use Series30-transmitters directly like in the CCS30 tool

-----

## Release History

## Version 6.3.25092.01 (April, 2025)
### Description:

This update introduces some bugfixes.

### Bug Fixes:

- fixed: Datepicker reverting to selected date when navigating to another month
- fixed: Removed Manometer configuration from DCX22 configuration page
- fixed: Images export used UTC for time axis instead of local time
- Added exception handling to reduce the risk of crashes

## Version 6.3.24338.01 (November, 2024)
### Description:

This update introduces multiple bugfixes.

### Bug Fixes:

- fixed: IoT configuration files not recognized with new file extension (".psuitec")
- fixed: Recording during the switch between daylight saving time to 'regular' time could result shifted times after the switch
- fixed: Crash when closing waterconfiguration dialog

## Version 6.3.24291.01 (Oktober, 2024)
### Description:
This update introduces some quality of life improvements and fixes a few small bugs

### Features and Enhancements:

- Added helper dialog to determine installation length for "depth to water" calculation
- Improved dutch translation

### Bug Fixes:

- Fixed ARC1 live measurement displaying null values with CTD sensor

## Version 6.3.24061.01 (March 01, 2024)

### Features and Enhancements:

- **Visualize**: Added option to move chart toolbar 
- **IoT Device Configuration**: Changed design of warnings to make them less intrusive
- **Export**: Redesigned export page
- **Settings**: Added option to set the default export filename to be compatible with the Dawaco software 

### Bug Fixes:

- **Visualize**: Fixed timespan labels displayed as datetime labels
- **IoT Device Configuration**: Refresh summary when loading preset 
- **Support Tools**: Fixed logfile send functionality 
- Fixed crash when starting a second instance of PressureSuite Desktop


## Version 6.3.24030.01 (January 30, 2024)

### Description:
This latest update integrates support for our IoT devices, namely ARC1 and ADT1. PressureSuite Desktop now seamlessly incorporates the functionality of the IoT software 'GsmConfiguration'/'GSM Setup' to efficiently program our IoT devices, enhancing user experience and device management capabilities.

### Features and Enhancements:

- **IoT Device Support**: Users can now leverage PressureSuite Desktop to configure and manage ARC1 and ADT1 IoT devices effortlessly.
- **Simplified File Import**: Introducing the ability to drag and drop measurement files (.json and .dx5) directly from the file explorer to the measurements list.
- **Logfile Display Tool**: A new tool has been added to facilitate the display of PressureSuite Desktop logfiles, aiding in troubleshooting and system monitoring.

### Bug Fixes:

- **Improved Error Handling**: Users will now receive more informative error messages to guide them through problem resolution, enhancing the overall usability of the software.
- **Stability Enhancements**: Various fixes have been implemented to address crashes, ensuring a more stable and reliable user experience.

## Version 6.2.23251.01 (September 08, 2023)

### Description:
Hotfix: PressureSuite Desktop crashes on startup on certain conditions.

## Version 6.2.23236.05 (August 24, 2023)

### Description:
This update brings significant improvements and various features to enhance user experience and system performance. 
The most notable visible changes are in the Live Data control and the handling of calculations (water calculations and barometric pressure compensation).

### Features and Enhancements:

- Added a new feature to export data in PDF format
- Enabled Live Measuring with Water-Calculation
- Enabled the user to hide the Live Measuring chart control
- Enhanced chart functionality to accommodate unit-less time series (rain catcher)
- Incorporated guidance for managing the deletion of existing device measurements on a device
- Enhanced export file naming logic: Device name displayed if available
- Improved visibility when data is being read out from the recording device; A popup offers then options
- Adding a customer logo is now easier and more persistent
- Introduced support for ARC1 demo device
- Harmonized interface with the KELLER CI color scheme 
- Improved barometric pressure usability by offering a checkbox to automatically use the new channel in the water calculation


### Bug Fixes:

- Optimized memory handling by refining warnings and intervals, enhancing system reliability
- To optimize memory/CPU usage, the chart now displays the latest 2000 measurements
- Addressed German translation typos
- Implemented various bug fixes to enhance system stability across different scenarios
- Fixed crash on export when multiple barometric pressure compensations were executed

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
- Added silent installer for PressureSuite Desktop. Call installer with option "/quiet" to install PressureSuite Desktop and drivers without any user interaction (Eg. "PressureSuiteDesktopInstaller.exe /quiet")
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

In this update we introduce the new DEMO MODE. This mode can be used to try out or present PressureSuite Desktop without connected devices. 

#### Features and Enhancements

- DEMO MODE: Added a mode to use PressureSuite Desktop without connected devices. This mode can be used to to try out PressureSuite Desktop without devices.
- New button to delete multiple records at once.
- Configuration: When starting a record the device time is synchronized by default with the option to deselect the synchronisation.

#### Bug fixes

- Fixed: Exporting Files could generate default filenames that contained invalid symbols

- Fixed: Water configuration: Default values for gravity and density are indicated

- Fixed: Water configuration: When loading the water config for the first time many errors were shown

- Fixed: When exporting a .zip where a folder or zip with the same name existed the export would fail

## Version 6.2.20128.4

#### Description

With this version we introduce the compatibility of [KELLER remote transmission units](https://keller-pressure.com/en/products/wireless-solutions). PressureSuite Desktop can read the measurements from ADT1, ARC1 and GSM-1 & GSM-2 devices.  

#### Features and Enhancements

- **[General]**: New devices supported by PressureSuite Desktop: ADT1, ARC1, GSM-1, GSM-2. Measurements can be read out but it can not be configured. For a configuration of the remote transmission units it is necessary to use the ["GsmSetup"-tool](https://keller-pressure.com/en/downloads?id=nBhPS8HkSDJkB6azedxsAB#results).
- **[General]**: Connected KELLER devices that are not supported by PressureSuite Desktop will now show up as "not supported KELLER device"
- **[Tools]**: Added the import function for Logger 5 and PressureSuite JSON files  

#### Bug fixes

- fixed: export file name could contain invalid characters and the export would fail
- fixed: failed import of Logger 5 files now shows the error message why it failed

## Version 6.2.20100.2

#### Description

With this update we introduce many features that were requested and some quality of life upgrades.

#### Features and Enhancements
- **[Devices]**: Lifted restriction to only have one device connected: Multiple devices can now be connected and will be displayed in the list of ports. It can be switched between devices.
- **[Devices]**: KELLER devices that are not compatible with PressureSuite Desktop will be recognized and an information will be displayed.
- **[Import]**: Import Logger5 (.dx5) and PressureSuite (.json) files was has now a summary after the import and the import is way faster
- **[Export]**: Added more information about the record and device to the excel export
- **[Export]**: Export will now export the Units in the PressureSuite Desktop settings (instead of just bar and celsius)
- **[Export]**: New export format: Hydras, PressureSuite Format
- **[Configuration]**: CTD measuring is now configurable for DCX CTD
- **[Configuration]**: Added new images to overflow configuration
- **[Language] New languages: Italian, French and Spanish
- **[K-114BT]**: The K-114 Bluetooth can now reliably communicate with PressureSuite Desktop
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
- PressureSuite Desktop no longer crashes if the [Logo.jpg] is missing

## Version 6.2.19361.1

#### Description

With this update we introduce the water configuration. It is now possible to configure the water configuration on the devices and calculate the water level.
#### Features and Enhancements
- **[General]**: PressureSuite Desktop now shows an icon during startup
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

- **[General]**: PressureSuite Desktop no longer automatically searches for devices while communicating with another device
- **[General]**: Navigation is no longer limited while communicating
- **[Configuration]**: Added event-triggered recording
- **[Configuration]**: Reworked the existing configuration
- **[Settings]**: PressureSuite Desktop settings are no longer reset after an update
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

- **[General]**: New language: PressureSuite Desktop is now available in **Dutch**.
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
