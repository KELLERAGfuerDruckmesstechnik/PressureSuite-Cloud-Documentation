---
title: Integrate with Actility/ThingsPark (Swisscom/Digita/KPN/...)
menu:
    main:
        parent: lora-technology
        weight: 5
toc: false
description: Information on how to integrate a configurated LoRa KELLER to the Actility plattform
---
# Cookbook guide
### What you need
 - Access to the ThingPark/Actility portal of your mobile network provider (eg. Swisscom, Digita, KPN)
    - Access to the "deviceManager" (E.g. Swisscom: https://portal.lpn.swisscom.ch/deviceManager/)
    - Optional: Access to the "Logger" (E.g. Swisscom: https://portal.lpn.swisscom.ch/thingpark/wlogger/gui/)
 - A KELLER LoRa device
 - The EUI number of the device (Use the GSMSetup-tool to extract the EUI)
 - The App key (Use the GSMSetup-tool to extract or write the key)
 - The KOLIBRI Endpoint URL which is: ```https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==```

### Step 1
<img src="../../integrateActility/1.png"/>  

Log into the portal and *Create* a *application server*  

### Step 2
<img src="../../integrateActility/2.png"/>  

Give a *Name*, choose *Content Type* **JSON** and set the *Status* to **Active*  
Add a the destination URL which is the KOLIBRI Endpoint URL for LoRa devices and *Save* the *Application Server*  

### Step 3
<img src="../../integrateActility/3.png"/>  

*Create* a *AS Routing profile*  

### Step 4
<img src="../../integrateActility/4.png"/>  

Give a *Name*; and *Add* the new created application server as a *Local application server*. *Save* the *AS routing profile*  

### Step 5
<img src="../../integrateActility/5.png"/>  

Go to *Devices* and choose your device from the list.  
You might have to *create* the device first.
//TODO: Add description for device creation with app key, EUI key and GSMSetup tool.

### Step 6
<img src="../../integrateActility/6.png"/>  

With the chosen device, select the *Network*.  

### Step 7
<img src="../../integrateActility/7.png"/>  

In the middle of the page there is the *Network routing*. Please *change* the *AS routing profile* to the new created one. 

### Step 8 
If the device is already in a accessible KOLIBRI Cloud group it should be possible to see new measurement data from the device. With the connected GSMSetup-tool it is possible to manually execute the sending of measurement data or device information.