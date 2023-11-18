import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_hub_lifesaver_app/firebase_options.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> nfcData = {"last_name": "No NFC tag scanned yet"};
  bool isReading = false; // Flag to track NFC reading status

  @override
  void dispose() {
    // Stop the NFC session if it's still active when the widget is disposed.
    if (isReading) {
      NfcManager.instance.stopSession();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Center(
              child: Text(
                'Health Hub Lifesaver',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _toggleNFCReading(); // Corrected to call the function
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Container(
                    width: 300,
                    height: 225,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Text(
                              isReading
                                  ? 'Stop NFC Reading'
                                  : 'Start NFC Reading',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/nfc_illustration.png',
                            width: 167,
                            height: 167,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // show the NFC data here in a box once data is read
                if (nfcData["last_name"] != "No NFC tag scanned yet" ||
                    nfcData["last_name"] != "NFC reading stopped")
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Name
                          Row(
                            children: [
                              Icon(Icons.person,
                                  color:
                                      const Color.fromARGB(255, 121, 198, 152),
                                  size: 30),
                              SizedBox(width: 5),
                              Text(
                                "${nfcData["first_name"]} ${nfcData["last_name"]}",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Blood type
                          Row(
                            children: [
                              Icon(Icons.bloodtype,
                                  color:
                                      const Color.fromARGB(255, 121, 198, 152),
                                  size: 30),
                              SizedBox(width: 5),
                              Text(
                                '${nfcData["blood_type"]}',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Allergies
                          Row(
                            children: [
                              Icon(Icons.masks,
                                  color:
                                      const Color.fromARGB(255, 121, 198, 152),
                                  size: 30),
                              SizedBox(width: 5),
                              Text(
                                '${nfcData["id_allergies"]}',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Drug contraindications
                          Row(
                            children: [
                              Icon(Icons.vaccines,
                                  color:
                                      const Color.fromARGB(255, 121, 198, 152),
                                  size: 30),
                              SizedBox(width: 5),
                              Text(
                                '${nfcData["drugs_contraindications"]}',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleNFCReading() {
    if (isReading) {
      // If already reading, stop the NFC session
      NfcManager.instance.stopSession();
      setState(() {
        isReading = false;
        nfcData["last_name"] = 'NFC reading stopped';
      });
    } else {
      // If not reading, start the NFC session
      _startNFCReading();
    }
  }

  void _startNFCReading() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (isAvailable) {
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
            // get id from tag
            String tagId = json.encode(tag.data);
            tagId = ((tagId.split('{')[2]).split(':')[1]).split(']')[0];
            print("TagID:" + tagId);

            firestoreInstance
                .collection("user_id")
                .where('tag_id', isEqualTo: tagId + "]")
                .get()
                .then((querySnapshot) {
              querySnapshot.docs.forEach((result) {
                print(result.data());
                setState(() {
                  nfcData = jsonDecode(jsonEncode(result.data()));
                  print(nfcData);
                });
              });
            });
          },
        );
        setState(() {
          isReading = true;
        });
      } else {
        setState(() {
          nfcData["last_name"] = 'NFC not available.';
        });
      }
    } catch (e) {
      setState(() {
        nfcData["last_name"] = 'Error reading NFC: $e';
      });
    }
  }
}
