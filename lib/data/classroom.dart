import 'package:learning_management_system/data/users_data.dart';

List<Map<String, String>> anncounments = [
  {
    "title": "Welcome to TYIT Classroom",
    "subject": "",
    "message":
        "All Students Wishing a new Stsrted and have outr best year ahead",
    "by": teachers[0]["name"].toString(),
  },
];

List<Map<String, dynamic>> assignments = [
  {
    "title": "Case Study",
    "subject": "HCI",
    "message":
        "This is an random Message taken for just sample work of the assignment. Dont mind it please. it very good to see you out here. Just helps others. Thank You",
    "duedate": "2024-02-23",
    "by": teachers[0]["name"].toString(),
    "submitted": []
  },
];
