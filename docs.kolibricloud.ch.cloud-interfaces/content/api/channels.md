---
title: KELLER Device Channel Mapping
menu:
    main:
        parent: api
        weight: 3
---

# KELLER Channel mapping

The KELLER IoT devices can have multiple types of connection as there are multiple use cases for many customers.  

## Connection Types

We differ between 13 connection types. Customer that know the GSMSetup-tool recognize them as *"HW Connection Device Types"*  

![Connection Types in GSMSetup](../../img/GSMSetupConnectionTypes.png "Connection Types in GSMSetup")

| ***DeviceTypeId*** | ***Device Type***                                                  |
| ------------------ |------------------------------------------------------------------- |
| 0                  | RS485                                                              |
| 1                  | RS485 & 2 Dig.Inp.                                                 |
| 2                  | RS485 & Baro (P1-P2) & Dig.Inp. 1                                  |
| 3                  | RS485 & Baro (P1-PB) & Dig.Inp.1                                   |
| 4                  | RS485 & Baro (P1-P2) & Dig.Inp.1 & Volt Inp.                       |
| 5                  | RS485 & Baro (P1-PB) & Dig.Inp.1 & Volt Inp. 1                     |
| 6                  | RS485(x5) & Baro (P1-P2) & Dig.Inp1/2 = Counter Inp. & Volt Inp.   |
| 7                  | SDI12 & Baro & Digital Inp.1 & Volt Inp                            |
| 8                  | RS485 (5xP1+TOB1) & Baro & Dig.Inp. 1/2                            |
| 9                  | RS485 CTD & Baro (P1-P2) & Dig.Inp. 1 & Volt. Inp. 1               |
| 10                 | RS485 CTD & Baro (P1-PB) & Dig.Inp. 1 & Volt. Inp.                 |
| 11                 | RS485 CTD & Baro (3x P1+TOB1+Cond comp+Tcon) & Baro & Counter Inp. |
| 12                 | RS485 & Baro (P1-PBaro) & Modbus ABB Aquamaster                    |
| 13                 | RS485 (2x(P1+P2+TOB1+TOB2)) & Counter Inp. & Volt Inp.             |
  
Depending on the chosen ***DeviceTypeId*** one has a different set of channel numbers (***ChannelNumber***). These ***ChannelNumber*** are again mapped to certain ***MeasurementDefinitionId*** 's which defines the physical measurement identification and unit.

## MeasurementDefinitionId

##### What is a **MeasurementDefinitionId**?
This is an integer number representing a MeasurementDefinition and is, currently, between 1 and 54.

A MeasurementDefinition represent the physical unit. In other KELLER SW the "channel number" is used but because in the KOLIBRI Cloud there are many different devices (GSM, ARC, ADT..) with various ways to connect sensors ("DeviceType" (or "Connection Types")) it was settled on using a so called "Measurement Definition" that defines the measured physical unit.

>E.g.:
MeasurementDefinition "**PBaro**" which is the "**Barometric Pressure**" inside an ARC1 or ADT1. It has an MeasurementDefinitionId of "*7*".
MeasurementDefinition "**TBaro**" which is the "**Barometric Temperature**" inside an ARC1 or ADT1. It has an MeasurementDefinitionId of "*8*".
MeasurementDefinition "**TOB1 (4)**" which is the temperature on the 4th attached probe. It has an MeasurementDefinitionId of "*32*".

There are also calculated MeasurementDefinitions.
MeasurementDefinition "**F**" which is the "**Water Depth**" calculated from a pressure difference and other parameters. It has an MeasurementDefinitionId of "*35*".  


