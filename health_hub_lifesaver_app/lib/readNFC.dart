import 'package:nfc_manager/nfc_manager.dart';


import 'package:nfc_manager/nfc_manager.dart';

class NFCReader {
  void _startNFCReading() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();

      //We first check if NFC is available on the device.
      if (isAvailable) {
        //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            // Process NFC tag, When an NFC tag is discovered, print its data to the console.
          },
        );
      }
    } catch (e) {
      // Handle any errors that occur during NFC reading.
    }
  }
}