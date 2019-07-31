---
title: Which sending technology is the right for me?
menu:
    main:
        parent: overview
        weight: 1
---

# Differences between LoRa and GSM

**GSM** is the second generation mobile telephone system. It is mainly meant for voice, but also supports data in the form of SMS and GPRS. Because this is an old system, it is widely adopted.

**LTE** is the 4th generation mobile network system. Even though it supports voice calls, it was designed for better scalability and wireless broadband. The range is normally less than GSM, but the attainable data rate is orders of magnitude more. LTE can compare to long range WiFi.

The nature of the **LoRa** network potentially allows IoT devices to run for years on small batteries, occasionally sending out small packets of data, waiting for a short time for response messages, and then closing the connection until more data needs to be sent.

GSM/UMTS/LTE    | LoRa
--------|------
| Bundled transfer of multiple measurements together after a certain time period | Continuos transfer of single set of measurements in a short time period | 
| Example: 24 measurement set every day sent daily | Example: 1 measurement set every 15 minutes | 
| Example data size: 5000B  | Example data size: 64B | 
| Big (expensive) industrial grade battery | Small battery  | 
| Range: 2km(LTE) - 35km(GSM) | Range: 5-15km typical (heavily dependant on line of sight) | 
| Communication from device to a mobile telephone provider antenna | Communication from device to either a LoRa Gateway or a LoRa-compatible antenna from a mobile telephone provider | 
| 👍 Existing Coverage & High data rate | 👍 Low power & Lower cost & "Real Time"-Data| 
| 👎  Requires a contract with a mobile telephone service provider. Requires a lot of energy. | 👎 Requires investing in one’s own network with base stations, a community network or getting a contract with a service provider that has coverage where you need it. | 

## Important questions for a decision between LoRa and GSM/UMTS/LTE  
- Do I have a mobile telephone provider antenna near the device?  
- Do I have a TTN gateway near the device? Or are there LoRa-compatible antennas near my device?  
- What is your budget? Depending of the amount of needed devices: LoRa devices have the potential to lower the cost.  
- How important are "real time" data for my application?  
- Is it ok that a LoRa Network provider temporary stored my measurement data?  
- Why not try out a device from KELLER with the KOLIBRI Cloud and try it out in your environment for your application? In just a couple of days you have a proof-of-concept of your application!  