| ***MeasurementDefinitionId*** | ***MeasurementDefinition***        |
| ----------------------------- |----------------------------------- |
| 1                             | Pd (P1-P2)                         |
| 2                             | P1                                 |
| 3                             | P2                                 |
| 4                             | T                                  |
| 5                             | TOB1                               |
| 6                             | TOB2                               |
| 7                             | PBaro                              |
| 8                             | TBaro                              |
| 9                             | Volt Inp. 1                        |
| 10                            | Volt Inp. 2                        |
| 11                            | Pd (P1-PBaro)                      |
| 12                            | Conductivity Tc                    |
| 13                            | Conductivity raw                   |
| 14                            | T (Conductivity)                   |
| 15                            | P1 (2)                             |
| 16                            | P1 (3)                             |
| 17                            | P1 (4)                             |
| 18                            | P1 (5)                             |
| 19                            | Counter input                      |
| 20                            | SDI12 CH1                          |
| 21                            | SDI12 CH2                          |
| 22                            | SDI12 CH3                          |
| 23                            | SDI12 CH4                          |
| 24                            | SDI12 CH5                          |
| 25                            | SDI12 CH6                          |
| 26                            | SDI12 CH7                          |
| 27                            | SDI12 CH8                          |
| 28                            | SDI12 CH9                          |
| 29                            | SDI12 CH10                         |
| 30                            | TOB1 (2)                           |
| 31                            | TOB1 (3)                           |
| 32                            | TOB1 (4)                           |
| 33                            | TOB1 (5)                           |
| 34                            | E                                  |
| 35                            | F                                  |
| 36                            | G                                  |
| 37                            | mH20 (Pbaro)                       |
| 38                            | mH20 (P1-P2)                       |
| 39                            | mH20 (P1-P3)                       |
| 40                            | mH20 (P1-P4)                       |
| 41                            | mH20 (P1-P5)                       |
| 42                            | Conductivity Tc (2)                |
| 43                            | Conductivity Tc (3)                |
| 44                            | T (Conductivity) (2)               |
| 45                            | T (Conductivity) (3)               |
| 46                            | P2 (2)                             |
| 47                            | TOB2 (2)                           |
| 48                            | AquaMaster Flow Rate               |
| 49                            | AquaMaster Pressure                |
| 50                            | AquaMaster Custom Flow Units       |
| 51                            | AquaMaster External Supply Voltage |
| 52                            | Tank Content 1                     |
| 53                            | Tank Content 2                     |
| 54                            | Tank Content 3                     |

## Mapping  

