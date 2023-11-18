import 'package:flutter/material.dart';
import 'main.dart';
import 'utils/custom_pill_day_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
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
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: cardBackgroundColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Surname",
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "Given name",
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Row(
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
                                          Text(
                                            "Blood type: A+",
                                            style: TextStyle(
                                              color: primaryTextColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                      height: 125,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: cardBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
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
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 23, right: 50),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                // Adjust the space between the icon and text
                                                Text(
                                                  "Allergies",
                                                  style: TextStyle(
                                                    color: primaryTextColor,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.expand_more,
                                color: secondaryTextColor, size: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                      height: 125,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: cardBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
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
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 23),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                // Adjust the space between the icon and text
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  child: Text(
                                                    "Contraindications",
                                                    style: TextStyle(
                                                      color: primaryTextColor,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.expand_more,
                                color: secondaryTextColor, size: 30),
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
