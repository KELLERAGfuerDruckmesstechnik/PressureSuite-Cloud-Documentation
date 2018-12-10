---
title: Intro
menu:
    main:
        parent: overview
        weight: 1
---

# The KOLIBRI Cloud

## From KELLER transmitter to the Cloud?

![alt text](../img/ArcArchitecture.png "Architecture Overview")

One or more sensors are connected to an data transmitter unit (such as "ARC-1") and transmit data to a FTP-Server or a Mail-Server using a network provider. When using the KOLIBRI Cloud the FTP-Server are automatically gathering the data, transform them in a understandable format and store them in a database hosted in a professional data warehouse. This database is accessible through an API. Authenticated users can access the the API. One way to access the API is using the KOLIBRI Cloud web application.


## Overview 

The Internet of Things starts with a sensor. Understand the versatile range of the precise pressure sensors and everything that can be connected with them in order to communicate with the Internet. Please refer to [KELLER devices](/keller-devices/) documentation page.
![alt text](../img/ArcArchitecture_1.png "Devices Overview")
#
#
#

There are multiple ways to connect devices to the Internet. LoRa, NB-IoT or the good old GSM... What is the best for your use case? Find out in the [Sending Technology](/sending-technology/) page.
![alt text](../img/ArcArchitecture_3.png "Interfaces Overview")
#
#
#

APIs are the hidden backbone of our modern world which allow software programs to communicate with one another. The web app www.kolibricloud.com is just one way to connect to one API. We show how these multiple Software application can work together and communicate. Please refer to the [Interfaces](/cloud-interfaces/) page.
![alt text](../img/ArcArchitecture_2.png "Interface Overview")
#
#
#
