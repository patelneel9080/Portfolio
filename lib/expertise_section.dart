import 'package:flutter/material.dart';
import 'package:portfolio/const.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpertiseSection extends StatefulWidget {
  // Add a required key
  final Key key;

  // Constructor with required key
  const ExpertiseSection({required this.key}) : super(key: key);

  @override
  State<ExpertiseSection> createState() => _ExpertiseSectionState();
}

class _ExpertiseSectionState extends State<ExpertiseSection> {
  bool isCardHovered = false;
  bool _isButtonHover = false;
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'patelneel9080@gmail.com',
      query: 'subject=Hire Me&body=Hello, I am interested in hiring you.',
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 700,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Expertise",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: themecolor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: themecolor),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => isCardHovered = true),
                      onExit: (_) => setState(() => isCardHovered = false),
                      child: Card(
                        elevation: 8,
                        shadowColor: isCardHovered ? themecolor : Colors.black,
                        color: Color(0xff25262A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                                MouseRegion(
                                  onEnter: (_) => setState(() => _isButtonHover = true),
                                  onExit: (_) => setState(() => _isButtonHover = false),
                                  child: ElevatedButton(
                                    onPressed: _launchEmail,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:  Color(0xff25262A),

                                      side: BorderSide(color: _isButtonHover ? Colors.white : themecolor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Hire Me',
                                      style: TextStyle(color:  _isButtonHover ? Colors.white : themecolor),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     SkillProgress(
                //         skill: 'Figma',
                //         percentage: 90,
                //         color: Colors.blue),
                //     SkillProgress(
                //         skill: 'Adobe Photoshop',
                //         percentage: 85,
                //         color: Colors.blue),
                //     SizedBox(height: 20),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: <Widget>[
                //         CircularSkill(
                //             skill: 'Figma',
                //             percentage: 80,
                //             color: Colors.purple),
                //         CircularSkill(
                //             skill: 'Backend',
                //             percentage: 56,
                //             color: Colors.green),
                //         CircularSkill(
                //             skill: 'HTML/JavaScript',
                //             percentage: 60,
                //             color: Colors.orange),
                //         CircularSkill(
                //             skill: 'WordPress', percentage: 70, color: Colors.blue),
                //       ],
                //     ),
                //   ],
                // )
                Container(
                    height: 420,
                    width: 420,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/expertise.png'))),
                ),
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
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            Expanded(
              child: LinearProgressIndicator(
                value: percentage / 100,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            SizedBox(width: 10),
            Text(
              '$percentage%',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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

  CircularSkill({required this.skill, required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
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
                '$percentage%',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 80,
          child: Text(
            skill,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
