---
title: Configuring a LoRaWAN device from KELLER
menu:
    main:
        parent: lora-technology
        weight: 4
toc: false
description: Information how to configuring a LoRaWAN device from KELLER AG
---

# Configuring a LoRaWAN device from KELLER

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
    - For TTN V3: You do not have to change the App EUI. Use this APP EUI when adding the Device to your TTN (V3) application.

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