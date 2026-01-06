import 'package:flutter/material.dart';
import 'package:tasky_pro/authentication/view/onboarding_view.dart';
import 'package:tasky_pro/authentication/view/sign_in_view.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}