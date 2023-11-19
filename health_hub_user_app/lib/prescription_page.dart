import 'package:flutter/material.dart';
import 'package:health_hub_user_app/utils/custom_prescription_info_card.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescriptions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Current prescriptions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
      
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('user_id').doc('1').get(),
                builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      
                if (snapshot.hasError) {
                  return Text('Test');
                }
            
                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }
      
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 5), // Adjust the top padding
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: data['prescriptions'].length,
                      itemBuilder: (context, index) {
                        List<String> prescriptionInfo = data['prescriptions'][index]['prescription'].split(";");
                        String dateStart = prescriptionInfo[0];
                        String dateFinal = prescriptionInfo[1];
                        print(prescriptionInfo);
                        return Column(  
                          children: [
                            PrescriptionInfoCard(dateStart, dateFinal, prescriptionInfo),
                            SizedBox(height: 15),
                          ],
                        );
                      },
                    );
                }
      
          return Text("loading");
        },
          ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Past prescriptions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 5), // Adjust the top padding
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      //PrescriptionInfoCard(),
                      SizedBox(height: 15),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
