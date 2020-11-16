---
title: Service Status
menu:
    main:
        parent: overview
        weight: 6
toc: false
description: History about maintenances and outages
---
# Status

💚 ***ALL SERVICES ARE RUNNING OK***

## Planned Maintenance windows

- none

## Outages & Maintenance Windows  

### 16.Nov.2020 14:42:01 MEZ - 16:14:00 MEZ

**Summary of Impact:**  
Both, the Web app and the API was inaccessible due to an expired SSL certificate.

**Mitigation:**  
The annual SSL certificate renewal process seems to be broken and the SSL certificate was not proberly renwed.

**Next Steps:**  
We manually renewed the certificate and after waiting for all DNS involved all services are now reachable again.

---

### 06.Nov.2020 15:33:10 UTC - 09.Nov.2020 20:00:00 UTC

**Summary of Impact:**  
After a new update on 06.Nov.2020 15:33:10 UTC the data ingress of all cellular devices failed.  
No data from Friday to Monday was available throught the API not the web app.  
While fixing the issue the LoRa data on Monday some LoRa messages where wrongly assigned, too.

As the data was temporary stored in a DL-queue engineers restored all the data again on Monday night.

If there are still data missing, please contact kolibri@keller-druck.com to restore missing data.

**Mitigation:**  
Engineers found a bug that caused a wrong conversion and assignment of the GSM1/ARC1 channels.  

**Next Steps:**  
In hindsight, the SW developer deeply regrets deployind new stuff on a Friday afternoon.  


---

### 05.Nov.2020 13:08:07 UTC - 06.Nov.2020 15:33:10 UTC

**Summary of Impact:**  
During one day, all measurments of all LoRa devices have a wrong channel.
This also caused wrong alarms-mails being triggered.

**Preliminary Root Cause:**  
SW Engineers determined that an error in using the new open-source converter SW (https://iotconverter.kolibricloud.ch/) caused the a wrong conversion where the channel mapping (https://docs.kolibricloud.ch/cloud-interfaces/api/channels/) was off by one (channel).

**Mitigation:**  
The DevOps Engineer fixed and tested the issue by updating a newer version.  
*EVERY WRONG MEASUREMENTS WILL BE FIXED DURING THE WEEKEND AND RECIPIENTS OF MAILS WILL BE NOTIFIED.*  
[update - 06.Nov2020 - 22:30 CET]: The measurements have been adjusted back to the correct mapping.

**Next Steps:**  
None.

---

### 06.Sep.2020 from 17:00 CET - 07.Sep.2020 10:15 CET

**Summary of Impact**:  
The API could not be reached (Status code: 502 Bad Gateway)

**Mitigation:**  
The API was redeployed.

**Next Steps**:  
None.

---

### 10.Aug.2020 from 17:00 CET - 22:30 CET

**Summary of Impact**:  
An important Cloud-WebJob has stopped and was under maintenance due to erroneous behavior. 
No new data was processed but stored in a data queue (service bus), therefore no new data was shown on the KOLIBRI Cloud web app.
There was no known data loss. 

**Preliminary Root Cause**:
The present DevOps Engineer determined that a Cloud component during an update misbehaved and didn't start correctly when published.
Therefore, no new data was processed to the database. The data was temporary stored in a data queue.

**Mitigation:**:  
The DevOps Engineer fixed the program again and all stored data was processed correctly.

**Next Steps**:  
None.

---

### 10.Feb.2020 from 17:30 CET - 11.Feb.2020 08:30 CET

**Summary of Impact**:  
The https://www.kolibricloud.ch web app showed no content. Only the the https://test.kolibricloud.ch test environment was working.

**Preliminary Root Cause**:
Engineers determined that an error in deployment process that just happens to stop working.  
The specific error is documented here: https://github.com/microsoft/azure-pipelines-tasks/issues/10387  

**Mitigation:**:  
The DevOps Engineer fixed and tested the issue by updating the CD component.

**Next Steps**:  
None.

---

### From 23.Jan.2020 to 10.Feb.2020

**Summary of Impact**:  
The "LastMeasurements" and the "DeviceInformation" showed older measurements (timestamp + values) then available and stored.  

**Preliminary Root Cause**:
The DevOps Engineer determined an error in a wrong continuous deployment process that upgraded only parts of the system causing the ```/v1/LastMeasurements``` endpoint to show an older measurement. Nevertheless, no data was lost and the ```/v1/Measurements``` endpoint continued to work properly.

**Mitigation:**:  
Engineers fixed and tested the issue.

**Next Steps**:  
None.

---


### 06.Nov.2019 from 16:00-17:00 CET

**Planned Maintenance Window**:  
Updated various features including test version of the new "Device Configuration" feature.  
Known issues:

- The Device Configuration-Button is hidden on purpose.
- "Measure interval" and "Next expected transmission" are showing wrong values due to missing device configurations

---

### 29.Okt.2019 from 17:00-21:00 CET

**Summary of Impact**:  
The storing of LoRa messages from TTN and Loriot.io was temporary impossible. LoRa from Actility networks were stored.

**Preliminary Root Cause**:
Engineers determined that an error in a recent deployment of a new auto-assignment feature to the backend of the KOLIBRI Cloud caused a conflict with specific LoRa-server protocol implementation.

**Mitigation:**:  
Engineers fixed and tested the protocol issue.

**Next Steps**:  
Customers who lost important data can contact the KOLIBRI Cloud support (kolibri@keller-druck.com) to retrieve the missing measurement data from the log files.

---

### 2.May.2019 from 20:00-22:00 UTC

**Summary of Impact**:  
The web app and API could not be reached for two hours. No measurement data have been lost.

**Preliminary Root Cause**:
An error by the cloud hoster Microsoft caused a global outage of many cloud services including the possibility of storing measurement data.  
See <https://www.zdnet.com/article/azure-global-outage-our-dns-update-mangled-domain-records-says-microsoft/>

**Mitigation:**:  
After two hours all services were working again and the pending measurement transmission automatically waited in a queue and were stored into the DB as soon as the outage was fixed.

**Next Steps**:  
None.
