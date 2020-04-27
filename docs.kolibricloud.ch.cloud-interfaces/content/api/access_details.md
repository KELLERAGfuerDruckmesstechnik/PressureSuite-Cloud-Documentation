---
title: Accessing the API
menu:
    main:
        parent: api
        weight: 2
---

# Recommended data access flow and interval policy

Accessing the data through the API with a (daemon/server) program it is recommended to gather the data daily. If possible somewhen between 00:00 UTC and 06:00 UTC.  
It is forbidden to gather data in an interval faster than 60min. This would hurt the throughtput of others and is considered malicious and against the terms of service (Section IV.20).  

It is recommended to periodically gather data and store it into an own DB by:
- Decide for a timespan to gather date: eg. *every 12h*  

- Every remote sending unit (GSM, ARC, ADT..) has its own ```deviceId```. It is recommended to hard code this deviceIds and link it to the application relevant entity (eg. location, position, sending place, lake, measuring point..)  

- Create a list of ```measurementsDefinitonId```s representing the physical measurement channel (eg. ```channels_of_interest=[2,5,7,8,11]```) and link it to the application relevant entities (eg. Water Temperature, Pressure 1, Air Pressure, Water-Conductivity..). It is recommended to hard code this, too.

- Run the program every ~12h and
  - for all devices (```deviceId```) of interest...
  - for all channels ```measurementsDefinitonId``` of interest..
  - use the ```GET /v1/Measurements``` endpoint and get the data from the last ~24h
  - and store the data into a DB
  - you might check first if the measurement(value+timestamp) is not already stored because
  - It is possible that a request fails. To solve this error case please re-call the data later again. You might gather data from an overlapped time slot and exclude measurements that has been stored already.

Be aware that it is not possible to get calculated measuring data (eg. water level) from the API. See https://docs.kolibricloud.ch/cloud-interfaces/overview/howto/#how-do-i-get-calculated-data-from-the-api

# Important endpoints

The API's Swagger specification can be found here: <https://api.kolibricloud.ch/swagger/index.html?url=/swagger/v1/swagger.json>

