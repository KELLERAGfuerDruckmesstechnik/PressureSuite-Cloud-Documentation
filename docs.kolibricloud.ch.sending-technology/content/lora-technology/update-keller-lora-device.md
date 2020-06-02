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

The following manual describes how to configure a LoRaWAN device from KELLER ARC1-Lora and a K114 adapter cable rsp. a ADT1 and a USB-cable. It is also available in [German as PDF](../../KELLER_LoRaWAN_Geraet_konfigurieren_V1.0.pdf).

The software *GsmConfiguration/GsmSetup* is required for the configuration. The software can be downloaded under the following link: <http://www.keller-druck2.ch/swupdate/GSMSetup/GSMSetup.zip>

A general description of the software can be found here:
<http://www.keller-druck2.ch/swupdate/GSMSetup/manual/man_gsm2_g_De.pdf>
(Attention: The description of the LoRaWAN configuration is not included yet)
  
Connect the device to be configured to the PC via the interface converter K114 (or K102) and then start the software *GsmConfiguration*.  

<img src="../../configLoRaDevice00.png" alt="GSMSetup00"/>  

<img src="../../configLoRaDevice01.png" alt="GSMSetup01"/>

Select the <span style="color:red">*Comport Number*</span> of the connected device and then press the button <span style="color:green">*Read Configuration*</span>. The current settings of the device are now read out and displayed in the software.
  
**ATTENTION**: Changes to the configuration are only transferred to the device if the <span style="color:orange">*Write Configuration*</span> button is pressed.

## Settings

In the tab [Settings] you can enable the function <span style="color:red">*Measure*</span> and after selecting the <span style="color:green">*Hardware settings*</span> you can select the <span style="color:orange">*measuring channels*</span> which are to be transferred.  
<img src="../../configLoRaDevice02.png" alt="GSMSetup02"/>  

## Measure

In the tab [Measure] the <span style="color:red">*measuring start time*</span> and the <span style="color:green">*measuring interval*</span> can be defined.
In this example, the first measurement is carried out at 15.00 on 19.8.2019 and then repeated at 15-minute intervals.
The measured values are transmitted immediately after each measurement.

<img src="../../configLoRaDevice03.png" alt="GSMSetup03"/>  

## Communication

The parameters required for transmission can be changed in the communication settings.
  
<img src="../../configLoRaDevice04.png" alt="GSMSetup04"/>

The following settings can be changed:  

- ***Activation method***  
The activation method OTAA (Network-Session-Key and App-Session-Key are exchanged/created during the first connection) or ABP (Manual entry of keys) can be selected. Depending on the selection of the activation method, the input fields are activated.  

- ***Device EUI***  
The devices EUI (Unique Device Identification) cannot be changed. The EUI is registered at the network server.  

- ***Application EUI***  
The unique identification number for the application with which the data is further processed is entered here.  

- ***Device Address / Network Session Key / App Session Key***  
These settings must be entered for the ABP activation method.  

- ***Uplink Mode***  
The data can be sent with confirmation (confirmed) or without confirmation (unconfirmed) of the network server. Recommended setting: unconfirmed.  

- ***Transmit Mode***  
If ADR= ON () is selected, the transmission power (SF) of the device is adapted to the ambient conditions by the network server. An optimal ratio between range and power is set. If ADR=OFF, the automatic power adjustment is deactivated and the device transmits with the power set in the "Data Rate" field.  

- ***Data Rate***  
Here the transmission power can be set, whereby the setting 0 SF12/125kHz achieves the highest power and consequently the highest range (and also the highest energy consumption). With the setting 6 SF7/250kHz the smallest range is reached.  
Recommendation: Use 2 SF10/125kHz (ADR = OFF).  

- ***Power Index***  
With the Power Index setting the transmission power can be adjusted to the antenna. If an antenna with amplification is used, the transmission power can be reduced so that the transmission power corresponds to the permissible standard.
Standard setting / Recommended setting = 1 14dbm.

## Write the device with the configuration

After all settings have been made on the software interface, press the *"Write configuration"* button and all settings are transferred to the device connected to the COM port.
The device will measure at the set time/interval and transfer the measured values.
Before the first transfer of the measured values or if required, the device will perform a JOIN, in which the device registers with the network server and exchanges the keys.

## Triggering a measurement at the touch of a button

In the tab *"Error/Status"* the current status of the device can be viewed. Possible errors during transmission as well as errors during measurement of the connected sensors are displayed.

***Measuring***
Pressing the *"Measure"* button triggers a measurement (without transmission). The measured values are displayed below the button.  
  
***Send Measure-Data LoRa***
A measurement is triggered and the measured values are transmitted via LoRaWAN. If necessary, a JOIN is carried out before the measurement data transfer.  

***Send Configuration LoRa***
By pressing this button, all settings of the device are transmitted one after the other in different individual messages via LoRaWAN.
**Attention**: due to the limitations of the transmission (frequency band usage regulations) the transmission may take some time (minutes to hours).

<img src="../../configLoRaDevice05.png" alt="GSMSetup05"/>