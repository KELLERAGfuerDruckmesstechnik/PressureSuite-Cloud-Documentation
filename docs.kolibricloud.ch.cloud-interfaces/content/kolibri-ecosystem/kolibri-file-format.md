---
title: The KOLIBRI measurement JSON file
menu:
    main:
        parent: kolibri-ecosystem
        weight: 6

---

# Introduction
The KOLIBRI measurement file is meant to be a JSON file that has a structured and defined form in order to be used in various platform independent software tools. The main goal is to store measurement data and give information about the origin of the stored measurement data.  
The KOLIBRI measurement file is used by the 'KOLIBRI Desktop'-Software, the 'KOLIBRI Cloud' Web App/API and the coming new 'KOLIBRI Mobile' Apps (Android/iOS). The idea is that the data can (or will be) interchangeable between the products. It is now possible to export measurement data from the 'KOLIBRI Cloud Web App and open the file with KOLIBRI Desktop.  
This documentation helps to understand the file and makes an integration/transformation into other file formats or systems possible.


# Example files

Example file: 
- [KOLIBRI Desktop - ADT1](../../data/Kolibri_EUI-009D6B0000C53DD32023111408584720231201073847.json)
- [KOLIBRI Desktop - LEO Record](../../data/Kolibri_REC-10.2-123452023082308513220230824062552.json)
- [KOLIBRI Cloud - ARC1](../../data/CLOUD_ARC-9.20-5_2024.01.04_15-01-11.json)


# Basic structure of the JSON file
{{< highlight json >}}
{
  "Version": 1,
  "Header": {
    "MeasurementDefinitionsInBody": [5, 8, 2],
    "...": ".. more meta information"
  },
  "Body": [{
      "t": "2024-01-04T15:01:11",
      "v": [10.38257, 5.619995, -0.04195881]
    }, {
      "t": "2024-01-04T16:01:11",
      "v": [10.39307, 5.449951, -0.0421896]
    },
    "etc": ".. more measurements .."
  ]
}


The whole JSON file consists of three blocks
 - `Version`  
   Shows the version number of the JSON schema which was the number 1 ten years ago still is 1. If we introduce breaking changes it would be version 2.
 - ``Header``  
   Shows a lot of meta information to interpret the measurements. The first information is `MeasurementsDefinition` which indicates which raw measurements channels are stored in the `Body` part. https://docs.kolibricloud.ch/cloud-interfaces/api/channels/#measurementdefinitionid shows the mapping of the numbers to the physical channels. In the `Header` are also the calculation formula stored used to calculate values such as 'water level' out of the raw measurements.
 - ```Body```  
   Shows the list of raw measurements with a UTC time stamp (`t`) and the values (`v`).

Example:
On `2024-01-04T15:01:11` UTC it was measured  
  - value '**10.38257**' of MeasurmentDefinitionId '**5**' which is '**TOB1**' (Temperature Over the sensor)
  - value '**5.619995**' of MeasurmentDefinitionId '**8**' which is '**TBaro**' (Barometric Temperature measured inside the ARC1)
  - value '**-0.04195881**' of MeasurmentDefinitionId '**2**' which is '**P1**' (The first pressure which is for this type of level probe the pressure difference between the sensor pressure and the barometric pressure)


# File description

| Name | Description | Example |
| --- | --- | --- |
| Time | The time of the measurement | "2022-01-01T00:00:00Z" |
| Values | The values of the measurements | [1.0, 2.0, 3.0] |

| Name | Description | Example |
| --- | --- | --- |
| SourceUniqueSerialNumber | The unique serial number of the source | "1234567890" |
| GeneratedMeasurementDefinitionIds | The IDs of the generated measurement definitions | [1, 2, 3] |
| CompensationDateUTC | The UTC date of the compensation | "2022-01-01T00:00:00Z" |



| Name | Description | Example |
| --- | --- | --- |
| RecordName | The name of the record | "Record 1" |
| RecordNotes | The notes of the record | "This is a note" |


| Name | Description | Example |
| --- | --- | --- |
| SizeItem | The size of the item | 1.0 |
| Size | The size of the memory | "1KB" |
| HighPage | The high page of the memory | 1 |
| LowPage | The low page of the memory | 1 |
| EndHighPage | The end high page of the memory | 1 |
| EndLowPage | The end low page of the memory | 1 |
| PageCount | The count of the pages | 1 |
| SizeRecord | The size of the record | 1.0 |
| RecordTextSize | The text size of the record | 1 |

