---
title: Overview
menu:
    main:
        parent: api
        weight: 1
---

# Cloud API Overview

The API's specification can be found here: <https://api.pressuresuite.com/swagger/index.html?url=/swagger/v1/swagger.json>

An open-sourced example implementation can be seen here: <https://github.com/KELLERAGfuerDruckmesstechnik/PressureSuite-Cloud-API-daemon-example-with-access-token>

Endpoints of interest are:  

| Endpoint                     | Use to                                                                                                                      |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `GET /v1/Devices`            | Gets information of all devices                                                                                             |
| `GET /v1/Devices/{deviceId}` | Gets information of a specific device                                                                                       |
| `GET /v1/Measurements`       | Gets a list of measurements composed of a value and a UTC datetime                                                          |
| `GET /v1/PageSettings`       | Gets information about settings of the tenant group but also about **MeasurementDefinitionIds** and there alternative names |

he `deviceId` are the same numbers that can be seen in the URL of the WebApp when the device is selected: [https://www.pressuresuite.com/devices/**1234**/](https://www.pressuresuite.com/devices/1234/)

DateTime formats from the API are always in **UTC**  
Pressure values from the API are always in **bar**  
Temperature values from the API are always in **°C**  
It is not possible to delete measurement data with the API  


## Temporary Access Token

If you want to try out the API with [Swagger](https://api.pressuresuite.com/swagger/index.html?url=/swagger/v1/swagger.json) please us the dark green [Authorize] button and a valid bearer token.  
![BearerToken From Swagger UI](../img/BearerTokenFromSwaggerUI.png)

You can get a valid bearer token when logged in on <https://www.pressuresuite.com> under [User Settings]  
![BearerToken From Web App](../img/BearerTokenFromWebApp.png)

## Permanent Access Token
If you want a *Permanent Access Token*: One user of a customer group has the "CustomerAdmin" rights. This user can get the permanent access token from the web app from https://www.pressuresuite.com/account-settings.  
The provided access token must be the value with the key "userOid" in the header of every request. This way a bearer token and the OAUTH flow is NOT needed anymore.  

![Postman and permanent Access Token](../img/permanent-access-token-postman.png)  



Please create github issues for feature wishes or problems.  
Or contact <pressuresuite@keller-druck.com>
