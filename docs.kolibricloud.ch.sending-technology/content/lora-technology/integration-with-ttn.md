---
title: Integrate with The Things Network (TTN)
menu:
    main:
        parent: lora-technology
        weight: 5
toc: false
description: Information on how to integrate a configured KELLER LoRa device to the TTN platform
---

## Warning: Upcoming 'The Things Network' V2 to V3 Migration

The Things Network is changing from V2 to V3 stack.
This means:  

- From April 2021 on, no new devices can be added to the old V2 stack at https://console.thethingsnetwork.org/.   V3 is available on https://eu1.cloud.thethings.network/console/
- The devices working with TTN and the KOLIBRI Cloud will still work until December 2021.
- TTN plans to shut down all V2 servers in September 2021. From then on all devices and gateways needs to be migrated.  
- The KOLIBRI Support team updated its backend: V2 and V3 work in parallel.
- There might be a point where all LoRaWAN devices and Gateways working over TTN will have to be updated.
- The below migration guide is tested with a couple of devices and gateways and should work, but KELLER can not guarantee this. In the worst-case scenario, one has to be connected to the KELLER device for a migration. Best case: The below migration works "remotely" and can be done in a couple of minutes.

More information from TTN: https://www.thethingsnetwork.org/forum/t/the-things-network-upgrade-to-v3/43256

For those who missed the warnings about the shutdown of TTN V2 (since February) and didn’t manage to migrate their devices before the migration deadline of September 30, for those who didn’t make it to the December 1 traffic API shutdown, and even for those who didn’t export their devices before the final shutdown of V2 on December 7, TTN is happy to announce the new The Things Network V2 Take-Out Tool:  https://v2takeout.thethingsnetwork.org/ 

After signing in with The Things ID, this tool will let you see the applications you had on V2, as well as the end device registrations and state at the time of the final shutdown on December 7. You can use it to download a ZIP file containing application information, payload formatters and a CSV file with end device registrations.  The take-out tool will be available until The Things Conference 2022, after which the old V2 data will be destroyed.  

---
---
---

## Migrate Existing Device from TTN v2 to TTN V3 Guide

### What you need

