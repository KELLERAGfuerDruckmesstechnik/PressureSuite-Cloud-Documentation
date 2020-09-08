---
title: How-Tos
menu:
    main:
        parent: overview
        weight: 3
toc: true
description: Some FAQ but rather technical and specific.
---

# How-Tos

## How to connect the KOLIBRI Cloud with my Database/Leitsystem?

The best way is to use the KOLIBRI Cloud API to periodically gather measurement data from the KOLIBRI Cloud API. When the data is loaded from the API it can be transformed or stored in your database system.  

This is an example SW (Python) that shows the connection and data loading: <https://github.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-API-daemon-example-with-access-token>  

Please be aware that you need a valid AccessToken. See <https://docs.kolibricloud.ch/cloud-interfaces/api>  
Ask for a permanent Access Token that is bound to your user account.  

## Can I use KOLIBRI Cloud and the Datamanager at the same time for the same devices?

No, this is not possible. Both use FTP folders and both grab the data in a periodic fashion. After getting the data, the data is deleted on the FTP server. Would both software tools try to get the data, the faster one gets the data and other not. This behaviour is programmed into the Datamanger and can not be changed as there are no new changes implemented in the DataManager SW.

## How to add a KOLIBRI Cloud Chart into my Website?

Currently, it is not possible to export/display KOLIBRI Cloud Charts to another website.
Consider periodically load the measurement data from the KOLIBRI Cloud API, store it in a (online) data base.  
Users have good experience with solutions like <https://grafana.com/> (demo: <https://play.grafana.org/)> where it is possible to export an IFrame. There are many such platforms (Prometheus, Kibana, …).
It is even possible to use "Google Spreadsheet" as a "database" and visualization tool. Here an older demo from 2017: <http://www.gsmdata.ch/Lora/Leo5SwisscomTestModule.html>

## How to build an own Web App / Mobile App with KOLIBRI Cloud?

As the whole www.kolibricloud.com-"Web App" gets all the information through the KOLIBRI Cloud API it is also possible to re-design an own App and just use the KOLIBRI Cloud API to get the data and present them.  
Alternately, it is possible to periodically gather the measurement data and develop an own API.

## LoRa and Loriot.io, Swisscom, KPN, Digita ... : How do I connect my device to the KOLIBRI Cloud?

Use [the same procedure as with TTN](https://docs.kolibricloud.ch/sending-technology/lora-technology/integration-with-ttn/) but with the specific named services (eg. "HTTP Post").  
For *Actility*/*Thingspark* based platforms used by Swisscom, KPN, Digita etc please see https://docs.kolibricloud.ch/sending-technology/lora-technology/integration-with-actility/  
The [KOLIBRI support team](<kolibri@keller-druck.com>) can help you with the integration.

## LoRa: I want LoRa technology but not share my data in any cloud. What are my options?

The KOLIBRI Cloud does not support this right now. Meaning, it is not possible to run the KOLIBRI Cloud locally. There are possibilities like using a [*Wifx LORIX One* Gateway](https://www.lorixone.io/) and run it with a the [*loraserver.io* LoRa Gateway OS](https://www.loraserver.io/lora-gateway-os/overview/) that stores the measurement and offers an API.

## How do I get calculated data from the API?

Currently, we do not offer calculated data such as "water levels", "tank levels" etc through the API.
  
Besides technical and security reasons:

- We believe it will cause more trouble for customers to have this option activated. You can continuously fetch measurements from the Cloud API and automatically store it in the customers DB/system.  
 Now, when anyone (you, another authorized user, your customer) who has write-access changes the calculation settings on the Cloud web page the calculated values will change, too. This might happen by accident and the API starts to deliver false calculation values.  
- We from KELLER try to deliver you the rawest measurement data we get from our sensors and believe that when you integrate them into a customer's system then you have to manage and guarantee the calculation, too.  
  
The water calculation itself is not that complicated. You can see the formula in the Cloud web app.
