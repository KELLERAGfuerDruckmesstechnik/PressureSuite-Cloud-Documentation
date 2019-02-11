---
title: The KELLER LoRa payload
menu:
    main:
        parent: lora-technology
        weight: 2
description: Information how you to decrypt and use the LoRa payload encrypted by KELLER AG
---

# How many LoRa messages can I send per device?
Due to the limited size of a LoRa message KELLER can send up to five float values per transmission. If a device is configured to send more than 5 float values then two messages have to be transmitted. Be aware that this doubles the message rate and therefore you might have to adjust the sending interval. KELLER recommends not more than 1 message per 10min per device. Independently, if there is one device or one thousand devices.

# How to decrypt the KELLER payload message from TheThingsNetwork?

The actual protocol can be found here [found here](../Kommunikationsprotokoll LoRa v2.0.pdf) (*IN GERMAN*)

Let's make an example:

  **1) Introduction**
In the TTN console (https://console.thethingsnetwork.org/applications) the payload and the decrypted values can be seen in the DATA tab:
![picture of TTN payload example](../../payload_ttn_example.png "TTN payload example")  
TTN here already decrypts the payload, and displays the channel values as floats. It does it because it uses [KELLER's TTN payload decoder Javascript code](https://github.com/KELLERAGfuerDruckmesstechnik/KellerAgTheThingsNetworkPayloadDecoder). This decoder SW works because TTN already decodes the payload (string) firstly to a byte array.

Payload string: "AQUA079gQlk9vCn8QajZAD93x6RBuAAA"
Base64 decrypted byte array: **01 05 00 D3 BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**

  **2) Basic steps**  
  - A)  Decrypt the Payload string to a Byte-Array  
  - B)  Identify the Device-Type  
  - C)  Decode the Bytes to (float) values  
  - D)  Assign the values to the correct channels according to the Device-Type  

  **2.A) Decrypt the Payload string to a Byte-Array**  
  - The payload string is Base64 encrypted.  
  - Decrypt it into a byte array. (Not a string)  
    
```
// Code example with c#:
    byte[] decodedPayload = System.Convert.FromBase64String(payload);
```

  **2.B) Identify the Device-Type**
-  The payload size varies depending of the count of transmitted values  
-  The payload is divided into the following groups:  
![picture of internal payload build](../../payload_protocol.png "internal payload build")  

- Byte #1: Represents the "function code". For normal measurement transmission this is 1. It would be another function code in case of alarming, configuration, transmission acknowledges, ...  
**<span style="color:red">01</span> 05 00 D3 BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> Function Code = 1  

- Byte 2#: Represents the Device Type (or "Connection Type"). Please use the "Device Type table" below. The value is not zero-based (sorry)  
**01 <span style="color:red">05</span> 00 D3 BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> Device Type = 5

- Byte #2+#3: Represent the information which transmitted channel values have been sent. Each bit represent the used channel from the particular device type  
**01 05 <span style="color:red">00 D3</span> BF 60 42 59 3D BC 29 FC 41 A8 D9 00 3F 77 C7 A4 41 B8 00 00**  
--> 00 D3 --> 0000'0000 1101'0011  
Transmitted Channels:  
   - #1
   - #2
   - #5
   - #7
   - #8


... todo



# How to decrypt the KELLER payload message from Loriot or Actility?

It is exactly the same as above except the payload string doesn't have to be decrypted from Base64, but converted from a string with hex-Values into a byte array.

```
// Example in c#
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
```