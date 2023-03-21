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

💚 ***ALL KOLIBRI CLOUD SERVICES RUNNING OK***




---
---
## Planned Maintenance windows
### 28.February 2022 12:00 MEZ - 14:00 MEZ

**Planned work**  
We are deploying the newest version of the app with version number v.1.22059.01. 
During this time, an older database version with the timestamp February, 8th 2022 will be shown. After 14:00 MEZ, please login again and refresh the web app.
No data will be lost during this time.

---

## Outages/Issues  

### 18.December 20:00 UTC - 20.March 2023 22:30 UTC

**Summary of Impact:**  
On the weekend evening, the API service ceased functioning, causing all attempts to connect to fail, including the web app www.kolibricloud.ch. However, the processes to ingest data continued to operate successfully, and no measurement data was lost. The engineers began addressing the issue on Monday morning, but were unable to determine the root cause. Ultimately, a new server was established and DNS routing was modified approximately 30 minutes prior to midnight, resulting in the API's restoration.  

**Root Cause:**  
Still Unknown.  
A server component that worked for nearly 6 years just stopped and could not be restarted. The cause of the problem remains unknown, and communication with cloud experts is ongoing to determine its origin. (21 March 2023)  


### 23.December - 08. March 2023

**Summary of Impact:**  
Some Level Alarm setup in the web app did not trigger an alarm and would not send an alarm mail! Affected customers have been contacted.  
We completely re-deployed all connected services and implemented new monitor-software to react faster.

**Root Cause:**  
The dedicated Azure Function stopped executing in a night to the 23rd december. We tried to find the root cause but neither we nor Microsoft tooling could point a root cause.
This lead us to the point to implement further alarming mechanism to monitor the level alarming mechanism.  


### 05.March - 06. March 2023 15:45 CET

**Summary of Impact:**  
Starting on 5th March 2023, it was not possible to login anymore to https://www.kolibricloud.ch  
Access to the API with 'Permanent Access Token' and ingress of measurement data worked so far.  
On 6th March 2023 - 14:45 CEST it was possible again to login.  

**Root Cause:**  
The developer team found the root cause in a migration from the Microsoft Azure AD B2C endpoint provider. See https://learn.microsoft.com/en-us/azure/active-directory-b2c/b2clogin  
After changing and testing various URLs and updating of packages/libraries the login was working again.



### 22. February 2022 10:00 CET - 10:20 CET

**Summary of Impact:**  
Faulty e-mails with the warning 'Device has stopped sending' were sent. The devices are still sending. Please ignore these e-mails.

**Root Cause:**  
Maintenance of a component led to a false deployment of the device-check-function that used an older test-DB, not the actual DB. We actualized this device-check-function with the correct link to the actual DB.

### 10. December 2021 12:40 CET - 11. December 2021 08:40 CET

**Summary of Impact:**  
An SW update caused the system to reject all incoming measurement sets. The data has been restored.  
If you think there is still missing data, then please contact kolibri@keller-druck.com

**Root Cause:**  
An SW update meant for our test system caused a smaller sub-part to automatically re-build and deploy to the production system. This resulted in an incompatibility and the data could not be ingested into the database.  
The data was still captured in an emergency log queue from which the measurements could be retrieved.  
Due to the holiday season, we had to delay these efforts and fix and test everything after New Year's Eve but not earlier. We are sorry for this outage.  

---
### 25. October 2021 16:00 CET - 02. November 2021 13:30 CET

**Summary of Impact:**  
An update on the FTP-file-grabber-module caused an internal error in four FTP accounts where new devices were registered.  
This error has been fixed. No data has been deleted, and all missing measurements should have been loaded up to the KOLIBRI Cloud DB.  

**Root Cause:**  
An error when creating paths to copy the measurement files to a new associated folder lead to ill-formed folders and files. This error caused an exception and the FTP account and the process of mitigation the new measurement files has been dropped for another 5min.  

**Mitigation:**  
The particular software code has been fixed and tested. All data should now be visible again.  

---

### 3.August 2021 - 28.August 2021

**Summary of Impact:**  
Some level alarms have not been created nor sent via e-mail to users.

**Preliminary Root Cause:**  
An error in the alarming system caused to stop working due to one single faulty alarm setting of one user.

**Mitigation:**  
The particular alarm setting has been fixed, and counter measurements have been implemented that this should never occur again.
We decided not to re-trigger the e-mails as this would look like a spam attack to some users.

---

### 17.June 2021 11:00:00 MEZ - 18.June 2021 10:00:00 MEZ

**Summary of Impact:**  
The process to gather measurements from FTP was broken again for 24h until an older working version was manually deployed again.  
Customers experienced a delay of the data in the web app or API.

**Preliminary Root Cause:**  
The last known issue from May 2021 with the process of data collecting showed weak points that had to be fixed. As we were working on these improvements, unfortunately, a new release was deployed live that had problems in the module that should warn when problems arise.

**Mitigation:**  
We deployed an older working version.

**Next Steps:**  
We continue to improve the warn & log system to find such problems earlier.

---

### 01.July 2021 10:00 MEZ - 16:00 MEZ

**Planned work**  
We are continuing improving several components that gather data from FTP, Mails ...  
The new versions of these components are being deployed and resulting in temporary downtimes when no new measurement files can be loaded. No data will be lost.  
In the worst case, data will not be updated for some hours.

---

### 17.June 2021 11:00:00 MEZ - 18.June 2021 10:00:00 MEZ

**Summary of Impact:**  
The process to gather measurements from FTP was broken again for 24h until an older working version was manually deployed again.  
Customers experienced a delay of the data in the web app or API.

