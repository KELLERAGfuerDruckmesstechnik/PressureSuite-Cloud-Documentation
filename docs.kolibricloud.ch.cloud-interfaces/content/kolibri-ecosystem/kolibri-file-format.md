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
- [KOLIBRI Cloud - ADT1 LoRa](https://raw.githubusercontent.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation/master/docs.kolibricloud.ch.cloud-interfaces/static/data/CLOUD_EUI-E84F25000001A146_2023.11.22_16-19-13.json) 15KB
- [KOLIBRI Desktop - DCX](https://raw.githubusercontent.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation/master/docs.kolibricloud.ch.cloud-interfaces/static/data/REC-5.5-539216_2024-01-12_02_08_19.json) 365KB
- [KOLIBRI Cloud - ARC1](https://raw.githubusercontent.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-Documentation/master/docs.kolibricloud.ch.cloud-interfaces/static/data/CLOUD_ARC-9.20-1234_2024.01.12_09-10-01.json) 70KB


## Basic structure of the JSON file
```
{
  "Version": 1,
  "Header": {
    "MeasurementDefinitionsInBody": [ 2, 4, 7, 8 ],
//.. more meta information
  },
  "Body": [
    {
      "t": "2023-11-22T16:19:13.804",
      "v": [ 0.02652109, 6.126587, 0.97132, 5.82 ]
    },
    {
      "t": "2023-11-22T16:29:17.802",
      "v": [ 0.02997284, 6.145645, 0.97147, 5.88 ]
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
On `2023-11-22T16:19:13.804` UTC it was measured  
  - value '**0.02652109**' of MeasurementDefinitionId '**2**' which is '**P1**' (The first pressure which is for this type of level probe the pressure difference between the sensor pressure and the barometric pressure)
  - value '**6.126587**' of MeasurementDefinitionId '**4**' which is '**T**' (Temperature Over the sensor)
  - value '**0.97132**' *[Bar]* of MeasurementDefinitionId '**7**' which is '**PBaro**' (Barometric Pressure measured inside the ARC1)
  - value '**5.82**' *[°C]* of MeasurementDefinitionId '**8**' which is '**TBaro**' (Barometric Temperature measured inside the ARC1)



## Detailed file description

### Body

| Name | Description | Example |
| --- | --- | --- |
| t (Time) | The time of the measurement in UTC | "2023-11-22T16:19:13.804" |
| v (Values) | The values of the measurements | [ 0.02652109, 6.126587, 0.97132, 5.82 ] |

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
| RemoteTransmissionUnitInfo | Information for RemoteTransmissionUnits. This ConnectionTypeId indicates which channels can be measured by the sensors connected to the remote transmission device (sometimes called: DeviceTypeId). Range: 0-13. See https://docs.kolibricloud.ch/cloud-interfaces/api/channels#connection-types or manual | "RemoteTransmissionUnitInfo": {"ConnectionTypeId": 3 },|
| CustomAttributes | Dictionary with various information. Eg. "RecordNotes is the note text to the device in the KOLIBRI Cloud | { "RecordName": "CLOUD ARC-9.20-5 2024.01.04 15-01-11", "RecordNotes": "This is a note" } |
| WaterCalculationStoredInDeviceSettings | MeasurementFileFormatWaterCalculationStoredInDevice | "WaterCalculationStoredInDeviceSettings":{"WaterLevelCalculation":{"WaterLevelType":34,"HydrostaticPressureChannelId":11,"BarometricPressureChannelId":0,"UseBarometricPressureToCompensate":false,"Offset":0.0,"Density":998.2,"Gravity":9.80665,"InstallationLength":0.0,"HeightOfWellhead":0.0},"OverflowCalculation":null,"TankCalculation":null} |
| ChannelCalculations | List of calculations | "ChannelCalculations":[{"CalculationParameters":{"HydrostaticPressureMeasurementDefinitionId":"11","BarometricPressureMeasurementDefinitionId":"0","CorrespondingMeasurementDefinitionId":"34","Gravity":"9.80665","Offset":"0","Density":"998.2","UseBarometricPressureToCompensate":"False","From":null,"To":null},"CalculationTypeId":1,"ChannelInfo":{"ChannelType":34,"MeasurementDefinitionId":34,"Name":"mH20 (E)","Description":"","ColorCode":"#8c45ef","UnitType":3}}] |




## Calculation

### WaterCalculationStoredInDeviceSettings vs. ChannelCalculations

'WaterCalculationStoredInDeviceSettings' stores the water calculation that was configured on the device at the time of retrieving the measurement. This calculation will never be changed and is mainly to restore the original calculation.

The 'WaterCalculationStoredInDeviceSettings' will be duplicated and also stored in the 'ChannelCalculations', where the user can modify, delete or add additional calculations. All calculations in 'ChannelCalculations' will be calculated and displayed the calculations in KOLIBRI Desktop.

### WaterCalculationStoredInDeviceSettings

| Name | Description | Example |
| --- | --- | --- |
| OverflowCalculation | see 'WaterLevelCalculation' |  |
| WaterLevelCalculation | see 'OverflowCalculation' |  |
| TankCalculation | does not exist yet -> always 'null' |  |

Only one of the properties can have a value at a time, the other two will be 'null'

Examples:
```
        "WaterCalculationStoredInDeviceSettings": {
            "OverflowCalculation": {
                "BarometricPressureChannelId": 0,
                "Density": 998.0,
                "FormAngle": 1.0,
                "FormFactor": 1.111,
                "FormWidth": 0.0,
                "Gravity": 9.80665,
                "HydrostaticPressureChannelId": 2,
                "Offset": 0.002,
                "OverflowType": 1,
                "UseBarometricPressureToCompensate": false,
                "WallHeight": 0.03
            },
            "TankCalculation": null,
            "WaterLevelCalculation": null
        }
```
```
        "WaterCalculationStoredInDeviceSettings": {
            "OverflowCalculation": null,
            "TankCalculation": null,
            "WaterLevelCalculation": {
                "BarometricPressureChannelId": 0,
                "Density": 998.0,
                "Gravity": 9.80665,
                "HeightOfWellhead": 0.0,
                "HydrostaticPressureChannelId": 2,
                "InstallationLength": 10.0,
                "Offset": 0.0,
                "UseBarometricPressureToCompensate": false,
                "WaterLevelType": 35
            }
        }
```

#### WaterLevelCalculation

| Name | Description | Example |
| --- | --- | --- |
| WaterLevelType | Id of type of calculation (see enum 'WaterLevelType' below) | 35 |
| Density | Density of the liquid (kg/m³) | 998.0 |
| Gravity | Gravity (m/s²) | 9.80665 |
| HeightOfWellhead | Height of the wellhead above sea level (m) | 123.7 |
| InstallationLength | Length of the installation (m) | 3.5 |
| Offset | Offset to correct calculated value (m) | 0.02 |
| HydrostaticPressureChannelId | Channel Id of pressure channel to calculate water level (see MeasurementDefinitionId) | 1 |
| UseBarometricPressureToCompensate | indicator if calculation should use 'BarometricPressureChannelId' to compensate for barometric pressure | true |
| BarometricPressureChannelId |  Channel Id of barometric pressure channel to compensate (see MeasurementDefinitionId) | 2 |


#### OverflowCalculation

| Name | Description | Example |
| --- | --- | --- |
| OverflowType | Id of type of calculation (see enum 'OverflowType' below) | 1 |
| Density | Density of the liquid (kg/m³) | 998.0 |
| Gravity | Gravity (m/s²) | 9.80665 |
| FormAngle | Angle of cutout for 'Thomson' calculation (°) | 95.0  |
| FormFactor | Form factor to account for flow rate of different shapes of wall (between 0.85 and 1.37) | 1.14 |
| FormWidth | With of wall cutout for 'Poleni' calculation (m) | 4.2 |
| WallHeight | Height of the wall cutout relative to the sensor | 2.4 |
| Offset | Offset to correct calculated value (m) | 0.02 |
| HydrostaticPressureChannelId | Channel Id of pressure channel to calculate water level (see MeasurementDefinitionId) | 1 |
| UseBarometricPressureToCompensate | indicator if calculation should use 'BarometricPressureChannelId' to compensate for barometric pressure | true |
| BarometricPressureChannelId |  Channel Id of barometric pressure channel to compensate (see MeasurementDefinitionId) | 2 |

#### WaterCalculationStoredInDeviceSettings Enum descriptions

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

### ChannelCalculations



#### CalculationParameter Description

| Name | Description | Example |
| --- | --- | --- |
| Offset | Offset to correct calculated value | "0.2" |
| Density | Density of the liquid (kg/m³) | "998.2" |
| Gravity | Gravity (m/s²) | "9.80665" |
| CorrespondingMeasurementDefinitionId | Especially, when using multi-sensor measurementDefinitionId like 55-59 the target calculation might be another like 34-36. This information must be stored (see MeasurementDefinitionId) | "34" |
| ChannelId |  | "1" |
| HydrostaticPressureMeasurementDefinitionId | Channel Id of pressure channel to calculate water level (see MeasurementDefinitionId) | "1" |
| BarometricPressureMeasurementDefinitionId | Can be null if 'UseBarometricPressureToCompensate' is "False". (see MeasurementDefinitionId) | "2" |
| UseBarometricPressureToCompensate | indicator if calculation should use 'BarometricPressureMeasurementDefinitionId' to compensate for barometric pressure | "True" |
| InstallationLength |  | "2.3" |
| HeightOfWellheadAboveSea |  | "230" |
| WallHeight | Height of the wall cutout relative to the sensor (m) | "1.7" |
| FormFactor | Form factor to account for flow rate of different shapes of wall (between 0.85 and 1.37) | "1.11"|
| FormWidth | With of wall cutout for 'Poleni' calculation (m) | "1.4" |
| FormAngle | Angle of cutout for 'Thomson' calculation (°)  | "90" |
| Area |  | "2.2" |
| Width |  | "1" |
| Height |  | "22.1" |
| Length |  | "1.4" |
| TankType |  | "1" |
| From | Time from when the calculation is valid. Can be null. | "2022-12-11T07:55:25.7206325Z" |
| To | Time until the calculation is valid. Can be null. | "2023-12-11T07:55:25.7206325Z" |

#### Required CalculationParameter per CalculationType

- Unknown = 0,
- HeightOfWater = 1
  - HydrostaticPressureMeasurementDefinitionId
  - UseBarometricPressureToCompensate
  - BarometricPressureMeasurementDefinitionId [nullable]
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Offset
  - Density
  - From [nullable]
  - To [nullable]
- DepthToWater = 2
  - HydrostaticPressureMeasurementDefinitionId
  - UseBarometricPressureToCompensate
  - BarometricPressureMeasurementDefinitionId [nullable]
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Offset
  - Density
  - From [nullable]
  - To [nullable]
  - InstallationLength
- HeightOfWaterAboveSea = 3
  - HydrostaticPressureMeasurementDefinitionId
  - UseBarometricPressureToCompensate
  - BarometricPressureMeasurementDefinitionId [nullable]
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Offset
  - Density
  - From [nullable]
  - To [nullable]
  - HeightOfWellheadAboveSea
  - InstallationLength
- Offset = 4
  - Offset
  - ChannelId
- OverflowPoleni = 5
  - HydrostaticPressureMeasurementDefinitionId
  - BarometricPressureMeasurementDefinitionId
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Offset
  - Density
  - UseBarometricPressureToCompensate
  - WallHeight
  - FormFactor
  - FormWidth
- OverflowThomson = 6
  - HydrostaticPressureMeasurementDefinitionId
  - BarometricPressureMeasurementDefinitionId
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Offset
  - Density
  - UseBarometricPressureToCompensate
  - WallHeight
  - FormFactor
  - FormAngle
- OverflowVenturi = 7
  - HydrostaticPressureMeasurementDefinitionId
  - BarometricPressureMeasurementDefinitionId
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Offset
  - Density
  - UseBarometricPressureToCompensate
  - FormFactor
  - FormWidth
- Force = 8
  - HydrostaticPressureMeasurementDefinitionId
  - BarometricPressureMeasurementDefinitionId
  - Offset
  - Area
  - UseBarometricPressureToCompensate
- Tank = 9
  - HydrostaticPressureMeasurementDefinitionId
  - BarometricPressureMeasurementDefinitionId
  - CorrespondingMeasurementDefinitionId
  - Gravity
  - Density
  - UseBarometricPressureToCompensate
  - InstallationLength
  - Width
  - Height
  - Length
  - TankType


#### How to calculate

For each data point in the 'Body' of the measurement file:
- Look up the index of measurementDefinitionId in the 'Header.MeasurementDefinitionIds' (for both HydrostaticMeasurementDefinitionId and BarometricMeasurementDefinitionId)
- Take the measurement values at the determined index
- Insert the CalculationParameters and the previously determined values into the according formula
- Repeat for each measurement value in the 'Body'


#### Example
```
"ChannelCalculations": [
            {
                "CalculationParameters": {
                    "BarometricPressureMeasurementDefinitionId": "0",
                    "CorrespondingMeasurementDefinitionId": "35",
                    "Density": "998",
                    "From": null,
                    "Gravity": "9.80665",
                    "HydrostaticPressureMeasurementDefinitionId": "2",
                    "InstallationLength": "10",
                    "Offset": "0",
                    "To": null,
                    "UseBarometricPressureToCompensate": "False"
                },
                "CalculationTypeId": 2,
                "ChannelInfo": {
                    "ChannelType": 35,
                    "ColorCode": "#2196f3",
                    "Description": "",
                    "MeasurementDefinitionId": 35,
                    "Name": "mH20 (F)",
                    "UnitType": 3
                }
            },
            {
                "CalculationParameters": {
                    "BarometricPressureMeasurementDefinitionId": null,
                    "CorrespondingMeasurementDefinitionId": "34",
                    "Density": "998.2",
                    "From": null,
                    "Gravity": "9.80665",
                    "HydrostaticPressureMeasurementDefinitionId": "2",
                    "Offset": "0",
                    "To": null,
                    "UseBarometricPressureToCompensate": "False"
                },
                "CalculationTypeId": 1,
                "ChannelInfo": {
                    "ChannelType": 100,
                    "ColorCode": "#8c45ef",
                    "Description": "",
                    "MeasurementDefinitionId": 100,
                    "Name": "mH20 (E)",
                    "UnitType": 3
                }
            },
            {
                "CalculationParameters": {
                    "BarometricPressureMeasurementDefinitionId": null,
                    "CorrespondingMeasurementDefinitionId": "36",
                    "Density": "998.2",
                    "From": null,
                    "Gravity": "9.80665",
                    "HeightOfWellheadAboveSea": "0",
                    "HydrostaticPressureMeasurementDefinitionId": "2",
                    "InstallationLength": "0",
                    "Offset": "0",
                    "To": null,
                    "UseBarometricPressureToCompensate": "False"
                },
                "CalculationTypeId": 3,
                "ChannelInfo": {
                    "ChannelType": 100,
                    "ColorCode": "#3f51b5",
                    "Description": "",
                    "MeasurementDefinitionId": 100,
                    "Name": "mH20 (G)",
                    "UnitType": 3
                }
            }
        ],
```
```
    public enum CalculationType
    {
        Unknown = 0,
        HeightOfWater = 1,
        DepthToWater = 2,
        HeightOfWaterAboveSea = 3,
        Offset = 4,
        OverflowPoleni = 5,
        OverflowThomson = 6,
        OverflowVenturi = 7,
        Force = 8,
        Tank = 9
    }
```
```
    public enum UnitType
    {
        Unknown = 0,
        Pressure = 1,
        Temperature = 2,
        Length = 3,
        Conductivity = 4,
        Voltage = 5,
        Volume = 6,
        Density = 7,
        Acceleration = 8,
        Angle = 9,
        Flow = 10,
        Force = 11,
        Area = 12,
        Unitless = 13
    }
```
```
    public enum CalculationParameter
    {
        Offset,
        Density,
        Gravity,
        /// <summary>
        /// Especially, when using multi-sensor measurementDefinitionId like 55-59 the target calculation might be another like 34-36. This information must be stored
        /// The calculation is a default calculation, that has a calculation parameters for eg 34 but this property shows that it corresponds to one of the multi-sensor channels.
        /// </summary>
        CorrespondingMeasurementDefinitionId,
        ChannelId,
        HydrostaticPressureMeasurementDefinitionId,
        BarometricPressureMeasurementDefinitionId,
        UseBarometricPressureToCompensate,
        InstallationLength,
        HeightOfWellheadAboveSea,
        WallHeight,
        FormFactor,
        FormWidth,
        FormAngle,
        Area,
        Width,
        Height,
        Length,
        TankType,
        From,
        To,
    }
```

#### Formulas

*HeightOfWater = (HydrostaticPressure - BarometricPressure) / (density * gravity) + Offset*

*DepthToWater = InstallationLength - (HydrostaticPressure - BarometricPressure) / (density * gravity) + Offset*

*HeightOfWaterAboveSea = HeightOfWellheadAboveSea - InstallationLength + (HydrostaticPressure - BarometricPressure) / (density * gravity) + Offset*

##### Example
Given 
```
{
  "Version": 1,
  "Header": {
    "MeasurementDefinitionsInBody": [ 2, 4, 7, 8 ],
//.. more meta information
  },
  "Body": [
    {
      "t": "2023-11-22T16:19:13.804",
      "v": [ 0.02652109, 6.126587, 0.97132, 5.82 ]
    },
//.. more measurements
  ]
}
```
we know that the **pressure difference** is '**P1**' as this seems to be a relative sensor which already compensated with the atmospheric pressure. The pressure difference is '**0.02652109**'.


and

```
"ChannelCalculations": [{
        "CalculationParameters": {
            "HydrostaticPressureMeasurementDefinitionId": "2",
            "BarometricPressureMeasurementDefinitionId": null,
            "CorrespondingMeasurementDefinitionId": "34",
            "Gravity": "9.80665",
            "Offset": "0.02",
            "Density": "998.2",
            "UseBarometricPressureToCompensate": "False",
            "From": null,
            "To": null
        },
        "CalculationTypeId": 1,
        "ChannelInfo": {
            "ChannelType": 100,
            "MeasurementDefinitionId": 100,
            "Name": "mH20 (E)",
            "Description": "",
            "ColorCode": "#8c45ef",
            "UnitType": 3
        }
    }
]
```
The calculation type (CalculationTypeId = 1) is **'HeightOfWater'**. 

We use the formula
*HeightOfWater = (HydrostaticPressure - BarometricPressure) / (density * gravity) + Offset*

HeightOfWater = (**0.02652109** *[Bar]* * 100000 *[factorize to SI unit Pascal]*) / (**998** *[kg/m^3]* * **9.80665** *[m/s^2]*) + **0.02** ~= **0.291 m**

## Load data using C#

See https://github.com/KELLERAGfuerDruckmesstechnik/PressureSuiteFileFormatSamples