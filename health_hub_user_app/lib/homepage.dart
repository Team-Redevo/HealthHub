import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_hub_user_app/utils/custom_prescription_info_card.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';
import 'utils/custom_pill_info_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('user_id');

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // welcome text
              const Text('Welcome, Claudiu!',
                  style: TextStyle(color: primaryTextColor, fontSize: 30)),
              const SizedBox(height: 15),
              // pills reminder section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'November 2023',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // list of days
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 6, // chendule for the next 10 days
                      itemBuilder: (context, index) {
                        var nowTime = DateTime.now();
                        var futureDate = nowTime.add(Duration(days: index));
                        var dayName = DateFormat('E').format(futureDate);
                        var dayNr = futureDate.day;

                        // Determine the background and text color based on whether the date matches the selected date
                        bool isSelectedDate = selectedDate.day == dayNr && selectedDate.month == futureDate.month;
                        var bkColor = isSelectedDate ? primaryColor : cardBackgroundColor;
                        var textColor = isSelectedDate ? Colors.white : primaryTextColor;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              //selectedDate = nowTime.add(Duration(days: index));
                              selectedDate = futureDate;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: bkColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  dayNr.toString(),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  dayName,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // list of pills that need to be taken that day
                  FutureBuilder<DocumentSnapshot>(
                    future: users.doc("1").get(),
                    builder:
                        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        return SizedBox(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: data["prescriptions"].length,
                            itemBuilder: (context, index) {
                              var originalData = data["prescriptions"][index]; // the prescription and the id
                              String id = data["prescriptions"][index]["id"];
                              originalData = (originalData["prescription"].toString()).split(";"); // the array with the prescription data (creationDay, lastDay and pills)
                              var prescriptionLimit = DateTime.parse(originalData[1].toString());
                              if(prescriptionLimit.isAfter(selectedDate.subtract(const Duration(days:1)))) {
                                List<Widget> pillInfoCards = [];
                                for (int i = 2; i < originalData.length; i++) {
                                  var currentIntakes = originalData[i].toString().split(",")[4];
                                  print("currentIntakes: ${currentIntakes}");
                                  if(DateFormat('d').format(selectedDate.add((Duration(days: int.parse(currentIntakes)+1)))) != DateFormat('d').format(DateTime.now())){
                                    var values = originalData[i].toString().split(",");
                                    pillInfoCards.add(PillInfoCard(
                                      values[0],
                                      values[1],
                                      values[2],
                                      values[3],
                                      id,
                                      i,
                                    ));
                                  }
                                }
                                return Column(
                                  children: pillInfoCards,
                                );
                              }
                            },
                          ),
                        );
                      }
                      return const Text("loading");
                    },
                  ),
                  // add space
                  const SizedBox(
                    height: 20,
                  ),
                  PrescriptionInfoCard("start", "stop", ["data"]),
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}
