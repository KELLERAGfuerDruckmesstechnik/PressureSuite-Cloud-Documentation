---
title: How to set up a device for the KOLIBRI Cloud
menu:
    main:
        parent: gsm-technology
        weight: 1
---

# How to set up a GSM/ARC device to send data to the cloud

Please refer to the [General Process](https://docs.kolibricloud.ch/overview/process) of working with the KOLIBRI Cloud.
To register a GSM/ARC device please follow the following steps:

1. Consider staying in close contact with the KELLER sales engineer and/or the KOLIBRI Cloud support team (kolibri@keller-druck.com)  
2. Either the device is in your office, and you can connect it with a cable then please refer to [Cloud integration without GSMDataManager](#cloud-integration-without-gsmdatamanager) If you are not close to the device and use the GSM2DataManager then please proceed to [Cloud integration with the GSMDataManager](#cloud-integration-with-the-gsmdatamanager)

## With cable connection: Cloud integration

1. Please download the appropriate SW tool to configure your device. You find the SW [here](http://www.keller-druck.com/home_e/paprod_e/software_e.asp). If you can connect to the device with a cable please use the ["GSM-Config" SW](http://www.keller-druck2.ch/swupdate/GSMSetup/GSMSetup.zip), and it's [manual](http://www.keller-druck2.ch/swupdate/GSMSetup/manual/man_gsm2_e_en.pdf).

2. Ideally, the KOLIBRI Cloud gets the data from an FTP-Server. Either you host an own FTP server or use own of the provided FTP accounts from KELLER. 

  - a) If you wish to use an FTP account provided by KELLER then, please, contact KOLIBRI Cloud support or your KELLER sales representative to communicate the needed credentials (host-name, user-name, password).
  - b) If you wish to use an own hosted FTP account, please be aware that only certain security protocols are supported. SFTP is not supported. Some FTPS versions are supported. In doubt, please ask the KOLIBRI Cloud support team (kolibri@keller-druck.com).
  - c) To let the device automatically be assigned to your KOLIBRI Cloud account, register your FTP account first in your KOLIBRI Cloud in https://www.kolibricloud.ch/account-settings  
  ![Add an FTP account to auto-register new devices](../add-ftp-account.png "Add a FTP account to auto-register new devices")

3. Connect the device with your Windows PC (you might need a K114 adapter) and use the GSM-Setup tool according its manual.

4. The following steps are some general hints for a cloud integration:

  - a) Choose the correct device type and only the channels that are needed.
    ![Choose the correct device type picture](../gsmsetup_correcttype.png "Choose the correct device type!") ![Choose only the needed channels picture](../gsmsetup_correctchannels.png "Choose only the needed channels!")  

  - b) To verify the choice of channels and device connection type it is a good idea to check the actual measurement in [Error/Status]. Only chose those channels that deliver measurement values of interest.  
    ![Check chosen channels](../gsmsetup_verifyactivechannels.png "Check chosen channels!")  
    
  - c) Use a “check interval” which is the time the device waits until it checks the FTP server for new configuration (from the DataManager and soon from the KOLIBRI Cloud). An interval of 24h is ok.
    ![Choose a check interval picture](../gsmsetup_checkinterval.png "Check the interval!")  

  - d) In the **[Measure]** tab please set the measure “Interval” and the “Send FTP-File after X-Measurements”. If you measure every 30min and send a measurements file after 20 Measurements then the device will send data every 10 hours. As longer the 'send interval' as lower the battery is used. On the other hand, an alarm set in the Cloud will only react when it has data. In this example a Cloud alarm is triggered in worst-case after 10h.  

  - e) <span style="color:red">In the **[Measure]** tab it is *NEEDED* to activate the “Record Datatransfer”.</span> The KOLIBRI Cloud only handles data in this format.  
    ![Use the record format picture](../gsmsetup_recordformat.png "Use the record format!")  

  - f) In the **[Communication]** tab avoid having a “FTP directory”. If you need/configured one, then please contact KOLIBRI support. It is recommended to NOT use the “active Mode” and NOT use FTPs (with TLS).  
    ![Prefer not to use a sub folder picture](../gsmsetup_ftpsettings.png "Prefer not to use a sub folder!") 

5. <span style="color:red">After writing the settings it is *NEEDED* to have a configuration file ready for the Cloud.</span> Without a configuration a device CAN NOT be registered in the Cloud! We recommend sending it manually in tab **[Error/Status]**. Otherwise, the Cloud has to wait for the interval set in **[Info]**.  
![Do manually send a config file picture](../gsmsetup_sendconfigfile.png "Do manually send a config file!") 


6. Test your connection! If an FTP account has been assigned (step 2) and the device uses the same FTP then the device should automatically be listed into your KOLIBRI cloud account. Otherwise, use your login credentials and use an FTP client (like [FileZilla](https://filezilla-project.org/)) and check if a text file could be sent.  

## Without a cable connection: Cloud integration with the GSMDataManager

1. Please consult the [DataManager Manual](http://www.keller-druck2.ch/swupdate/InstallerGSM2Datamanager/manual/MAN_Datamanager_EN_en.pdf).

2. Ideally, the KOLIBRI Cloud gets the data from an FTP-Server. Either you host an own FTP server or use own of the provided FTP accounts from KELLER. Either way please contact KOLIBRI support to communicate the needed credentials (host-name, user-name, password).  

3. For each device  
    - Like above configure the device so that it sends the data to the agreed FTP account.

    - Like with the GSM-Setup it is ***NEEDED*** to activate the “Record Datatransfer”.  
    ![Use the record format picture](../datamanager_recordformat.png "Use the record format!")  

    - Like with the GSMSetup above it is ***NEEDED*** to have a configuration file ready for the Cloud. One way to trigger the device to send a configuration file is to **send a configuration from the DataManager to the devices**. The device will mirror the settings and make it available for the cloud.
    Use **[Configure]** and **[Proceed]**

    - When using water calculations (or other calculation) it is a good idea to make screenshots or notes of the used values like installation lengths or offsets. The water calculations in the KOLIBRI Cloud has to be set up again.  

4. Set the GSMDatamanager in “silent mode” so it doesn't synchronize the data and delete data from the FTP server.  
