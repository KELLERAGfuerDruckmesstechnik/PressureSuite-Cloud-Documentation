---
title: Roadmap
menu:
    main:
        parent: overview
        weight: 5
toc: true
description: Roadmap of coming features
---
# Roadmap
The following roadmap is an idea. Therefore, the priority might change and ee might implement a feature earlier or later depending on customer projects and other circumstances.  

![.](../../img/roadmap/void.jpg)  


## PRIO 1 - Estimated: End of 2020

### DeviceConfiguration for LoRa devices
Now that the sending 'Device Configuration' for GSM/ARC to devices over FTP/Mail-server is working. We are going to implement the new protocol for KELLER's LoRa devices. The goal is to communicate to and from the device over multiple LoRaWAN transmission using the small payload in an efficient way.  
![DeviceConfiguration for LoRa devices](../../img/roadmap/DeviceConfigurationsLoRa.png)  

### Explainer videos
Youtube-videos that show the functionalities and get a short overview. 

### Process descriptions
It is needed to have an easy overview of how to initialize a project with as a sales person, as a customer as KOLIBRI Cloud support person...
A check list and a graphical overview is wished.  

### Customer Administrator features
- Add registered user to own group
- Show the user name of the customer administrator

----
## PRIO 2

### Device Log  
Changing configurations, settings and calculations should be stored to give a certain traceability for understanding the system and allow to post-configure multiple installation per device. The 'Device Log' discloses the changes and who did the changes.  
![Device Log](../../img/roadmap/DeviceLog.png)  

### Handle multiple Configurations/Water Calculations per device
One of the advantages of the DataManger-SW is that it can handle various configuration/calculations per device. The KOLIBRI Cloud right shows calculated values on-the-fly but ignores the fact that measurements can have different calculations in the past (eg. due to changing installation). It is wished to be able to add comments to  
The goal is now to handle and visualize the stored device configurations, in the chart and the export!  ![Handle multiple Configurations/Water Calculations per device](../../img/roadmap/MultipleWaterLevelsOnOneChart.png)  


----
## PRIO 3

### Alarming
It is wished to automatically trigger alarms when certain device or system specific cases occur:  
* Device Alarm  
  * Low Battery - Warn when battery has to be replaced  
  * Too high humidity  
  * Freeze (water must be ice - pressure measurement unusable)  
  * Level probe is not in water anymore  
* System Alarm  
  * Gateway does not respond  
  * FTP/Mail server do not respond  

![Alarm Overview](../../img/roadmap/AlarmOverview.png)   
  
![Alarming](../../img/roadmap/SystemDeviceAlarms.png)  


### Devices Map
As now a user can change and store the coordinates of a device from the WebApp it makes sense to visualize the devices in a map. It might be possible to change the location in the map to update the coordinates.  Try https://www.kolibricloud.ch/device-map  
![Devices Map](../../img/roadmap/DevicesMap.png)  

----
## PRIO 4
### Easier Registration with Welcome/Guidance Mail for new Users
The registration process and everything following might be overwhelming to some users. Better guidance and check lists should help to make it clearer what to do.  

### Localized Page Login
Depending on where the user logs in the welcome page is in German or English or something in between. It is possible to localize this page to various languages.
![Localized Page Login](../../img/roadmap/LoginPageLocalized.png)  

### Administer users, their rights and sub groups
A rather complicated feature but wished by many users is the possibility to generate sub groups and the possibility to assign users to these sub groups in order to assign them and limit their access to certain devices.  
![Administer users, their rights and sub groups](../../img/roadmap/AdminUsers.png)  

### Offset channels as reference lines
The possibility to add multiple reference lines to show various installation depending components such as the "maximal possible water height".  
![Offset channels as reference lines](../../img/roadmap/AddReferenceLines.png)  

----
## PRIO 5
### Overflow Calculations
Like the KOLIBRI Desktop-SW the KOLIBRI Cloud has to support overflow calculations, too.
![Overflow Calculations 1](../../img/roadmap/Poleni.png)  ![Overflow Calculations 2](../../img/roadmap/Thomson.png)  ![Overflow Calculations 3](../../img/roadmap/Venturi.png)  


### *Find*, *mark* and *delete* unreliable or outlier data
Statistical methods and customized threshold should make it possible to find irregularities.  
Found unreliable data should be able to be marked and and even deleted.


### Export of multiple channels into ONE Excel/CSV file
Export of multiple channels into ONE Excel/CSV file.


----
# YOUR idea
Tell us your idea! What do you need?
<kolibri@keller-druck.com>