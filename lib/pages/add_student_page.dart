import 'package:flutter/material.dart';
import 'package:learning_management_system/data/users_data.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController rollNoController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customText(
                text: "Add Students",
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 8,
              ),
              customTextFeild(text: "Name", controller: nameController),
              const SizedBox(
                height: 8,
              ),
              customTextFeild(text: "Email", controller: emailController),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: customTextFeild(
                        text: "Roll No", controller: rollNoController),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: customTextFeild(
                        text: "Password", controller: passwordController),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              customElevatedButton(
                context: context,
                text: "Add Student",
                callbackFunction: () {
                  if (nameController.text.isEmpty &&
                      emailController.text.isEmpty &&
                      rollNoController.text.isEmpty &&
                      passwordController.text.isEmpty) {
                    customSnackBar(
                        context: context, message: "All Field are required");
                  } else {
                    students.add({
                      "name": nameController.text.toString(),
                      "email": emailController.text.toString(),
                      "rollno": rollNoController.text.toString(),
                      "password": passwordController.text.toString(),
                    });

                    customSnackBar(
                        context: context,
                        message: "Student Data Added Succesfully!!");

                    setState(() {
                      nameController.text == "";
                      emailController.text == "";
                      rollNoController.text == "";
                      passwordController.text == "";
                    });
                  }
                },
              ),
              const SizedBox(
                height: 36,
              ),
              customText(text: "OR", fontWeight: FontWeight.bold, size: 21),
              const SizedBox(
                height: 36,
              ),
              customText(text: "Import Data"),
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.upload,
                    size: 40,
                    color: Colors.deepPurple,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
