---
title: Architecture
menu:
    main:
        parent: overview
        weight: 2
toc: false
description: Architectural overview. What components are used and how.
---

# System architecture
![Architectural Overview](https://docs.kolibricloud.ch/cloud-interfaces/img/KellerCloud_Architecture.png"Architectural Overview")


![Architecture part 1](../../img/arch2.png)
*Using a ARC device lets the sensor send measurement data per GSM/UMTS/LTE to the next antenna and from there via internet to a configured FTP server. The measurement data or configuration information are stored in text files. It is also possible to store the data on a mail server but we do not recommend this as FTP is more reliable than SMTP/POP. If you do not want to host a FTP server than KELLER can create one for you as part of the KOLIBRI Cloud set up process.*  

*Normally, measurements will be periodically stored (e.g. every 1h) and send after reaching a certain amount of measurements (e.g.after 24 measurements = every 24h).*
*The ARC device can be configured in a way that it immediately triggers and sends a SMS/Email-alarm. E.g. when the water level reached a critical level.*

![Architecture part 2](../../img/arch1.png)  
*When using a KELLER device that is using the LoRa sending technology than*

![Architecture part 3](../../img/arch3.png)


![Architecture part 4](../../img/arch4.png)


![Architecture part 5](../../img/arch6.png)


![Architecture part 6](../../img/arch5.png)

- The data of our sensors is regularly stored in FTP/mail server.
- The KOLIBRI Cloud in the background is also a collection of many small programs (Azure Functions), which do regular tasks. For example, every 5 minutes all FTP/mail servers are checked for new data and new data is stored in a data queue.
- As soon as a new telegram is available at LoRa, it will be stored in a data queue.
- Another program controls the data queue and analyses the content and origin. The data will then be converted and stored in a database.
- There are other programs that regularly check the measured data and abnormalities and, if necessary, generate alarms and send emails.
- At the same time there is this- (our) API. This is the gateway to the database. No customer can access the database directly. Everything goes through the API.
- You can log in with username/password. An external service authorizes the user and responds with a special key that identifies the user correctly and allows the user to use our API.
- Thanks to the key, the API knows what data it is allowed to send to the user / program.
- The WebApp is such a program that collects all data via the API. The measurement data are also sent in compressed&encrypted text formats to the WebApp. The WebApp (App = Application = Program) generates a chart itself based on the measured data.1)
