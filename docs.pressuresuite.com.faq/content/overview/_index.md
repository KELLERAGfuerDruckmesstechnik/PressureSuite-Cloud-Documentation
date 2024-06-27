---
title: Frequently Asked Questions (FAQ)
menu:
    main:
        parent: overview
        weight: 1
toc: false
description: Frequently Asked Questions  (FAQ)
---

# Frequently Asked Questions

If you miss a question/answer please contact <pressuresuite@keller-druck.com> or write a new issue on [Github](https://github.com/KELLERAGfuerDruckmesstechnik/PressureSuite-Cloud-Documentation).

- [What does "cloud", "IoT", "LoRa" mean?](#what-does-cloud-iot-lora-mean)
- [What kind of IoT devices does KELLER have?](#what-kind-of-iot-devices-does-keller-have)
- [What does "PressureSuite" even mean?](#what-does-pressuresuite-even-mean)
- [What is the "PressureSuite Cloud"?](#what-is-the-pressuresuite-cloud)
- [Should I use the Cloud or the GSM2Datamanager solution?](#should-i-use-the-cloud-or-the-gsm2datamanager-solution)
- [What is the roadmap of the features?](#what-is-the-roadmap-of-the-features)
- [The customer wants to create his own web app or mobile app. How can KELLER help the customer?](#the-customer-wants-to-create-his-own-web-app-or-mobile-app-how-can-keller-help-the-customer)
- [The customer does not want to use our "cloud". (ie the customer wants to save and present the data by himself). How can KELLER help the customer?](#the-customer-does-not-want-to-use-our-cloud-ie-the-customer-wants-to-save-and-present-the-data-by-himself-how-can-keller-help-the-customer)
- [Where can I find marketing/promotional material?](#where-can-i-find-marketingpromotional-material)
- [How do I sign up? How do I log in? How can I test it?](#how-do-i-sign-up-how-do-i-log-in-how-can-i-test-it)
- [Does the website also work on a mobile phone?](#does-the-website-also-work-on-a-mobile-phone)
- [What alarms are there](#what-alarms-are-there)
- [How do I know that the devices are communicating?](#how-do-i-know-that-the-devices-are-communicating)
- [Can I use existing data from the GSM2Datamanager switch to the PressureSuite Cloud?](#can-i-use-existing-data-from-the-gsm2datamanager-switch-to-the-pressuresuite-cloud)
- [The customer needs a new feature? How do I proceed?](#the-customer-needs-a-new-feature-how-do-i-proceed)
- [I discovered an SW error. How do I contact KELLER?](#i-discovered-an-sw-error-how-do-i-contact-keller)
- [How does LoRa technology work and what are the advantages?](#how-does-lora-technology-work-and-what-are-the-advantages)
- [What is an API?](#what-is-an-api)
- [Where is the data stored?](#where-is-the-data-stored)
- [How does the data get from the devices to the WebApp?](#how-does-the-data-get-from-the-devices-to-the-webapp)
- [How safe is the cloud?](#how-safe-is-the-cloud)
- [Are there any specific standards that the cloud fulfills?](#are-there-any-specific-standards-that-the-cloud-fulfills)
- [Is there a terms of service(ToS)?](#is-there-a-terms-of-servicetos)
- [Does the chart show all measurement points?](#does-the-chart-show-all-measurement-points)

## What does "cloud", "IoT", "LoRa" mean?

**IoT** ("Internet of Things"): A hype term that describes a system/network of things (= devices) with sensors, which perform well together or with users thanks to information exchange (e.g., measurement data through the Internet).  
KELLER has been using IoT devices for many years: Cellular data loggers and now also LoRa devices.  
**Cloud**: Can be defined as follows: "Cloud computing" refers to storing and accessing data and programs over the Internet, as opposed to saving data on your hard disk. The term "cloud" is also used as a metaphor for "the Internet".  
**LoRa** (long range): A long-range, low-power wireless platform. A popular IoT wireless protocol. Similar to cellular radio, measurement data from KELLER sensors can be sent wirelessly to the nearest antenna/gateway, and from there forwarded via the Internet to FTP/mail servers or even LoRa servers. LoRa has advantages over cellular radio in that it is cheaper and requires less power (smaller, cheaper battery).  
See more at <https://docs.pressuresuite.com/sending-technology/lora-technology/>

## What kind of IoT devices does KELLER have?
See https://keller-druck.com/en/products/wireless-solutions
KELLER sells the ADT1 (low-cost) and the ARC1 (robust) devices in a tube, a box, or a box with special safety barriers.
Both device categories can send data either via cellular sending technology (2G/3G/4G/NB-IoT/LTE-M) or via the LoRaWAN sending technology.

## What does "PressureSuite" even mean?

PressureSuite is the successor of KOLIBRI. It is a new name for a product line. 
Currently, this product line contains:

- PressureSuite Cloud: Web portal for customers to access data

- PressureSuite Desktop: The new logger software application that we use to store and visualize data from data loggers on the Windows PC.

- PressureSuite Mobile: The new iOS/Android app, with which you can load measurement data from KELLER data loggers via Bluetooth to a smartphone.

These products all use the latest technologies and a customized design. In addition, you can download and upload data from "PressureSuite Desktop" and "PressureSuite Mobile" to the "PressureSuite Cloud".

## What is the "PressureSuite Cloud"?

PressureSuite is the name of the new KELLER Pressure product line.
Part of this new product line are the cloud possibilities, which include:

- WebApp: The "Online Program" at www.pressuresuite.com

- API: A standardized interface to transfer data (e.g., measurement data) in a common internet format to other programs/services/clouds

- Documentations: How to interpret the measurement data of Cellular/LoRa devices? How does the API work? All protocols and simple examples should be openly documented.

- Tools: To simplify the integration of our IoT devices, sample programs and libraries are available for free or even open-sourced.

## Should I use the Cloud or the GSM2Datamanager solution?

[Please see this comparison.](https://docs.pressuresuite.com/cloud-interfaces/overview/differences/)

## What is the roadmap of the features?

[Please see this overview.](https://docs.pressuresuite.com/overview/roadmap/)

## The customer wants to create their own web app or mobile app. How can KELLER assist?

Customers may use our WebApp to see that their devices are sending data (proof-of-concept). This means they can IMMEDIATELY start testing our devices in their environment.
Then they can use our API to make data queries. They now have to develop a User Interface and address our API. We assist them with sample programs and good documentation.

## The customer does not want to use our "cloud" (i.e., the customer wants to manage and present the data themselves). How can KELLER assist?

Customers may use our WebApp to see that their devices are sending data (proof-of-concept). This means they can IMMEDIATELY start testing our devices in their environment.
During the testing phase, they can start using our documentation to integrate the devices into their solution.

## Where can I find marketing/promotional materials?

Please contact <marketing@keller-druck.com>.

## How do I sign up? How do I log in? How can I test it?

See: <https://www.pressuresuite.com>
For all those interested, there is a test user account (Demo1234 / Demo1234), with which everyone can log in and try out the WebApp.
There are a few test devices visible and their measurement data. The login password can be found on <https://www.pressuresuite.com>.

## Does the website also work on a mobile phone?

Yes. The site is optimized for PC / Mac with monitor screens.
The WebApp is "responsive" and therefore works on mobile phones, too. However, due to the small screen area, the chart display is very difficult to use.
The mobile version is more necessary for monitoring triggered alarms and the current state of all devices.

## What alarms are there?

There are three categories:

- Application alarms: Alarms that the customer can set and are related to their application
  - Level Alarm: Here you can select a minimum or maximum of any channel. E.g., "If channel 'Pressure 1' has more than 2.5 bar, then trigger an alarm."
- Device Alarms: These are alarms that are automatically triggered if a device experiences an extraordinary condition. For example:
  - Low Battery Capacity / Critical Battery Capacity
  - "Low Battery Voltage" / "Critical Battery Voltage"
  - Extraordinary humidity in the sensor
  - Device does not send or is sending late

## How do I know that the devices are communicating?

On the WebApp, you can read the time of the last communication.
![Last Data on www.pressuresuite.com](../LastData.png"Last Data")

## Can I use existing data from the GSM2Datamanager switch to the PressureSuite Cloud?

It is possible to load data from GSM2DataManager databases into the cloud. This is a work effort of multiple hours and might be a chargeable work. Your sales person will find a fair solution.

## The customer needs a new feature? How do I proceed?

Contact to <pressuresuite@keller-druck.com>

## I discovered an SW error. How do I contact KELLER?

Contact to <pressuresuite@keller-druck.com>

## How does LoRa technology work? And what are the advantages?

LoRa (long range): Long range, low power wireless platform. A popular IoT wireless protocol. Similar to Cellular Radio, measurement data from the KELLER sensor can be sent away wireless to the next antenna/gateway, and from there forwarded via the Internet to FTP / mail servers or even LoRa servers.
LoRa has the advantages over Cellular Radio that it is cheaper and requires less power (smaller, cheaper battery)

See <https://docs.pressuresuite.com/sending-technology/lora-technology/>

## What is an API?

[![What is an API](https://img.youtube.com/vi/s7wmiS2mSXY/0.jpg)](https://www.youtube.com/watch?v=s7wmiS2mSXY)

The Internet and Internet products essentially consist of devices that communicate with each other. The format of this interface is often a REST API. All large companies have APIs. Google Maps, for example, needs an API to query where a place is and reacts to maps, coordinates, ...

APIs are not sorcery solely for developers.
The PressureSuite Cloud API can also be tested (if authorized) at <https://api.pressuresuite.com/swagger/index.html?url=/swagger/v1/swagger.json>

If you as a specific software aks. e.g. "Give me the list of all devices", the answer would be:

`https://api.pressuresuite.com/v1/Devices`

And in answer you get from PressureSuite Cloud:

{{< highlight json >}}
{
    "totalRecords":3,
    "devices":[
        {
            "id": 1004,
            "name": "Eulach 03",
            "networkNode": "Winterthur",
            "transferType": "GSM",
            "gsmNumber": "+ 41774691179",
            "euiNumber": null
        },
        {
            "id": 1005,
            "name": "Eulach 10",
            "networkNode": "Winterthur",
            "transferType": "GSM",
            "gsmNumber": "+41774692307",
            "euiNumber": null
        },
        {
            "id": 1508,
            "name": "Pascal Swisscom 05",
            "networkNode": "Winterthur",
            "transferType": "LoRa",
            "gsmNumber": null,
            "euiNumber": "0004A30B001E5CD8"
        }
    ]
}
{{< /highlight >}}

The data format is called JSON (standard) and can be easily decrypted by all programming languages.

An API is very powerful. A customer can use the API to pick up all his data, save it or just show how it suits him.

## Where is the data stored?

All data is stored in an EU data center in Ireland in an SQL database.
It is automatically backed up every 10 minutes.

## How does the data get from the devices to the WebApp?

The entire system is not that complicated.

- The data from our sensors is regularly stored on FTP/mail servers.
- The PressureSuite Cloud in the background is also a collection of many small programs (Azure Functions), which perform regular tasks. For example, every 5 minutes, all FTP/mail servers are checked for new data, and new data is stored in a data queue.
- As soon as a new message is available from LoRa, it is stored in a data queue.
- Another program monitors the data queue, analyzes the content and origin, then converts the data and stores it in a database.
- There are other programs that regularly check the measured data for abnormalities and, if necessary, generate alarms and send emails.
- At the same time, there is this—our API. This is the gateway to the database. No customer can access the database directly. Everything goes through the API.
- You can log in with a username/password. An external service authorizes the user and responds with a special key that correctly identifies the user and allows them to use our API.
- Thanks to the key, the API knows which data it is allowed to send to the user/program.
- The WebApp is such a program that collects all data via the API. The measurement data are also sent in compressed and encrypted text formats to the WebApp. The WebApp (App = Application = Program) generates a chart itself based on the measured data.

## How safe is the cloud?

The cloud is very safe.
It uses modern processes, best practices, and tools. Everything was audited by Windows Azure experts (Microsoft MVP experts).
Authorization is managed externally (by Microsoft Azure Active Directory B2C). So, if you want to hack accounts from PressureSuite Cloud, then you have to hack Microsoft first.
Without proper authorization, it is not possible to get data.
You can only query the data assigned to the user. This means that a validly authorized user cannot see other users' data. This is even backed up at the database level (role-level feature SQL Server).

The greatest risk is not that our system (or Microsoft's) or a password is hacked, but that a customer mistakenly redistributes the password by themselves.

Microsoft Azure is one of the top three players in cloud services and meets several standards.

## Are there any specific standards that the cloud fulfills?

Security is one of the key features and concerns in IoT/cloud projects.

The PressureSuite Cloud uses the access, storage, and authentication of users and data in/from a MICROSOFT (Azure) data center.

This data center is in the EU and subject to EU regulations (EU Data Protection Regulation (DSGVO)) (i.e., no data may be shared with data centers outside the EU, especially not with US). <https://www.microsoft.com/de-de/TrustCenter/Privacy/gdpr/default.aspx>

In addition:

- There are not many standards of countries regarding cloud/data/privacy, yet. And if so, then they affect the "personal data" which does not concern us, because the PressureSuite Cloud stores mostly measurement data.
- What standards does Microsoft guarantee?

  - <https://azure.microsoft.com/en-us/overview/trusted-cloud/>   (overview)
  - <https://azure.microsoft.com/en-us/blog/microsoft-azure-leads-the-industry-in-iso-certifications/>  (overview)
  - List of standards:  <https://www.microsoft.com/en-us/trustcenter/compliance/complianceofferings>
eg  ISO 9001 , ISO 20000-1: 2011, ISO 2230, ISO 27001, ISO 27017, ISO 27018, BIR 2012 (Netherlands), UK G-Cloud, Argentina PDPA, ...

## Is there a terms of service(ToS)?

Yes.  See: https://docs.pressuresuite.com/PressureSuite_Cloud_Terms_and_Conditions_2024.pdf

## Does the chart show all measurement points?

To reduce the computing power needed to show the loaded measurement points in the chart (which is quite scarce when using a browser) a downsample algorithm is used. This algorithm reduces the displayed measurement points to a maximum number of 1500pts / channel. The algorithm is based on *Largest Triangle Three Buckets algorithm* described by *Sveinn Steinarsson* in his master thesis *"Downsampling Time Series for Visual Representation"* at the Faculty of Industrial Engineering, Mechanical Engineering and Computer Science University of Iceland (<https://skemman.is/handle/1946/15343>).
