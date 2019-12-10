---
title: Device Configuration Protocoll
menu:
    main:
        parent: api
        weight: 2
---

# Device Config API to "Cellular data communication protocol" Mapping

The mapping of the API fields and the ARC1 cellular data communication protocol is described in the following tables.

## #a GPRS Settings

| Field                                                                                 | Reference | Comment              |
| ------------------------------------------------------------------------------------- | --------- | -------------------- |
| {{< highlight typescript >}}gprsAPN: string;{{< /highlight >}}                        | `#a/a`    | -                    |
| {{< highlight typescript >}}gprsID: string;{{< /highlight >}}                         | `#a/b`    | -                    |
| {{< highlight typescript >}}gprsPassword: string;{{< /highlight >}}                   | `#a/c`    | -                    |
| {{< highlight typescript >}}gprsDNS: string;{{< /highlight >}}                        | `#a/d`    | -                    |
| {{< highlight typescript >}}mailSmtpShowedName: string;{{< /highlight >}}             | `#a/e`    | -                    |
| {{< highlight typescript >}}mailPop3Username: string;{{< /highlight >}}               | `#a/f`    | -                    |
| {{< highlight typescript >}}mailPop3Password: string;{{< /highlight >}}               | `#a/g`    | -                    |
| {{< highlight typescript >}}mailOptSmtpUsername: string;{{< /highlight >}}            | `#a/h`    | -                    |
| {{< highlight typescript >}}mailOptSmtpPassword: string;{{< /highlight >}}            | `#a/i`    | -                    |
| {{< highlight typescript >}}mailPop3Server: string;{{< /highlight >}}                 | `#a/j`    | -                    |
| {{< highlight typescript >}}mailPop3Port: numnber;{{< /highlight >}}                  | `#a/k`    | min = 0, max = 65535 |
| {{< highlight typescript >}}mailSmtpServer: string;{{< /highlight >}}                 | `#a/l`    | -                    |
| {{< highlight typescript >}}mailSmtpPort: number;{{< /highlight >}}                   | `#a/m`    | min = 0, max = 65535 |
| {{< highlight typescript >}}mailReturnAddress: string;{{< /highlight >}}              | `#a/n`    | -                    |
| {{< highlight typescript >}}cellularModuleId: string;{{< /highlight >}}               | `#a/o`    | -                    |
| {{< highlight typescript >}}cellularModuleRevisionId: string;{{< /highlight >}}       | `#a/p`    | -                    |
| {{< highlight typescript >}}cellularModuleSerialNumberIMEI: string;{{< /highlight >}} | `#a/q`    | -                    |
| {{< highlight typescript >}}cellularSIMCardId: string;{{< /highlight >}}              | `#a/r`    | -                    |
| {{< highlight typescript >}}cellularSIMCardSubscriberId: string;{{< /highlight >}}    | `#a/s`    | -                    |

## #b Text, Number and Addresses

