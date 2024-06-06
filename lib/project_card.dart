import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/const.dart';
import 'package:portfolio/project_model.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isCardHovered = false;
  bool _isButtonHovered = false;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _isCardHovered ? 8 : 4,
      color: Color(0xff2D2E32),
      shadowColor: _isCardHovered ? themecolor : Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isCardHovered = true),
        onExit: (_) => setState(() => _isCardHovered = false),
        child: Container(
          height: 300, // Adjusted height
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 160, // Adjusted height for the image
                width: double.infinity, // Make image container fill the width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(widget.project.projectImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                child: Text(
                  widget.project.projectName,
                  style: TextStyle(
                    color: _isCardHovered ? Colors.white : Colors.white54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  widget.project.projectDescription,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
             Spacer(),
             // Add Spacer to push button to the bottom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isButtonHovered = true),
                  onExit: (_) => setState(() => _isButtonHovered = false),
                  child: Center( // Center the button horizontally
                    child: Container(
                      width: 150, // Set fixed width for the button
                      child:ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(_isButtonHovered ? Colors.white : themecolor),
                          foregroundColor: MaterialStateProperty.all(_isButtonHovered ? themecolor : Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _launchURL(widget.project.githubLink);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                'GitHub',
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              FontAwesomeIcons.github,
                              size: 16, // Adjust icon size if necessary
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 12), // Add some spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

