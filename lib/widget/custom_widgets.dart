import 'package:flutter/material.dart';
import 'package:learning_management_system/pages/announcement_list_page.dart';
import 'package:learning_management_system/pages/assignment_list_page.dart';
import 'package:learning_management_system/pages/login_page.dart';
import 'package:learning_management_system/pages/show_students_page.dart';

customText({
  required String text,
  double? size,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size ?? 18,
      fontWeight: fontWeight ?? FontWeight.normal,
    ),
  );
}

customTextFeild({
  required String text,
  required TextEditingController controller,
  IconData? prefixIcon,
  IconData? suffixIcon,
  bool obscureText = false,
  int minLines = 1,
  int maxLines = 1,
}) {
  return TextField(
    minLines: minLines,
    maxLines: maxLines,
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      label: Text(text),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
    ),
  );
}

customElevatedButton({
  required BuildContext context,
  required String text,
  required VoidCallback callbackFunction,
}) {
  return ElevatedButton(
    style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(
          Size(240, 60),
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)),
    onPressed: callbackFunction,
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

customSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(message),
      ),
    ),
  );
}

customAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    title: customText(
      text: title,
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  );
}

customDrawer({
  required BuildContext context,
  required String name,
  required String email,
  required bool isTeacher,
}) {
  return Drawer(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.account_circle,
                    size: 48,
                  ),
                ),
              ),
              customText(
                text: name,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 6,
              ),
              customText(
                text: email,
              ),
              const SizedBox(
                height: 14,
              ),
              const Divider(),
              // View Announcement option
              isTeacher
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnncounmentListPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.chat_outlined),
                          const SizedBox(
                            width: 8,
                          ),
                          customText(
                            text: "View Announcement",
                          )
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              // View Assignments option
              isTeacher
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AssignmentListPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.assignment_outlined),
                          const SizedBox(
                            width: 8,
                          ),
                          customText(
                            text: "View Assignments",
                          )
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              // View Students option
              isTeacher
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShowStudentPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.people_alt_sharp),
                          const SizedBox(
                            width: 8,
                          ),
                          customText(
                            text: "View Students",
                          )
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              // Logout option
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.logout),
                    const SizedBox(
                      width: 8,
                    ),
                    customText(
                      text: "Log out",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
