import 'package:flutter/material.dart';
import 'package:portfolio/const.dart';

class ExpertiseSection extends StatelessWidget {
  // Add a required key
  final Key key;

  // Constructor with required key
  const ExpertiseSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Expertise",
            style: TextStyle(decoration: TextDecoration.underline,
                decorationColor: themecolor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: themecolor),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            elevation: 4,color: Color(0xff25262A),
            child: Container(
              height: 300,
              padding: EdgeInsets.all(24),
              width: 550,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Skills & Tools',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themecolor,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Every Day is a New Challenge',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A skilled mobile app developer with expertise in design (Figma) and development (Flutter). Strong programming foundation in C/C++ for performance needs. Manages backends with Firebase and Node.js. Comfortable in development environments like Android Studio and VS Code.',
                    style: TextStyle(fontSize: 16,color: Colors.white54),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: themecolor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Hire Me',
                      style: TextStyle(color: themecolor),
                    ),
                  ),

                ]
              ),
            ),
          ),
        ],
      ),
    );
  }



}
