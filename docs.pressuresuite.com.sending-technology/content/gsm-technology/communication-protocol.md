---
title: The ARC-1 cellular data communication protocol
menu:
    main:
        parent: gsm-technology
        weight: 2
---

## The ARC1 cellular data communication protocol for GSM/UMTS/LTE
Here is the download link of the **ARC1 cellular data communication protocol (GSM/UMTS/LTE)**: 
[Version v1.00a (24-05-2018)](https://docs.pressuresuite.com/sending-technology/ARC-1%20Cellular%20data%20communication%20protocol%20(GSM%20UMTS%20LTE)%20v1.00a.pdf)  


## FAQ: How can I implement an own solution?
It is necessary to follow the protocol and its explanations.  


## FAQ: Which SW already supports and implements this protocol?
Two SW implemented this protocol:  
  - The GSMDatamanager SW  
  - PressureSuite Cloud backend SW  
  
Right now, there is no open-sourced SW that uses the protocol.  

## FAQ: I don't want to implement this protocol. What alternatives do I have?
- Alternatively, it is possible to use the PressureSuite Cloud API and get the data automatized in a proper JSON format through.    
- It is also possible to use the GSMDatamanager and let it store data into a local MySQL database. Then implement a SW tool that extracts the data out of the MySQL database.  