---
title: Differences Datamanager vs. Cloud
menu:
    main:
        parent: overview
        weight: 3
toc: false
description: What are the differences between GSM2Datamanager and KOLIBRI Cloud
---

# What are the differences between GSM2Datamanager and KOLIBRI Cloud

Basically prefer to use the KOLIBRI Cloud as it is easier, modern and well supported.
The reasons to use the Datamanager are:
- You are bound to rules that do not allow to use cloud services (such as Dropbox, Windows 10)
- You are bound to rules that do not allow to have the data stored in another country
- Accessability of 98% is not enough
- You need to use a E-Mail-account to temporary store the data and not an FTP account
- You change the location of the device in a regular basis



GSM2Datamanager    | KOLIBRI Cloud 
--------|------
| Runs locally on a Windows system    | Runs "in the cloud"  | 
| You have to do the backup | Data is backuped automatically every 10min  | 
| Gets data from MAIL & FTP | Gets data from FTP only |
| Documentation: [PDF download](http://www.keller-druck2.ch/swupdate/InstallerGSM2Datamanager/manual/MAN_Datamanager_EN_en.pdf)| Documentation: This page | 
| Battleproofen since >10 years      | Used by customers since 2017 | 
| Not maintained  | Bi-Monthly updates | 
| Can send Configurations| PLANNED 2019 to be able to send Configurations|
| Various Water Calculations | Water & Tank-Calculation | 
| Calculations are bound to installation | Calculation can be manipulated on-the-fly. Flexible but problematic when the installation location changes | 
| Many Features | Simple GUI | 
| Exports to CSV, Hydras, AquaInfo, Delft-Fews, XML, PGI | Exports to EXCEL, CSV, Hydras, AquaInfo, KOLIBRI | 
| Stores everything in a MySQL or SQLite DB which can be exported | Has a documented API|
| Tool available to periodically store data locally | Open Source tools available to download and/or integrate data locally or other cloud services| 
