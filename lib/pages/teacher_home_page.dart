
import 'package:flutter/material.dart';
import 'package:learning_management_system/pages/add_anncounment_page.dart';
import 'package:learning_management_system/pages/add_assignment_page.dart';
import 'package:learning_management_system/pages/add_student_page.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class TeacherHomePage extends StatefulWidget {
  String name;
  String email;
  TeacherHomePage({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  int currentPage = 0;

  List pages = [
    const AddAnnouncementPage(),
    const AddAssignmentPage(),
    const AddStudentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Teacher Home"),
      drawer: customDrawer(
        context: context,
        name: widget.name,
        email: widget.email,
        isTeacher: true,
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(
            label: "Announcement",
            icon: Icon(Icons.chat_outlined),
          ),
          BottomNavigationBarItem(
            label: "Assignment",
            icon: Icon(Icons.assignment_outlined),
          ),
          BottomNavigationBarItem(
            label: "Student",
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
