---
title: How to set up a cellular device with PressureSuite Desktop
menu:
    main:
        parent: gsm-technology
        weight: 4
---

# How to set up a cellular device with PressureSuite Desktop

## Identification / Location

- 
- Register the coordinates where this device is installed as decimal degrees and the altitude of the device.

![](../../Cellular_WizardLocation.png  "")

## Hardware

The current value of a channel can only be retrvieved, if they are already configured active on the device.

![](../../Cellular_WizardHardware.png  "")

## Measurement

- In the Wizard [Measurement] the Next Action and the Interval can be defined.
- In this example, the first measurement is carried out at 16:00 on 31.10.2024 and then repeated at 1-hour intervals. The measured values are transmitted immediately 24 measurements to an FTP server.
- Default measure interval is: 1 hour
- The more often the device sends the more battery is consumed

![](../../Cellular_WizardMeasurement.png  "")

## Event Recording

![](../../Cellular_WizardEventOnOff.png  "")

## Internet Connection

![](../../Cellular_WizardInternetConnection.png  "")

## FTP Connection

![](../../Cellular_WizardFtpConnection.png  "")

## Configuration Check

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

![](../../Cellular_WizardEmailConnection.png  "")