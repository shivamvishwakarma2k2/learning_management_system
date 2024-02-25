import 'package:flutter/material.dart';
import 'package:learning_management_system/data/classroom.dart';
import 'package:learning_management_system/pages/assignmnet_submission_page.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class AssignmentListPage extends StatelessWidget {
 
  const AssignmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: assignments.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var title = assignments[index]['title'].toString();
            var subject = assignments[index]['subject'].toString();
            var dueDate = assignments[index]['duedate'].toString();
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AssignmentSubmitPage(
                        assignment: assignments[index],
                      );
                    },
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.assignment_outlined),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            text: title,
                            size: 20,
                          ),
                          customText(
                            text: dueDate,
                            size: 12,
                          ),
                        ],
                      ),
                      const Spacer(),
                      customText(text: subject, size: 12),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
