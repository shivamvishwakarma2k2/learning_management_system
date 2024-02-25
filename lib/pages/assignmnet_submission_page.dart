// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learning_management_system/data/users_data.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class AssignmentSubmitPage extends StatefulWidget {
  Map<String, dynamic> assignment;
  AssignmentSubmitPage({
    super.key,
    required this.assignment,
  });

  @override
  State<AssignmentSubmitPage> createState() => _AssignmentSubmitPageState();
}

class _AssignmentSubmitPageState extends State<AssignmentSubmitPage> {
  TextEditingController ansController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    print(widget.assignment["submitted"]);

    return Scaffold(
      appBar: customAppBar(
          context: context, title: widget.assignment["subject"]!.toString()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: widget.assignment["title"]!,
              size: 24,
            ),
            customText(
              text: "Last Date: ${widget.assignment["duedate"]!}",
              size: 14,
            ),
            const Divider(),
            customText(
              text: widget.assignment["message"]!,
            ),
            const Spacer(),
            isVisible
                ? customText(
                    text:
                        "submitted : ${widget.assignment["submitted"][0]["rollno"]}")
                : const SizedBox(
                    height: 0,
                  ),
            const SizedBox(
              height: 8,
            ),
            customTextFeild(
              text: "Write Answer",
              controller: ansController,
              minLines: 5,
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: customElevatedButton(
                    context: context,
                    text: "Submit Work",
                    callbackFunction: () {
                      if (ansController.text.isEmpty) {
                        customSnackBar(
                            context: context,
                            message:
                                "Answer is required feilds to Submitte the Assignment");
                      } else {
                        widget.assignment["submitted"] = [
                          {
                            "rollno": currentStudentRollNo,
                            "work": ansController.text.toString()
                          }
                          
                          
                        ];
                        ansController.text = "";
                        isVisible = true;
                        print(widget.assignment);
                        setState(() {});
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: customElevatedButton(
                    context: context,
                    text: "Attach Work",
                    callbackFunction: () {
                      customSnackBar(
                          context: context,
                          message: "Pick the File from Media");
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