| ***ChannelNumber*** | ***DeviceTypeId*** | ***MeasurementDefinitionId*** |
| ------------------- | ------------------ | ----------------------------- |
| 1                   | 0                  | 1                             |
| 2                   | 0                  | 2                             |
| 3                   | 0                  | 3                             |
| 4                   | 0                  | 4                             |
| 5                   | 0                  | 5                             |
| 6                   | 0                  | 6                             |
| 1                   | 1                  | 1                             |
| 2                   | 1                  | 2                             |
| 3                   | 1                  | 3                             |
| 4                   | 1                  | 4                             |
| 5                   | 1                  | 5                             |
| 6                   | 1                  | 6                             |
| 1                   | 2                  | 11                            |
| 2                   | 2                  | 2                             |
| 3                   | 2                  | 3                             |
| 4                   | 2                  | 4                             |
| 5                   | 2                  | 5                             |
| 6                   | 2                  | 6                             |
| 7                   | 2                  | 7                             |
| 8                   | 2                  | 8                             |
| 1                   | 3                  | 11                            |
| 2                   | 3                  | 2                             |
| 3                   | 3                  | 3                             |
| 4                   | 3                  | 4                             |
| 5                   | 3                  | 5                             |
| 6                   | 3                  | 6                             |
| 7                   | 3                  | 7                             |
| 8                   | 3                  | 8                             |
| 1                   | 4                  | 1                             |
| 2                   | 4                  | 2                             |
| 3                   | 4                  | 3                             |
| 4                   | 4                  | 4                             |
| 5                   | 4                  | 5                             |
| 6                   | 4                  | 6                             |
| 7                   | 4                  | 7                             |
| 8                   | 4                  | 8                             |
| 9                   | 4                  | 9                             |
| 10                  | 4                  | 10                            |
| 1                   | 5                  | 11                            |
| 2                   | 5                  | 2                             |
| 3                   | 5                  | 3                             |
| 4                   | 5                  | 4                             |
| 5                   | 5                  | 5                             |
| 6                   | 5                  | 6                             |
| 7                   | 5                  | 7                             |
| 8                   | 5                  | 8                             |
| 9                   | 5                  | 9                             |
| 10                  | 5                  | 10                            |
| 1                   | 6                  | 1                             |
| 2                   | 6                  | 2                             |
| 3                   | 6                  | 3                             |
| 4                   | 6                  | 4                             |
| 5                   | 6                  | 5                             |
| 6                   | 6                  | 6                             |
| 7                   | 6                  | 7                             |
| 8                   | 6                  | 8                             |
| 9                   | 6                  | 9                             |
| 10                  | 6                  | 10                            |
| 11                  | 6                  | 15                            |
| 12                  | 6                  | 16                            |
| 13                  | 6                  | 17                            |
| 14                  | 6                  | 18                            |
| 15                  | 6                  | 19                            |
| 2                   | 7                  | 7                             |
| 3                   | 7                  | 8                             |
| 4                   | 7                  | 9                             |
| 5                   | 7                  | 10                            |
| 6                   | 7                  | 20                            |
| 7                   | 7                  | 21                            |
| 8                   | 7                  | 22                            |
| 9                   | 7                  | 23                            |
| 10                  | 7                  | 24                            |
| 11                  | 7                  | 25                            |
| 12                  | 7                  | 26                            |
| 13                  | 7                  | 27                            |
| 14                  | 7                  | 28                            |
| 15                  | 7                  | 29                            |
| 1                   | 8                  | 2                             |
| 2                   | 8                  | 5                             |
| 3                   | 8                  | 15                            |
| 4                   | 8                  | 30                            |
| 5                   | 8                  | 16                            |
| 6                   | 8                  | 31                            |
| 7                   | 8                  | 17                            |
| 8                   | 8                  | 32                            |
| 9                   | 8                  | 18                            |
| 10                  | 8                  | 33                            |
| 11                  | 8                  | 9                             |
| 12                  | 8                  | 10                            |
| 13                  | 8                  | 7                             |
| 14                  | 8                  | 8                             |
| 15                  | 8                  | 19                            |
| 1                   | 9                  | 1                             |
| 2                   | 9                  | 2                             |
| 3                   | 9                  | 3                             |
| 4                   | 9                  | 14                            |
| 5                   | 9                  | 5                             |
| 6                   | 9                  | 6                             |
| 7                   | 9                  | 7                             |
| 8                   | 9                  | 8                             |
| 9                   | 9                  | 9                             |
| 10                  | 9                  | 10                            |
| 11                  | 9                  | 12                            |
| 12                  | 9                  | 13                            |
| 1                   | 10                 | 11                            |
| 2                   | 10                 | 2                             |
| 3                   | 10                 | 3                             |
| 4                   | 10                 | 14                            |
| 5                   | 10                 | 5                             |
| 6                   | 10                 | 6                             |
| 7                   | 10                 | 7                             |
| 8                   | 10                 | 8                             |
| 9                   | 10                 | 9                             |
| 10                  | 10                 | 10                            |
| 11                  | 10                 | 12                            |
| 12                  | 10                 | 13                            |
| 1                   | 11                 | 2                             |
| 2                   | 11                 | 5                             |
| 3                   | 11                 | 12                            |
| 4                   | 11                 | 14                            |
| 5                   | 11                 | 15                            |
| 6                   | 11                 | 30                            |
| 7                   | 11                 | 42                            |
| 8                   | 11                 | 44                            |
| 9                   | 11                 | 16                            |
| 10                  | 11                 | 31                            |
| 11                  | 11                 | 43                            |
| 12                  | 11                 | 45                            |
| 13                  | 11                 | 7                             |
| 14                  | 11                 | 8                             |
| 15                  | 11                 | 19                            |
| 1                   | 12                 | 11                            |
| 2                   | 12                 | 2                             |
| 3                   | 12                 | 3                             |
| 4                   | 12                 | 14                            |
| 5                   | 12                 | 5                             |
| 6                   | 12                 | 6                             |
| 7                   | 12                 | 7                             |
| 8                   | 12                 | 8                             |
| 9                   | 12                 | 9                             |
| 10                  | 12                 | 10                            |
| 11                  | 12                 | 48                            |
| 12                  | 12                 | 49                            |
| 13                  | 12                 | 50                            |
| 14                  | 12                 | 51                            |
| 15                  | 12                 | 19                            |
| 1                   | 13                 | 2                             |
| 2                   | 13                 | 3                             |
| 3                   | 13                 | 5                             |
| 4                   | 13                 | 6                             |
| 5                   | 13                 | 15                            |
| 6                   | 13                 | 46                            |
| 7                   | 13                 | 30                            |
| 8                   | 13                 | 47                            |
| 9                   | 13                 | 7                             |
| 10                  | 13                 | 8                             |
| 11                  | 13                 | 9                             |
| 12                  | 13                 | 10                            |
| 13                  | 13                 | 19                            |

