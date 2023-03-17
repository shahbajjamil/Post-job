import 'package:flutter/material.dart';
import 'package:post_job/constant/app_color.dart';
import 'package:post_job/feature/job/view/job_screen.dart';

import 'feature/main_landing/main_landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      home: const MainBottomScreen(),
    );
  }
}