**Preliminary Root Cause:**  
The last known issue from May 2021 with the process of data collecting showed weak points that had to be fixed. As we were working on these improvements, unfortunately, a new release was deployed live that had problems in the module that should warn when problems arise.

**Mitigation:**  
We deployed an older working version.

**Next Steps:**  
We continue to improve the warn & log system to find such problems earlier.

---

### 15.May 2021 - 26.May 2021

**Summary of Impact:**  
The KOLIBRI Cloud searches on all known FTP servers for new measurement data. It does this every 5 minutes. Now, due to a chain of multiple causes, the interval to gather the new measurements files has increased from 2 minutes up to multiple hours. The data came but during a random time later (up to 3 hours later).  
Customers experienced a delay of the data in the web app or API.

After the holidays around Pentecost, we fixed the system and saw ways to improve it. No measurement data has been lost due to this incident.

**Root Cause:**  
A customer used a slow FTP server located in South America and summed up multiple thousands of faulty measurement files. The 'KOLIBRI Cloud FTP collection service' tried to download this multiple times causing this 'collection process' to take **several hours** instead of 2 minutes. The files were rejected from the KOLIBRI Cloud as they were faulty, but re-downloaded and analysed later again and again.  
This caused the ingestion time of the measurements to be delayed not by the usual 1-5 minutes but by a random (and exponentially increasing) time. On May 26, we saw that it took between 2-3 hours depending on the speed of the particular FTP and the amount of collected data.  
This also caused to overload the warn mail system which again caused delays in sending the "Level Alarm"-mails to some customers.  

**Mitigation:**  
The particular FTP server has been blocked which caused the service to run normal again.  
The 60k mails stuck in the mail system needed several days to be processed as other services like spam protection also triggered a delay.

**Next Steps:**  
We changed the service in a way that slow FTP connection will be blocked. It is also necessary to change the whole warn & logging mechanism.

---

### 28.April 2021 at 14:00:00 MEZ - 30.April 2021 at 17:00:00 MEZ

**Summary of Impact:**  
Our FTP-provider did migrate the server to another. Not only did the provider forgot to tell us, they also somehow made mistakes and caused ALL our FTP accounts (ftp.gsmdata.ch) to cease communicating for two days.
During this time period, all cellular devices (GSM/ARC1) using ftp.gsmdata.ch could not send data to the FTP and, therefore, not to the cloud.
Nevertheless, the ARC1/GSMs are programmed in a way that after a positive re-connection they re-send the missing data. 

**Next Steps:**  
There should not been data holes due to the ARC1s/GSMs fault-tolerance strategy. If you think there are any data holes, please contact kolibri@keller-druck.ch to remotely request the missing data.

---


### 16.Nov.2020 14:42:01 MEZ - 16:14:00 MEZ

**Summary of Impact:**  
Both, the Web app and the API was inaccessible due to an expired SSL certificate.

**Mitigation:**  
The annual SSL certificate renewal process seems to be broken and the SSL certificate was not properly renewed.

**Next Steps:**  
We manually renewed the certificate and after waiting for all DNS involved all services are now reachable again.

---

### 06.Nov.2020 15:33:10 UTC - 09.Nov.2020 20:00:00 UTC

**Summary of Impact:**  
After a new update on 06.Nov.2020 15:33:10 UTC the data ingress of all cellular devices failed.  
No data from Friday to Monday was available through the API not the web app.  
While fixing the issue the LoRa data on Monday some LoRa messages where wrongly assigned, too.

As the data was temporarily stored in a DL-queue engineers restored all the data again on Monday night.

If there are still data missing, please contact kolibri@keller-druck.com to restore missing data.

**Mitigation:**  
Engineers found a bug that caused a wrong conversion and assignment of the GSM1/ARC1 channels.  

**Next Steps:**  
In hindsight, the SW developer deeply regrets deploying new stuff on a Friday afternoon.  


---

### 05.Nov.2020 13:08:07 UTC - 06.Nov.2020 15:33:10 UTC

**Summary of Impact:**  
During one day, all measurements of all LoRa devices have a wrong channel.
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
Therefore, no new data was processed to the database. The data was temporarily stored in a data queue.

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
Updated various features; Including test version of the new "Device Configuration" feature.  
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

---
---

## Past Maintenance windows

### 31.January 2022 10:00 MEZ - 12:00 MEZ

**Planned work**  
*We update the DB, API and frontend to make the new features possible. For this, the Cloud, including WebApp & API might be not accessible for some hours. Expect API calls to fail and data to be collected with delay.*


### 20. September 2021

**Planned work**  
- We are enabling the auto-alarming feature for all customers. This might trigger warn mails to those customers who have an E-Mail address registered in the account settings (https://www.kolibricloud.ch/account-settings)
- We are going to switch the SSL certificate. This might cause temporary connection problems and problems when accessing the data through the API.

---

### 01.July 2021 10:00 MEZ - 16:00 MEZ

**Planned work**  
We are continuing improving several components that gather data from FTP, Mails ...  
The new versions of these components are being deployed and resulting in temporary downtimes when no new measurement files can be loaded. No data will be lost.  
In the worst case, data will not be updated for some hours.

---
### 13.June 2021 14:00 MEZ - 17:00 MEZ

**Planned work**  
We are continuing improving several components that gather data from FTP, Mails ...  
The new versions of these components are being deployed and resulting in temporary downtimes where no new measurement files can be loaded. No data will be lost.  
In the worst case, data will not be updated for some hours.

**Effects**  
No measureable impacts happened noticeable by users.
