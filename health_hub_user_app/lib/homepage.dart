import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_hub_user_app/utils/custom_prescription_info_card.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';
import 'utils/custom_pill_info_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  // Failed code

  // void _generateWeekDates() {
  //   DateTime now = DateTime.now();
  //   DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  //   DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

  //   for (int i = 0; i < 7; i++) {
  //     DateTime date = startOfWeek.add(Duration(days: i));
  //     _weekDates.add(date);
  //   }

  //   print(_weekDates);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text
            const Text('Welcome Claudiu!',
                style: TextStyle(color: primaryTextColor, fontSize: 30)),
            const SizedBox(height: 15),
            // Pills reminder section
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
                SizedBox(
                  height: 15,
                ),
                // TO DO: Get current and following days of the week
                // List of days
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      if (index == 1) {
                        return PillDayCard(primaryColor, Colors.white);
                      } else {
                        return PillDayCard(
                            cardBackgroundColor, primaryTextColor);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // TO DO: Get info about pill from database
                // List of pills that need to be taken that day
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return PillInfoCard();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: PillInfoCard(),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 25),
                  child: Center(
                    child: SizedBox(
                      height: 1,
                      width: 250,
                      child: Container(
                          decoration: BoxDecoration(color: secondaryColor)),
                    ),
                  ),
                ),
                Text('Current prescription',
                    style: TextStyle(color: primaryTextColor, fontSize: 20)),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      // TO DO: Navigate to prescription page
                    },
                    child: PrescriptionInfoCard("start", "stop", ["prescription"])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