| Name | Description | Example |
| --- | --- | --- |
| WaterLevelCalculation | The calculation of the water level | { "WaterLevelType": WaterLevelType.HeightOfWater, "HydrostaticPressureChannelId": 1, "BarometricPressureChannelId": 2, "UseBarometricPressureToCompensate": true, "Offset": 0.0, "Density": 1.0, "Gravity": 9.8, "InstallationLength": 1.0, "HeightOfWellhead": 1.0 } |
| OverflowCalculation | The calculation of the overflow | { "OverflowType": OverflowType.Poleni, "HydrostaticPressureChannelId": 1, "BarometricPressureChannelId": 2, "UseBarometricPressureToCompensate": true, "Offset": 0.0, "Density": 1.0, "Gravity": 9.8, "WallHeight": 1.0, "FormFactor": 1.0, "FormAngle": 1.0, "FormWidth": 1.0 } |
| TankCalculation | The calculation of the tank | null |


| Name | Description | Example |
| --- | --- | --- |
| CalculationParameters | The parameters of the calculation | { "CalculationParameter1": "Value1", "CalculationParameter2": "Value2" } |
| CalculationTypeId | The ID of the calculation type | 1 |
| ChannelInfo | The information of the channel | { "ChannelId": 1, "ChannelName": "Channel 1" } |

| Name | Description | Example |
| --- | --- | --- |
| ConnectionTypeId | The ID of the connection type | 1 |




| Name | Description | Example |
| --- | --- | --- |
| MeasurementDefinitionsInBody | The list of all MeasurementDefinitionIds | [1, 2, 3, 4] |
| MeasurementDefinitionsInBodyAlternativeNames | The list of alternative names of the channels | ["Air Pressure", null, "P1", "P2"] |
| RecordId | Unique Record Id | "1234567890" |
| UniqueSerialNumber | Based on Device-ID and Serial Number | "1234567890" |
| SerialNumber | Every device has a serial number | "1234" |
| DeviceName | Give a good clear name | "Eulach 10 - Winterthur / GSM: +41774692307" |
| DeviceType | Mobile needs device type for identification | "30.05" |
| CreationDateTimeUTC | The UTC time the file will be created | "2022-01-01T00:00:00Z" |
| CreationDateTimeDeviceTime | The device time the file will be created | "2022-01-01T00:00:00" |
| IanaTimeZoneName | IANA Time Zone Name | "Europe/Zurich" |
| FirstMeasurementUTC | Should be .Body.First().Time | "2022-01-01T00:00:00Z" |
| LastMeasurementUTC | Should be .Body.Last().Time | "2022-01-01T23:59:59Z" |
| CreationOrigin | Which SW created this file? | Origin.Kolibri |
| IsBodyCompressed | We might encrypt the body in the future | false |
| MemoryInfo | InternalMemoryInfo | { "SizeItem": 1.0, "Size": "1KB" } |
| CompensationSourcesInfo | Information about the source measurements of the compensated channels | [ { "SourceUniqueSerialNumber": "1234567890", "GeneratedMeasurementDefinitionIds": [1, 2], "CompensationDateUTC": "2022-01-01T00:00:00Z" } ] |
| RemoteTransmissionUnitInfo | Information for RemoteTransmissionUnits | { "ConnectionTypeId": 1 } |
| CustomAttributes | MeasurementFileFormatCustomAttributes | { "RecordName": "Record 1", "RecordNotes": "This is a note" } |
| WaterCalculationStoredInDeviceSettings | MeasurementFileFormatWaterCalculationStoredInDevice | { "WaterLevelCalculation": { "WaterLevelType": WaterLevelType.HeightOfWater, "HydrostaticPressureChannelId": 1, "BarometricPressureChannelId": 2, "UseBarometricPressureToCompensate": true, "Offset": 0.0, "Density": 1.0, "Gravity": 9.8, "InstallationLength": 1.0, "HeightOfWellhead": 1.0 }, "OverflowCalculation": { "OverflowType": OverflowType.Poleni, "HydrostaticPressureChannelId": 1, "BarometricPressureChannelId": 2, "UseBarometricPressureToCompensate": true, "Offset": 0.0, "Density": 1.0, "Gravity": 9.8, "WallHeight": 1.0, "FormFactor": 1.0, "FormAngle": 1.0, "FormWidth": 1.0 }, "TankCalculation": null } |
| ChannelCalculations | List<MeasurementFileFormatChannelCalculation> | [ { "CalculationParameters": { "CalculationParameter1": "Value1", "CalculationParameter2": "Value2" }, "CalculationTypeId": 1, "ChannelInfo": { "ChannelId": 1, "ChannelName": "Channel 1" } } ] |
