import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:health_hub_user_app/main.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class PillInfoCard extends StatelessWidget {
  final String pillName;
  final String pillDosage;
  final String pillFrequency;
  final String period;
  final String id;
  PillInfoCard(this.pillName, this.pillDosage, this.pillFrequency, this.period, this.id);

  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(23),
              onPressed: (context) {
                print("deleter started with id: ${id}");
                // connect to db and delete the pill
                firestoreInstance
                  .collection("user_id")
                  .where('prescriptions.id', arrayContains: id.toString())
                  .get()
                  .then((querySnapshot) {
                querySnapshot.docs.forEach((result) {
                  print(result.data());
                });
              });
              },
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.check,
              label: "Done",
            ),
          ]),
      child: InkWell(
        onTap: () {
        },
        child: Container(
          height: 95,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: cardBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Image.asset(
                      "assets/pill_image.png",
                      width: 50, // Set the desired width
                      height: 50, // Set the desired height
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${pillFrequency} pills per day",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${pillName}, ${pillDosage}",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled,
                            color: primaryColor, size: 20),
                        SizedBox(width: 5),
                        Text(
                          "Take at 8:00 AM",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios,
                    color: secondaryTextColor, size: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
