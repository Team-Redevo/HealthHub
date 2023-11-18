import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:health_hub_user_app/main.dart";

class PrescriptionInfoCard extends StatelessWidget {
  final String prescriptionDateStart;
  final String prescriptionDateFinal;
  final List<String> prescriptionRow;

  PrescriptionInfoCard(this.prescriptionDateStart, this.prescriptionDateFinal, this.prescriptionRow);

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
                  // title
                  const Row(
                    children: [
                      Icon(
                        Icons.receipt_long,
                        color: secondaryColor,
                        size: 24,
                      ),
                      SizedBox(
                          width:
                              8),
                      Text(
                        "Prescription",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // issuing doctor
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person, 
                          color: secondaryColor,
                          size: 24,
                        ),
                        SizedBox(
                            width:
                                8),
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
                  // issue date
                  Row(
                    children: [
                      const Icon(
                        Icons.start, // Choose the appropriate icon
                        color: secondaryColor, // Customize the icon color
                        size: 24, // Customize the icon size
                      ),
                      const SizedBox(width:8), // Adjust the space between the icon and text
                      Text(
                        "Issued on $prescriptionDateStart",
                        style: const TextStyle(
                          color: primaryTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  // expiry date
                  Row(
                    children: [
                      const Icon(
                        Icons.hourglass_bottom, // Choose the appropriate icon
                        color: secondaryColor, // Customize the icon color
                        size: 24, // Customize the icon size
                      ),
                      const SizedBox(width:8), // Adjust the space between the icon and text
                      Text(
                        "Expires on $prescriptionDateFinal",
                        style: const TextStyle(
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
            // this is the button that will show the modal
            InkWell(
              onTap: () {
                _showModal(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryTextColor,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.7,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Prescription Details',
                style: TextStyle(
                  fontSize: 20,  // 30
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              for (int i = 2; i < prescriptionRow.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SubstanceName: ' + prescriptionRow[i].split(",")[0].toString()),
                    Text('Miligrams: ' + prescriptionRow[i].split(",")[1].toString()),
                    Text('Dosage: ' + prescriptionRow[i].split(",")[2].toString()),
                    Text('Period: ' + prescriptionRow[i].split(",")[3].toString()),
                    SizedBox(height: 16),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
