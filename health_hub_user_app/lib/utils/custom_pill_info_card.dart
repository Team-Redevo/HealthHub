import "package:flutter/material.dart";
import "package:health_hub_user_app/main.dart";

class PillInfoCard extends StatelessWidget {
  PillInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "1 pill, once per day",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Probiotic, 250mg",
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
            Icon(Icons.arrow_forward_ios, color: secondaryTextColor, size: 30)
          ],
        ),
      ),
    );
  }
}
