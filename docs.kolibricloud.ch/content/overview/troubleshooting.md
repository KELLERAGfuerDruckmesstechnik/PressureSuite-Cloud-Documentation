---
title: Troubleshooting
menu:
    main:
        parent: overview
        weight: 7
toc: true
description: List of problems and their solutions
---
# Troubleshooting

---
## How can I *activate* the alarm mails for the device alarms?

**Problem**  
There are three categories of alarms: 
 - Application alarms  
    *Application alarms are for example 'level alarms' that can be set per device per channel and trigger when the value falls below/over a certain level.*
 - Device alarms  
    *Device alarms are automatically triggered alarms in case a device has an exceptional state such es low power, high humidity, or stopped sending measurements.*
 - System alarms  
    *System alarms are triggered when system-wide problems arise.*

*Application alarms* must be set by users themselves and linked to a recipient e-mail address. *Device alarms*, however, are preset with a fixed minimum limit and maximum limit. The e-mail address for these kinds of alarms must be configured, too.

**Solutions**  
In the *Account Settings* (https://www.kolibricloud.ch/account-settings) one or multiple receiver e-mail addresses have to be added to make it possible for the KOLIBRI Cloud to send alarm e-mails.  

![.](../../img/troubleshooting/add-email-for-system-and-device-alarm.png)  

---
## The device stopped sending / *'Device stopped transmitting'*-alarm triggered

**Problems**  
With cellular technology, multiple reasons for failed transmissions can arise. The cellular technology-based KELLER devices (GSM/ARC1/ADT1) can handle a few failed transmissions by automatically resending the missing data. 
In LoRaWAN a 100% reliability is not given by protocol design. Failed transmissions will not be repeated automatically.  
Nevertheless, missing *five* transmissions is considered worthy of alarm.  

### Common causes
- The sending device
  - has no battery power left
  - battery is not plugged in
  - device antenna is not plugged in
  - has communication problems
    - because of heavy rain
    - because it is underwater
    - because the cellular antenna is not reacting (cell antenna stopped sending the needed frequency, cell antenna is updating or broken, ...)
    - because the LoRaWAN gateway is not reacting (power-off, antenna broken, ...)
  - electronics/sensors/level-probes are damaged
  - has an invalid SIM card
- The FTP/Mail server is not reachable

**Possible reasons and solutions**  

#### ⚡ *The sending device has no battery power left*
   - To identify this problem, please analyze the 'Battery Info' of the device on https://www.kolibricloud.ch/. Also, there should have been a *Device Alarm* in the *Alarms* list with a warning.
   - If the battery voltage and/or battery capacity is too low, then the battery needs to be replaced.

#### ⚡ *The sending device has communication problems because of heavy rain/snow* 
   - To identify this problem, please analyze the 'Signal strength' of the device on https://www.kolibricloud.ch/ and, if possible, cross-reference the data with past weather data. Does the signal strength get worse when there is heavy rainfall/snowfall?
   - If the weather has an impact, then consider re-position or protect the antenna. The higher the position, the better.
   - Even with a free line of sight there might be issues due to [Fresnel zones](https://en.wikipedia.org/wiki/Fresnel_zone)

#### ⚡ *The sending device has communication problems because it is underwater* 
   - To identify this problem, please analyze the 'Signal Strength' and the 'Humidity' of the device on https://www.kolibricloud.ch/ :
   - If the humidity continues to rise, the signal strength immediately dropped and the communication stopped, then consider a water damage or the possibility of an overflowed device. Consider verifying the state of the sending device in the field.
#### ⚡ *The sending device has communication problems because the cellular antenna is not reacting* 
   - The cell antenna stopped sending the needed frequency because the mobile telecom provider changes the available frequencies (No 2G in favour of 4G rsp. No 3G in favour of 4G etc.). Please check with you provider is in the process of shutting down the mobile network.
   - Unlikely, but sometimes network provider lower the signal strength of cell antennas during the night. This might lead to the device not being able to connect during the nighttime. Please check if transmission gaps happened periodically and consider replacing the sending device to a more exposed place.

#### ⚡ *The sending device has communication problems because the LoRaWAN gateway is not reacting* 
   - The LoRaWAN gateway might be power-off or defect. Please check the state of the gateway. You might be able to remotely check the state of the gateway with the LoRa network platform (TTN, Loriot.io, ...)

#### ⚡ *The sending device's electronics/sensors/level-probes are damaged* 
   - Three cases:
      A) The sending device (GSM, ARC1 or ADT1) might be defective or missing.
      B) The cables to the level probes might be defective.
      C) The sensors themselves might be defective.
   - To analyze this please check the rate of transmissions on www.kolibrcloud.ch and the "last data". 
    If some channels do not send correct values ("--" instead of a number), the sensor might be defective. Sometimes it is visible that the values of another channel have increased/decreased from the very moment other channels do not show any values. This indicates that the sensor is defective due to pressure overload.
    If ALL channels are no longer sending correct values, but transmissions continue, the cable to the probes may be defective.
    If there is no transmission anymore, the sending device itself might be physically defective or there is another (connection) problem.

