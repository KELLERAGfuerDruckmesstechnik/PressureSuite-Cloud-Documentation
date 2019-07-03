---
title: Frequently Asked Questions (FAQ)
menu:
    main:
        parent: overview
        weight: 1
toc: true
description: Frequently Asked Questions  (FAQ)
---

# Frequently Asked Questions
- If you miss a question/answer please contact <kolibri@keller-druck.com> or write a new issue on [Github](https://github.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation).
  - [What does "cloud", "IoT", "LoRa" mean?](#what-does-cloud-iot-lora-mean)
  - [What kind of IoT devices does KELLER have?](#what-kind-of-iot-devices-does-keller-have)
  - [Can I use other non-KELLER devices?](#can-i-use-other-non-keller-devices)
  - [What does "KOLIBRI" even mean?](#what-does-kolibri-even-mean)
  - [What is the "KOLIBRI Cloud?](#what-is-the-kolibri-cloud)
  - [Should I use the Cloud or the GSM2Datamanager solution?](#should-i-use-the-cloud-or-the-gsm2datamanager-solution)
  - [What is the roadmap of the features?](#what-is-the-roadmap-of-the-features)
  - [The customer wants to create his own web app or mobile app. How can KELLER help the customer?](#the-customer-wants-to-create-his-own-web-app-or-mobile-app-how-can-keller-help-the-customer)
  - [The customer does not want to use our "cloud". ie the customer wants to save and present the data by himself. How can KELLER help the customer?]  (#the-customer-does-not-want-to-use-our-cloud-ie-the-customer-wants-to-save-and-present-the-data-by-himself-how-can-keller-help-the-customer)
  - [Where can I find marketing/promotional material?](#where-can-i-find-marketing-promotional-material)
  - [How do I sign up? How do I log in? How can I test it?](#how-do-i-sign-up-how-do-i-log-in-how-can-i-test-it)
  - [Does the website also work on a mobile phone?](#does-the-website-also-work-on-a-mobile-phone)
  - [What alarms are there](#what-alarms-are-there)
  - [How do I know that the devices are communicating?](#how-do-i-know-that-the-devices-are-communicating)
  - [Can I use existing data from the GSM2Datamanager switch to the KOLIBRI Cloud?](#can-i-use-existing-data-from-the-gsm2datamanager-switch-to-the-kolibri-cloud)
  - [The customer needs a new feature? How do I proceed?](#the-customer-needs-a-new-feature-how-do-i-proceed)
  - [I discovered an SW error. How do I contact KELLER?](#i-discovered-an-sw-error-how-do-i-contact-keller)
  - [How does LoRa technology work and what are the advantages?](#how-does-lora-technology-work-and-what-are-the-advantages)
  - [What is an API?](#what-is-an-api)
  - [Where is the data stored?](#where-is-the-data-stored)
  - [How do I get the data from the devices to the WebApp?](#how-do-i-get-the-data-from-the-devices-to-the-webapp)
  - [How safe is the cloud?](#how-safe-is-the-cloud)
  - [Are there any specific standards that the cloud fulfills?](#are-there-any-specific-standards-that-the-cloud-fulfills)
  - [Is there a terms of service(ToS)?](#is-there-a-terms-of-service-tos)

## What does "cloud", "IoT", "LoRa" mean?

IoT ("Internet of Things"): Hype term that describes a system / network of things (= devices) with sensors , which perform well together or with users thanks to information exchange (e.g. measurement data through the Internet).
KELLER has been using IoT devices for many years: GSM data loggers and now also LoRa devices.
Cloud . Can be defined as follows: By " cloud  computing" one can mean storing and accessing data and programs via the Internet or the opposite is saving data to your hard disk. The term "cloud" is also used as a metaphor for "the Internet".
LoRa (long range): Long range, low power wireless platform. A popular IoT wireless protocol. Similar to GSM, measurement data from the KELLER sensor can be sent away wirelessly to the next antenna/gateway, and from there forwarded via the Internet to FTP / mail servers or even LoRa servers. LoRa has the advantages over GSM that it is cheaper and requires less power (smaller, cheaper battery)
See more at: LoRa Overview and LoRa- LPWAN

## What kind of IoT devices does KELLER have?

KELLER sells pressure sensors that send data via GSM or LoRa. Both using the ARC-1 variations. With or without ATEX certification. 
In 2019 KELLER will sell cost-efficient LoRa-devices. And there will be the first NB-IoT prototypes, too.

## Can I use other non-KELLER devices?

Yes, as long as you use KELLER pressure sensors you can use other sending devices.
E.g. [DecentLab](https://www.decentlab.com/products/)

## What does "KOLIBRI" even mean?

KOLIBRI is the name of the new KELLER AG product line. Its the German name for Hummingbird starting with a K as in KELLER.
Currently this product line contains:

- KOLIBRI Cloud : Web portal for customers to access data

- KOLIBRI Desktop : The new logger software application that we use to store and visualise data from data loggers on the Windows PC.

- KOLIBRI Mobile : The new Android app, with which you can load measurement data from KELLER data loggers via Bluetooth to a smartphone.

These products all use the latest technologies and a customized design. In addition, you will download and upload data from "KOLIBRI Desktop" and "KOLIBRI Mobile" to the "KOLIBRI Cloud".

## What is the "KOLIBRI Cloud"?

KOLIBRI is the name of the new KELLER AG product line.
Part of this new product line are the cloud possibilities, which are:

- WebApp : The "Online Program" at www.kolibricloud.com

- API : A standardized interface to transfer data (e.g. measurement data) in a common internet format to other programs/services/clouds

- Documentations : How to interpret the measurement data of GSM / LoRa devices? How does the API work? All protocols and simple examples should be openly documented.

- Tools : To simplify the integration of our IoT devices, sample programs and libraries are available for free or even open sourced.

## Should I use the Cloud or the GSM2Datamanager solution?

[Please see this comparison.](https://docs.kolibricloud.ch/cloud-interfaces/overview/differences/)

## What is the roadmap of the features?

[Plese see this overview.](https://docs.kolibricloud.ch/overview/features/)

## The customer wants to create his own web app or mobile app. How can KELLER help the customer?

Customer may use our WebApp to see that their devices are sending data (proof-of-concept). This means that he can IMMEDIATELY start testing our devices in his environment.
Then he can use our API to make data queries. He now has to develop an User Interface and address our API. We help him with sample programs and good documentation.

## The customer does not want to use our "cloud". (ie the customer wants to save and present the data by himself). How can KELLER help the customer?

Customer may use our WebApp to see that their devices are sending data (proof-of-concept). This means that he can IMMEDIATELY start testing our devices in his environment.
During the testing phase, he can start using our documentation to integrate his devices into his solution.

## Where can I find marketing/promotional material?

See ..todo link

## How do I sign up? How do I log in? How can I test it?

See: www.kolibricloud.ch
For all those interested there is a test user account, with which everyone can log in and try out the WebApp.
There are a few test devices visible and their measurement data. The login password can be seen on www.kolibricloud.ch.

## Does the website also work on a mobile phone?

Yes. The site is optimized for the PC / Mac with monitor screen.
The WebApp is "responsive" and therefore it works on a mobile phone, too. However, because of the small screen area, the chart display is very difficult to use.
The mobile version is needed more to monitor triggered alarms and to monitor the current state of all devices.

## What alarms are there

There are three categories:

- Application alarms: Alarms that the customer can set and are related to his application
  - Level Alarm: Here you can select a minima or maxima of any channel. Eg "If channel 'Pressure 1' has more than 2.5 bar, then trigger an alarm
  - PLANNED: Delta/Time Alarm: Here, an alarm can be triggered if measured values fluctuate too much
- PLANNED: Device Alarms: These are alarms that are automatically triggered if a device experiences an extraordinary condition. For example:
  - Low Battery Capacity / Critical Battery Capacity
  - "Low Battery Voltage " / "Critical Battery Voltage"
  - "Low signal quality" / "low signal capacity"
  - Extraordinary humidity in the sensor (feature of ARC devices)
  - Sensor Error
  - Device does not send or is sending late
- PLANNED: System Alarms: Alarms in case multiple devices have problems at the same time:
  - Several devices do not send or arrive late
  - FTP server is not available
  - Mail server is not available
  - LoRa Server is not available
  - Measurement data could not be stored in the DB for unknown reasons

## How do I know that the devices are communicating?

On the WebApp you can read the time of the last communication.
ToDo: picture

## Can I use existing data from the GSM2Datamanager switch to the KOLIBRI Cloud?

It is possible to load data from GSM2DataManager databases into the cloud. This is a work effort of multiple hours and might be a chargeable work. Your sales person will find a fair solution.

At a trade fair I would like to present the KOLIBRI WebApp.

## The customer needs a new feature? How do I proceed?

Contact to kolibri@keller-druck.com

## I discovered an SW error. How do I contact KELLER?

Contact to kolibri@keller-druck.com

## How does LoRa technology work and what are the advantages?

LoRa (long range): Long range, low power wireless platform. A popular IoT wireless protocol. Similar to GSM, measurement data from the KELLER sensor can be sent away wireless to the next antenna/gateway, and from there forwarded via the Internet to FTP / mail servers or even LoRa servers.
LoRa has the advantages over GSM that it is cheaper and requires less power (smaller, cheaper battery)

See: link todo

## What is an API?

[![What is an API](http://img.youtube.com/vi/s7wmiS2mSXY/0.jpg)](http://www.youtube.com/watch?v=s7wmiS2mSXY)

The Internet and Internet products essentially consist of devices that communicate with each other. The format of this interface is often a REST API. All large companies have APIs. Google Maps, for example, needs an API to query where a place is and reacts to maps, coordinates, ...

APIs are not sorcery solely for developers.
The KOLIBRI Cloud API can also be tested (if authorized) at https://api.kolibricloud.ch/swagger/index.html?url=/swagger/v1/swagger.json

If you as a specific software aks. e.g. "Give me the list of all devices", the answer would be:

```https://api.kolibricloud.ch/v1/Devices```

And in answer you get from KOLIBRI Cloud:

```{
   " totalRecords ":3,
   " devices ":[
      {
         " id ":1004,
         " name ":"Eulach 03",
         " networkNode ":"Winterthur",
         " transferType ":"GSM",
         " gsmNumber ":"+ 41774691179 ",
         " euiNumber ":null
      },
      {
         " id ":1005,
         " name ":" Eulach 10 ",
         " networkNode ":"Winterthur",
         " transferType ":"GSM",
         " gsmNumber ":"+41774692307",
         " euiNumber ":null
      },
      {
         " id ":1508,
         " name ":"Pascal Swisscom 05",
         " networkNode ":"Winterthur",
         " transferType ":"LoRa",
         " gsmNumber ":null,
         " euiNumber ":"0004A30B001E5CD8"
      }
   ]
}
```

The data format is called JSON (standard) and can be easily decrypted by all programming languages.

An API is very powerful. A customer can use the API to pick up all his data, save it or just show how it suits him.

## Where is the data stored?

All data is stored in a data center in Ireland (soon to be Germany) in an SQL database and partly information is cached in logfiles to recover data in an emergency.
It is automatically backed up every 5-10 min.

## How do I get the data from the devices to the WebApp?

The entire system is not that complicated.

- The data of our sensors is regularly stored in FTP/mail server.
- The KOLIBRI Cloud in the background is also a collection of many small programs (Azure Functions), which do regular tasks. For example, every 5 minutes all FTP/mail servers are checked for new data and new data is stored in a data queue.
- As soon as a new telegram is available at LoRa, it will be stored in a data queue.
- Another program controls the data queue and analyses the content and origin. The data will then be converted and stored in a database.
- There are other programs that regularly check the measured data and abnormalities and, if necessary, generate alarms and send emails.
- At the same time there is this- (our) API. This is the gateway to the database. No customer can access the database directly. Everything goes through the API.
- You can log in with username/password. An external service autorises the user and responds with a special key that identifies the user correctly and allows the user to use our API.
- Thanks to the key, the API knows what data it is allowed to send to the user / program.
- The WebApp is such a program that collects all data via the API. The measurement data are also sent in compressed&encrypted text formats to the WebApp. The WebApp (App = Application = Program) generates a chart itself based on the measured data.

## How safe is the cloud?

The cloud is very safe.
It uses modern processes, best practices and tools.
Authorisation is managed externally (by Microsoft Azure Active Directory B2C). So if you want to hack accounts from KOLIBRI Cloud, then you have to hack Microsoft first.
Without proper authorisation, it is not possible to get data.
You can only query the data assigned to the user. This means that a validly authorised user can not see other user's data. This is even backed up at the database level (role-level feature SQL Server).

The greatest risk is not that our system (or Microsoft's) or a password is hacked, but that a customer wrongly redistributes the password themselves.

Microsoft Azure is one of the top three players in cloud services and meets several standards.

## Are there any specific standards that the cloud fulfills?

Security is one of the key features and concerns in IoT / cloud projects.

The KOLIBRI Cloud uses the access, storage and authentication of users and data in / from a MICROSOFT (Azure) datacenter.

This data center is in the EU and subject to EU regulations ( EU Data Protection Regulation ( DSGVO) ) (ie no data may be shared with data centers outside the EU, especially not with US). https://www.microsoft.com/de-de/TrustCenter/Privacy/gdpr/default.aspx

In addition:

- There are not many standards of countries regarding cloud/data/privacy, yet. And if so, then they affect the "personal data" which does not concern us, because the KOLIBRI Cloud stores mostly measurement data.
- What standards does Microsoft guarantee?

  - https://azure.microsoft.com/en-us/overview/trusted-cloud/   (overview)
  - https://azure.microsoft.com/en-us/blog/microsoft-azure-leads-the-industry-in-iso-certifications/  (overview)
  - List of standards:  https://www.microsoft.com/en-us/trustcenter/compliance/complianceofferings
eg  ISO 9001 , ISO 20000-1: 2011, ISO 2230, ISO 27001, ISO 27017, ISO 27018, BIR 2012 (Netherlands), UK G-Cloud, Argentina PDPA, ...

## Is there a terms of service(ToS)?

Yes. Todo Link!
