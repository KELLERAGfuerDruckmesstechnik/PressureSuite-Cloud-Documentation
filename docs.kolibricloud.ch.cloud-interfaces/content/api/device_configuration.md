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

| Field                          | Reference | Comment              |
| ------------------------------ | --------- | -------------------- |
| gprsAPN                        | #a/a      | -                    |
| gprsID                         | #a/b      | -                    |
| gprsPassword                   | #a/c      | -                    |
| gprsDNS                        | #a/d      | -                    |
| mailSmtpShowedName             | #a/e      | -                    |
| mailPop3Username               | #a/f      | -                    |
| mailPop3Password               | #a/g      | -                    |
| mailOptSmtpUsername            | #a/h      | -                    |
| mailOptSmtpPassword            | #a/i      | -                    |
| mailPop3Server                 | #a/j      | -                    |
| mailPop3Port                   | #a/k      | min = 0, max = 65535 |
| mailSmtpServer                 | #a/l      | -                    |
| mailSmtpPort                   | #a/m      | min = 0, max = 65535 |
| mailReturnAddress              | #a/n      | -                    |
| cellularModuleId               | #a/o      | -                    |
| cellularModuleRevisionId       | #a/p      | -                    |
| cellularModuleSerialNumberIMEI | #a/q      | -                    |
| cellularSIMCardId              | #a/r      | -                    |
| cellularSIMCardSubscriberId    | #a/s      | -                    |

## #b Text, Number and Addresses

| Field                            | Reference | Comment                          |
| -------------------------------- | --------- | -------------------------------- |
| measurementMailAddress           | #b/a      | -                                |
| alarmMailAddress                 | #b/b      | -                                |
| infoMailAddress                  | #b/c      | -                                |
| gprsPasswordForQuerySms          | #b/g      | -                                |
| gprsSimPin                       | #b/j      | -                                |
| hardwareDataConnectionCallNumber | #b/k      | -                                |
| measurementSmsNumber             | #b/m      | -                                |
| alarmSmsNumber                   | #b/n      | -                                |
| infoSmsNumber                    | #b/o      | -                                |
| gprsSmsServiceCenterNr           | #b/q      | -                                |
| generalNetworkName               | #b/r      | -                                |
| generalOwnTelNumber              | #b/s      | -                                |
| generalLocationName              | #b/t      | -                                |
| measurementSmsText               | #b/u      | -                                |
| alarmSmsText                     | #b/v      | -                                |
| checkAnswerSmsText               | #b/w      | -                                |
| generalLongitudeText             | #b/0      | -                                |
| generalLatitudeText              | #b/1      | -                                |
| generalAltitudeText              | #b/2      | -                                |
| generalCellLocateLongitudeText   | #b/3      | Readonly, recalibracte with #e/l |
| generalCellLocateLatitudeText    | #b/4      | Readonly, recalibracte with #e/l |
| generalCellLocateAltitudeText    | #b/5      | Readonly, recalibracte with #e/l |

## #c Measurement Settings