Open-sourced example implementations (C# and Python) can be seen here: <https://github.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-API-daemon-example-with-access-token>

Endpoints of interest are:  

| Endpoint                     | Use to                                                                                                                      |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `GET /v1/Devices`            | Gets information of all devices                                                                                             |
| `GET /v1/Devices/{deviceId}` | Gets information of a specific device                                                                                       |
| `GET /v1/Measurements`       | Gets a list of measurements composed of a value and a UTC datetime                                                          |


### GET /v1/Devices

---
  Returns json data about a all accessible devices

**Data Params**

* **skip** (OPTIONAL)  
Type: integer($int32)  
Default: 0  
Use: *Skips the given number of devices. The opposite of Take.*

* **take** (OPTIONAL)  
Type: integer($int32)  
Default: 50<br/>  
Use: *Takes only the first .. devices. The opposite of Skip. When not specified the API replies with the first 50 devices.*

* **searchText** (OPTIONAL)  
Type: string  
Default: null  
Use: *Text term to filter all devices. Only the devices with ```searchText``` in the ```name``` or ```network```*

* **sortField** (OPTIONAL)  
Type: string  
Default: null  
Use: *Default it is sort by the device's ```"Name"```. It is also possible to sort for ```"NetworkNode"```, ```"TransferType"```, ```"GsmNumber"```, ```"EuiNumber"```, ```"SerialNumber"```*

* **sortAscending** (OPTIONAL)  
Type: boolean  
Default: True  
Use: *If False then the list of the devices is ordered in descending order.*

**Sample Call**

   https://api.kolibricloud.ch/v1/Devices

**Successfull Sample Response:**

  * **Code:** 200   
    **Content:** 
```
{
  "totalRecords": 2,
  "devices":
  [
    {
    {
      "id": 1935,
      "name": "ADT1 7",
      "networkNode": "Winterthur",
      "transferType": "LoRa",
      "gsmNumber": null,
      "euiNumber": "009D6B0000C5D3AD",
      "serialNumber": "EUI-009D6B0000C5D3AD"
    },
    {
      "id": 2128,
      "name": "ARC-1  25",
      "networkNode": "Sales Demo",
      "transferType": "ARC_1",
      "gsmNumber": "+901405100340210",
      "euiNumber": null,
      "serialNumber": "ARC-9.20-25"
    }
  ]
}
```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED   


### GET /v1/Device/{deviceId}
---
  Returns json data about a specific accesible device.

**Data Params**

* **deviceId** (REQUIRED)  
Type: integer($int32)  
Use: *Every device has an 4 digit id number. The ```deviceId``` is the same number that can be seen in the URL of the WebApp when the device is selected: [https://www.kolibricloud.ch/devices/**1234**/](https://www.kolibricloud.ch/devices/1234/)*

**Sample Call**

   https://api.kolibricloud.ch/v1/Device/2128

**Successfull Sample Response:**

  * **Code:** 200   
    **Content:** 
``` yaml
{
  "deviceId": 2128,  #Use the deviceId as an unique identifier for a remote sending unit / measurement location
  "stationId": "GSM: +901405100340210",  //Do not use this
  "measurementDefinitions": [
    {
      "id": 11,     // this is the measurementDefinitionId
      "name": "Pd (P1-PBaro)",  // The standard name of the channel
      "unitId": 101,  // This is bar. See below what unitId represents
      "isActive": true //Normally, a sending device has many channels but only a few are used. Those which are active are used. The inactive channels do not have data.
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
  "note": null,  #This is a note text written by a user in the front end (rsp. with the POST /v1/device/{deviceId} endpoint)
  "numberOfUnconfirmedAlarms": 8, #The number of unconfirmed alarms
  "lastMeasurementTransmissionDateTime": "2020-04-23T18:01:35.3835644", #The UTC timestamp when the last transmission happened
  "signalQuality": 24, //Represents the signal strength in "Arbitrary Strength Unit".  (24 ASU * 2)-113dBm = -65dBm signal strength
  "humidity": 29, // 29% humidity
  "batteryInfoVoltageInVolt": 3.814, // battery voltage
  "batteryInfoCapacityInPercent": 98, // battery capacity calculated by the voltage and used time. Be aware that this will be resetted to 100% when the remote sending device is disconnected from the power (eg. during a battery change).
  "transmissionInterval": null, //unused for now
  "saveInterval": null //unused for now
}
```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED   


### GET /v1/Measurements
---
  Returns the raw measurement data of a given ```measurementDefinitionId``` of a given ```deviceId``` and a given time range defined by a UTC ```from``` and ```end``` time stamp.

**Data Params**

* **measurementDefinitionId** (REQUIRED)  
Type: integer($int32)  
Use: *Every ```measurementDefinitionId``` represents a pyhsical measurment identifiaction and unit. The list of all ```measurementDefinitionId``` can be seen here: https://docs.kolibricloud.ch/cloud-interfaces/api/channels/*

* **deviceId** (REQUIRED)  
Type: integer($int32)  
Use: *Every device has an 4 digit id number. The ```deviceId``` is the same number that can be seen in the URL of the WebApp when the device is selected: [https://www.kolibricloud.ch/devices/**1234**/](https://www.kolibricloud.ch/devices/1234/)*

* **start** (OPTIONAL)  
Type: string($date-time)  
Default: null  
Use: *Normally, the start UTC timestamp has to be given. It is in the ISO format (ISO 8601) eg. ```2020-04-01T12:34:56.009Z```. All replied measurement data are younger then this timestamp. If the ```start``` timestamp is not given then all data is returned until the ```end``` timestamp.*

* **end** (OPTIONAL)  
Type: string($date-time)  
Default: null  
Use: *Normally, the end UTC timestamp has to be given. It is in the ISO format (ISO 8601) eg. ```2020-04-01T23:59:01.009Z```. All replied measurement data are older then this timestamp. If the ```end``` timestamp is not given then all data is returned from the ```start``` timestamp.*

* **isFiltered** (OPTIONAL)  
Type: boolean  
Default: False  
Use: *If True then only 1500 measurement points are taken. The choosen measurments point are given by the Largest Triangle Three Buckets algorithm.*

* **ianaTimeZone** (OPTIONAL)  
Type: boolean  
Default: null  
Use: *Normally, the measurements are returned in UTC time. But it is also possible to specifiy a time zone and the measurement's time is calculated to a local time. See the list of IANA names: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones Eg. "&ianaTimeZone=America/Costa_Rica"*

**Sample Call**

   https://api.kolibricloud.ch/v1/Measurements?measurementDefinitionId=8&deviceId=2128&start=2020-04-01T03%3A00%3A00.0Z&end=2020-04-01T04%3A00%3A00.0Z&isFiltered=false

**Successfull Sample Response:**

  * **Code:** 200   
    **Content:** 
``` json
{
  "measurementDefinitionId": 8, // this is the measurementDefinitionId. 8 represents TBaro which, normally, is similar to the air temperature but measured inside of the remote sending unit.
  "deviceId": 2128,
  "values": [
    {
      "time": "2020-04-01T03:00:02",
      "value": 10.23999  // In this case this is 10.23999 °C
    },
    {
      "time": "2020-04-01T03:10:02",
      "value": 10.19995
    },
    {
      "time": "2020-04-01T03:20:02",
      "value": 10.12988
    },
    {
      "time": "2020-04-01T03:30:02",
      "value": 10.07983
    },
    {
      "time": "2020-04-01T03:40:02",
      "value": 10.02979
    },
    {
      "time": "2020-04-01T03:50:02",
      "value": 9.969971
    }
  ],
  "unitId": 201 // See table below. 201 represents 'Temperature' in °C
}
```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED   
  * **Code:** 500 Internal Server Error - Happens when at least one of the parameters is wrong or access is not given. Eg. Wrong ```deviceId``` or ```measurementDefinitionId``` which does not exist in the given device.  


# Units / unitId

The used units mapping can be get with the ```GET ​/v1​/Units``` endpoint. It returns this:

``` json
{
  "units": [
    {
      "id": 0,
      "unitCategory": "NoUnit",
      "description": "NoUnit",
      "unitSymbol": ""
    },
    {
      "id": 100,
      "unitCategory": "Pressure",
      "description": "UserDefinedPressure",
      "unitSymbol": ""
    },
    {
      "id": 101,
      "unitCategory": "Pressure",
      "description": "Bar",
      "unitSymbol": "bar"
    },
    {
      "id": 102,
      "unitCategory": "Pressure",
      "description": "MilliBar",
      "unitSymbol": "mbar"
    },
    {
      "id": 103,
      "unitCategory": "Pressure",
      "description": "PSI",
      "unitSymbol": "PSI"
    },
    {
      "id": 104,
      "unitCategory": "Pressure",
      "description": "MegaPascal",
      "unitSymbol": "MPa"
    },
    {
      "id": 105,
      "unitCategory": "Pressure",
      "description": "KiloPascal",
      "unitSymbol": "kPa"
    },
    {
      "id": 106,
      "unitCategory": "Pressure",
      "description": "Pascal",
      "unitSymbol": "Pa"
    },
    {
      "id": 200,
      "unitCategory": "Temperature",
      "description": "UserDefinedTemperature",
      "unitSymbol": ""
    },
    {
      "id": 201,
      "unitCategory": "Temperature",
      "description": "DegreeCelsius",
      "unitSymbol": "°C"
    },
    {
      "id": 202,
      "unitCategory": "Temperature",
      "description": "DegreeFarenheit",
      "unitSymbol": "°F"
    },
    {
      "id": 300,
      "unitCategory": "Length",
      "description": "UserDefinedLength",
      "unitSymbol": ""
    },
    {
      "id": 301,
      "unitCategory": "Length",
      "description": "Meter",
      "unitSymbol": "m"
    },
    {
      "id": 302,
      "unitCategory": "Length",
      "description": "Centimeter",
      "unitSymbol": "cm"
    },
    {
      "id": 303,
      "unitCategory": "Length",
      "description": "Inch",
      "unitSymbol": "inch"
    },
    {
      "id": 304,
      "unitCategory": "Length",
      "description": "Foot",
      "unitSymbol": "ft"
    },
    {
      "id": 400,
      "unitCategory": "Conductivity",
      "description": "UserDefinedConductivity",
      "unitSymbol": ""
    },
    {
      "id": 401,
      "unitCategory": "Conductivity",
      "description": "MilliSiemensPerCentimeter",
      "unitSymbol": "mS/cm"
    },
    {
      "id": 402,
      "unitCategory": "Conductivity",
      "description": "MicroSiemensPerCentimeter",
      "unitSymbol": "uS/cm"
    },
    {
      "id": 500,
      "unitCategory": "Voltage",
      "description": "UserDefinedVoltage",
      "unitSymbol": ""
    },
    {
      "id": 501,
      "unitCategory": "Voltage",
      "description": "Volt",
      "unitSymbol": "V"
    },
    {
      "id": 600,
      "unitCategory": "Density",
      "description": "KilogramsPerCubicMeter",
      "unitSymbol": "kg/m^3"
    },
    {
      "id": 700,
      "unitCategory": "Acceleration",
      "description": "MetersPerSecondSquared",
      "unitSymbol": "m/s^2"
    },
    {
      "id": 800,
      "unitCategory": "SignalStrength",
      "description": "DecibelsBelow1Milliwatt",
      "unitSymbol": "dDm"
    },
    {
      "id": 900,
      "unitCategory": "NoUnit",
      "description": "Percent",
      "unitSymbol": "%"
    },
    {
      "id": 1000,
      "unitCategory": "Volume",
      "description": "UserDefinedVolume",
      "unitSymbol": ""
    },
    {
      "id": 1001,
      "unitCategory": "Volume",
      "description": "Liter",
      "unitSymbol": "l"
    }
  ],
  "measurementsDefinitionIds": [
    {
      "id": 1,
      "name": "PDP1P2"
    },
    {
      "id": 2,
      "name": "P1"
    },
    {
      "id": 3,
      "name": "P2"
    },
    {
      "id": 4,
      "name": "T"
    },
    {
      "id": 5,
      "name": "TOB1"
    },
    {
      "id": 6,
      "name": "TOB2"
    },
    {
      "id": 7,
      "name": "PBARO"
    },
    {
      "id": 8,
      "name": "TBARO"
    },
    {
      "id": 9,
      "name": "VOLTINP1"
    },
    {
      "id": 10,
      "name": "VOLTINP2"
    },
    {
      "id": 11,
      "name": "PDP1PBARO"
    },
    {
      "id": 12,
      "name": "CONDUCTIVITYTC"
    },
    {
      "id": 13,
      "name": "CONDUCTIVITYRAW"
    },
    {
      "id": 14,
      "name": "TCONDUCTIVITY"
    },
    {
      "id": 15,
      "name": "P1_2"
    },
    {
      "id": 16,
      "name": "P1_3"
    },
    {
      "id": 17,
      "name": "P1_4"
    },
    {
      "id": 18,
      "name": "P1_5"
    },
    {
      "id": 19,
      "name": "COUNTERINPUT"
    },
    {
      "id": 20,
      "name": "SDI12CH1"
    },
    {
      "id": 21,
      "name": "SDI12CH2"
    },
    {
      "id": 22,
      "name": "SDI12CH3"
    },
    {
      "id": 23,
      "name": "SDI12CH4"
    },
    {
      "id": 24,
      "name": "SDI12CH5"
    },
    {
      "id": 25,
      "name": "SDI12CH6"
    },
    {
      "id": 26,
      "name": "SDI12CH7"
    },
    {
      "id": 27,
      "name": "SDI12CH8"
    },
    {
      "id": 28,
      "name": "SDI12CH9"
    },
    {
      "id": 29,
      "name": "SDI12CH10"
    },
    {
      "id": 30,
      "name": "TOB1_2"
    },
    {
      "id": 31,
      "name": "TOB1_3"
    },
    {
      "id": 32,
      "name": "TOB1_4"
    },
    {
      "id": 33,
      "name": "TOB1_5"
    },
    {
      "id": 34,
      "name": "MH20_E"
    },
    {
      "id": 35,
      "name": "MH20_F"
    },
    {
      "id": 36,
      "name": "MH20_G"
    },
    {
      "id": 37,
      "name": "MH20_PBARO"
    },
    {
      "id": 38,
      "name": "MH20_P1P2"
    },
    {
      "id": 39,
      "name": "MH20_P1P3"
    },
    {
      "id": 40,
      "name": "MH20_P1P4"
    },
    {
      "id": 41,
      "name": "MH20_P1P5"
    },
    {
      "id": 42,
      "name": "CONDUCTIVITYTC_2"
    },
    {
      "id": 43,
      "name": "CONDUCTIVITYTC_3"
    },
    {
      "id": 44,
      "name": "TCONDUCTIVITY_2"
    },
    {
      "id": 45,
      "name": "TCONDUCTIVITY_3"
    },
    {
      "id": 46,
      "name": "P2_2"
    },
    {
      "id": 47,
      "name": "TOB2_2"
    },
    {
      "id": 48,
      "name": "AQUAMASTERFLOWRATE"
    },
    {
      "id": 49,
      "name": "AQUAMASTERPRESSURE"
    },
    {
      "id": 50,
      "name": "AQUAMASTERCUSTOMFLOWUNITS"
    },
    {
      "id": 51,
      "name": "AQUAMASTEREXTERNALSUPPLYVOLTAGE"
    },
    {
      "id": 52,
      "name": "TANKCONTENT1"
    },
    {
      "id": 53,
      "name": "TANKCONTENT2"
    },
    {
      "id": 54,
      "name": "TANKCONTENT3"
    },
    {
      "id": 55,
      "name": "MULTISENSOR1"
    },
    {
      "id": 56,
      "name": "MULTISENSOR2"
    },
    {
      "id": 57,
      "name": "MULTISENSOR3"
    },
    {
      "id": 58,
      "name": "MULTISENSOR4"
    },
    {
      "id": 59,
      "name": "MULTISENSOR5"
    }
  ]
}
```
