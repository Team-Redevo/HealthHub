import 'package:flutter/material.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';
import 'utils/custom_pill_info_card.dart';

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
                  height: 90,
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
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
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
                  height: 10,
                ),
                Container(
                  height: 95,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: cardBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(Icons.insert_drive_file,
                                color: primaryColor, size: 50),
                          ),
                        ),
                        Column(
                          children: [],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
