// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learning_management_system/data/users_data.dart';
import 'package:learning_management_system/pages/student_home_page.dart';
import 'package:learning_management_system/pages/teacher_home_page.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    tryLogin() {
      bool isUser = false;

      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        // checking for Admin login
        for (int i = 0; i < teachers.length; i++) {
          String name = teachers[i]['name']!;
          String email = teachers[i]['email']!;
          String password = teachers[i]['password']!;

          print("$email $password");
          if (emailController.text == email &&
              passwordController.text == password) {
            print("Registered Teacher");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TeacherHomePage(
                  name: name,
                  email: email,
                ),
              ),
            );

            isUser = true;
          }
        }

        // checking for Student login
        for (int i = 0; i < students.length; i++) {
          String name = students[i]['name']!;
          String rollNo = students[i]['rollno']!;
          String email = students[i]['email']!;
          String password = students[i]['password']!;

          print("$email $password");

          if (emailController.text == email &&
              passwordController.text == password) {
            currentStudent = name;
            currentStudentRollNo = rollNo;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StudentHomePage(
                  name: name,
                  email: email,
                ),
              ),
            );

            isUser = true;
          }
        }

        if (isUser == false) {
          customSnackBar(
            context: context,
            message:
                "No Registered to the Platform!\nKindly contact your teacher",
          );
        }
      } else {
        customSnackBar(
          context: context,
          message: "Email and Password field cannot be empty!!!",
        );
      }
    }

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                text: "Login",
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 28,
              ),
              customTextFeild(
                text: "Email",
                controller: emailController,
                suffixIcon: Icons.email,
              ),
              const SizedBox(
                height: 16,
              ),
              customTextFeild(
                text: "password",
                controller: passwordController,
                suffixIcon: Icons.password,
                obscureText: true,
              ),
              const SizedBox(
                height: 28,
              ),
              customElevatedButton(
                  context: context, text: "Login", callbackFunction: tryLogin),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