| Field                                                                                  | Reference | Comment                          |
| -------------------------------------------------------------------------------------- | --------- | -------------------------------- |
| {{< highlight typescript >}}measurementMailAddress: string;{{< /highlight>}}           | `#b/a`    | -                                |
| {{< highlight typescript >}}alarmMailAddress: string;{{< /highlight>}}                 | `#b/b`    | -                                |
| {{< highlight typescript >}}infoMailAddress: string;{{< /highlight>}}                  | `#b/c`    | -                                |
| {{< highlight typescript >}}gprsPasswordForQuerySms: string;{{< /highlight>}}          | `#b/g`    | -                                |
| {{< highlight typescript >}}gprsSimPin: string;{{< /highlight>}}                       | `#b/j`    | -                                |
| {{< highlight typescript >}}hardwareDataConnectionCallNumber: string;{{< /highlight>}} | `#b/k`    | -                                |
| {{< highlight typescript >}}measurementSmsNumber: string;{{< /highlight>}}             | `#b/m`    | -                                |
| {{< highlight typescript >}}alarmSmsNumber: string;{{< /highlight>}}                   | `#b/n`    | -                                |
| {{< highlight typescript >}}infoSmsNumber: string;{{< /highlight>}}                    | `#b/o`    | -                                |
| {{< highlight typescript >}}gprsSmsServiceCenterNr: string;{{< /highlight>}}           | `#b/q`    | -                                |
| {{< highlight typescript >}}generalNetworkName: string;{{< /highlight>}}               | `#b/r`    | -                                |
| {{< highlight typescript >}}generalOwnTelNumber: string;{{< /highlight>}}              | `#b/s`    | -                                |
| {{< highlight typescript >}}generalLocationName: string;{{< /highlight>}}              | `#b/t`    | -                                |
| {{< highlight typescript >}}measurementSmsText: string;{{< /highlight>}}               | `#b/u`    | -                                |
| {{< highlight typescript >}}alarmSmsText: string;{{< /highlight>}}                     | `#b/v`    | -                                |
| {{< highlight typescript >}}checkAnswerSmsText: string;{{< /highlight>}}               | `#b/w`    | -                                |
| {{< highlight typescript >}}generalLongitudeText: string;{{< /highlight>}}             | `#b/0`    | -                                |
| {{< highlight typescript >}}generalLatitudeText: string;{{< /highlight>}}              | `#b/1`    | -                                |
| {{< highlight typescript >}}generalAltitudeText: string;{{< /highlight>}}              | `#b/2`    | -                                |
| {{< highlight typescript >}}generalCellLocateLongitudeText: string;{{< /highlight>}}   | `#b/3`    | Readonly, recalibracte with #e/l |
| {{< highlight typescript >}}generalCellLocateLatitudeText: string;{{< /highlight>}}    | `#b/4`    | Readonly, recalibracte with #e/l |
| {{< highlight typescript >}}generalCellLocateAltitudeText: string;{{< /highlight>}}    | `#b/5`    | Readonly, recalibracte with #e/l |

## #c Measurement Settings

