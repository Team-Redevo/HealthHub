import "package:flutter/material.dart";
import "package:health_hub_user_app/main.dart";

class PrescriptionInfoCard extends StatelessWidget {
  PrescriptionInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.receipt_long, // Choose the appropriate icon
                        color: secondaryColor, // Customize the icon color
                        size: 24, // Customize the icon size
                      ),
                      SizedBox(
                          width:
                              8), // Adjust the space between the icon and text
                      Text(
                        "Prescription 001",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person, // Choose the appropriate icon
                          color: secondaryColor, // Customize the icon color
                          size: 24, // Customize the icon size
                        ),
                        SizedBox(
                            width:
                                8), // Adjust the space between the icon and text
                        Text(
                          "Issuing doctor",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.start, // Choose the appropriate icon
                        color: secondaryColor, // Customize the icon color
                        size: 24, // Customize the icon size
                      ),
                      SizedBox(
                          width:
                              8), // Adjust the space between the icon and text
                      Text(
                        "Issued on 12/12/2021",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.hourglass_bottom, // Choose the appropriate icon
                        color: secondaryColor, // Customize the icon color
                        size: 24, // Customize the icon size
                      ),
                      SizedBox(
                          width:
                              8), // Adjust the space between the icon and text
                      Text(
                        "Expires on 12/12/2022",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: secondaryTextColor, size: 30)
          ],
        ),
      ),
    );
  }
}
