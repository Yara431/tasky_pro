import 'package:flutter/material.dart';
import 'package:tasky_pro/app_context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
      body: Stack(
        children: [
           /* Positioned(
                top: 20,
                left: 10,
                child: Image.asset(context.resources.imagesUrls.splashImg))*/
        ],
      ),
    );
  }
}
