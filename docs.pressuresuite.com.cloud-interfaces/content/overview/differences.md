---
title: Differences Datamanager vs. Cloud
menu:
    main:
        parent: overview
        weight: 2
toc: false
description: What are the differences between GSM2Datamanager and PressureSuite Cloud
---

# What are the differences between GSM2Datamanager and PressureSuite Cloud

Basically prefer to use the PressureSuite Cloud as it is easier, modern and well supported.

The reasons to use the Datamanager are:

- You are bound to rules that do not allow to use any cloud services (such as Dropbox, Windows 10)
- You are bound to rules that do not allow to have the data stored in another country
- Accessability of 98% is not enough
- You change the location of the device in a regular basis

| GSM2Datamanager                                                 | PressureSuite Cloud                                                                                              |
| --------------------------------------------------------------- |----------------------------------------------------------------------------------------------------------- |
| Runs locally on a Windows system                                | Runs "in the cloud"                                                                                        |
| You have to do the backup                                       | Data is backed up automatically every 10min                                                                |
| Gets data from MAIL & FTP                                       | Gets data from FTP only                                                                                    |
| Documentation: [PDF download](http://www.keller-druck2.ch/swupdate/InstallerGSM2Datamanager/manual/MAN_Datamanager_EN_en.pdf)| Documentation: This page                      |
| Battleproofen since >10 years                                   | Used by customers since 2017                                                                               |
| Not maintained                                                  | Bi-Monthly updates                                                                                         |
| Can send Configurations                                         | PLANNED 2019 to be able to send Configurations                                                             |
| Various Water Calculations                                      | Water & Tank-Calculation                                                                                   |
| Calculations are bound to installation                          | Calculation can be manipulated on-the-fly. Flexible but problematic when the installation location changes |
| Many Features                                                   | Simple GUI                                                                                                 |
| Exports to CSV, Hydras, AquaInfo, Delft-Fews, XML, PGI          | Exports to EXCEL, CSV, Hydras, AquaInfo, PressureSuite                                                           |
| Stores everything in a MySQL or SQLite DB which can be exported | Has a documented API                                                                                       |
| Tool available to periodically store data locally               | Open Source tools available to download and/or integrate data locally or other cloud services              |

---

![Datamanager Architectural overview](/cloud-interfaces/img/DataManagerOverview.png "Architectural overview Datamanager")
*Interfaces GSMDatamanger*

![PressureSuite Cloud Architectural overview](/cloud-interfaces/img/KellerCloud_Architecture.png  "Architectural overview PressureSuite Cloud")
*Interfaces PressureSuite Cloud*