| Field                                                                                         | Reference | Comment                                                                                          |
| --------------------------------------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------ |
| {{< highlight typescript >}}measurementTimer: number;{{< /highlight >}}                       | `#c/a`    | min = 0, max = 5184000                                                                           |
| {{< highlight typescript >}}alarmTimer: number;{{< /highlight >}}                             | `#c/b`    | min = 0, max = 5184000                                                                           |
| {{< highlight typescript >}}infoTimer: number;{{< /highlight >}}                              | `#c/c`    | min = 0, max = 5184000                                                                           |
| {{< highlight typescript >}}checkTimer: number;{{< /highlight >}}                             | `#c/d`    | min = 0, max = 5184000                                                                           |
| {{< highlight typescript >}}hardwareDataConnectionTimer: number;{{< /highlight >}}            | `#c/e`    | min = 0, max = 5184000                                                                           |
| {{< highlight typescript >}}measurementInterval: number;{{< /highlight >}}                    | `#c/g`    | min = 1, max = 2592000                                                                           |
| {{< highlight typescript >}}alarmInterval: number;{{< /highlight >}}                          | `#c/h`    | min = 1, max = 2592000                                                                           |
| {{< highlight typescript >}}infoInterval: number;{{< /highlight >}}                           | `#c/i`    | min = 1, max = 2592000                                                                           |
| {{< highlight typescript >}}checkInterval: number;{{< /highlight >}}                          | `#c/j`    | min = 1, max = 2592000                                                                           |
| {{< highlight typescript >}}hardwareDataConnectionInterval: number;{{< /highlight >}}         | `#c/k`    | min = 1, max = 2592000                                                                           |
| {{< highlight typescript >}}hardwareMeasureSaveChannel0: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 0                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel1: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 1                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel2: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 2                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel3: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 3                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel4: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 4                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel5: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 5                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel6: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 6                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel7: boolean;{{< /highlight >}}           | `#c/m`    | Bit Position 7                                                                                   |
| {{< highlight typescript >}}measurementSendSmsAfterX: number;{{< /highlight >}}               | `#c/o`    | -                                                                                                |
| {{< highlight typescript >}}hardwareMeasureSaveChannel8: boolean;{{< /highlight >}}           | `#c/p`    | Bit Position 0                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel9: boolean;{{< /highlight >}}           | `#c/p`    | Bit Position 1                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel10: boolean;{{< /highlight >}}          | `#c/p`    | Bit Position 2                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel11: boolean;{{< /highlight >}}          | `#c/p`    | Bit Position 3                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel12: boolean;{{< /highlight >}}          | `#c/p`    | Bit Position 4                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel13: boolean;{{< /highlight >}}          | `#c/p`    | Bit Position 5                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel14: boolean;{{< /highlight >}}          | `#c/p`    | Bit Position 6                                                                                   |
| {{< highlight typescript >}}hardwareMeasureSaveChannel15: boolean;{{< /highlight >}}          | `#c/p`    | Bit Position 7                                                                                   |
| {{< highlight typescript >}}measurementSendMailAfterX: number;{{< /highlight >}}              | `#c/q`    | -                                                                                                |
| {{< highlight typescript >}}alarmChannelNumber: number;{{< /highlight >}}                     | `#c/r`    | -                                                                                                |
| {{< highlight typescript >}}alarmType: number;{{< /highlight >}}                              | `#c/s`    | 1 = On / Off, 2 = Delta, 3 = Digital Input                                                   |
| {{< highlight typescript >}}alarmSendXTimes: number;{{< /highlight >}}                        | `#c/t`    | -                                                                                                |
| {{< highlight typescript >}}hardwareResolutionPressureChannels: number;{{< /highlight >}}     | `#c/v`    | SMS only                                                                                         |
| {{< highlight typescript >}}hardwareResolutionTemperatureChannels: number;{{< /highlight >}}  | `#c/w`    | SMS only                                                                                         |
| {{< highlight typescript >}}lockTimerMeasurement: boolean;{{< /highlight >}}                  | `#c/y`    | -                                                                                                |
| {{< highlight typescript >}}lockTimerAlarm: boolean;{{< /highlight >}}                        | `#c/y`    | -                                                                                                |
| {{< highlight typescript >}}lockTimerInfo: boolean;{{< /highlight >}}                         | `#c/y`    | -                                                                                                |
| {{< highlight typescript >}}lockTimerCheck: boolean;{{< /highlight >}}                        | `#c/y`    | -                                                                                                |
| {{< highlight typescript >}}lockTimerDial: boolean;{{< /highlight >}}                         | `#c/y`    | -                                                                                                |
| {{< highlight typescript >}}measurementSendSms: boolean;{{< /highlight >}}                    | `#c/z`    | Bit Position 0                                                                                   |
| {{< highlight typescript >}}alarmSendSms: boolean;{{< /highlight >}}                          | `#c/z`    | Bit Position 1                                                                                   |
| {{< highlight typescript >}}infoSendSms: boolean;{{< /highlight >}}                           | `#c/z`    | Bit Position 2                                                                                   |
| {{< highlight typescript >}}checkSendSms: boolean;{{< /highlight >}}                          | `#c/z`    | Bit Position 3                                                                                   |
| {{< highlight typescript >}}measurementSendMail: boolean;{{< /highlight >}}                   | `#c/z`    | Bit Position 4                                                                                   |
| {{< highlight typescript >}}alarmSendMail: boolean;{{< /highlight >}}                         | `#c/z`    | Bit Position 5                                                                                   |
| {{< highlight typescript >}}infoSendMail: boolean;{{< /highlight >}}                          | `#c/z`    | Bit Position 6                                                                                   |
| {{< highlight typescript >}}checkSendMail: boolean;{{< /highlight >}}                         | `#c/z`    | Bit Position 7                                                                                   |
| {{< highlight typescript >}}gprsModemProtocol: number;{{< /highlight >}}                      | `#c/0`    | 0 = 9600bps (V.32), 1 = 9600bps (V.34), 2 = 9600bps (V.110)                                  |
| {{< highlight typescript >}}mailSmtpUseSSL: boolean;{{< /highlight >}}                        | `#c/1`    | Bit Position 0                                                                                   |
| {{< highlight typescript >}}mailPop3UseSSL: boolean;{{< /highlight >}}                        | `#c/1`    | Bit Position 1                                                                                   |
| {{< highlight typescript >}}mailUseAlternativeSMTPLogin: boolean;{{< /highlight >}}           | `#c/2`    | -                                                                                                |
| {{< highlight typescript >}}waterLevelCalculationFormType: number;{{< /highlight >}}          | `#c/3`    | 0 = none, 1 = A, 2 = B, 3 = C, 4 = D, 5 = E, 6 = F, 7 = Venturi, 8 = Open tube * |
| {{< highlight typescript >}}hardwarePowerExternalDevice: number;{{< /highlight >}}            | `#c/4`    | 0 = Deactivated, 1 = +12V, 2 = +5V, 3 = +3.9V, 4 = all On                                |
| {{< highlight typescript >}}hardwareSupportedSensorTypes: number;{{< /highlight >}}           | `#c/5`    | -                                                                                                |
| {{< highlight typescript >}}hardwareConnectionType: number;{{< /highlight >}}                 | `#c/6`    | -                                                                                                |
| {{< highlight typescript >}}waterLevelCalculationIsAbsoluteSensor: boolean;{{< /highlight >}} | `#c/7`    | -                                                                                                |
| {{< highlight typescript >}}waterLevelCalculationCalculateFrom: number;{{< /highlight >}}     | `#c/8`    | 0 = P1-P2, 1 = P1-PBaro, 2 = P1 relative, 3 = not defined                                  |
| {{< highlight typescript >}}waterLevelCalculationConversionTo: number;{{< /highlight >}}      | `#c/9`    | 0 = E, 1 = F, 2 = G, 3 = Poleni, 4 = Thomson **                                            |
| {{< highlight typescript >}}ftpUseTLS: boolean;{{< /highlight >}}                             | `#c/A`    | -                                                                                                |
| {{< highlight typescript >}}ftpUseActiveMode: boolean;{{< /highlight >}}                      | `#c/B`    | -                                                                                                |

