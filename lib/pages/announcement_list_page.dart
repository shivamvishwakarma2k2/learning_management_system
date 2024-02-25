import 'package:flutter/material.dart';
import 'package:learning_management_system/data/classroom.dart';
import 'package:learning_management_system/widget/custom_widgets.dart';

class AnncounmentListPage extends StatelessWidget {
  const AnncounmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: anncounments.length,
          itemBuilder: (context, index) {
            var title = anncounments[index]['title'].toString();
            var subject = anncounments[index]['subject'].toString();
            var message = anncounments[index]['message'].toString();
            var by = anncounments[index]['by'].toString();
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.read_more),
                        const SizedBox(
                          width: 8,
                        ),
                        customText(
                            text: title, fontWeight: FontWeight.bold, size: 18),
                        const Spacer(),
                        customText(text: subject, size: 14),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 4,
                    ),
                    customText(
                      text: message,
                      size: 14,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customText(text: " - $by", size: 13),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
