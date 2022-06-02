---
title: KOLIBRI Desktop FAQ
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

## How can I silenty install KOLIBRI Desktop

KOLIBRI Desktop can be installed silent with the option "/quiet" or "/qn". WIth the silent option no UI will be shown and all extensions/drivers will be installed silent too if they are not yet installed

Example:       .../.../KolibriDesktopInstaller.exe /quiet

Example uninstall: .../.../KolibriDesktopInstaller.exe /quiet /x //

Further installation options can be found here:

https://www.advancedinstaller.com/user-guide/msiexec.html
https://www.advancedinstaller.com/user-guide/exe-setup-file.html

When installing with Silent mode, the user must be aware of the EULA's of the drivers and KOLIBRI Desktop.
