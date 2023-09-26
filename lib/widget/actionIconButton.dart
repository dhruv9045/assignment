import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ActionIcon extends StatelessWidget {
  final Function()? onPress;
  final IconData icon;
  const ActionIcon({
    super.key,
    this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
              color: AppColors.white,
              width: 40,
              height: 40,
              child: Icon(
                icon,

              )),
        ),
      ),
    );
  }
}
