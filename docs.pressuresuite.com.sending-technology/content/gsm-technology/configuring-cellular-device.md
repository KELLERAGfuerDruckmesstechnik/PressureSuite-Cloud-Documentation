---
title: How to set up a cellular device with PressureSuite Desktop
menu:
    main:
        parent: gsm-technology
        weight: 4
---

# How to set up a cellular device with PressureSuite Desktop

## Identification / Location

- Unique Id is used to identify the device when sending data. Recommended is to use the IMEI.
- Device Name and Network name are used to name devices and group them into networks.
- Register the coordinates where this device is installed as decimal degrees and the altitude of the device.

![](../../Cellular_WizardLocation.png  "")

## Hardware

- Select the 'Connected Sensor Type' based on the connected sensor.

The current value of a channel can only be retrvieved, if they are already configured active on the device.

![](../../Cellular_WizardHardware.png  "")

## Measurement

- In the Wizard [Measurement] the Next Action and the Interval can be defined.
- In this example, the first measurement is carried out at 16:00 on 31.10.2024 and then repeated at 1-hour intervals. The measured values are transmitted immediately 24 measurements to an FTP server.
- Default measure interval is: 1 hour
- The more often the device sends the more battery is consumed

![](../../Cellular_WizardMeasurement.png  "")

## Event Recording

- There are three types of events
  - Delta Save
    - The device saves a value when the delta to the last measured value is bigger than the defined 'Delta Value'
  - Delta Send
    - The device sends the stored an unsent measurements when the delta to the last measured value is bigger than the defined 'Delta Value'
  - On/Off
    - The device starts recording at the 'Trigger Value' and stops at the 'Trigger Off value'. This is described more in detail in the chapter "Alarming" below.

![](../../Cellular_WizardEventOnOff.png  "")

## Internet Connection

- Enter the 'APN', 'User Name' and 'Password' provided by the SIM-card provider. Some of the more popular providers are listed in the popup box next to the APN field.
- If the SIM-card requiers a PIN, make sure to enter the PIN correctly. The SIM-card will be locked after three incorrect tries by the ADT1/ARC1. If that happens, the SIM-card must be unlocked with the help of a mobile phone and the SIM-card puck.

![](../../Cellular_WizardInternetConnection.png  "")

## FTP Connection

- Enter the credentials to the FTP server.
- If you use the PressureSuite Cloud service, an FTP server can be provided to you by the PressureSuite support.

![](../../Cellular_WizardFtpConnection.png  "")

## Configuration Check

This function checks for incoming configurations for example sent by the PressureSuite cloud.

![](../../Cellular_WizardConfigCheck.png  "")

## Information Message

The device can send useful information such as battery voltage, battery capacity, humidity etc.

![](../../Cellular_WizardInfoMessage.png  "")

## Alarming

If 'Alarm Trigger Value' >= 'Alarm Un-Trigger Value', then the alarm will be sent above a certain level 

An alarm message is triggered if the measured value of the selected channel is greater than the 'Alarm Trigger Value'. During this period the alarm will be sent X times if the measured value is still greater than the 'Alarm Un-Trigger Value' (Hysteresis = 'Alarm Trigger Value' – 'Alarm Un-Trigger Value'). 

![Alarming Explanation](../../AlarmingExplanation1.png  "Alarming Explanation")
 
If 'Alarm Trigger Value' < 'Alarm Un-Trigger Value', then the alarm will be sent below a certain level 

An alarm message is triggered if the measured value of the selected channel is less than the 'Alarm Trigger Value'. During this period the alarm will be sent X times if the measured value is still lower than the 'Alarm Un-Trigger Value' (Hysteresis = 'Alarm Un-Trigger Value' – 'Alarm Trigger Value'). 
 
![Alarming Explanation](../../AlarmingExplanation2.png  "Alarming Explanation")

NOTE: If the alarm condition is active and X alarm messages are sent no more alarm messages will be sent. The alarm is 
only re-armed when the 'Alarm Un-Trigger Value' condition is fulfilled.

![](../../Cellular_WizardAlarming.png  "")

## Water Level Calculation

There are essentially 3 different calculation types.

![Watercalculation Wizard](../../LoRa_WizardWaterCalc1.png  "Watercalculation Wizard")

### Height Of Water

At water height above probe (E), the water column/water height above the probe is measured.

![Height Of Water](../../WaterHeightDialog.png  "Height Of Water")

### Depth To Water

At depth to water (F), the distance from the upper edge of the measuring point to the water surface is determined. For 
the calculation of the depth upper edge of the measuring point to the water surface, the installation length B must be 
known. 

![Water Depth](../../WaterDepthDialog.png  "Water Depth")

### Height Of Water Above Sea Level

At water level related to sea level (G) the water level/water level related to sea level is calculated. With this infor-
mation, the measured values from different locations can be compared with each other. For this calculation, the 
installation length B and the height above sea level of the upper edge of the measuring point are required. 

![Height Of Water Above Sea Level](../../WaterHeightAboveSeaDialog.png  "Height Of Water Above Sea Level")

## E-Mail Connection

We recommend using FTP instead of E-Mail. 

![](../../Cellular_WizardEmailConnection.png  "")