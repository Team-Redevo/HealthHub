import "package:flutter/material.dart";

class PillDayCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;

  PillDayCard(this.backgroundColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 80,
      width: 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "12",
            style: TextStyle(
              color: textColor,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Mon",
            style: TextStyle(
              color: textColor,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
