import 'package:flutter/material.dart';
import 'package:learning_management_system/data/users_data.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class ShowStudentPage extends StatefulWidget {
  const ShowStudentPage({super.key});

  @override
  State<ShowStudentPage> createState() => _ShowStudentPageState();
}

class _ShowStudentPageState extends State<ShowStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            var name = students[index]['name'].toString();
            var email = students[index]['email'].toString();
            var rollNo = students[index]['rollno'].toString();
            return Card(
              child: ListTile(
                title: customText(text: name, size: 16),
                subtitle: customText(text: email, size: 14),
                leading: CircleAvatar(
                  radius: 20,
                  child: customText(text: rollNo, size: 12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