\* A = 0.85-0.88, B = 0.87-0.95, C = 1.13-1.27, D = 1.11, E = 1.30, F = 1.37, Venturi = 1.75-2.02, Open tube = 0.529

\** E = Height of water above level sensor, F = Distance to water surface, G = Height of water above sea level, Poleni/Thomson = Overflow

## #d Floating Point Values

| Field                                                                                        | Reference | Comment  |
| -------------------------------------------------------------------------------------------- | --------- | -------- |
| {{< highlight typescript >}}alarmOnThreshold: number;{{< /highlight >}}                      | `#d/a`    | -        |
| {{< highlight typescript >}}alarmOffThreshold: number;{{< /highlight >}}                     | `#d/b`    | -        |
| {{< highlight typescript >}}alarmDeltaThreshold: number;{{< /highlight >}}                   | `#d/c`    | -        |
| {{< highlight typescript >}}hardwareMultiplierTemperatureChannels: number;{{< /highlight >}} | `#d/f`    | SMS only |
| {{< highlight typescript >}}hardwareMultiplierPressureChannels: number;{{< /highlight >}}    | `#d/g`    | SMS only |
| {{< highlight typescript >}}eventOnValueThreshold: number;{{< /highlight >}}                 | `#d/i`    | -        |
| {{< highlight typescript >}}eventOffValueThreshold: number;{{< /highlight >}}                | `#d/j`    | -        |
| {{< highlight typescript >}}eventDeltaValueThreshold: number;{{< /highlight >}}              | `#d/k`    | -        |
| {{< highlight typescript >}}waterLevelCalculationEnable: boolean;{{< /highlight >}}          | `#d/m`    | -        |
| {{< highlight typescript >}}waterLevelCalculationLength: number;{{< /highlight >}}           | `#d/n`    | -        |
| {{< highlight typescript >}}waterLevelCalculationHeight: number;{{< /highlight >}}           | `#d/o`    | -        |
| {{< highlight typescript >}}waterLevelCalculationOffset: number;{{< /highlight >}}           | `#d/p`    | -        |
| {{< highlight typescript >}}waterLevelCalculationDensity: number;{{< /highlight >}}          | `#d/q`    | -        |
| {{< highlight typescript >}}waterLevelCalculationWidth: number;{{< /highlight >}}            | `#d/r`    | -        |
| {{< highlight typescript >}}waterLevelCalculationAngle: number;{{< /highlight >}}            | `#d/s`    | -        |
| {{< highlight typescript >}}waterLevelCalculationFormFactor: number;{{< /highlight >}}       | `#d/t`    | -        |
| {{< highlight typescript >}}waterLevelCalculationMinCalcHeight: number;{{< /highlight >}}    | `#d/u`    | -        |
| {{< highlight typescript >}}generalGpsLongitude: number;{{< /highlight >}}                   | `#d/0`    | -        |
| {{< highlight typescript >}}generalGpsLatitude: number;{{< /highlight >}}                    | `#d/1`    | -        |
| {{< highlight typescript >}}generalGpsAltitude: number;{{< /highlight >}}                    | `#d/2`    | -        |

