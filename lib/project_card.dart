

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xff2D2E32),
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 300, // Adjusted height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 160, // Adjusted height for the image
              width: 310,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(project.projectImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                project.projectName,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(50,25))
              ),
              onPressed: () {
                // Open GitHub link
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('GitHub'),
                  SizedBox(width: 10),
                  Icon(FontAwesomeIcons.github)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}