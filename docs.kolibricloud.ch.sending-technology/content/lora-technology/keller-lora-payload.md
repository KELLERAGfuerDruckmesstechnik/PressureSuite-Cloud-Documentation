---
title: The KELLER LoRa communication protocol
menu:
    main:
        parent: lora-technology
        weight: 3
toc: false
description: Information how to decrypt and use the LoRa payload encrypted by KELLER AG
---


## How many LoRa messages can I send per device?

Due to the limited size of a LoRa message KELLER can send up to five float values per transmission. If a device is configured to send more than 5 float values then two messages have to be transmitted. Be aware that this doubles the message rate and therefore you might have to adjust the sending interval. KELLER recommends not more than 1 message per 10min per device; Independently, if there is one device or one thousand devices.

## The KELLER ADT/ARC LoRa communication protocol     ...or How to decrypt the KELLER payload messages?

#### For the ARC devices
The actual protocol can be [found here](../../ARC-1 LoRa data communication protocol 02_2020.pdf) (V02.2020 English)

#### For the ADT devices
The actual protocol can be [found here](../../ADT1 LoRa data communication protocol 02_2020.pdf) (V02.2020 English)


### Example with measurements (Port==1, Function code == 0x01)

In the [TTN console](https://console.thethingsnetwork.org/applications) the payload and the decrypted values can be seen in the DATA tab:
<img src="../../payload_ttn_example.png" alt="TTN payload example"/>  

TTN here already decrypts the payload, and displays the channel values as floats. It does it because it uses [KELLER's TTN payload decoder Javascript code](https://github.com/KELLERAGfuerDruckmesstechnik/KellerAgTheThingsNetworkPayloadDecoder). This decoder SW works because TTN already decodes the payload (string) firstly to a byte array.

Payload string: "AQUA079gQlk9vCn8QajZAD93x6RBuAAA"  
Base64 decrypted byte array: **01 05 00 D3 BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  

#### Basic steps

1. Decrypt the Payload string to a Byte-Array
2. Identify the Device-Type and channel numbers  
3. Decode the bytes to (float) values  
4. Assign the values to the correct channels according to the Device-Type  

##### 1. Decrypt the Payload string to a Byte-Array

- The payload string is Base64 encrypted.  
- Decrypt it into a byte array. (Not a string)  

{{< highlight csharp >}}
// code example with C#:
byte[] decodedPayload = System.Convert.FromBase64String(payload);
{{< /highlight >}}

##### 2. Identify the Device-Type and channel numbers

- The payload size varies depending of the count of transmitted values  
- The payload is divided into the following groups:  
![picture of internal payload build](../../payload_protocol.png "internal payload build")  

- Byte #1: Represents the "function code" which is the expected data format structure of the answer message. For normal ''measurement'' transmission this is **1**.   
**<span style="color:red">01</span> 05 00 D3 BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> Function Code = 1  

- Byte 2#: Represents the Device Type (or "Connection Type"). Please use the "Device Type table" below.  
**01 <span style="color:red">05</span> 00 D3 BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> Device Type = 5  

##### 3. Decode the bytes to (float) values  

- Byte #2+#3: Represent the information which transmitted channel values have been sent. Each bit represent the used channel from the particular device type  
![picture of internal payload build](../../payload_protocol_channels.png "internal payload build")  
**01 05 <span style="color:red">00 D3</span> BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> 00 D3 --> 0000'0000 **11**0**1**'00**11**  
- Transmitted Channels:  
  - #1  
  - #2  
  - #5  
  - #7  
  - #8  

- Byte #4 .. #7: Represents a float value using the IEEE 754 (<https://en.wikipedia.org/wiki/IEEE_754)> standard.  
**01 05 00 D3 <span style="color:red">BF 60 42 59</span> 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> BF 60 42 59 --> -0.876012384...

Test it with one of many online converters such as
![IEEE 754 Floating Point Converter](../../IEEE_754_Floating_Point_Converter.png "IEEE 754 Floating Point Converter")

{{< highlight csharp >}}
//code example with C#
private static float ExtractFloat(byte[] payLoadBytes, int pos)
{
    var bytes = new byte[4];
    Array.Copy(payLoadBytes, pos, bytes, 0, bytes.Length);
    if (BitConverter.IsLittleEndian)
    {
        bytes = bytes.Reverse().ToArray();
    }
    return BitConverter.ToSingle(bytes, 0);
}
{{< /highlight >}}

{{< highlight javascript >}}
//code example with Javascript
//
// Based on https://stackoverflow.com/a/37471538 by Ilya Bursov
function bytesToFloat(bytes) {
    // JavaScript bitwise operators yield a 32 bits integer, not a float.
    // Assume MSB (most significant byte first).
    var bits = bytes[0]<<24 | bytes[1]<<16 | bytes[2]<<8 | bytes[3];
    var sign = (bits>>>31 === 0) ? 1.0 : -1.0;
    var e = bits>>>23 & 0xff;
    var m = (e === 0) ? (bits & 0x7fffff)<<1 : (bits & 0x7fffff) |        0x800000;
    var f = sign * m * Math.pow(2, e - 150);
    return f;
}
{{< /highlight >}}

- Byte #8 .. #11, etc: Represent the other floating values like above
  
BF 60 42 59 --> -0.876012384...  
3D BC 29 FC -->  0.091876953...  
41 A8 D9 00 --> 21.105957031...  
3F 77 C7 A4 -->  0.967890024...  
41 B8 00 00 --> 23.0  
  
It is important to know that order and the definition of the float values corresponds to the order of the transmitted channels.  

##### 4. Assign the values to the correct channels according to the Device-Type

Above example payload identified:  

- DeviceType #5 which is "RS485 & Baro (P1-PB) & Dig.Inp.1 & Volt Inp. 1"  
- Transmitted Channels:
  - #1 with -0.876012384...  
  - #2 with  0.091876953...  
  - #5 with 21.105957031...  
  - #7 with  0.967890024...  
  - #8 with 23.0  
  
Now, to map the channels to real named channels with physical units it is needed to lookup the given device type. See [protocol pdf](../../ADT1 LoRa data communication protocol 02_2020.pdf) or the [table below](#mapping).
  
The given channels are therefore:

- #1 = MeasurementDefinitionId 11 = Pd(P1-PBaro) with -0.876012384... bar
- #2 = MeasurementDefinitionId 2  = P1 with  0.091876953... bar  
- #5 = MeasurementDefinitionId 5  = TOB1 with 21.105957031... °C  
- #7 = MeasurementDefinitionId 7  = PBaro with  0.967890024... bar  
- #8 = MeasurementDefinitionId 8  = TBaro with 23.0 °C  

Pressure values from the API are always in bar  
Temperature values from the API are always in °C  

## How to decrypt the KELLER payload message from Loriot or Actility

It is exactly the same as above except the payload string doesn't have to be decrypted from Base64, but converted from a string with hex-Values into a byte array.  

{{< highlight csharp >}}
// code example in c#
private static byte[] ConvertHexStringToByteArray(string hexString)
{
    var hexAsBytes = new byte[hexString.Length / 2];

    for (var i = 0; i < hexAsBytes.Length; i++)
    {
        string byteValue = hexString.Substring(i * 2, 2);
        hexAsBytes[i] = byte.Parse(byteValue, NumberStyles.HexNumber, CultureInfo.InvariantCulture);
    }
    return hexAsBytes;
}
{{< /highlight >}}

## Mapping between: Device Type - Measurement Definition Id - Channel numbers  

### Device Type  

 Id | Device Type                                                       
----|--------------------------------------------------------------------
 0  | RS485                                                             
 1  | RS485 & 2 Dig.Inp.                                                
 2  | RS485 & Baro (P1-P2) & Dig.Inp. 1                                 
 3  | RS485 & Baro (P1-PB) & Dig.Inp.1                                  
 4  | RS485 & Baro (P1-P2) & Dig.Inp.1 & Volt Inp.                      
 5  | RS485 & Baro (P1-PB) & Dig.Inp.1 & Volt Inp. 1                    
 6  | RS485(x5) & Baro (P1-P2) & Dig.Inp1/2 = Counter Inp. & Volt Inp.  
 7  | SDI12 & Baro & Digital Inp.1 & Volt Inp                           
 8  | RS485 (5xP1+TOB1) & Baro & Dig.Inp. 1/2                           
 9  | RS485 CTD & Baro (P1-P2) & Dig.Inp. 1 & Volt. Inp. 1              
 10 | RS485 CTD & Baro (P1-PB) & Dig.Inp. 1 & Volt. Inp.                
 11 | RS485 CTD & Baro (3x P1+TOB1+Cond comp+Tcon) & Baro & Counter Inp.
 12 | RS485 & Baro (P1-PBaro) & Modbus ABB Aquamaster                   
 13 | RS485 (2x(P1+P2+TOB1+TOB2)) & Counter Inp. & Volt Inp.            

### Measurement Definition Id  

 Id | MeasurementDefinition              
----|------------------------------------
 1  | Pd (P1-P2)                         
 2  | P1                                 
 3  | P2                                 
 4  | T                                  
 5  | TOB1                               
 6  | TOB2                               
 7  | PBaro                              
 8  | TBaro                              
 9  | Volt Inp. 1                        
 10 | Volt Inp. 2                        
 11 | Pd (P1-PBaro)                      
 12 | Conductivity Tc                    
 13 | Conductivity raw                   
 14 | T (Conductivity)                   
 15 | P1 (2)                             
 16 | P1 (3)                             
 17 | P1 (4)                             
 18 | P1 (5)                             
 19 | Counter input                      
 20 | SDI12 CH1                          
 21 | SDI12 CH2                          
 22 | SDI12 CH3                          
 23 | SDI12 CH4                          
 24 | SDI12 CH5                          
 25 | SDI12 CH6                          
 26 | SDI12 CH7                          
 27 | SDI12 CH8                          
 28 | SDI12 CH9                          
 29 | SDI12 CH10                         
 30 | TOB1 (2)                           
 31 | TOB1 (3)                           
 32 | TOB1 (4)                           
 33 | TOB1 (5)                           
 34 | E                                  
 35 | F                                  
 36 | G                                  
 37 | mH20 (Pbaro)                       
 38 | mH20 (P1-P2)                       
 39 | mH20 (P1-P3)                       
 40 | mH20 (P1-P4)                       
 41 | mH20 (P1-P5)                       
 42 | Conductivity Tc (2)                
 43 | Conductivity Tc (3)                
 44 | T (Conductivity) (2)               
 45 | T (Conductivity) (3)               
 46 | P2 (2)                             
 47 | TOB2 (2)                           
 48 | AquaMaster Flow Rate               
 49 | AquaMaster Pressure                
 50 | AquaMaster Custom Flow Units       
 51 | AquaMaster External Supply Voltage 
 52 | Tank Content 1                     
 53 | Tank Content 2                     
 54 | Tank Content 3                     

### Mapping  

 ChannelNumber | DeviceTypeId | MeasurementDefinitionId 
---------------|--------------|------------------------- 
 1             | 0            | 1                       
 2             | 0            | 2                       
 3             | 0            | 3                       
 4             | 0            | 4                       
 5             | 0            | 5                       
 6             | 0            | 6                       
 1             | 1            | 1                       
 2             | 1            | 2                       
 3             | 1            | 3                       
 4             | 1            | 4                       
 5             | 1            | 5                       
 6             | 1            | 6                       
 1             | 2            | 11                      
 2             | 2            | 2                       
 3             | 2            | 3                       
 4             | 2            | 4                       
 5             | 2            | 5                       
 6             | 2            | 6                       
 7             | 2            | 7                       
 8             | 2            | 8                       
 1             | 5            | 11                      
 2             | 5            | 2                       
 3             | 5            | 3                       
 4             | 5            | 4                       
 5             | 5            | 5                       
 6             | 5            | 6                       
 7             | 5            | 7                       
 8             | 5            | 8                       
 9             | 5            | 9                       
 10            | 5            | 10                      
 1             | 10           | 11                      
 2             | 10           | 2                       
 3             | 10           | 3                       
 4             | 10           | 14                      
 5             | 10           | 5                       
 6             | 10           | 6                       
 7             | 10           | 7                       
 8             | 10           | 8                       
 9             | 10           | 9                       
 10            | 10           | 10                      
 11            | 10           | 12                      
 12            | 10           | 13                      
 1             | 3            | 11                      
 2             | 3            | 2                       
 3             | 3            | 3                       
 4             | 3            | 4                       
 5             | 3            | 5                       
 6             | 3            | 6                       
 7             | 3            | 7                       
 8             | 3            | 8                       
 1             | 4            | 1                       
 2             | 4            | 2                       
 3             | 4            | 3                       
 4             | 4            | 4                       
 5             | 4            | 5                       
 6             | 4            | 6                       
 7             | 4            | 7                       
 8             | 4            | 8                       
 9             | 4            | 9                       
 10            | 4            | 10                      
 1             | 6            | 1                       
 2             | 6            | 2                       
 3             | 6            | 3                       
 4             | 6            | 4                       
 5             | 6            | 5                       
 6             | 6            | 6                       
 7             | 6            | 7                       
 8             | 6            | 8                       
 9             | 6            | 9                       
 10            | 6            | 10                      
 11            | 6            | 15                      
 12            | 6            | 16                      
 13            | 6            | 17                      
 14            | 6            | 18                      
 15            | 6            | 19                      
 2             | 7            | 7                       
 3             | 7            | 8                       
 4             | 7            | 9                       
 5             | 7            | 10                      
 6             | 7            | 20                      
 7             | 7            | 21                      
 8             | 7            | 22                      
 9             | 7            | 23                      
 10            | 7            | 24                      
 11            | 7            | 25                      
 12            | 7            | 26                      
 13            | 7            | 27                      
 14            | 7            | 28                      
 15            | 7            | 29                      
 1             | 8            | 2                       
 2             | 8            | 5                       
 3             | 8            | 15                      
 4             | 8            | 30                      
 5             | 8            | 16                      
 6             | 8            | 31                      
 7             | 8            | 17                      
 8             | 8            | 32                      
 9             | 8            | 18                      
 10            | 8            | 33                      
 11            | 8            | 9                       
 12            | 8            | 10                      
 13            | 8            | 7                       
 14            | 8            | 8                       
 15            | 8            | 19                      
 1             | 9            | 1                       
 2             | 9            | 2                       
 3             | 9            | 3                       
 4             | 9            | 14                      
 5             | 9            | 5                       
 6             | 9            | 6                       
 7             | 9            | 7                       
 8             | 9            | 8                       
 9             | 9            | 9                       
 10            | 9            | 10                      
 11            | 9            | 12                      
 12            | 9            | 13                      
 1             | 11           | 2                       
 2             | 11           | 5                       
 3             | 11           | 12                      
 4             | 11           | 14                      
 5             | 11           | 15                      
 6             | 11           | 30                      
 7             | 11           | 42                      
 8             | 11           | 44                      
 9             | 11           | 16                      
 10            | 11           | 31                      
 11            | 11           | 43                      
 12            | 11           | 45                      
 13            | 11           | 7                       
 14            | 11           | 8                       
 15            | 11           | 19                      
 1             | 13           | 2                       
 2             | 13           | 3                       
 3             | 13           | 5                       
 4             | 13           | 6                       
 5             | 13           | 15                      
 6             | 13           | 46                      
 7             | 13           | 30                      
 8             | 13           | 47                      
 9             | 13           | 7                       
 10            | 13           | 8                       
 11            | 13           | 9                       
 12            | 13           | 10                      
 13            | 13           | 19                      