## #f Measurement Settings 2

| Field                                                                           | Reference | Comment                                                       |
| ------------------------------------------------------------------------------- | --------- | ------------------------------------------------------------- |
| {{< highlight typescript >}}eventMeasureTimer: number;{{< /highlight >}}        | `#f/a`    | min = 0, max = 5184000                                        |
| {{< highlight typescript >}}eventCheckInterval: number;{{< /highlight >}}       | `#f/g`    | min = 1, max = 2592000                                        |
| {{< highlight typescript >}}eventMeasureInterval: number;{{< /highlight >}}     | `#f/h`    | min = 1, max = 2592000                                        |
| {{< highlight typescript >}}eventChannel: number;{{< /highlight >}}             | `#f/m`    | -                                                             |
| {{< highlight typescript >}}eventType: number;{{< /highlight >}}                | `#f/n`    | 0 = deactivated, 1 = activated, 2 = On / Off, 3 = Delta |
| {{< highlight typescript >}}eventSendMailXTimes: number;{{< /highlight >}}      | `#f/o`    | min = 1, max = 30                                             |
| {{< highlight typescript >}}measurementSendFtpAfterX: number;{{< /highlight >}} | `#f/q`    | -                                                             |
| {{< highlight typescript >}}measurementSendFTP: boolean;{{< /highlight >}}      | `#f/z`    | Bit Position 0                                                |
| {{< highlight typescript >}}alarmSendFTP: boolean;{{< /highlight >}}            | `#f/z`    | Bit Position 1                                                |
| {{< highlight typescript >}}infoSendFTP: boolean;{{< /highlight >}}             | `#f/z`    | Bit Position 2                                                |
| {{< highlight typescript >}}checkSendFTP: boolean;{{< /highlight >}}            | `#f/z`    | Bit Position 3                                                |
| {{< highlight typescript >}}hardwarePreOnTime: number;{{< /highlight >}}        | `#f/3`    | min = 0, max = 254                                            |

## #k FTP-Settings

| Field                                                                       | Reference | Comment              |
| --------------------------------------------------------------------------- | --------- | -------------------- |
| {{< highlight typescript >}}ftpServerName: string;{{< /highlight >}}        | `#k/a`    | -                    |
| {{< highlight typescript >}}ftpUsername: string;{{< /highlight >}}          | `#k/b`    | -                    |
| {{< highlight typescript >}}ftpPassword: string;{{< /highlight >}}          | `#k/c`    | -                    |
| {{< highlight typescript >}}ftpAccount: string;{{< /highlight >}}           | `#k/d`    | -                    |
| {{< highlight typescript >}}ftpSourceControlPort: string;{{< /highlight >}} | `#k/e`    | min = 0, max = 65535 |
| {{< highlight typescript >}}ftpPort: string;{{< /highlight >}}              | `#k/f`    | min = 0, max = 65535 |
| {{< highlight typescript >}}ftpSourceDataPort: string;{{< /highlight >}}    | `#k/g`    | min = 0, max = 65535 |
| {{< highlight typescript >}}ftpServerPath: string;{{< /highlight >}}        | `#k/h`    | -                    |

## #I Information

| Field                                                                            | Reference |
| -------------------------------------------------------------------------------- | --------- |
| {{< highlight typescript >}}generalGsmSoftwareVersion: string;{{< /highlight >}} | `#I/f`    |
| {{< highlight typescript >}}generalGsmSerialNumber: string;{{< /highlight >}}    | `#I/n`    |