| Field                                 | Reference | Comment                                                                                          |
| ------------------------------------- | --------- | ------------------------------------------------------------------------------------------------ |
| measurementTimer                      | #c/a      | min = 0, max = 5184000                                                                           |
| alarmTimer                            | #c/b      | min = 0, max = 5184000                                                                           |
| infoTimer                             | #c/c      | min = 0, max = 5184000                                                                           |
| checkTimer                            | #c/d      | min = 0, max = 5184000                                                                           |
| hardwareDataConnectionTimer           | #c/e      | min = 0, max = 5184000                                                                           |
| measurementInterval                   | #c/g      | min = 1, max = 2592000                                                                           |
| alarmInterval                         | #c/h      | min = 1, max = 2592000                                                                           |
| infoInterval                          | #c/i      | min = 1, max = 2592000                                                                           |
| checkInterval                         | #c/j      | min = 1, max = 2592000                                                                           |
| hardwareDataConnectionInterval        | #c/k      | min = 1, max = 2592000                                                                           |
| hardwareMeasureSaveChannel0           | #c/m      | Bit Position 0                                                                                   |
| hardwareMeasureSaveChannel1           | #c/m      | Bit Position 1                                                                                   |
| hardwareMeasureSaveChannel2           | #c/m      | Bit Position 2                                                                                   |
| hardwareMeasureSaveChannel3           | #c/m      | Bit Position 3                                                                                   |
| hardwareMeasureSaveChannel4           | #c/m      | Bit Position 4                                                                                   |
| hardwareMeasureSaveChannel5           | #c/m      | Bit Position 5                                                                                   |
| hardwareMeasureSaveChannel6           | #c/m      | Bit Position 6                                                                                   |
| hardwareMeasureSaveChannel7           | #c/m      | Bit Position 7                                                                                   |
| measurementSendSmsAfterX              | #c/o      | -                                                                                                |
| hardwareMeasureSaveChannel8           | #c/p      | Bit Position 0                                                                                   |
| hardwareMeasureSaveChannel9           | #c/p      | Bit Position 1                                                                                   |
| hardwareMeasureSaveChannel10          | #c/p      | Bit Position 2                                                                                   |
| hardwareMeasureSaveChannel11          | #c/p      | Bit Position 3                                                                                   |
| hardwareMeasureSaveChannel12          | #c/p      | Bit Position 4                                                                                   |
| hardwareMeasureSaveChannel13          | #c/p      | Bit Position 5                                                                                   |
| hardwareMeasureSaveChannel14          | #c/p      | Bit Position 6                                                                                   |
| hardwareMeasureSaveChannel15          | #c/p      | Bit Position 7                                                                                   |
| measurementSendMailAfterX             | #c/q      | -                                                                                                |
| alarmChannelNumber                    | #c/r      | -                                                                                                |
| alarmType                             | #c/s      | 1 = On / Off \| 2 = Delta \| 3 = Digital Input                                                   |
| alarmSendXTimes                       | #c/t      | -                                                                                                |
| hardwareResolutionPressureChannels    | #c/v      | SMS only                                                                                         |
| hardwareResolutionTemperatureChannels | #c/w      | SMS only                                                                                         |
| lockTimerMeasurement                  | #c/y      | -                                                                                                |
| lockTimerAlarm                        | #c/y      | -                                                                                                |
| lockTimerInfo                         | #c/y      | -                                                                                                |
| lockTimerCheck                        | #c/y      | -                                                                                                |
| lockTimerDial                         | #c/y      | -                                                                                                |
| measurementSendSms                    | #c/z      | Bit Position 0                                                                                   |
| alarmSendSms                          | #c/z      | Bit Position 1                                                                                   |
| infoSendSms                           | #c/z      | Bit Position 2                                                                                   |
| checkSendSms                          | #c/z      | Bit Position 3                                                                                   |
| measurementSendMail                   | #c/z      | Bit Position 4                                                                                   |
| alarmSendMail                         | #c/z      | Bit Position 5                                                                                   |
| infoSendMail                          | #c/z      | Bit Position 6                                                                                   |
| checkSendMail                         | #c/z      | Bit Position 7                                                                                   |
| gprsModemProtocol                     | #c/0      | 0 = 9600bps (V.32) \| 1 = 9600bps (V.34) \| 2 = 9600bps (V.110)                                  |
| mailSmtpUseSSL                        | #c/1      | Bit Position 0                                                                                   |
| mailPop3UseSSL                        | #c/1      | Bit Position 1                                                                                   |
| mailUseAlternativeSMTPLogin           | #c/2      | -                                                                                                |
| waterLevelCalculationFormType         | #c/3      | 0 = none \| 1 = A \| 2 = B \| 3 = C \| 4 = D \| 5 = E \| 6 = F \| 7 = Venturi \| 8 = Open tube * |
| hardwarePowerExternalDevice           | #c/4      | 0 = Deactivated \| 1 = +12V \| 2 = +5V \| 3 = +3.9V \| 4 = all On                                |
| hardwareSupportedSensorTypes          | #c/5      | -                                                                                                |
| hardwareConnectionType                | #c/6      | -                                                                                                |
| waterLevelCalculationIsAbsoluteSensor | #c/7      | -                                                                                                |
| waterLevelCalculationCalculateFrom    | #c/8      | 0 = P1-P2 \| 1 = P1-PBaro \| 2 = P1 relative \| 3 = not defined                                  |
| waterLevelCalculationConversionTo     | #c/9      | 0 = E \| 1 = F, 2 = G \| 3 = Poleni \| 4 = Thomson **                                            |
| ftpUseTLS                             | #c/A      | -                                                                                                |
| ftpUseActiveMode                      | #c/B      | -                                                                                                |