## Example

Let's say ***DeviceTypeId*** *5* is chosen which is *"RS485 & Baro (P1-PB) & Dig.Inp.1 & Volt Inp. 1"*.  
With the mapping above this gives us

| ***ChannelNumber*** | ***DeviceTypeId*** | ***MeasurementDefinitionId***| ***MeasurementDefinition*** |
| ------------------- | ------------------ | ---------------------------- | --------------------------- |
| 1                   | 5                  | 11                           | Pd (P1-PBaro)               |
| 2                   | 5                  | 2                            | P1                          |
| 3                   | 5                  | 3                            | P2                          |
| 4                   | 5                  | 4                            | T                           |
| 5                   | 5                  | 5                            | TOB1                        |
| 6                   | 5                  | 6                            | TOB2                        |
| 7                   | 5                  | 7                            | PBaro                       |
| 8                   | 5                  | 8                            | TBaro                       |
| 9                   | 5                  | 9                            | Volt Inp. 1                 |
|10                   | 5                  | 10                           | Volt Inp. 2                 |

This is also visible through the API...
![Device Details of Device 1834](../../img/APIDeviceDetails.png "Device Details of Device 1834")
...the response is:  

{{< highlight json >}}
{
    "deviceId": 1834,
    "stationId": "GSM: +901405100488246",
    "measurementDefinitions": [
    {
        "id": 11,
        "name": "Pd (P1-PBaro)",
        "unitId": 101,
        "isActive": true
    },
    {
        "id": 2,
        "name": "P1",
        "unitId": 101,
        "isActive": true
    },
    {
        "id": 3,
        "name": "P2",
        "unitId": 101,
        "isActive": false
    },
    {
        "id": 4,
        "name": "T",
        "unitId": 201,
        "isActive": false
    },
    {
        "id": 5,
        "name": "TOB1",
        "unitId": 201,
        "isActive": true
    },
    {
        "id": 6,
        "name": "TOB2",
        "unitId": 201,
        "isActive": false
    },
    {
        "id": 7,
        "name": "PBaro",
        "unitId": 101,
        "isActive": true
    },
    {
        "id": 8,
        "name": "TBaro",
        "unitId": 201,
        "isActive": true
    },
    {
        "id": 9,
        "name": "Volt Inp. 1",
        "unitId": 501,
        "isActive": false
    },
    {
        "id": 10,
        "name": "Volt Inp. 2",
        "unitId": 501,
        "isActive": false
    }
    ],
    "note": "Luftfeuchtigkeitsüberwachung im Keller",
    "numberOfUnconfirmedAlarms": 0,
    "lastMeasurementTransmissionDateTime": "2019-08-07T10:03:18.8421797",
    "signalQuality": 16,
    "humidity": 53,
    "batteryInfoVoltageInVolt": 3.898,
    "batteryInfoCapacityInPercent": 98,
    "transmissionInterval": null,
    "saveInterval": null
}
{{< /highlight >}}
