---
title: Integrate with Actility/ThingsPark (Swisscom/Digita/KPN/...)
menu:
    main:
        parent: lora-technology
        weight: 6
        
toc: false
description: Information on how to integrate and configure a KELLER LoRaWAN device to the Actility platform
---
# Cookbook guide

## What you need

- Access to the ThingPark/Actility portal of your mobile network provider (eg. Swisscom, Digita, KPN)
  - Access to the "deviceManager" (E.g. Swisscom: <https://portal.lpn.swisscom.ch/deviceManager/)>
  - Optional: Access to the "Logger" (E.g. Swisscom: <https://portal.lpn.swisscom.ch/thingpark/wlogger/gui/)>
- A KELLER LoRa device
- The EUI number of the device (Use the GSMSetup-tool to extract the EUI)
- The App key (Use the GSMSetup-tool to extract or write the key)
- The KOLIBRI Endpoint URL which is: `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`

### Step 1

Log into the portal and **Create** a **application server**  
![Create an application server](../../thingpark/001_create_app_server.png  "Create an application server")  

### Step 2

Give a **Name**, choose **Content Type** *JSON* and set the **Status** to **Active**  
Add a the destination URL which is the KOLIBRI Endpoint URL for LoRa devices and **Save** the **Application Server**  
![Configure an application server](../../thingpark/002_configure_app_server_2.png  "Configure an application server")

### Step 3

**Add a Route** to add a route and add a destination. The destination for the KOLIBRI Cloud is:  
   ```https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==```  

![Configure an application server](../../thingpark/002_configure_app_server_add_destination_1.png  "Configure an application server")

### Step 3B

Alternatively, it is possible to use a free service like https://webhook.site/ or https://putsreq.com/ to generate an own endpoint in order to test the communication before adding it to the KOLIBRI Cloud.  
![Test with webhook.site first](../../thingpark/002_configure_app_server_add_destination_2.png  "Test with webhook.site first")

### Step 4
**Create** a routing profile in **AS Routing profiles**.  
Give a **Name** and **Add** the new created application server as a **Local application server**. **Save** the **AS Routing profile** with the top right **Save** button.  
![Create a routing profile](../../thingpark/003_create_routing_profile_2.png "Create a routing profile")

### Step 5A
Before the device can be created it first has to be configured, too. Use the tool ["GSM setup for remote transmission units and its manual"](https://keller-druck.com/en/downloads?id=nBhPS8HkSDJkB6azedxsAB#results) and a similar process like in https://docs.pressuresuite.com/sending-technology/gsm-technology/ 

### Step 5B
Under [Settings] choose the correct "Connection Device/type" based on the attached sensor/probe.  
In [Error/Status] the measured values of all channels can be seen and indicates which channels are of interest.  
![Configure a LoRa device 1](../../thingpark/004_configure_device_1.png  "Configure a LoRa device 1") 

### Step 5C
In [Settings] choose only the channels that are of interest. As smaller the amount of chosen channels as better it is for the LoRaWAN transmission.  
![Configure a LoRa device 2](../../thingpark/004_configure_device_2.png  "Configure a LoRa device 2") 

### Step 5D
Under [LoRa Settings] generally use the default values unless you now exactly what you are doing. See https://docs.pressuresuite.com/sending-technology/lora-technology/update-keller-lora-device/  
Write down the **Device EUI** and the **App Key**.  
The **Application EUI** has to be programmed based on the provider. For Swisscom this is ```F0-3D-29-AC-71-00-00-01```.  
![Configure a LoRa device 3](../../thingpark/004_configure_device_3.png  "Configure a LoRa device 3") 


### Step 6
**Create** a device and add the same settings as seen in the picture below. Just use the individual **Device EUI** and the **App Key**.  The **Application EUI** has to be programmed based on the provider. For Swisscom this is ```F0-3D-29-AC-71-00-00-01```.  
Use the correct **Connectivity plan** based on the contract with your service provider.  
Under "Application server routing profile" choose routing profile which was created before.  
![Create a device](../../thingpark/005_create_device.png  "Create a device") 

### Step 7
If the device is already in a accessible KOLIBRI Cloud group it should be possible to see new measurement data from the device. With the connected GSMSetup-tool it is possible to manually execute the sending of measurement data or device information.  
It is now possible for contributor users to **ADD LoRa devices** in the account settings (https://www.pressuresuite.com/account-settings)

### Tips:
- The above guide is based on the experience with Swisscom that uses the Actility/ThingPark Wireless platform. It is assumed that other telecom company such as Digita or KNP are using the same platform and therefore have similar steps. Please consult and prefer the guides provided by the telecom company.  

- To force a join it is sometimes helpful to remove and attache the battery of the ADT1.  

- In the ThingPark Wireless "Device Manager" the devices are sometimes not found in the devices menu. They can be easier found when choosing the "List" tab.  

-  Deleting a device and re-adding it can cause an error by the platform. It is better to log out and login after deleting to be able to Add a device.