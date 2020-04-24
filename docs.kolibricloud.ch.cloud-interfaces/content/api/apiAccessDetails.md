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
+ Decide for a time span to gather date: eg. *every 24h*
+ Every remote sending unit (GSM, ARC, ADT..) has its own ```deviceId```. It is recommended to hard code this deviceIds and link it to the application relevant entity (eg. location, position, sending place, lake, measuring point..)
+ Create a list of ```measurementsDefinitonId```s representing the physical measurement channel (eg. ```channels_of_interest=[2,5,7,8,11]```) and link it to the application relevant entities (eg. Water Temperature, Pressure 1, Air Pressure, Water-Conductivity..). It is recommended to hard code this, too.

+ Run the program every ~24h and
  - for all devices (```deviceId```) of interest...
  - for all channels ```measurementsDefinitonId``` of interest..
  - use the ```GET /v1/Measurements``` endpoint
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
| `GET /v1/PageSettings`       | Gets information about settings of the tenant group but also about **MeasurementDefinitionIds** and their alternative names |



### GET /v1/Devices

---
  Returns json data about a all accessible devices

**Data Params**

* **skip** (OPTIONAL)<br />
Type: integer($int32)<br />
Default: 0<br />
Use: *Skips the given number of devices. The opposite of Take.*

* **take** (OPTIONAL)<br />
Type: integer($int32)<br />
Default: 50<br />
Use: *Takes only the first .. devices. The opposite of Skip. When not specified the API replies with the first 50 devices.*

* **searchText** (OPTIONAL)<br />
Type: string<br />
Default: null<br />
Use: *Text term to filter all devices. Only the devices with ```searchText``` in the ```name``` or ```network```*

* **sortField** (OPTIONAL)<br />
Type: string<br />
Default: null<br />
Use: *Default it is sort by the device's ```"Name"```. It is also possible to sort for ```"NetworkNode"```, ```"TransferType"```, ```"GsmNumber"```, ```"EuiNumber"```, ```"SerialNumber"```*

* **sortAscending** (OPTIONAL)<br />
Type: boolean<br />
Default: True<br />
Use: *If False then the list of the devices is ordered in descending order.*

**Sample Call**

   https://apitest.kolibricloud.ch/v1/Devices

**Successfull Sample Response:**

  * **Code:** 200 <br />
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
  * **Code:** 401 UNAUTHORIZED <br />



### GET /v1/Device/{deviceId}

---
  Returns json data about a specific accesible device.

**Data Params**

* **deviceId** (REQUIRED)<br />
Type: integer($int32)<br />
Use: *Every device has an 4 digit id number. The ```deviceId``` is the same number that can be seen in the URL of the WebApp when the device is selected: [https://www.kolibricloud.ch/devices/**1234**/](https://www.kolibricloud.ch/devices/1234/)*

**Sample Call**

   https://apitest.kolibricloud.ch/v1/Device/2128

**Successfull Sample Response:**

  * **Code:** 200 <br />
    **Content:** 
```
{
  "deviceId": 2128,
  "stationId": "GSM: +901405100340210",
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
  "note": null,
  "numberOfUnconfirmedAlarms": 8,
  "lastMeasurementTransmissionDateTime": "2020-04-23T18:01:35.3835644",
  "signalQuality": 24,
  "humidity": 29,
  "batteryInfoVoltageInVolt": 3.814,
  "batteryInfoCapacityInPercent": 98,
  "transmissionInterval": null,
  "saveInterval": null
}
```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED <br />



### GET /v1/Measurements

---
  Returns the raw measurement data of a given ```measurementDefinitionId``` of a given ```deviceId``` and a given time range defined by a UTC ```from``` and ```end``` time stamp.

**Data Params**

* **measurementDefinitionId ** (REQUIRED)<br />
Type: integer($int32)<br />
Use: **

* **deviceId** (REQUIRED)<br />
Type: integer($int32)<br />
Use: **

* **start** (OPTIONAL)<br />
Type: string($date-time)<br />
Default: null<br />
Use: **

* **end** (OPTIONAL)<br />
Type: string($date-time)<br />
Default: null<br />
Use: **

* **isFiltered** (OPTIONAL)<br />
Type: boolean<br />
Default: False<br />
Use: *If True then only 1500 measurement points are taken. The choosen measurments point are given by the Largest Triangle Three Buckets algorithm.*

* **ianaTimeZone** (OPTIONAL)<br />
Type: boolean<br />
Default: null<br />
Use: **

**Sample Call**

   https://apitest.kolibricloud.ch/v1/Measurements?measurementDefinitionId=8&deviceId=2128&start=2020-04-01T03%3A00%3A00.0Z&end=2020-04-01T04%3A00%3A00.0Z&isFiltered=false

**Successfull Sample Response:**

  * **Code:** 200 <br />
    **Content:** 
```
{
  "measurementDefinitionId": 8,
  "deviceId": 2128,
  "values": [
    {
      "time": "2020-04-01T03:00:02",
      "value": 10.23999
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
  "unitId": 201
}
```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED <br />
  * **Code:** 500 Internal Server Error - Happens when at least one of the parameters is wrong or access is not given. Eg. Wrong ```deviceId``` or ```measurementDefinitionId``` which does not exist in the given device.<br />
