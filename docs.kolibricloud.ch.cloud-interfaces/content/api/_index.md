---
title: Overview
menu:
    main:
        parent: api
        weight: 1
---

# Cloud API Overview

The API's specification can be found here: <https://api.kolibricloud.ch/swagger/index.html?url=/swagger/v1/swagger.json>

An open-sourced example implementation can be seen here: <https://github.com/KELLERAGfuerDruckmesstechnik/Kolibri-Cloud-API-daemon-example-with-access-token>

Endpoints of interest are:  

| Endpoint                     | Use to                                                                                                                      |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `GET /v1/Devices`            | Gets information of all devices                                                                                             |
| `GET /v1/Devices/{deviceId}` | Gets information of a specific device                                                                                       |
| `GET /v1/Measurements`       | Gets a list of measurements composed of a value and a UTC datetime                                                          |
| `GET /v1/PageSettings`       | Gets information about settings of the tenant group but also about **MeasurementDefinitionIds** and there alternative names |

## Notes

DateTime formats from the API are always in **UTC**  
Pressure values from the API are always in **bar**  
Temperature values from the API are always in **°C**  
It is not possible to delete measurement data with the API  

If you want to try out the API with [Swagger](https://api.kolibricloud.ch/swagger/index.html?url=/swagger/v1/swagger.json) please us the dark green [Authorize] button and a valid bearer token.  
![BearerToken From Swagger UI](../img/BearerTokenFromSwaggerUI.png)

You can get a valid bearer token when logged in on <http://www.kolibricloud.ch> under [User Settings]  
![BearerToken From Web App](../img/BearerTokenFromWebApp.png)

The `deviceId` are the same numbers that can be seen in the URL of the WebApp when the device is selected: [https://www.kolibricloud.ch/devices/**1234**/](https://www.kolibricloud.ch/devices/1234/)

If you want a *Permanent Access Token*, please contact the KOLIBRI support team (<kolibri@keller-druck.com>).
The provided access token must be the value with the key "userOid" in the header of every request. This way a bearer token and the OAUTH flow is NOT needed anymore. 

<img src="https://i.imgur.com/BtOYz6h.png" width="400">

Please create github issues for feature wishes or problems.  
Or contact <kolibri@keller-druck.com>