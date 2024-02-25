import 'package:flutter/material.dart';
import 'package:learning_management_system/pages/announcement_list_page.dart';
import 'package:learning_management_system/pages/assignment_list_page.dart';
import 'package:learning_management_system/pages/show_students_page.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class StudentHomePage extends StatefulWidget {
  String name;
  String email;
  StudentHomePage({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int currentPage = 0;
  List pages = [
    const AnncounmentListPage(),
    const AssignmentListPage(),
    const ShowStudentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
          text: "Student Home",
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: customDrawer(
        context: context,
        name: widget.name,
        email: widget.email,
        isTeacher: false,
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
            label: "Announcements",
            icon: Icon(Icons.chat_outlined),
          ),
          BottomNavigationBarItem(
            label: "Assignments",
            icon: Icon(Icons.assignment_outlined),
          ),
          BottomNavigationBarItem(
            label: "Classmates",
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
