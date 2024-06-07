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
      child: Container(
        height: 700,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Expertise",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: themecolor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: themecolor),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Card(
                      elevation: 4,
                      color: Color(0xff25262A),
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
                                style: TextStyle(fontSize: 16, color: Colors.white54),
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
                            ]),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SkillProgress(
                        skill: 'Adobe Photoshop',
                        percentage: 85,
                        color: Colors.blue),
                    // SkillProgress(
                    //     skill: 'Adobe Illustrator',
                    //     percentage: 75,
                    //     color: Colors.orange),
                    // SkillProgress(
                    //     skill: 'Adobe XD', percentage: 65, color: Colors.purple),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircularSkill(
                            skill: 'Figma',
                            percentage: 80,
                            color: Colors.purple),
                        CircularSkill(
                            skill: 'Backend',
                            percentage: 56,
                            color: Colors.green),
                        CircularSkill(
                            skill: 'HTML/JavaScript',
                            percentage: 60,
                            color: Colors.orange),
                        CircularSkill(
                            skill: 'WordPress', percentage: 70, color: Colors.blue),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class SkillProgress extends StatelessWidget {
  final String skill;
  final int percentage;
  final Color color;

  SkillProgress({required this.skill, required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 300,
        child: Row(
          children: <Widget>[
            Text(
              skill,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            Container(
              width: 100,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return LinearProgressIndicator(
                    value: percentage / 100,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 30,
              child: Text(
                '$percentage',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularSkill extends StatelessWidget {
  final String skill;
  final int percentage;
  final Color color;

  CircularSkill(
      {required this.skill, required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 8,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Text(
              '$percentage',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: 80,
          child: Text(
            skill,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}