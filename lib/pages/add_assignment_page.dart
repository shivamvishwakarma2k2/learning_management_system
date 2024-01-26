// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learning_management_system/data/classroom.dart';
import 'package:learning_management_system/data/users_data.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class AddAssignmentPage extends StatefulWidget {
  const AddAssignmentPage({super.key});

  @override
  State<AddAssignmentPage> createState() => _AddAssignmentPageState();
}

class _AddAssignmentPageState extends State<AddAssignmentPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController messController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024, DateTime.january),
      lastDate: DateTime(2025),
      currentDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      var dueDate = picked.toString().substring(0, 10);
      setState(() {
        selectedDate = picked;
        dateController.text = dueDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  customText(
                      text: "Add Assignment", fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 8,
                  ),
                  customTextFeild(
                    text: "Title",
                    controller: titleController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  customTextFeild(
                    text: "Subject",
                    controller: subController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  customTextFeild(
                    text: "Description",
                    controller: messController,
                    minLines: 3,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: dateController,
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      label: Text("Select Due Date"),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () {
                      selectDate(context);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  customElevatedButton(
                    context: context,
                    text: "Add Assignment",
                    callbackFunction: () {
                      if (titleController.text.isEmpty &&
                          subController.text.isEmpty &&
                          messController.text.isEmpty &&
                          dateController.text.isEmpty) {
                        customSnackBar(
                            context: context,
                            message: "all fields are mandatory");
                      } else {
                        assignments.insert(
                          0,
                          {
                            "title": titleController.text.toString(),
                            "subject": subController.text.toString(),
                            "message": messController.text.toString(),
                            "duedate": dateController.text.toString(),
                            "by": teachers[0]["name"].toString(),
                          },
                        );

                        print("Assignment added");
                        print(assignments);

                        customSnackBar(
                            context: context,
                            message: "Announcement Published");

                        titleController.text = "";
                        subController.text = "";
                        messController.text = "";
                        dateController.text = "";
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
