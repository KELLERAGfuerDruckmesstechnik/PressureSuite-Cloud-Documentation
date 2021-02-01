---
title: Integrate with The Things Network (TTN)
menu:
    main:
        parent: lora-technology
        weight: 5
toc: false
description: Information on how to integrate a configured KELLER LoRa device to the TTN plattform
---
# Warning: The Things Network V2 to V3 migration  
![V2 to V3 Warning](../../TTN_V2_to_V3_Warning.png  "V2 to V3 Warning")  

The Things Network is changing from V2 to V3 stack.
This means:  
 - From April 2021 on, no new devices will be able to be added to the old V2 stack at https://console.thethingsnetwork.org/. V3 is available on https://eu1.cloud.thethings.network/console/
 - The devices working with TTN and the KOLIBRI Cloud will still work.
 - Until TTN decides to shut down all V2 servers. We don't know when this will happen.
 - The KOLIBRI Support team will update it's backend and make V2 and V3 work in parallel.
 - There might be a point where all LoRaWAN devices and Gateways working over TTN will have to be updated.
 - For this scenario we will implment, test and inform all customers as soon as possible.

More information from TTN: https://www.thethingsnetwork.org/forum/t/the-things-network-upgrade-to-v3/43256

# TTN V2 guide

## What you need
  
- Access to the TTN portal https://www.thethingsnetwork.org/. An account is free and the entry page is https://console.thethingsnetwork.org/  
- A KELLER LoRa device
- The EUI number of the device (Use the GSMSetup-tool to extract the EUI)  
- The App key (Use the GSMSetup-tool to write the key)  
- The KOLIBRI Endpoint URL which is: `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  


A [KELLER LoRa device](https://docs.kolibricloud.ch/keller-devices/overview/) can be added to the KOLIBRI Cloud using the following steps:  
  
### Step 1  
- During the order of the device ask your sales person to let the device pre-configure by the KOLIBRI support team. This helps to speed up and simplify your configuration work. Technical documentation for the configuration of a KELLER LoRa-device can be found [here](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device).  

### Step 2  
- Go to <https://console.thethingsnetwork.org/> and **Create** a **application server**. Use the given app key and program it into the LoRa device using the [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) and program the device with the application key.  

### Step 3  
- Verify your connection with your gateway by seeing a transmission with a payload in the [TTN console](https://console.thethingsnetwork.org/). You may optionally use the [KELLER LoRa Payload Decoder code](https://github.com/KELLERAGfuerDruckmesstechnik/KellerAgTheThingsNetworkPayloadDecoder) to decrypt the real channel values and visualize them in the TTN console.  
![TTN LoRa Decoder](/cloud-interfaces/img/TTN_PayloadDecryptor.png  "TTN LoRa Decoder")  

### Step 4  
- Choose **HTTP integration** and enter a POST method to forward the URL to  
`https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  
This will forward a transmission to the KOLIBRI Cloud.  
- Process ID : Enter the name of the integration which doesn't have an effect  
- Other fields are empty:  
  - Authorization: Leave empty  
  -	Custom Header Name: Leave empty  
  -	Custom Header Value: Leave empty  
![TTN HTTP Integration example](../../TTNIntegration_Integration.png  "TTN HTTP Integration example")  

### Step 5
- If the device is already in a accessible KOLIBRI Cloud group it should be possible to see new measurement data from the device. With the connected GSMSetup-tool it is possible to manually execute the sending of measurement data or device information.  If the device is not visible on www.kolibricloud.ch then please wait until the KOLIBRI Cloud support assigned the device to your group.  