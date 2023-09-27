import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/dashboard.dart';
import 'package:assignment/screens/view/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.primary,
            iconTheme: IconThemeData(color: AppColors.primary),
            appBarTheme: AppBarTheme(
                color: AppColors.primary,
                titleTextStyle: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                iconTheme: IconThemeData(size: 21, color: AppColors.primary),
                centerTitle: false)),
        home: DashBoard());
  }
}
