---
title: Integrate with The Things Network (TTN)
menu:
    main:
        parent: lora-technology
        weight: 5
toc: false
description: Information on how to integrate a configured KELLER LoRa device to the TTN platform
---

## Warning: Upcoming 'The Things Network' V2 to V3 migration

![V2 to V3 Warning](../../TTN_V2_to_V3_Warning.png  "V2 to V3 Warning")  

The Things Network is changing from V2 to V3 stack.
This means:  

- From April 2021 on, no new devices can be added to the old V2 stack at https://console.thethingsnetwork.org/. V3 is available on https://eu1.cloud.thethings.network/console/
- The devices working with TTN and the KOLIBRI Cloud will still work.
- TTN plans to shut down all V2 servers in September 2021. From then on all devices and gateways needs to be migrated.  
- The KOLIBRI Support team updated its backend: V2 and V3 work in parallel.
- There might be a point where all LoRaWAN devices and Gateways working over TTN will have to be updated.
- For this scenario we will implement, test and inform all customers as soon as possible.

More information from TTN: https://www.thethingsnetwork.org/forum/t/the-things-network-upgrade-to-v3/43256

## TTN V3 guide

### What you need
- An account on 'The Things Network'. If you do not have one than please sign up on https://www.thethingsnetwork.org/
- A KELLER LoRa device (ADT1 LoRa or ARC1 LoRa)
- [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) and a USB connector cable (ARC1: K114 interface converter / ADT1: Micro USB cable)
- The Device EUI number of the device (Use the [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) to extract the EUI)
- The Application EUI number of the device (Use the [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) to extract the EUI)
- The KOLIBRI Endpoint URL which is: `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`

### Step 1  

- During the order of the device ask your sales person to let the device pre-configure by the KOLIBRI support team. This helps to speed up and simplify your configuration work. Technical documentation for the configuration of a KELLER LoRa-device can be found [here](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device).

### Step 2  

- Go to <https://eu1.cloud.thethings.network/console/> and **+Add Application** if you do not have one. Set a **Application ID** and the **Owner**.  

![Create a TTN V3 Application](../../TTNV3_CreateApplication.png  "Create a TTN V3 Application")

### Step 3

- In the application (eg https://eu1.cloud.thethings.network/console/applications/app-for-my-company) **+Add end device** with
  - Activation mode: OTAA
  - LoRaWAN version: MAC V1.0.2  

![TTN V3 Add a Device 1](../../TTNV3_AddDevice1.png  "TTN V3 Add a Device 1")

### Step 4

- Set the *Basic settings* by
  - Choosing an **End device ID** name
  - Entering the AppEUI from the device (See [How to configuring a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))
  - Entering the DevEUI from the device (See [How to configuring a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))

![TTN V3 Add a Device 2](../../TTNV3_AddDevice2.png  "TTN V3 Add a Device 2")

### Step 5

- Set the *Network layer settings* by
  - Choosing an frequency plan. In Europe choose **"Europe 863-870 MHz (SF9 for RX2 - recommended)"**
  - Choosing Regional Parameter version: **PHY V1.0.2 REV B**

![TTN V3 Add a Device 3](../../TTNV3_AddDevice3.png  "TTN V3 Add a Device 3")

### Step 6

- Set the *Join settings* by
  - Generate an AppKey and store the key. This key is needed to assign, verify and program the device.

![TTN V3 Add a Device 4](../../TTNV3_AddDevice4.png  "TTN V3 Add a Device 4")

- If you forgot to store the key. It is also possible to copy the key after adding the device:  

![TTN V3 Add a Device 5](../../TTNV3_AddDevice5.png  "TTN V3 Add a Device 5")

### Step 7

- Connect your PC using the [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) and 
  - Check if you used the same Application EUI
  - Enter the generated App Key from *Step 6*
  - Program your device (See [How to configuring a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))  

![LoRa Setup LoRa Settings](../../LoRaSetup-LoRaSettings.png  "LoRa Setup LoRa Settings")

### Step 8

- If you have a TTN gateway in reach you should now be able to communicate with the TTN server.
- When you want to register a new TTN gateway into TTN V3 then go to https://eu1.cloud.thethings.network/console/gateways/add
  - Enter the **Gateway EUI** from the Gateway and choose a **Gateway ID**
  - Use the same *frequency plan* and set the *Gateway Status* to **Public**

### Step 9

- This step is optional. You can add the KELLER Payload Decoder to decode the payload string into readable Measurements/Information visible in the Live-Editor.
  - The most recent KELLER Payload Decoder code is on [Github](https://github.com/KELLERAGfuerDruckmesstechnik/KellerAgTheThingsNetworkPayloadDecoder/blob/master/PayloadDecoderFunction.js)
  - Got to **Payload formatters** in your application and paste the decoder code into *Uplink*  using **Javascript** formatter type.

![Add KELLER Payload Decoder](../../TTNV3_AddPayloadDecoder.png  "Add KELLER Payload Decoder")

### Step 10

- To send data to the KOLIBRI Cloud it is needed to forward the transmissions.
  - Go to **Integrations** and **+Add Webhook** in **Webhooks**
  - Choose **Custom webhook**
  - Choose a *Webhook ID* such as *webhook-to-kolibri*
  - *Webhook format* is **JSON**
  - *Base URL* is `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  
  - Enable all **Uplink messages**
  - Press **Add webhook**
This will forward a transmission to the KOLIBRI Cloud.  

![TTN V3 Webhook Integration](../../TTNV3_AddIntegrationToKolibri.png  "TTN V3 Webhook Integration")  

### Step 11

- To make your device visible on www.kolibricloud.ch it is needed to add it
  - In the **Account Settings** on https://www.kolibricloud.ch enter the Device EUI of the LoRa device and press **Add Device**
  - The device should now be visible in the device list. If adding is not possible and a red popup is shown, please contact the KOLIBRI Support Team kolibri@keller-druck.com

![Add LoRa Device To Own Group](../../AddLoRaDeviceToOwnGroup.png  "Add LoRa Device To Own Group")  
wait until the KOLIBRI Cloud support assigned the device to your group. otototototottotoot

## Obsolete TTN V2 guide
### What you need
  
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