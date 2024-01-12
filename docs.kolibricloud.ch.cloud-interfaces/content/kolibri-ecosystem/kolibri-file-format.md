---
title: The KOLIBRI measurement file
menu:
    main:
        parent: kolibri-ecosystem
        weight: 6

---

## Introduction
The KOLIBRI measurement file is meant to be a JSON file that has a structured and defined form in order to be used in various platform independent software tools. The main goal is to store measurement data and give information about the origin of the stored measurement data.  
The KOLIBRI measurement file is used by the 'KOLIBRI Desktop'-Software, the 'KOLIBRI Cloud' Web App/API and the coming new 'KOLIBRI Mobile' Apps (Android/iOS). The idea is that the data can (or will be) interchangeable between the products. It is now possible to export measurement data from the 'KOLIBRI Cloud Web App and open the file with KOLIBRI Desktop.  
This documentation helps to understand the file and makes an integration/transformation into other file formats or systems possible.


## Example files
- [KOLIBRI Cloud - ADT1 LoRa](https://raw.githubusercontent.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation/master/docs.kolibricloud.ch.cloud-interfaces/static/data/EUI-F84F25000001A0AD_2024-01-12_01_23_50.json) 22KB
- [KOLIBRI Desktop - DCX](https://raw.githubusercontent.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation/master/docs.kolibricloud.ch.cloud-interfaces/static/data/REC-5.5-539216_2024-01-12_02_08_19.json) 365KB
- [KOLIBRI Cloud - ARC1](https://raw.githubusercontent.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation/master/docs.kolibricloud.ch.cloud-interfaces/static/data/CLOUD_ARC-9.20-5_2024.01.04_15-01-11.json) 12KB


## Basic structure of the JSON file
```
{
  "Version": 1,
  "Header": {
    "MeasurementDefinitionsInBody": [5, 8, 2],
//.. more meta information
  },
  "Body": [{
      "t": "2024-01-04T15:01:11",
      "v": [10.38257, 5.619995, -0.04195881]
    }, {
      "t": "2024-01-04T16:01:11",
      "v": [10.39307, 5.449951, -0.0421896]
    },
//.. more measurements
  ]
}
```

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


## Detailed file description

### Body

| Name | Description | Example |
| --- | --- | --- |
| t (Time) | The time of the measurement in UTC | "2023-08-23T08:51:32Z" |
| v (Values) | The values of the measurements | [2, 5, 7, 11] |

### Header

| Name | Description | Example |
| --- | --- | --- |
| MeasurementDefinitionsInBody | REQUIRED. The list of all MeasurementDefinitionIds | [5, 8, 2]  Use the mapping in https://docs.kolibricloud.ch/cloud-interfaces/api/channels/#measurementdefinitionid to identify the correct channel|
| MeasurementDefinitionsInBodyAlternativeNames | OBSOLETE. Should be null. The list of alternative names of the channels | ["Water Temp", "Air Temp", "Pressure Diff"] |
| RecordId | Unique Record Id | "REC-10.2-157642023082308513220230824062552" |
| UniqueSerialNumber | Based on Device-Type (eg. "REC-10.2" or "ARC-9.20") and Serial Number (LoRa devices use the EUI instead the device number) | "EUI-009D6B0000C5D33D" |
| SerialNumber | Every device has a serial number | "1234" |
| DeviceName | The device name in KOLIBRI Cloud this is | "Eulach 10 - Winterthur" |
| DeviceType | Each KELLER device type has its own number | "30.05" |
| CreationDateTimeUTC | The UTC time the file was created based on the system that created the file | "2024-01-11T14:58:44.1999293Z" |
| CreationDateTimeDeviceTime | The time the file was created based on the time in the device. Some don't use UTC. | "2024-01-11T16:58:43" |
| IanaTimeZoneName | IANA Time Zone Name. See TZ identifier from https://en.wikipedia.org/wiki/List_of_tz_database_time_zones | "Europe/Zurich" or "CET" or "UTC" |
| FirstMeasurementUTC | Should be the UTC time stamp of the first measurement | "2023-08-23T08:51:32Z" |
| LastMeasurementUTC | Should be the UTC time stamp of the last measurement | "2023-08-24T06:25:52Z" |
| CreationOrigin | Which SW created this file? This is an enum. 0=Unknown, 1=Script, 2=Logger4, 3=Logger5, 4=KolibriDesktop, 5=KolibriMobile, 6=KolibriCloud, | 4 |
| IsBodyCompressed | We might encrypt the body in the future. This is always false as for now. | false |
| MemoryInfo | Internal Memory Info - Which gives information about the location of the data that was stored inside the device's memory | "MemoryInfo": {"SizeItem": 25.6,"Size": "25.6%","HighPage": 14,"LowPage": 251,"EndHighPage": 3,"EndLowPage": 25,"PageCount": 1047,"SizeRecord": 4096.0,"RecordTextSize": 8 } |
| CompensationSourcesInfo | Information about the source measurements of the compensated channels. Sometimes Level Probes do not have access to the barometric pressure. With KOLIBRI Desktop we can merge/interpolate the barometric pressure from other devices to make calculations possible.  | "CompensationSourcesInfo":[{"SourceUniqueSerialNumber":"REC-10.2-15764","GeneratedMeasurementDefinitionIds":[7],"CompensationDateUTC":"2023-08-24T06:28:52.6913177Z"},{"SourceUniqueSerialNumber":"REC-10.2-15764","GeneratedMeasurementDefinitionIds":[11],"CompensationDateUTC":"2023-08-24T06:30:56.1798789Z"},{"SourceUniqueSerialNumber":"REC-10.2-15764","GeneratedMeasurementDefinitionIds":[7,11],"CompensationDateUTC":"2023-08-24T06:36:26.4745526Z"}] |
| RemoteTransmissionUnitInfo | Information for RemoteTransmissionUnits. This ConnectionTypeId indicates which channels can be measured by the sensors connected to the remote transmission device (sometimes called: DeviceTypeId). Range 0-13 | "RemoteTransmissionUnitInfo": {"ConnectionTypeId": 3 },|
| CustomAttributes | Dictionary with various information. Eg. "RecordNotes is the note text to the device in the KOLIBRI Cloud | { "RecordName": "CLOUD ARC-9.20-5 2024.01.04 15-01-11", "RecordNotes": "This is a note" } |
| WaterCalculationStoredInDeviceSettings | MeasurementFileFormatWaterCalculationStoredInDevice | "WaterCalculationStoredInDeviceSettings":{"WaterLevelCalculation":{"WaterLevelType":34,"HydrostaticPressureChannelId":11,"BarometricPressureChannelId":0,"UseBarometricPressureToCompensate":false,"Offset":0.0,"Density":998.2,"Gravity":9.80665,"InstallationLength":0.0,"HeightOfWellhead":0.0},"OverflowCalculation":null,"TankCalculation":null} |
| ChannelCalculations | List of calculations | "ChannelCalculations":[{"CalculationParameters":{"HydrostaticPressureMeasurementDefinitionId":"11","BarometricPressureMeasurementDefinitionId":"0","CorrespondingMeasurementDefinitionId":"34","Gravity":"9.80665","Offset":"0","Density":"998.2","UseBarometricPressureToCompensate":"False","From":null,"To":null},"CalculationTypeId":1,"ChannelInfo":{"ChannelType":34,"MeasurementDefinitionId":34,"Name":"mH20 (E)","Description":"","ColorCode":"#8c45ef","UnitType":3}}] |



## Calculation

### WaterCalculationStoredInDeviceSettings vs. ChannelCalculations


### Example calculation


| Name | Description | Example |
| --- | --- | --- |
| WaterLevelCalculation | The calculation of the water level | { "WaterLevelType": WaterLevelType.HeightOfWater, "HydrostaticPressureChannelId": 1, "BarometricPressureChannelId": 2, "UseBarometricPressureToCompensate": true, "Offset": 0.0, "Density": 1.0, "Gravity": 9.8, "InstallationLength": 1.0, "HeightOfWellhead": 1.0 } |
| OverflowCalculation | The calculation of the overflow | { "OverflowType": OverflowType.Poleni, "HydrostaticPressureChannelId": 1, "BarometricPressureChannelId": 2, "UseBarometricPressureToCompensate": true, "Offset": 0.0, "Density": 1.0, "Gravity": 9.8, "WallHeight": 1.0, "FormFactor": 1.0, "FormAngle": 1.0, "FormWidth": 1.0 } |
| TankCalculation | The calculation of the tank | null |


```
    public enum WaterLevelType
    {
        HeightOfWater = 34,
        DepthToWater = 35,
        HeightOfWaterAboveSeaLevel = 36
    }

    public enum OverflowType
    {
        Poleni = 0,
        Thomson = 1,
        Venturi= 2,
    }
```

## Load data using C#