- The existing account on https://v2console.thethingsnetwork.org/ (V2)
- The migrated account to https://eu1.cloud.thethings.network/console/ (V3)
- The KOLIBRI Endpoint URL is: `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`
- A gateway migrated to V3 (https://www.thethingsindustries.com/docs/getting-started/migrating/gateway-migration/)

### Step 0

- Please read all steps in below guide before starting.
- This guide focuses on migrating the KELLER devices from V2 to V3 'remotely'. Our tests showed success, but there might be combinations where it is necessary to go to each device and re-program it.
- The guide has many manual steps. Depending on the count of devices a programmatic approach might be interesting. See https://www.youtube.com/watch?v=JUEJ_9LdnuI. When you have less than 20 devices we recommend to do it manually.
- The LoRaWAN gateway should also be migrated to V3. This is not covered in this guide.
- We recommend to start with one device and test it with one instead of migrating all devices at once.

### Step 1

- We recommend updating your gateway to V3 first. The idea is that the V2-devices still will send transmissions to TTN over the gateway. This worked in our environment, but it is not guaranteed that this will work with you gateway setup. There might be gateway where firmware-updates are necessary.
  - https://www.thethingsindustries.com/docs/getting-started/migrating/gateway-migration/
  - https://www.thethingsindustries.com/docs/gateways/


### Step 2A

- Go to <https://eu1.cloud.thethings.network/console/> and **+Add Application** if you do not have one. Set an **Application ID** and the **Owner**.  

> ![Create a TTN V3 Application](../../TTNV3_CreateApplication.png  "Create a TTN V3 Application")

### Step 2B
- This step has to be done ones for each new **Application**:
  - To send data to the KOLIBRI Cloud it is needed to forward the transmissions.
    - Go to **Integrations** and **+Add Webhook** in **Webhooks**
    - Choose **Custom webhook**
    - Choose a *Webhook ID* such as *webhook-to-kolibri*
    - *Webhook format* is **JSON**
    - *Base URL* is `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  
    - Enable all **Uplink messages**
    - Press **Add webhook**.  
    This will forward every transmission to the KOLIBRI Cloud.  

> ![TTN V3 Webhook Integration](../../TTNV3_AddIntegrationToKolibri.png  "TTN V3 Webhook Integration")  


### Step 3

- Login to the V2 account on https://v2console.thethingsnetwork.org/
- Note **Device EUI**, **Application EUI** and **App Key** for each device. You will need these keys later. Also, note the device's name.
> ![TTN V2 old console](../../ttn-v2-to-ttn-v3-old-console.png  "TTN V2 old console")

### Step 4

- In the application (e.g. https://eu1.cloud.thethings.network/console/applications/app-for-my-company) **+Add end device** with

> ![TTN V3 Add a Device 1](../../TTNv3-easy-01.png  "TTN V3 Add a Device 1")

### Step 5

- Choose the *Brand* which is **KELLER AG für Druckmesstechnik**  
> ![TTN V3 Add a Device 2](../../TTNv3-easy-02.png  "TTN V3 Add a Device 2")

### Step 6

- Choose the *Model* which is either
  - ADT1 Tube
  - ADT1 Box
  - ARC1 Tube
  - ARC1 Box
- Choose the correct *Profile* for your region. In Europe this is **EU_863_870**

> ![TTN V3 Add a Device 3](../../TTNv3-easy-03.png  "TTN V3 Add a Device 3")

### Step 7

- Now enter the **'Application EUI'**, **'App Key'** and the **'Device EUI'** which you have noted  
- Enter an *End Device ID* text to identify the device in the TTN portal. Preferably, the same or similar as in the V2 platform.

> ![TTN V3 Add a Device 4](../../TTNv3-easy-04.png  "TTN V3 Add a Device 4")

### Step 8

- Delete the device in the V2 platform (https://v2console.thethingsnetwork.org/). Without deletion the data will most probably not show up in the V3 platform.

### Step 9

- If you have a TTN gateway in reach, you should now be able to communicate with the TTN server.
- When you want to register a new TTN gateway into TTN V3 then go to https://eu1.cloud.thethings.network/console/gateways/add
  - Enter the **Gateway EUI** from the gateway and choose a **Gateway ID**
  - Use the same *frequency plan* and set the *Gateway Status* to **Public**
  
### Step 10

- To send data to the KOLIBRI Cloud it is needed to forward the transmissions.
  - Go to **Integrations** and **+Add Webhook** in **Webhooks**
  - Choose **Custom webhook**
  - Choose a *Webhook ID* such as *webhook-to-kolibri*
  - *Webhook format* is **JSON**
  - *Base URL* is `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  
  - Enable all **Uplink messages**
  - Press **Add webhook**.  
  This will forward a transmission to the KOLIBRI Cloud.  

> ![TTN V3 Webhook Integration](../../TTNV3_AddIntegrationToKolibri.png  "TTN V3 Webhook Integration")  

### Step 11

- Verify the connection by
  - waiting for the sending interval and seeing the transmission in the TTN V3 console.
  - finding the new measurement in the KOLIBRI Cloud
- Repeat *Step 3* to *Step 10* for each device 

---
---
---

## Add a New Device to TTN V3 Guide — New Easy Process

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

- Connect your PC using the [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) and 
  - Program your device according to your use case (See [How to configure a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))  
  - Write down the 'Application EUI', 'App Key' and the 'Device EUI'

> ![LoRa Setup LoRa Settings](../../LoRaSetup-LoRaSettings.png  "LoRa Setup LoRa Settings")


### Step 3

- Go to <https://eu1.cloud.thethings.network/console/> and **+Add Application** if you do not have one. Set an **Application ID** and the **Owner**.  

> ![Create a TTN V3 Application](../../TTNV3_CreateApplication.png  "Create a TTN V3 Application")

### Step 4

- In the application (e.g. https://eu1.cloud.thethings.network/console/applications/app-for-my-company) **+Add end device** with

> ![TTN V3 Add a Device 1](../../TTNv3-easy-01.png  "TTN V3 Add a Device 1")

### Step 5

- Choose the Brand which is **KELLER AG für Druckmesstechnik**  
> ![TTN V3 Add a Device 2](../../TTNv3-easy-02.png  "TTN V3 Add a Device 2")

### Step 6

- Choose the *Model* which is either
  - ADT1 Tube
  - ADT1 Box
  - ARC1 Tube
  - ARC1 Box
- Choose the correct *Profile* for your region. In Europe this is **EU_863_870**

> ![TTN V3 Add a Device 3](../../TTNv3-easy-03.png  "TTN V3 Add a Device 3")

### Step 7

- Now enter the 'Application EUI', 'App Key' and the 'Device EUI'
- Enter a device id text to identify the device in the TTN portal

> ![TTN V3 Add a Device 4](../../TTNv3-easy-04.png  "TTN V3 Add a Device 4")

### Step 8

- If you have a TTN gateway in reach, you should now be able to communicate with the TTN server.
- When you want to register a new TTN gateway into TTN V3 then go to https://eu1.cloud.thethings.network/console/gateways/add
  - Enter the **Gateway EUI** from the Gateway and choose a **Gateway ID**
  - Use the same *frequency plan* and set the *Gateway Status* to **Public**

### Step 9

- To send data to the KOLIBRI Cloud it is needed to forward the transmissions.
  - Go to **Integrations** and **+Add Webhook** in **Webhooks**
  - Choose **Custom webhook**
  - Choose a *Webhook ID* such as *webhook-to-kolibri*
  - *Webhook format* is **JSON**
  - *Base URL* is `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  
  - Enable all **Uplink messages**
  - Press **Add webhook**.  
  This will forward a transmission to the KOLIBRI Cloud.  

> ![TTN V3 Webhook Integration](../../TTNV3_AddIntegrationToKolibri.png  "TTN V3 Webhook Integration")  

### Step 10

- To make your device visible on https://www.kolibricloud.ch it is needed to add it
  - In the **Account Settings** on https://www.kolibricloud.ch enter the Device EUI of the LoRa device and press **Add Device**
  - The device should now be visible in the device list. If adding is not possible and a red popup is shown, please contact the KOLIBRI Support Team kolibri@keller-druck.com

> ![Add LoRa Device To Own Group](../../AddLoRaDeviceToOwnGroup.png  "Add LoRa Device To Own Group")  


---
---
---

##  Add a new device to TTN V3 Guide — Old Manual Process

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

- Go to <https://eu1.cloud.thethings.network/console/> and **+Add Application** if you do not have one. Set an **Application ID** and the **Owner**.  

> ![Create a TTN V3 Application](../../TTNV3_CreateApplication.png  "Create a TTN V3 Application")

### Step 3

- In the application (eg https://eu1.cloud.thethings.network/console/applications/app-for-my-company) **+Add end device** with
  - Activation mode: OTAA
  - LoRaWAN version: MAC V1.0.2  

> ![TTN V3 Add a Device 1](../../TTNV3_AddDevice1.png  "TTN V3 Add a Device 1")

### Step 4

- Set the *Basic settings* by
  - Choosing an **End device ID** name
  - Entering the AppEUI from the device (See [How to configure a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))
  - Entering the DevEUI from the device (See [How to configure a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))

> ![TTN V3 Add a Device 2](../../TTNV3_AddDevice2.png  "TTN V3 Add a Device 2")

### Step 5

- Set the *Network layer settings* by
  - Choosing a frequency plan. In Europe choose **"Europe 863-870 MHz (SF9 for RX2 - recommended)"**
  - Choosing Regional Parameter version: **PHY V1.0.2 REV B**

> ![TTN V3 Add a Device 3](../../TTNV3_AddDevice3.png  "TTN V3 Add a Device 3")

### Step 6

- Set the *Join settings* by
  - Generate an AppKey and store the key. This key is needed to assign, verify and program the device.

> ![TTN V3 Add a Device 4](../../TTNV3_AddDevice4.png  "TTN V3 Add a Device 4")

- If you forgot to store the key, it is also possible to copy the key after adding the device:  

> ![TTN V3 Add a Device 5](../../TTNV3_AddDevice5.png  "TTN V3 Add a Device 5")

### Step 7

- Connect your PC using the [GSM setup tool](https://keller-druck.com/en/products/software/desktop-applications/gsm-setup-for-remote-transmission-units) and 
  - Check if you used the same Application EUI
  - Enter the generated App Key from *Step 6*
  - Programm your device (See [How to configure a LoRaWAN device](https://docs.kolibricloud.ch/sending-technology/lora-technology/update-keller-lora-device/))  

> ![LoRa Setup LoRa Settings](../../LoRaSetup-LoRaSettings.png  "LoRa Setup LoRa Settings")

### Step 8

- When you have a TTN gateway in reach you should now be able to communicate with the TTN server.
- When you want to register a new TTN gateway into TTN V3 then go to https://eu1.cloud.thethings.network/console/gateways/add
  - Enter the **Gateway EUI** from the Gateway and choose a **Gateway ID**
  - Use the same *frequency plan* and set the *Gateway Status* to **Public**

### Step 9

- This step is optional. You can add the KELLER Payload Decoder to decode the payload string into readable Measurements/Information visible in the Live-Editor.
  - The most recent KELLER Payload Decoder code is on [GitHub](https://github.com/KELLERAGfuerDruckmesstechnik/KellerAgTheThingsNetworkPayloadDecoder/blob/master/ttn-v3-payload-decoder.js)
  - Got to **Payload formatters** in your application and paste the decoder code into *Uplink* using **Javascript** formatter type.

> ![Add KELLER Payload Decoder](../../TTNV3_AddPayloadDecoder.png  "Add KELLER Payload Decoder")

### Step 10

- To send data to the KOLIBRI Cloud it is needed to forward the transmissions.
  - Go to **Integrations** and **+Add Webhook** in **Webhooks**
  - Choose **Custom webhook**
  - Choose a *Webhook ID* such as *webhook-to-kolibri*
  - *Webhook format* is **JSON**
  - *Base URL* is `https://devspakellercloudfunctionapp.azurewebsites.net/api/HttpTriggerCSharp_PascalTTN?code=eQxVYd76shpatS8av6lzsn3XxNEbtCiE9psrJaasyeMk/fudmQQ5uw==`  
  - Enable all **Uplink messages**
  - Press **Add webhook**.  
  This will forward a transmission to the KOLIBRI Cloud.  

> ![TTN V3 Webhook Integration](../../TTNV3_AddIntegrationToKolibri.png  "TTN V3 Webhook Integration")  

### Step 11

- To make your device visible on www.kolibricloud.ch it is needed to add it
  - In the **Account Settings** on https://www.kolibricloud.ch enter the Device EUI of the LoRa device and press **Add Device**
  - The device should now be visible in the device list. If adding is not possible and a red popup is shown, please contact the KOLIBRI Support Team kolibri@keller-druck.com

> ![Add LoRa Device To Own Group](../../AddLoRaDeviceToOwnGroup.png  "Add LoRa Device To Own Group")  
wait until the KOLIBRI Cloud support assigned the device to your group. 

---
---
---