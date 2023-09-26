
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1ba94c);
  static const Color secondary = Color(0xFF097bbf);
  static const Color white= Color(0xFFFFFFFF);

  static const Color error = Color(0xFFa93c32);
  static const Color success = Color(0xFF22a97a);
  static const Color disabled = Color(0xFF6EA989);
  static MaterialColor primaryMaterial = MaterialColor(
    primary.value,
    <int, Color>{
      50: primary.withOpacity(0.1),
      100: primary.withOpacity(0.2),
      200: primary.withOpacity(0.3),
      300: primary.withOpacity(0.4),
      400: primary.withOpacity(0.5),
      500: primary.withOpacity(0.6),
      600: primary.withOpacity(0.7),
      700: primary.withOpacity(0.8),
      800: primary.withOpacity(0.9),
      900: primary.withOpacity(1),
    },
  );
}
