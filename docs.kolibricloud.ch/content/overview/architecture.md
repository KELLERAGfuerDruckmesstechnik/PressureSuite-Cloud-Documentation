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

---  


![Architecture part 1](../../img/arch2.png)  
*Using a ARC device lets the sensor send measurement data per GSM/UMTS/LTE to the next antenna and from there via internet to a configured FTP server. The measurement data or configuration information are stored in text files. It is also possible to store the data on a mail server but we do not recommend this as FTP is more reliable than SMTP/POP. If you do not want to host a FTP server than KELLER can create one for you as part of the KOLIBRI Cloud set up process.*  

*Normally, measurements will be periodically stored (e.g. every 1h) and send after reaching a certain amount of measurements (e.g.after 24 measurements = every 24h).*  

*The ARC device can be configured in a way that it immediately triggers and sends a SMS/Email-alarm. E.g. when the water level reached a critical level. Only one alarm can be configured in the ARC device.*
  
---  
![Architecture part 2](../../img/arch1.png)  
*When using a KELLER device with LoRa sending technology it normally does not log measurements. It immediately sends the encrypted measurements (e.g. every 15 minutes) to the nearest LoRa-gateways or LoRa compatible mobile cell antennas and from there to the chosen LoRa Network server.*
  
---  
![Architecture part 3](../../img/arch3.png)  
*A LoRa Network Server pushed the transmission further to the KOLIBRI Cloud where it is transformed and stored in a SQL database.*  
*Every 5 minutes, Cloud programs gather new files from the FTP- rsp. Mail-server and transform and store them in a SQL database.*
  
--- 
![Architecture part 4](../../img/arch4.png)  
*The data center is in the EU and subject to EU regulations (EU Data Protection Regulation (DSGVO)). The database is backuped every 10 minutes.*  

*It is possible to configure alarms in the KOLIBRI Web App that triggers the sending of E-Mails (eg. when a critical water level is reached). Multiple alarms can be configured to multiple recipients. Be aware that with ARC devices these kind of alarms only triggers when the CLoud has the collected measurement data.*
  
---  
![Architecture part 5](../../img/arch6.png)  
*The KOLIBRI Cloud WebApp and the API are protected with state-of-the art security measures. Azure Active Directory handles the Authentication. For a registration you have to enter a user name and an Email-Address. KELLER will never have access to your password as it is stored by Azure Active Directory. It is possible to reset the password.*  

*Authorization: The KOLIBRI Cloud allows multiple users per group. And multiple devices per group. Each user has either Read- or Read-Write-rights. Only users with write rights can change settings. All users can view and export all data of all devices of the assigned group.*
  
---
![Architecture part 6](../../img/arch5.png)  
*All data are transferred through the KOLIBRI API. Authenticated users get a temporary access key and can access the API.*  
*The KOLIBRI WebApp (www.kolibricloud.ch) is a program that uses your temporary access key and collects all needed data via the API. Based on the measurement data it can generate a chart.*
*If you want to use the API to automatically collect the data then you can request a permanent access key from the KOLIBRI support team.*