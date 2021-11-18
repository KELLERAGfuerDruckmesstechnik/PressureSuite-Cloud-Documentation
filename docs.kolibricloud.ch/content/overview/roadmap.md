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
The following roadmap is an idea. Therefore, the priority might change and we might implement a feature earlier or later depending on customer projects and other circumstances.  

## PRIO 1
### Handle multiple Configurations/Water Calculations per device
One of the advantages of the DataManager-SW is that it can handle various configuration/calculations per device. The KOLIBRI Cloud right shows calculated values on-the-fly but ignores the fact that measurements can have different calculations in the past (eg. due to changing installation). It is wished to be able to add comments to chosen installation/configuration.  
The goal is now to handle and visualize the stored device configurations, in the chart and the export!  ![Handle multiple Configurations/Water Calculations per device](../../img/roadmap/MultipleWaterLevelsOnOneChart.png)  

### Device Log  
Changing configurations, settings and calculations should be stored to give a certain traceability for understanding the system and allow to post-configure multiple installations per device. The 'Device Log' discloses the changes and who did the changes.  
![Device Log](../../img/roadmap/DeviceLog.png)  

## PRIO 2

### Show maintenance control to easy find issues with the device configuration and fix device issues/installations
-  Show possible configuration issues of this device
-  Possibility to hide measurements and request missing from the device
-  Easier change of a device from an installation to another without the help of KOLIBRI Cloud support
-  Easier replacement of a defect sending device without the help of KOLIBRI Cloud support



----
## PRIO 3

### Export of multiple channels into ONE Excel/CSV file
Export of multiple channels into ONE Excel/CSV file.

### Devices Map
As now a user can change and store the coordinates of a device from the WebApp it makes sense to visualize the devices in a map. It might be possible to change the location in the map to update the coordinates.  Try https://www.kolibricloud.ch/device-map  
![Devices Map](../../img/roadmap/DevicesMap.png)  

----
## PRIO 4 - Not in 2021

### *Find*, *mark* and *delete* unreliable or outlier data
Statistical methods and customized threshold should make it possible to find irregularities.  
Found unreliable data should be able to be marked and even deleted.

### MQTT analysis and integration
We are going to add the possibility to use MQTT in our sending devices. Ideally, the KOLIBRI Cloud backend shall be able to accept and communicate with MQTT.

### DeviceConfiguration for LoRa devices
Now that the sending 'Device Configuration' for GSM/ARC to devices over FTP/Mail-server is working. We are going to implement the new protocol for KELLER's LoRa devices. The goal is to communicate to and from the device over multiple LoRaWAN transmission using the small payload efficiently.  
![DeviceConfiguration for LoRa devices](../../img/roadmap/DeviceConfigurationsLoRa.png)  

----
# YOUR idea
Tell us your idea! What do you need?  
<kolibri@keller-druck.com>  

[![](https://docs.kolibricloud.ch/img/logo.png)](https://roadmap.kolibricloud.ch/)

<iframe src="https://roadmap.kolibricloud.ch/index.html" width="1000" height="840"></iframe>
