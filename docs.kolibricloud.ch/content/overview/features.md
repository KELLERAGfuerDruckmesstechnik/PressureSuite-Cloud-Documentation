---
title: Features
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