#### ⚡ *The SIM card invalid*
   - Check with your mobile provider if the SIM card plan that ran out of money.
#### ⚡ *The FTP server is not reachable* 
   - Check with an FTP client such as [FileZilla](https://filezilla-project.org/) your credentials (host/username/password). 
   - Alternatively, it is possible to test the connection in the account settings (https://www.kolibricloud.ch/account-settings)
   - If it is an FTP server provided by KELLER with the host name ftp.gsmdata.ch, then please contact kolibri@keller-druck.com
   - If it is an FTP server provided by you, then contact your IT administrator. When the FTP server never could be reached, then this might be a problem with unsupported security protocols. Contact kolibri@keller-druck.com to check if the used FTPS SSH cipher is supported. SFTP is not supported.

#### ⚡ *The mail server is not reachable* 
   - Check with an alternative mail client your credentials (host/username/password). 
   - If the credentials don't work, and it is a mail server provided by KELLER, then please contact kolibri@keller-druck.com
   - If the credentials don't work, and it is a mail server provided by you, then contact your IT administrator.
   - If the credentials work, but the device can not send data to the mail server any more than please contact kolibri@keller-druck.com


**The ARD1/ADT1 are also loggers**  
Be aware that all KELLER remote sending devices are also logger. And even when communication is not possible, measurements will be made and stored as long as the level probes and the cables are working. The measurement files can even be extracted (with 'KOLIBRI Desktop') and uploaded into the KOLIBRI Cloud.

**How was the alarm triggered**  
Every device in the KOLIBRI Cloud is checked daily (03:30 UTC). If a device missed *at least five* transmissions at this moment, it will trigger a *'Device stopped transmitting'*-alarm.

---
## The humidity in the device is too high / *'Humidity'*-alarm triggered

**Problem**  
The humidity IN the ARC1/ADT1 is too high. This might be because there is water IN the sending device itself. Water in the device will damage its electronics and power supply. It might stop sending because the electronics are defective or/and the device itself is underwater.

**Possible solution**   
Please check the state of the device. You might open it and see if there is water IN the device. Use new 'Silica gel bags' to dry the device and consider to re-position the device to avoid further water problems.

**How was the alarm triggered**  
The alarm is triggered when the humidity level is above 90%. This is checked every 6 hours.

---

## The battery capacity is too low / *'Battery Capacity'*-alarm triggered

**Problem**  
It is difficult to measure when a battery is running out of power as they are not rechargeable. Environmental changes or hardware differences result in an individual discharge curve for each battery. We measure and summarize every action of the device to calculate the used power. This empiric counter is visualized by the '*battery capacity*'. Effects like temperature or humidity influence the charge of the battery. The device might stop sending on +20% or will continue to send even when it reached 0%. 
Whenever we calculate a capacity of 30%, please consider replacing the batteries.
Be aware that **unplugging and re-plugging of the battery resets the capacity counter**! Therefore, the battery capacity will be 100%, although it is not.

**Possible solutions**  
Please replace the battery. You can order new batteries from KELLER sales or directly from the manufacturer.

**How was the alarm triggered**  
The *battery capacity too low* alarm is triggered when the capacity level is below 30% and will be automatically set off when the capacity level is over 90% again. 


---

## The battery voltage is too low / *'Battery Voltage'*-alarm triggered

**Problem**  
It is difficult to measure when a battery is running out of power as they are not rechargeable. Environmental changes or hardware differences result in an individual discharge curve for each battery. We measure and summarize every action of the device to calculate the used power. This empiric counter is visualized by the '*battery capacity*'. 
The '*battery voltage*' is the actual measured voltage on the battery.
When this alarm is raised, please consider replacing the batteries.

**Possible solutions**    
Please replace the battery. You can order new batteries from KELLER sales or directly from the manufacturer.
Be aware that unplugging and re-plugging of the battery resets the capacity counter. Therefore, the battery capacity will be 100%, although it is not.

**How was the alarm triggered**  
The *battery voltage too low* alarm is triggered when the battery voltage level is below 3.6V (ARC1) rsp. 3.5V (ADT1 LoRa) rsp 3.8V (ADT1 NB/LTEM) and will be automatically set off when the battery level is over 3.7V (ARC1) rsp. 4.0V (ADT1 LoRa) rsp 4.0V (ADT1 NB/LTEM) again.  

---
