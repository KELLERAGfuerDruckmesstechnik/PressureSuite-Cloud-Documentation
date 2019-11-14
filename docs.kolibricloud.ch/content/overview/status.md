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
All services running: OK

# Planned Maintenance windows
- None

# Outages & Maintenance Windows
---
## 06.Nov.2019 from 16:00-17:00 CET
**Planned Maintenance Window**:  
Updated various features including test version of the new "Device Configuration" feature.  
Known issues:  
 - The Device Configuration-Button is hidden on purpose.  
 - "Measure interval" and "Next expected transmission" are showing wrong values due to missing device configurations  

---
## 29.Okt.2019 from 17:00-21:00 CET
**Summary of Impact**:  
The storing of LoRa messages from TTN and Loriot.io was temporary impossible. LoRa from Actility networks were stored.

**Preliminary Root Cause**:   
Engineers determined that an error in a recent deployment of a new auto-assignment feature to the backend of the KOLIBRI Cloud caused a conflict with specific LoRa-server protocol implementation.

**Mitigation:**:  
Engineers fixed and tested the protocol issue.

**Next Steps**:  
Customers who lost important data can contact the KOLIBRI Cloud support (kolibri@keller-druck.ch) to retrieve the missing measurement data from the log files.

---
## 2.May.2019 from 20:00-22:00 UTC
**Summary of Impact**:  
The web app and API could not be reached for two hours. No measurement data have been lost.

**Preliminary Root Cause**:   
An error by the cloud hoster Microsoft caused a global outage of many cloud services including the possibility of storing measurement data.  
See https://www.zdnet.com/article/azure-global-outage-our-dns-update-mangled-domain-records-says-microsoft/

**Mitigation:**:  
After two hours all services were working again and the pending measurement transmission automatically waited in a queue and were stored into the DB as soon as the outage was fixed.

**Next Steps**:  
None.
