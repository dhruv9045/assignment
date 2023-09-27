import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AttendanceBox extends StatelessWidget {
  final String text;
  final Color color;
  const AttendanceBox({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 24,
        height: 24,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
