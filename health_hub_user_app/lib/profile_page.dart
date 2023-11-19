import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, Object?> userData;

  const ProfilePage({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: cardBackgroundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25, bottom: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .person, // Choose the appropriate icon
                                      color:
                                          secondaryColor, // Customize the icon color
                                      size: 24, // Customize the icon size
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '${widget.userData["first_name"]} ${widget.userData["last_name"]}',
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons
                                                .bloodtype, // Choose the appropriate icon
                                            color:
                                                secondaryColor, // Customize the icon color
                                            size: 24, // Customize the icon size
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // Adjust the space between the icon and text
                                          FutureBuilder<DocumentSnapshot>(
                                            future: FirebaseFirestore.instance
                                                .collection('user_id')
                                                .doc(
                                                    '${widget.userData['unique_id']}')
                                                .get(),
                                            builder: (context, snapshot) {
                                              // Check if the Future is complete
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                // Check if there is data
                                                if (snapshot.hasData) {
                                                  // Display the data in a Text widget
                                                  return Text(
                                                    'Blood type: ' +
                                                        snapshot
                                                            .data!['blood_type']
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: primaryTextColor,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  );
                                                } else if (snapshot.hasError) {
                                                  // Display an error message if the Future completes with an error
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                }
                                              }

                                              // By default, show a loading indicator
                                              return CircularProgressIndicator();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.logout,
                              color: secondaryTextColor, size: 30)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: cardBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(23),
                                      color: Colors.white,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.masks,
                                        size: 50,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Allergies",
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FutureBuilder<DocumentSnapshot>(
                                        future: FirebaseFirestore.instance
                                            .collection('user_id')
                                            .doc(
                                                '${widget.userData['unique_id']}')
                                            .get(),
                                        builder: (context, snapshot) {
                                          // Check if the Future is complete
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            // Check if there is data
                                            String textList = "";
                                            if (snapshot.hasData) {
                                              for (int i = 0;
                                                  i <
                                                      snapshot
                                                          .data!['id_allergies']
                                                          .length;
                                                  i++) {
                                                if (i == 0) {
                                                  textList = snapshot
                                                      .data!['id_allergies'][i];
                                                } else {
                                                  textList = textList +
                                                      "\n" +
                                                      snapshot.data![
                                                          'id_allergies'][i];
                                                }
                                              }
                                              return Text(
                                                textList,
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              );
                                              // Display the data in a Text widget
                                            } else if (snapshot.hasError) {
                                              // Display an error message if the Future completes with an error
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }
                                          }

                                          // By default, show a loading indicator
                                          return CircularProgressIndicator();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: cardBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(23),
                                      color: Colors.white,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.vaccines,
                                        size: 50,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Contraindications",
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FutureBuilder<DocumentSnapshot>(
                                        future: FirebaseFirestore.instance
                                            .collection('user_id')
                                            .doc(
                                                '${widget.userData['unique_id']}')
                                            .get(),
                                        builder: (context, snapshot) {
                                          // Check if the Future is complete
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            // Check if there is data
                                            String textList = "";
                                            if (snapshot.hasData) {
                                              for (int i = 0;
                                                  i <
                                                      snapshot
                                                          .data![
                                                              'drugs_contradictions']
                                                          .length;
                                                  i++) {
                                                if (i == 0) {
                                                  textList = snapshot.data![
                                                      'drugs_contradictions'][i];
                                                } else {
                                                  textList = textList +
                                                      "\n" +
                                                      snapshot.data![
                                                          'drugs_contradictions'][i];
                                                }
                                              }
                                              return Text(
                                                textList,
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              );
                                              // Display the data in a Text widget
                                            } else if (snapshot.hasError) {
                                              // Display an error message if the Future completes with an error
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }
                                          }

                                          // By default, show a loading indicator
                                          return CircularProgressIndicator();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      height: 90,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: cardBackgroundColor,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              "Do you want to change your password?",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add your logic here for the button click event
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                            ),
                            child: Text(
                              'Change',
                              style: TextStyle(
                                color: cardBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
