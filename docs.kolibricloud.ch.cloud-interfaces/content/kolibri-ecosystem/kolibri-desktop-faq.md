---
title: PressureSuite Desktop FAQ
menu:
    main:
        parent: kolibri-ecosystem
        weight: 2
---

# Frequently askes questions

Tutorials:
- [KOLIBRI Desktop - Installation](https://www.youtube.com/watch?v=OOwIafnIoro)
- [KOLIBRI Desktop - Overview](https://www.youtube.com/watch?v=-Ib0wYZtKso)
- [KOLIBRI Desktop - In Depth](https://www.youtube.com/watch?v=yLmyfeqxghs)

## How can I delete measurements from the device?

There is no option to delete measurements on the logger devices. When the memory of the logger is full, the oldest measurements will be overwritten. 
If a measurement has to be deleted, set the measure interval to 1 second and the memory mode to 'linear recording' and start the recording. This way the whole memory will be overwritten after a few hours.

## How can I silently install PressureSuite Desktop

PressureSuite Desktop can be installed silent with the option "/quiet" or "/qn". With the silent option no UI will be shown and all extensions/drivers will be installed silent too if they are not yet installed.

- Example:       .../.../PressureSuiteDesktopInstaller.exe /quiet
- Example uninstall: .../.../PressureSuiteDesktopInstaller.exe /quiet /x //

Further installation options can be found here:

- https://www.advancedinstaller.com/user-guide/msiexec.html
- https://www.advancedinstaller.com/user-guide/exe-setup-file.html

When installing with Silent mode, the user must be aware of the EULA's of the drivers and PressureSuite Desktop.

## Can I change the KELLER logo in the application and on the reports to my own logo?

Yes! Replace the 'Logo.jpg' in the PressureSuite Desktop installation folder (default path: 'C:\Program Files (x86)\KELLER\PressureSuite\Resources\Logo\Logo.jpg') with an image of your own logo and you're good to go. The new file must be named the same as the old one 'Logo.jpg'.

A custom logo can also be supplied before running the installer. Paste the custom logo in the same folder as the installer and name the logo file "PressureSuiteDesktopLogo.jpg". This logo will be replacing the default logo or any other custom logo previously defined.

Make sure the format is similar to the KELLER image (220x116 pixel) so there is no horizontal or vertical stretching. 

## I got a notification 'Automatic COM-port detection error'. What does that mean?

PressureSuite Desktop cannot monitor the com ports for changed devices, because the 'windows remote management' is not available. Add the windows remote management to a delayed automatic start with the powershell command:
- winrm quickconfig

Further information are provided by the microsoft documentation: https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management


## Can I export/convert data to a PDF file?  

Unfortunately, PressureSuite Desktop does not have built-in support for direct PDF export. However, you can still achieve this by using the "Save as..." function and selecting PDF. This option is available in applications like Word, Excel, and most other text or spreadsheet applications.  
For detailed instructions on how to save or convert to PDF using Microsoft Office desktop apps, you can refer to the following link: https://support.microsoft.com/en-us/office/save-or-convert-to-pdf-or-xps-in-office-desktop-apps-d85416c5-7d77-4fd6-a216-6f4bf7c7c110  
