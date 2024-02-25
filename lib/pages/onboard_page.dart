import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_management_system/pages/login_page.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.onTertiary,
              Theme.of(context).colorScheme.inversePrimary,
              Theme.of(context).colorScheme.onPrimary,
              const Color.fromARGB(255, 120, 147, 255),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                text: "RJC",
                fontWeight: FontWeight.bold,
                size: 32,
              ),
              const SizedBox(
                height: 18,
              ),
              customText(
                text: "TYIT Classroom",
                fontWeight: FontWeight.bold,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
