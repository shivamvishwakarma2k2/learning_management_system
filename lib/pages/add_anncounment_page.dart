// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learning_management_system/data/classroom.dart';
import 'package:learning_management_system/data/users_data.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({super.key});

  @override
  State<AddAnnouncementPage> createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController messController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                customText(
                    text: "Add Announcement",
                    fontWeight: FontWeight.bold),
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
                  text: "Subject about",
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
                  height: 16,
                ),
                customElevatedButton(
                  context: context,
                  text: "Announce It!",
                  callbackFunction: () {
                    if (titleController.text.isEmpty &&
                        subController.text.isEmpty &&
                        messController.text.isEmpty) {
                      customSnackBar(
                          context: context,
                          message: "all feilds are mandatory");
                    } else {
                      anncounments.insert(
                        0,
                        {
                          "title": titleController.text.toString(),
                          "subject": subController.text.toString(),
                          "message": messController.text.toString(),
                          "by": teachers[0]["name"].toString(),
                        },
                      );

                      print("announcement added");

                      customSnackBar(
                          context: context, message: "Announcement Published");

                      titleController.text = "";
                      subController.text = "";
                      messController.text = "";
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
