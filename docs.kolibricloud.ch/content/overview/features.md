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

### v.1.19108.01

#### Translations Update

The most used languages for the KOLIBRI Cloud (DE, EN, FI and NL) got updated and verified by native speakers.

#### Mail Import

In addition to FTP import, Mail import over SMTP can be used as well.

#### Calculations

We added the possibility to define additional Calculations to the already existing ones (Water and Tank Calculations). These new Calculations support all the Water Calculations for now.

To enable it, head to _Page Settings_ and scroll down to _Profile_:

![How to enable additional Calculations](/img/calculations/activate_calculations.png "How to enable additional Calculations")

The Calculations get shown in the Device-Detail at the top of the chart and can be modified the same way Water or Tank Calculations are modified:

![How to create an additional Calculation](/img/calculations/define_calculation.gif "How to create an additional Calculation")

The selected Calculations are shown in the chart as well:

![View Calculation in chart](/img/calculations/view_calculation.png "View Calculation in chart")

## Known Limitations
 - Only the default units (° C, bar, m..) will be exported. It is planned to make it possible to export the configured units.
 - The color scheme of the chart lines needs a redesign. Especially, line colors in the multiple device mode.
 - Export of measuring data of multiple devices produces a zip file with the Excel or CSV included instead of having all data in one single Excel/CSV included. It is planned to make this possible.
 - For now, Events (vertical line) nor reference heights (horizontal line) not event ranges (highlighted area) can be added to the chart.
 - Calculations are applied to ALL measurements. It is not possible have a separate calculation for a certain time frame and another calculation for another time range in the same chart.

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