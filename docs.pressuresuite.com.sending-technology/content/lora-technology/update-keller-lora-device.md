---
title: Configuring a LoRaWAN device from KELLER
menu:
    main:
        parent: lora-technology
        weight: 4
toc: false
description: Information how to configure a LoRaWAN device from KELLER Pressure
---

# Configuring a LoRaWAN device from KELLER


For the configuration of the KELLER LoRaWAN devices we developed "PressureSuite Desktop". 

PressureSuite Desktop is available on the [KELLER Website](https://keller-druck.com/en/products/software-accessories/pressuresuite/pressuresuite-desktop) 


<em>The guide for the old 'GSM configuration' software is on the bottom of the page</em>

## Overview

- On the left side navigation you can find the 'Configuration'-tab.

![LoRa Configuration Overview](../../LoRa_ConfigOverview.png  "LoRa Configuration Overview")

- You can change the configuration with a guided wizards (1) or an individual section (2) 

![LoRa Wizards Overview](../../LoRa_WizardsOverview.png  "LoRa Wizards Overview")


## Location

Register the coordinates where this device is installed as decimal degrees and the altitude of the device.

![LoRa Location Wizard](../../LoRa_WizardLocation.png  "LoRa Location Wizard")

## Hardware

<!--- TODO -->
The current value of a channel can only be retrvieved, if they are already configured active on the device.

![LoRa Hardware Wizard](../../LoRa_WizardHardware.png  "LoRa Hardware Wizard")

## Measurement

- In the Wizard [Measurement] the **Next Action** and the **Interval** can be defined.
- In this example, the first measurement is carried out at 12:00 on 30.10.2024 and then repeated at 30-minute intervals.
The measured values are transmitted immediately after each measurement.
- Default measure interval is: 10 min
- The more the device sends the more battery is consumed

![LoRa Measurement Wizard](../../LoRa_WizardMeasurement.png  "LoRa Measurement Wizard")

## LoRa Settings

The parameters required for transmission can be changed in the communication settings.
  
The following settings can be changed:  

- ***Activation method***  
The activation method OTAA (Network-Session-Key and App-Session-Key are exchanged/created during the first connection) or ABP (Manual entry of keys) can be selected. Depending on the selection of the activation method, the input fields are activated.
  - Default/Recommended: **OTAA**

- ***Device EUI***  
The devices EUI (Unique Device Identification) cannot be changed. The EUI is registered at the network server.  

- ***Application EUI***  
The unique identification number for the application with which the data is further processed is entered here.  
  - Enter here the Application EUI of your application/device from your LoRa Network Server
    - For Swisscom/Actility: Use `F0-3D-29-AC-71-00-00-01`
    - If you want to have the device in YOUR OWN TTN application, it is recommended to have a different App EUI. Choose a random App EUI. The reason is that the device is already used by KELLER for testing purpose and enlisted in a KELLER TTN application. This may cause issues within TTN as the device are double enlisted. Use this APP EUI when adding the device to your TTN (V3) application.


- ***Device Address / Network Session Key / App Session Key***  
These settings must be entered for the ABP activation method.
  - Default: When using the preferred OTAA mode these fields can not change.


- ***Uplink Mode***  
The data can be sent with confirmation (confirmed) or without confirmation (unconfirmed) of the network server.
  - Default/Recommended: unconfirmed.  


- ***Transmit Mode***  
If ADR= ON () is selected, the transmission power (SF) of the device is adapted to the ambient conditions by the network server. An optimal ratio between range and power is set. If ADR=OFF, the automatic power adjustment is deactivated and the device transmits with the power set in the "Data Rate" field.  
  - Default/Recommended: ON  


- ***Data Rate***  
Here the transmission power can be set, whereby the setting 0 SF12/125kHz achieves the highest power and consequently the highest range (and also the highest energy consumption). With the setting 6 SF7/250kHz the smallest range is reached.  
  - Default/Recommended: Use 1 SF11/125kHz when ADR is OFF  


- ***Power Index***  
With the Power Index setting the transmission power can be adjusted to the antenna. If an antenna with amplification is used, the transmission power can be reduced so that the transmission power corresponds to the permissible standard.
  - Default/Recommended: 1 14dbm.  

![LoRa Settings Wizard](../../LoRa_WizardLoraSettings.png  "LoRa Settings Wizard")

## Info Message

The device can send useful information such as battery voltage, battery capacity, humidity etc.
  - Default/Recommended: Once per day.

![LoRa Info Wizard](../../LoRa_WizardInfoMessage.png  "LoRa Info Wizard")

## Alarming

If 'Alarm Trigger Value' >= 'Alarm Un-Trigger Value', then the alarm will be sent above a certain level 

An alarm message is triggered if the measured value of the selected channel is greater than the 'Alarm Trigger Value'. During this period the alarm will be sent X times if the measured value is still greater than the 'Alarm Un-Trigger Value' (Hysteresis = 'Alarm Trigger Value' – 'Alarm Un-Trigger Value'). 

![Alarming Explanation](../../AlarmingExplanation1.png  "Alarming Explanation")
 
If 'Alarm Trigger Value' < 'Alarm Un-Trigger Value', then the alarm will be sent below a certain level 

An alarm message is triggered if the measured value of the selected channel is less than the 'Alarm Trigger Value'. During this period the alarm will be sent X times if the measured value is still lower than the 'Alarm Un-Trigger Value' (Hysteresis = 'Alarm Un-Trigger Value' – 'Alarm Trigger Value'). 
 
![Alarming Explanation](../../AlarmingExplanation2.png  "Alarming Explanation")

NOTE: If the alarm condition is active and X alarm messages are sent no more alarm messages will be sent. The alarm is 
only re-armed when the 'Alarm Un-Trigger Value' condition is fulfilled.

![LoRa Alarming Wizard](../../LoRa_WizardAlarming.png  "LoRa Alarming Wizard")

## Water Calculation

There are essentially 3 different calculation types.

![LoRa Watercalculation Wizard](../../LoRa_WizardWaterCalc1.png  "LoRa Watercalculation Wizard")

### Height Of Water

At water height above probe (E), the water column/water height above the probe is measured.

![Height Of Water](../../WaterHeightDialog.png  "Height Of Water")

### Depth To Water

At depth to water (F), the distance from the upper edge of the measuring point to the water surface is determined. For 
the calculation of the depth upper edge of the measuring point to the water surface, the installation length B must be 
known. 

![Water Depth](../../WaterDepthtDialog.png  "Water Depth")

### Height Of Water Above Sea Level

At water level related to sea level (G) the water level/water level related to sea level is calculated. With this infor-
mation, the measured values from different locations can be compared with each other. For this calculation, the 
installation length B and the height above sea level of the upper edge of the measuring point are required. 

![Height Of Water Above Sea Level](../../WaterHeightAboveSeaDialog.png  "Height Of Water Above Sea Level")

## Link Check

<!--- TODO -->

**Note:** Link check is working with device firmware >= 20.34 only 
Be aware that the link check function initiates downlink traffic which can cause more transfer costs and can limiting also the maximum sending interval. The power consumption of the device will also increase. Therefore, we do not recommend using this function.  
Please use the "Rejoin" function instead. 

![LoRa Link Check Wizard](../../LoRa_WizardLinkCheck.png  "LoRa Link Check Wizard")

## Rejoin

Devices with firmware >= 20.34 can have a Rejoin interval that helps to fix troubles with LoRa Network Servers (Hello Swisscom)
  - Default/Recommended: Interval time of 14 days  

![LoRa Rejoin Wizard](../../LoRa_WizardRejoin.png  "LoRa Rejoin Wizard")

## Write the device with the configuration

- After all settings have been made on the software interface, press the **Write changes to device** button and all settings are transferred to the device connected to the COM port.
- The device will measure at the set time/interval and transfer the measured values.
- Before the first transfer of the measured values or if required, the device will perform a JOIN, in which the device registers with the network server and exchanges the keys.

## Manually Send Data 

**Transmit Information**
The device sends useful information such as battery voltage, battery capacity, humidity etc. 
  
**Transmit Configuration**
By pressing this button, all settings of the device are transmitted one after the other in different individual messages via LoRaWAN.
**Attention**: Due to the limitations of the transmission (frequency band usage regulations) the transmission may take some time (minutes to hours).

**Transmit Measurements**
A measurement is triggered and the measured values are transmitted via LoRaWAN. If necessary, a JOIN is carried out before the measurement data transfer.  

![LoRa Transmit Commands](../../LoRa_TransmitCommands.png  "LoRa Transmit Commands")


---

## Setup with obsolete "GSM configuration" software

The following guide describes how to configure a LoRaWAN device from KELLER. A German version is available [as PDF](../../KELLER_LoRaWAN_Geraet_konfigurieren_V1.0.pdf).

The software [GsmConfiguration/GsmSetup](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) is required for the configuration. The software can be downloaded under the following link: <https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units>

- Connect the ARC1 device to a Windows-PC with the interface converter K114 and then start the software *GsmConfiguration*. ADT1 devices can be connected using a Micro USB-cable.

- Select the <span style="color:red">*Comport Number*</span> of the connected device and then press the button <span style="color:green">*Read Configuration*</span>. The current settings of the device are now read out and displayed in the software.

**ATTENTION**: Changes to the configuration are only transferred to the device if the <span style="color:orange">*Write Configuration*</span> button is pressed.



## Settings

- In the tab [Settings] you can enable the function **Measure** and after selecting the **Hardware settings** you can select the **Measuring channels** which are to be transferred.  
- If you are not sure which **Hardware settings** and which **Measuring Channels** are needed:
  - Go to tab **[Error/Status]** to show actual measuring values. This helps choosing the correct type. If you buy a sending device with level probes attached it should already be configured.
  - Only choose the needed channel. This helps to save energy/battery.

![LoRa Setup Settings](../../LoRaSetup-Settings.png  "LoRa Setup Settings")

## Measure

- In the tab [Measure] the **measuring start time** and the **measuring interval** can be defined.
- In this example, the first measurement is carried out at 11.46 on 26.02.2021 and then repeated at 10-minute intervals.
The measured values are transmitted immediately after each measurement.
- Default measure interval is: 10 min
- The more the device sends the more battery is consumed

![LoRa Setup Measure](../../LoRaSetup-Measure.png "LoRa Setup Measure")

## LoRa Settings

The parameters required for transmission can be changed in the communication settings.
  
The following settings can be changed:  

- ***Activation method***  
The activation method OTAA (Network-Session-Key and App-Session-Key are exchanged/created during the first connection) or ABP (Manual entry of keys) can be selected. Depending on the selection of the activation method, the input fields are activated.
  - Default/Recommended: **OTAA**

- ***Device EUI***  
The devices EUI (Unique Device Identification) cannot be changed. The EUI is registered at the network server.  

- ***Application EUI***  
The unique identification number for the application with which the data is further processed is entered here.  
  - Enter here the Application EUI of your application/device from your LoRa Network Server
    - For Swisscom/Actility: Use `F0-3D-29-AC-71-00-00-01`
    - If you want to have the device in YOUR OWN TTN application, it is recommended to have a different App EUI. Choose a random App EUI. The reason is that the device is already used by KELLER for testing purpose and enlisted in a KELLER TTN application. This may cause issues within TTN as the device are double enlisted. Use this APP EUI when adding the device to your TTN (V3) application.


- ***Device Address / Network Session Key / App Session Key***  
These settings must be entered for the ABP activation method.
  - Default: When using the preferred OTAA mode these fields can not change.


- ***Uplink Mode***  
The data can be sent with confirmation (confirmed) or without confirmation (unconfirmed) of the network server.
  - Default/Recommended: unconfirmed.  


- ***Transmit Mode***  
If ADR= ON () is selected, the transmission power (SF) of the device is adapted to the ambient conditions by the network server. An optimal ratio between range and power is set. If ADR=OFF, the automatic power adjustment is deactivated and the device transmits with the power set in the "Data Rate" field.  
  - Default/Recommended: ON  


- ***Data Rate***  
Here the transmission power can be set, whereby the setting 0 SF12/125kHz achieves the highest power and consequently the highest range (and also the highest energy consumption). With the setting 6 SF7/250kHz the smallest range is reached.  
  - Default/Recommended: Use 1 SF11/125kHz when ADR is OFF  


- ***Power Index***  
With the Power Index setting the transmission power can be adjusted to the antenna. If an antenna with amplification is used, the transmission power can be reduced so that the transmission power corresponds to the permissible standard.
  - Default/Recommended: 1 14dbm.  


![LoRa Setup LoRa Settings](../../LoRaSetup-LoRaSettings.png  "LoRa Setup LoRa Settings")

## Info

The device can send useful information such as battery voltage, battery capacity, humidity etc.
  - Default/Recommended: Once per day.

![LoRa Setup Info](../../LoRaSetup-Info.png  "LoRa Setup Info")

## ReJoin
Devices with Firmware>20.34 can have a ReJoin interval that helps to fix troubles with LoRa Network Servers (Hello Swisscom)
  - Default/Recommended: Interval time of 14 days  
  

![LoRa Setup ReJoin](../../LoRaSetup-ReJoin.png  "LoRa Setup ReJoin")

## Write the device with the configuration

- After all settings have been made on the software interface, press the **Write configuration** button and all settings are transferred to the device connected to the COM port.
- The device will measure at the set time/interval and transfer the measured values.
- Before the first transfer of the measured values or if required, the device will perform a JOIN, in which the device registers with the network server and exchanges the keys.

## Triggering a measurement at the touch of a button

In the tab **[Error/Status]** the current status of the device can be viewed. Possible errors during transmission as well as errors during measurement of the connected sensors are displayed.

**Measuring**
Pressing the **Measure** button triggers a measurement (without transmission). The measured values are displayed below the button.  
  
**Send Measure-Data LoRa**
A measurement is triggered and the measured values are transmitted via LoRaWAN. If necessary, a JOIN is carried out before the measurement data transfer.  

**Send Configuration LoRa**
By pressing this button, all settings of the device are transmitted one after the other in different individual messages via LoRaWAN.
**Attention**: Due to the limitations of the transmission (frequency band usage regulations) the transmission may take some time (minutes to hours).