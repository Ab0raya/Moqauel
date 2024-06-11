import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';


class AttendanceCard extends StatelessWidget {
  final String date;
  final String status;

  const AttendanceCard({
    Key? key,
    required this.date,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: DarkMode.kPrimaryColor.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date.split('T')[0],
            style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),
          ),
          Text(
            status,
            style: Styles.textStyle24.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
