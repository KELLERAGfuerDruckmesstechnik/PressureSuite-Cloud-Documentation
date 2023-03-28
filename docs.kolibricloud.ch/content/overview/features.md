---
title: New Features and Limitations
menu:
    main:
        parent: overview
        weight: 4
toc: false
description: Actual Release History and Known Limitations

---

# Release History and Known Limitations

## Releases

---

### v1.23087.03 (28.03.2023)

With this version, we introduce further device configuration options.

#### Devices Map

It was always possible to change the coordinates of a device from the WebApp. Now it is possible to see all devices that have coordinations (other than 0°00′00″N 0°00′00″W) in a map. It is also possible to change the location in the map to update the coordinates. Just be aware that changing a location also triggers a new configuration file in order to re-program/store the new coordination. This again needs battery changes.
![Devices Map](../../img/roadmap/DevicesMap.png)  

#### Device Alarms now store a measurement

It is possible to configure one (1) unit alarm in the unit that has its own alarm value test interval. Whenever an alarm value exceeds/falls below the alarm value, an alarm is triggered. This alarm can be sent as SMS, email or to the cloud (FTP). In the KOLIBRI Cloud it is visible in the alarm list (<https://www.kolibricloud.ch/alarms>) as 'Triggerd By Device'.  
In this version, the measurement that triggered the alarm is now also saved for each such alarm. This in turn makes it possible to trigger a Cloud alarm that reacts a few minutes after the device alarm and triggers the sending of (several) warning emails. Otherwise, the cloud alarm would have been triggered (hours later) when the batch of measurements was sent.

---

### v1.22059.01 (28.02.2022)

With this version, we introduce further device configuration options.

#### Device configuration > Measurement start time

The measurement start time can now be configured in the device configuration.
![image](https://user-images.githubusercontent.com/36856727/155985007-1f38fcbc-f8b7-497f-bb86-5824b1b938cb.png)

#### Device configuration > Device admin

The new "Device Admin" configuration allows additional possibilities to manage the devices and recorded measurements. This is only available for the "Customer Admin" role.
![image](https://user-images.githubusercontent.com/36856727/155989537-28cd4663-176a-4ea3-920d-124152390ce4.png)

### v.1.22034.01 (05.02.2022)

This release introduces the water calculation history and a log component.

##### Water Calculation History

Changing the water calculation is now possible without losing the old calculation (eg. due to changing installation). This way, past calculations will still be visualized and exported by the KOLIBRI Cloud!
![image](https://user-images.githubusercontent.com/36856727/153419252-c966d1db-38f7-45a9-9e48-a37640b4295a.png)

Unfortunately, the API endpoints have changed

##### Log Component

Changing configurations, settings and calculations are now stored to give certain traceability for understanding the system and allow to post-configure multiple installations per device. The 'Device Log' discloses the changes and who did the changes.
![image](https://user-images.githubusercontent.com/36856727/153418136-91f883d9-dff1-4d29-916b-d8e974c89296.png)

### v.1.21253.03 (10.09.2021)

#### Auto-Device-Alarms

Some alarms are automatically triggered when certain events occur. These alarms are sent to the alarm mail addresses defined in the *Account Settings* (<https://www.kolibricloud.ch/account-settings>). Users with the 'Contributor' or 'Customer Admin' role can add one or multiple E-Mail recipients.  

* Device Alarm  
  * Device stopped sending measurements (with E-Mail-alarm)
  * Low Battery / Low Capacity - Warn when the battery has to be replaced  (with E-Mail-alarm)
  * Too high humidity  (with E-Mail-alarm)

![Alarm Overview](../../img/roadmap/AlarmOverview.png)

![Alarming](../../img/roadmap/SystemDeviceAlarms.png)  

#### Dialogs for new users and new features

We now display dialogs for new users or new features.

First log in dialog
* When a user first logs in, there is a dialog explaining how to join a customer group or add new signed-up users.

Welcome dialog
* When a user is a member of a customer-group a welcome dialog with useful tips and links is shown.

New feature dialog
* When a new important feature is introduced, there will be a dialog explaining the feature. The first one will be a dialog about the new alarming-feature.

### v.1.21242.02 (30.08.2021)

#### Display and export of Overflow calculations possible

#### Overflow Calculations

We now support overflow calculations.  

![flow calc use](../../img/roadmap/use-flow-calculation.png)  
![flow calc enabling in page settings](../../img/roadmap/enable-flow-calculation.png)  

Works:
* Display of Overflow Calculations (use the Page Settings to enable them) and export them to Excel, CSV etc.  

Does not work:
* Currently, it is not possible to set an alarm to a certain flow.
* We plan to add a special report to show the flown volume.

#### Performance improvements and bug fixes

Several bug fixes and speed improvements.

#### TTN V3 descriptions

With the change from the open LoRaWAN network platform TheThingsNetwork (TTN) from V2 to V3 we added our LoRaWAN devices to the new TTN repository in order to easier configure or change the devices into TTN v3.  
![TTN v3 device repository](https://docs.kolibricloud.ch/sending-technology/TTNv3-easy-02.png)

From April 2021 on, no new devices will be able to be added to the old V2 stack at <https://console.thethingsnetwork.org/>. V3 is available on <https://eu1.cloud.thethings.network/console/>

Version 2 will definitely shut down on December 1st 2021. Please migrate your devices into TTN v3!
More information: <https://docs.kolibricloud.ch/sending-technology/lora-technology/integration-with-ttn/>  or <https://www.thethingsnetwork.org/forum/t/the-things-network-upgrade-to-v3/43256>

### v.1.21088.01 (30. March 2021)

#### Offset channels as reference lines

It is possible to add multiple reference lines to show various installation-depending components such as the 'maximal possible water height' or the 'installation depth'.  
![Offset channels as reference lines](../../img/reference-lines.png)  

### v.1.21042.01 (11. February 2021)

#### Show customer admin

Users can now find the name of their customer admin in the account settings.
![Administrator Settings](../../img/roadmap/CustomerAdmin.png)  

#### Administer users and their rights

With this new feature, the customer administrators can now add new users to their customer group and update their role.
Roles:

* Customer admin: Administrator of this group (cannot be grante to another user)
* Contributor: Can change settings and display options of charts
* Reader: Can only display but not change any settings

Users can also be set inactive, which prevents them from signing in
![Administrator Settings](../../img/roadmap/AdminSettings.png)  

### v.1.21003.01 (03. January 2021)

#### Localized Landing Page

Depending on where the user logs in the welcome page is in German or English or something in between. It is possible to localize this page to various languages such as
English, German, Suomi, Russian, Chinese, Swedish, Turkish, Italian, Spanish, Dutch, Polish
![Localized Landing Page](../../img/roadmap/LoginPageLocalized.png)  

#### Explainer videos

Youtube-videos that show the functionalities and get a short overview.

#### Process descriptions

It is needed to have an easy overview of how to initialize a project with as a sales person, as a customer as KOLIBRI Cloud support person...  
A check list and a graphical overview is wished.  

#### Free .NET DLL to convert data from/to ARC1/ADT1

See: <https://iotconverter.kolibricloud.ch>  

### v.1.20228.01 (15. August 2020)

#### Individual channel customizations

A long awaiting feature is the possibility to set a different **color** and **name** per channel per device. And each device should have different scale settings.  
![Individual channel customizations](../../img/roadmap/CustomizedChannels.png)  

#### Export and Alarming in other units (not only m, °C, bar)

Users using the imperial system need the possibility to export in units like feet, inch and Fahrenheit.
When improving the export it shall also be able to export & alarm of Tank- and Overflow Calculation.
![Export and Alarming in other units](../../img/roadmap/MultipleDevicesExporWithCustomUnits.png)

#### Performance

We optimize various methods by caching data in order to quickly load various components. Performance is always a feature, and we will further improve it.  
Every API call using the Permanent Access Token was ~1 sec because the 1 sec was needed for the authentication process. We cache this now and only the first API call has now 1 sec, all other generic calls should be around 50-100ms.  
![Performance](../../img/roadmap/performance.png)  

### v.1.20189.01 (07. July 2020)

#### More languages (eg. Polish, Spanish)

We added more languages plus revised the existing terms in cooperation with native partners.  
![More languages 1](../../img/roadmap/Poland.png) ![More languages 2](../../img/roadmap/Spain.png)  

#### Customized Alarm-Mail message subject

The subject of a mail is configurable per device.

#### Account Settings

* Group-wide "System & Device Alarms" Email
* Add LoRa device with EUI from device

#### Add FTP account for self-assignment of devices

This feature lets a customer admin add FTP server credentials. Each new device communicating from this FTP will automatically be added to the customers group.  
![Add FTP account for auto-assignment of devices](../../img/add_ftp_image.png)  

#### Auto-add used channels

Especially with the new LoRa ADT devices the used channels have to be changed according to the users configuration. At the same time the user expect to see measuring data from channels that are not sending data anymore but have stored data.  
![Auto-Add used channels](../../img/roadmap/AutoAssingmentOfUsedChannels.png)

#### Show Permanent Token for Administrators

To make it easier for the users and the KOLIBRI support team the individual permanent tokens of the *contributor* users are shown.  
![Show Permanent Token for Administrators](../../img/admin_token.png)  

### v.1.19352.02 (18. December 2019)

#### Device Configuration

Some devices configurations can now be seen and saved through the KOLIBRI Cloud.

### v.1.19315.01 (11. November 2019)

#### PREVIEW: Device Configuration

**PREVIEW**: Some devices configurations can now be seen in through the KOLIBRI Cloud. We are now testing the sending and fixing various issues.

![Device Configuration](/img/device_configuration.png "Device Configuration")

#### Chart Performance

Chart performance has been optimized. This was accomplished by two main adjustments:

* Calculating the correct timezone to display on the chart is a time-consuming thing when done in the browser. That is why it is now calculated on the backend.
* Displaying over 100'000 data points per channel is not efficient nor really useful as the chart is limited to 1000 pixel wide so it is not possible to present them. The backend no uses the [Largest Triangle Three Buckets algorithm](https://docs.kolibricloud.ch/faq/overview/#does-the-chart-show-all-measurement-points) to down-sample the loaded data to a maximum of 1'500 data points per channel. This leads to a drastic performance boost without a significant accuracy loss. The downside of this is that when zooming in some values might be missing. The export feature still exports all data.

#### Last Data Values

Tank calculations have been added to the "Last Data Values" in the device table.

#### Column widths in Device and Alarm Table

The column widths of the device and alarm table have been adjusted to the expected width of the texts within the columns.

#### Mail Addresses in Alarm Settings

The mail addresses in alarm settings can now be added by pressing "," or ";" while typing. After adding a mail address it appears as a so called chip token. Clicking "x" on the chip token removes the mail address from the settings.

Copy and pasting a comma or semicolon separated list of mail addresses works accordingly.

![How to enter mail addresses](/img/enter_alarm_email_addresses.gif "How to enter mail addresses")

#### Number of Decimal Places

KOLIBRI Cloud now supports 0 as decimal precision in page settings.

![0 as number of decimal places](/img/page_settings_units_precision.png "0 as number of decimal places")

#### Scale Settings

As the scale settings consist of five different units, it used to be difficult to enter big numbers into the "max" and "min" field.

The settings are now split into two rows which leaves enough room for the parameters to be adjusted without the space restrictions.

Scale settings are now being saved on the browser side. It must be kept in mind that if the browser / workstation is switched or KOLIBRI Cloud is opened in an incognito window the settings will be reset to the default value. Furthermore, the scale settings do not distinguish between devices.

![New layout for scale settings](/img/scale_settings.png "New layout for scale settings")

---

### v.1.19108.01 (18. April 2019)

#### Translations Update

The most used languages for the KOLIBRI Cloud (DE, EN, FI and NL) got updated and verified by native speakers.

#### Mail Import

In addition to FTP import, Mail import over SMTP can be used as well.

#### Calculations

We added the possibility to define additional Calculations to the already existing ones (Water and Tank Calculations). These new Calculations support all the Water Calculations for now.

To enable it, head to *Page Settings* and scroll down to *Profile*:

![How to enable additional Calculations](/img/calculations/activate_calculations.png "How to enable additional Calculations")

The Calculations get shown in the Device-Detail at the top of the chart and can be modified the same way Water or Tank Calculations are modified:

![How to create an additional Calculation](/img/calculations/define_calculation.gif "How to create an additional Calculation")

The selected Calculations are shown in the chart as well:

![View Calculation in chart](/img/calculations/view_calculation.png "View Calculation in chart")

## Known Limitations

* Export of measuring data of multiple devices produces a zip file with the Excel or CSV included instead of having all data in one single Excel/CSV included. It is planned to make this possible.
* For now, Events (vertical line) nor reference heights (horizontal line) not event ranges (highlighted area) can be added to the chart.
* Calculations are applied to ALL measurements. It is not possible have a separate calculation for a certain time frame and another calculation for another time range in the same chart.

<hr />
<hr />
  <div>
  <section class="features py-3">
    <h2 class="text-center">Existing Features</h2>
    <div class="row py-3">
      <div class="col-sm-4">
        <h4><i class="far fa-dot-circle"></i> KELLER unlimited</h4>
        <p class="content">
          «ONE SOFTWARE» – No installation necessary, data is displayed in browser.</br>
          All pressure measurement data available in one place.
        </p>
      </div>
      <div class="col-sm-4">
        <h4><i class="fas fa-broadcast-tower"></i> LoRa and GSM ready</h4>
        <p class="content">
          LoRa & GSM data directly saved to the KOLIBRI Cloud.</br>
          No need for PC software (GSM2Datamanager) and maintenance-free.
        </p>
      </div>
      <div class="col-sm-4">
        <h4><i class="fas fa-users"></i> Multi-Tenancy</h4>
        <p class="content">
          Data can be viewed and used by multiple users at the same time.</br>
          Structured data stored at any time and accessible from any device via browser.
        </p>
      </div>
    </div>
    <div class="row py-3">
      <div class="col-sm-4">
        <h4><i class="fas fa-chart-line"></i> Visualise with charts</h4>
        <p class="content">
          Visualise and analyse stored data in KOLIBRI Cloud.
        </p>
      </div>
      <div class="col-sm-4">
        <h4><i class="fas fa-exclamation-triangle"></i> Alarming</h4>
        <p class="content">
          Set and receive device and system alarms.
        </p>
      </div>
      <div class="col-sm-4">
        <h4><i class="fas fa-lock"></i> Secure</h4>
        <p class="content">
          „State of the Art“ security with HTTPS, SSL, OAuth 2.0, ...</br>
          DB backups of your data every 10min.
        </p>
      </div>
    </div>
    <div class="row py-3">
      <div class="col-sm-4">
        <h4><i class="fas fa-exchange-alt"></i> Compatibility</h4>
        <p class="content">
          Supports existing and new KELLER IoT products and IoT protocols: GSM, ARC, LoRa, KOLIBRI Mobile App and Desktop App.
        </p>
      </div>
      <div class="col-sm-4">
        <h4><i class="fas fa-plug"></i> API integration</h4>
        <p class="content">
          Flexible access via standard interfaces to your own cloud services or local databases.
        </p>
      </div>
      <div class="col-sm-4">
        <h4><i class="fas fa-file-export"></i> Export data</h4>
        <p class="content">
          Export using API possible or easy export in CSV, Excel, Hydras, Aquainfo,...
        </p>
      </div>
    </div>
  </section>
</div>
