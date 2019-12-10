---
title: LoRa Overview
menu:
    main:
        parent: lora-technology
        weight: 1
---

# The LoRa technology

Being an [early adopter](https://www.thethingsnetwork.org/labs/story/pressure-manometer-node-shows-live-data-on-a-website-1) and member of the LoRa Alliance since 2016 KELLER has a lot experience with LoRa.

LoRaWAN™: **Lo**ng **Ra**nge **W**ide **A**rea **N**etwork, is a protocol developed by the LoRa Alliance.

The peculiarity of this new protocol is the efficiency; because LoRaWAN™ has the minimal power consumption, long range of communication (up to 15km in rural areas) and secure data transmission (with AES-128 encryption).

The range of communication is around 2km in dense urban area, up to 15km in the rural areas and is influenced by the position of the end device and of the gateway, if the gateway is mounted in an high place the cover will be major than if is mounted in a low place.

LoRaWAN™ is part of a bigger category of technologies named LPWAN, that stands for Low Power Wide Area Network, this technology was born for the necessity of sending and receiving messages from sensor that operate on battery, using the smallest amount of energy available to preserve the battery energy.

An excellent documentation of the LoRaWAN technology can be found here: <https://www.thethingsnetwork.org/docs/lorawan/>

<iframe class="vidyard_iframe" src="//play.vidyard.com/NYGC6QZQ3kqBgzUcfgPSjh.html?v=3.1.1" width="640" height="360" scrolling="no" frameborder="0" allowtransparency="true" allowfullscreen></iframe>

<iframe class="vidyard_iframe" src="//play.vidyard.com/sH5PVAGX196UzG1ABCWdYC.html?v=3.1.1" width="640" height="360" scrolling="no" frameborder="0" allowtransparency="true" allowfullscreen></iframe>

There are many youtube channels with interesting content about LoRa and alternatives. For example:
[![LoRa / LoRaWAN De-Mystified (English)](https://img.youtube.com/vi/hMOwbNUpDQA/0.jpg)](https://www.youtube.com/watch?v=hMOwbNUpDQA)

## What is needed to get measurement data from a KELLER device via LoRa?

1. A KELLER device. See <https://docs.kolibricloud.ch/keller-devices/overview/>  
2. A way to send to the Internet  
    - Buy a LoRaWAN gateway. See <https://www.thethingsnetwork.org/docs/gateways/start/list.html>. Depending on your location you might be lucky and can use an existing TTN gateway. See <https://www.thethingsnetwork.org/map> or <https://ttnmapper.org/> to find the nearest community TTN gateway.
    - OR: In certain countries mobile communication provider offer a connection to their LoRa-compatible antennas. See <https://docs.kolibricloud.ch/sending-technology/lora-technology/partners/> for example coverage maps. You do not have to buy a gateway but pay a monthly/yearly fee to your provider.  
3. Choose a [LoRa Network server](https://docs.kolibricloud.ch/sending-technology/lora-technology/partners/)
4. Connect the LoRa devices with your LoRa Network server and test the connection
5. You might want to use the KOLIBRI Cloud to test your application by using this process: <https://docs.kolibricloud.ch/overview/process/>
6. Forward your LoRa telegrams to the cloud using the KOLIBRI Cloud endpoint URL
