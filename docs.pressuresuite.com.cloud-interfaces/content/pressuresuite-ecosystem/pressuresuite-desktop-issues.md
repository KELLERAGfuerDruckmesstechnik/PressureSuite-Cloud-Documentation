---
title: PressureSuite Desktop Known Issues
menu:
    main:
        parent: pressuresuite-ecosystem
        weight: 4
toc: false
---
## Known issue with Microsoft Antivirus Defender  
For some unknown reasons and starting from 12. January 2021 [Microsoft's patch day](https://www.thezdi.com/blog/2021/1/12/the-january-2021-security-update-review) some customer experience problems with PressureSuite Desktop when storing data to the local hard disk due to the AntiVirus Defender deleting the data instantly.

### Effects  
 - When using the "Live Measurement" the SW crashes  
 - When "Read"-ing out data from a logger the SW shows a red popup with "Error while Reading from device"  
![Device overview](../../img/ReadDataError.png "Device overview")  

### Possible workaround  
We are currently trying to find a solution for this problem.  
These are the suggested steps for know:
 - Update Windows 10  
 - Manually add exceptions to your 'Microsoft Defender Antivirus' following the steps from [Microsoft](https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-security-center-antivirus#add-exclusions-for-microsoft-defender-antivirus-in-the-windows-security-app)
    1. Open the Windows Security app by clicking the shield icon in the task bar or searching the start menu for Defender.  
    2. Click the Virus & threat protection tile (or the shield icon on the left menu bar).  
    3. Click Virus & threat protection settings.  
    4. Under the Exclusions setting, click 'Add or remove exclusions'.  
    5. Click the plus icon to choose the type and set the options for each exclusion.  
       5.A) Add an exclusion for *File type* with `.json`  
       5.B) Add an exclusion for *Process* with the path the PressureSuiteDesktop.exe is installed. Most likely: `C:\Program Files (x86)\Keller\PressureSuiteDesktop\PressureSuiteDesktop.exe`  
       5.C) Add an exclusion for *Folder* with to your storage folder including your user name. `C:\Users\{yourUserName}\Documents\KELLER\PressureSuiteDesktop\data`  
       5.D) Add an exclusion for *Folder* with to your storage folder including your user name. `C:\Users\{yourUserName}\Documents\KELLER\PressureSuiteDesktop`  
    Example settings for user `sebas` : 
      ![DefenderSettings](../../img/Win10DefenderSettings.png "Defender Settings")  
 - You might have to restart the Windows PC again.
 - Try the PressureSuite Desktop SW again and if it doesn't work, please contact pressuresuite@keller-pressure.com

