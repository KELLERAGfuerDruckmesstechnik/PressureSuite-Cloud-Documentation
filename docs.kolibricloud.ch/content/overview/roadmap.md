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

## PRIO 1
### DeviceConfiguration for LoRa devices
Now that the sending 'Device Configuration' for GSM/ARC to devices over FTP/Mail-server is working. We are going to implement the new protocol for KELLER's LoRa devices. The goal is to communicate to and from the device over multiple LoRaWAN transmission using the small payload in an efficient way.  
![DeviceConfiguration for LoRa devices](../../img/roadmap/DeviceConfigurationsLoRa.png)  

### Device Log
Changing configurations, settings and calculations should be stored to give a certain traceability for understanding the system and allow to post-configure multiple installation per device. The 'Device Log' discloses the changes and who did the changes.  
![Device Log](../../img/roadmap/DeviceLog.png)  

### Add FTP account for self-assignment of devices
This feature let an customer admin add FTP server credentials. Each new device communicating from this FTP will automatically added to the customers group.  
![Add FTP account for auto-assignment of devices](../../img/roadmap/AddFtpAccountForAutoAssignmentOfDevices_red.png)  

### Auto-Add used channels
Especially with the new LoRa ADT devices the used channels have to be changed according to the users configuration. At the same time the user expect to see measuring data from channels that are not sending data anymore but have stored data.  
![Auto-Add used channels](../../img/roadmap/AutoAssingmentOfUsedChannels.png)  

----
## PRIO 2
### More languages (eg. Polish, Italian)
We are going to add more language plus revise the existing terms in cooperation with native partners.  
![More languages 1](../../img/roadmap/Poland.png) ![More languages 2](../../img/roadmap/Spain.png)  

### Devices Map
As now a user can change and store the coordinates of a device from the WebApp it makes sense to visualize the devices in a map. It might be possible to change the location in the map to update the coordinates.  
![Devices Map](../../img/roadmap/DevicesMap.png)  

### Handle multiple Configurations/Water Calculations per device
One of the advantages of the DataManger-SW is that it can handle various configuration/calculations per device. The KOLIBRI Cloud right shows calculated values on-the-fly but ignores the fact that measurements can have different calculations in the past (eg. due to changing installation). It is wished to be able to add comments to  
The goal is now to handle and visualize the stored device configurations, in the chart and the export!  ![Handle multiple Configurations/Water Calculations per device](../../img/roadmap/MultipleWaterLevelsOnOneChart.png)  

### Individual channel customizations
A long awaiting feature is the possibility to set a different **color** and **name** per channel per device. And each device should have different scale settings.  
![Individual channel customizations](../../img/roadmap/CustomizedChannels.png)  

----
## PRIO 3
### Performance
It is planned to optimize the starting behavior in order to quickly load the devices overview. Performance is always a feature.  
![Performance](../../img/roadmap/performance.png)  

### Show Permanent Token for Administrators
To make it easier for the users and the KOLIBRI support team the individual permanent tokens of the *contributor* users will be shown.  
![Show Permanent Token for Administrators](../../img/roadmap/ShowIndividualPermanentToken.png)  


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


### Export and Alarming in other units (not only m, °C, bar)
Users using the imperial system need the possibility to export in units like feet, inch and Fahrenheit. 
When improving the export it shall also be able to export & alarm of Tank- and Overflow Calculation.
![Export and Alarming in other units](../../img/roadmap/MultipleDevicesExporWithCustomUnits.png)  


### Export of multiple channels into ONE Excel/CSV file
Export of multiple channels into ONE Excel/CSV file.


----
# YOUR idea
Tell us your idea! What do you need!
<kolibri@keller-druck.com>