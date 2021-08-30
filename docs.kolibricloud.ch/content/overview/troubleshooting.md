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
    *Device alarms are automatically triggered alarms in case a device has an exceptionally state such es low power, high humidity or stopped sending measurements.*
 - System alarms  
    *System alarms are triggered when system-wide problems arise.*

While *Application alarms* have to be set by the users themselves and link to a receiver e-mail address, *Device alarms*, however, are preset with fixed minimum limit and maximum limit. The e-mail address for these kinds of alarms must be configured, too.

**solutions** 
In the *Account Settings* (https://www.kolibricloud.ch/account-settings) one or multiple receiver e-mail addresses have to be added to make it possible for the KOLIBRI Cloud to send alarm e-mails.  

![.](../../img/troubleshooting/add-email-for-system-and-device-alarm.png)  

---
## The device stopped sending / *'Device stopped transmitting'*-alarm triggered

**Problems**  
With cellular technology, multiple reasons for one failed transmissions can arise. The cellular technology based KELLER devices (GSM/ARC1/ADT1) can handle a few failed transmission by automatically resending the missing data. 
In LoRaWAN a 100% reliability is not given by protocol design. Failed transmissions will not be repeated automatically.  
Nevertheless, missing *five* transmissions is considered worthy of alarm.  

### Common causes
- The sending device
  - has no battery power left
  - has communication problems
    - because of heavy rain
    - because of it is underwater
    - because the antenna/gateway is not reacting (G netz down, antenna change, gateway not here or powerddown...)
    - because of a defect level probe or cable
  - electronics are damaged
  - SIM card invalid
- The FTP/Mail server is not reachable

**Possible reasons and solutions**  

#### ⚡ *The sending device has no battery power left*
   - To identify this problem please analyze the 'Battery Info' of the device on https://www.kolibricloud.ch/. Also, there should have been a *Device Alarm* in the *Alarms* list with a warning.
   - If the battery voltage and/or battery capacity is lower than the battery needs to be replaced.

#### ⚡ *The sending device has communication problems because of heavy rain/snow* 
   - To identify this problem please analyze the 'Signal strength' of the device on https://www.kolibricloud.ch/ and, if possible, cross-reference the data with past weather data. Does the signal strength get worse when there is heavy rain/snow fall?
   - If the weather has an impact then consider re-position or protect the antenna. The higher the position the better.
   - Even with a free line of sight there might be issues due to [Fresnel zones](https://en.wikipedia.org/wiki/Fresnel_zone)

#### ⚡ *The sending device has communication problems because of it is underwater* 
   - To identify this problem please analyze the 'Signal Strength' and the 'Humidity' of the device on https://www.kolibricloud.ch/ :
   - If the humidity continues to rise, the signal strength immediately drops and the communication stopped, consider a water damage or the possibility of an overflooded device. Consider verifying the state of the sending device in the field.
#### ⚡ *The sending device has communication problems because the antenna/gateway is not reacting* 
   - todo (G netz down, antenna change, gateway not here or powerddown...)  
#### ⚡ *The sending device electronics are damaged* 
   - todo, sabotage or external influences
#### ⚡ *The SIM card invalid*
   - todo SIM card cost/abo 
#### ⚡ *The FTP/Mail server is not reachable* 

Be aware that all KELLER remote sending devices are also logger. And even when communication is not possible measurements will be made and stored. The measurement files can even be extracted (with 'KOLIBRI Desktop') and uploaded into the KOLIBRI Cloud.

**How was the alarm triggered**  
Every device in the KOLIBRI Cloud is checked daily (03:30 UTC). If a device missed *at least five* transmission at this moment, it will trigger a *'Device stopped transmitting'*-alarm.

---
## The humidity in the device is too high / *'Humidity'*-alarm triggered

**Problem**  
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

**Possible solution**   
At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.

**How was the alarm triggered**  
The alarm is triggered when the humidity level is above 90%. This is checked every 6 hours.

---

## The battery capacity is too low / *'Battery Capacity'*-alarm triggered

**Problem**  
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

**Possible solutions**  
At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.

**How was the alarm triggered**  
alarm condition 1  
alarm condition 2

---

## The battery voltage is too low / *'Battery Voltage'*-alarm triggered

**Problem**  
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

**Possible solutions**    
At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.

**How was the alarm triggered**  
alarm condition 1  
alarm condition 2

---