\* A = 0.85-0.88, B = 0.87-0.95, C = 1.13-1.27, D = 1.11, E = 1.30, F = 1.37, Venturi = 1.75-2.02, Open tube = 0.529

\** E = Height of water above level sensor, F = Distance to water surface, G = Height of water above sea level, Poleni/Thomson = Overflow

## #d Floating Point Values

| Field                                 | Reference | Comment  |
| ------------------------------------- | --------- | -------- |
| alarmOnThreshold                      | #d/a      | -        |
| alarmOffThreshold                     | #d/b      | -        |
| alarmDeltaThreshold                   | #d/c      | -        |
| hardwareMultiplierTemperatureChannels | #d/f      | SMS only |
| hardwareMultiplierPressureChannels    | #d/g      | SMS only |
| eventOnValueThreshold                 | #d/i      | -        |
| eventOffValueThreshold                | #d/j      | -        |
| eventDeltaValueThreshold              | #d/k      | -        |
| waterLevelCalculationEnable           | #d/m      | -        |
| waterLevelCalculationLength           | #d/n      | -        |
| waterLevelCalculationHeight           | #d/o      | -        |
| waterLevelCalculationOffset           | #d/p      | -        |
| waterLevelCalculationDensity          | #d/q      | -        |
| waterLevelCalculationWidth            | #d/r      | -        |
| waterLevelCalculationAngle            | #d/s      | -        |
| waterLevelCalculationFormFactor       | #d/t      | -        |
| waterLevelCalculationMinCalcHeight    | #d/u      | -        |
| generalGpsLongitude                   | #d/0      | -        |
| generalGpsLatitude                    | #d/1      | -        |
| generalGpsAltitude                    | #d/2      | -        |

## #f Measurement Settings 2

| Field                    | Reference | Comment                                                       |
| ------------------------ | --------- | ------------------------------------------------------------- |
| eventMeasureTimer        | #f/a      | min = 0, max = 5184000                                        |
| eventCheckInterval       | #f/g      | min = 1, max = 2592000                                        |
| eventMeasureInterval     | #f/h      | min = 1, max = 2592000                                        |
| eventChannel             | #f/m      | -                                                             |
| eventType                | #f/n      | 0 = deactivated \| 1 = activated \| 2 = On / Off \| 3 = Delta |
| eventSendMailXTimes      | #f/o      | min = 1, max = 30                                             |
| measurementSendFtpAfterX | #f/q      | -                                                             |
| measurementSendFTP       | #f/z      | Bit Position 0                                                |
| alarmSendFTP             | #f/z      | Bit Position 1                                                |
| infoSendFTP              | #f/z      | Bit Position 2                                                |
| checkSendFTP             | #f/z      | Bit Position 3                                                |
| hardwarePreOnTime        | #f/3      | min = 0, max = 254                                            |

## #k FTP-Settings

| Field                | Reference | Comment              |
| -------------------- | --------- | -------------------- |
| ftpServerName        | #k/a      | -                    |
| ftpUsername          | #k/b      | -                    |
| ftpPassword          | #k/c      | -                    |
| ftpAccount           | #k/d      | -                    |
| ftpSourceControlPort | #k/e      | min = 0, max = 65535 |
| ftpPort              | #k/f      | min = 0, max = 65535 |
| ftpSourceDataPort    | #k/g      | min = 0, max = 65535 |
| ftpServerPath        | #k/h      | -                    |

## #I Information

| Field                     | Reference |
| ------------------------- | --------- |
| generalGsmSoftwareVersion | #I/f      |
| generalGsmSerialNumber    | #I/n      |
