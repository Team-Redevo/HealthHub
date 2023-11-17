import 'package:flutter/material.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';

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
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
