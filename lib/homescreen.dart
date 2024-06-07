import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/expertise_section.dart';
import 'package:portfolio/project_card.dart';
import 'package:portfolio/project_model.dart';
import 'package:portfolio/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/statitem.dart';

import 'const.dart';
import 'geticons.dart';
import 'nav_item.dart';


bool _isHovered = false;

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  bool isfloatHover = false;
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final Map<String, bool> _hoverStates = {};

  final List<String> titles = [
    'Flutter Developer',
    'UI Designer',
    'A Friend',
    'Mentor',
    'Student'
  ];

  int _currentTitleIndex = 0;

  void _changeThemeColor(Color newColor) {
    setState(() {
      themecolor = newColor;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showScrollToTopButton = _scrollController.offset > 300;
      });
    });
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        _currentTitleIndex = (_currentTitleIndex + 1) % titles.length;
      });
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 2), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D2E32),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            _buildHeader(),
            SizedBox(height: 50),
            _buildProfileSection(),
            SizedBox(height: 130),
            _buildAboutSection(),
            SizedBox(height: 150),
            _buildTechSection(),
            SizedBox(height: 150),
            _buildProjectsSection(),
            SizedBox(height: 50),
            _buildExpertiseSection(),
            SizedBox(height: 70),
            _buildContactSection(),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Designed & Created by ',
                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                children:  <TextSpan>[
                  TextSpan(text: 'Neel Patel', style: TextStyle(fontWeight: FontWeight.w600,color: themecolor)),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: _showScrollToTopButton
          ?  MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Icon(Icons.arrow_upward,color: Colors.black,),
          backgroundColor: isfloatHover ? Colors.white : themecolor, // Change color based on hover state
        ),
      )
          : null,
    );
  }

  Widget _buildHeader() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Portfolio',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 28,
                color: themecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              _buildNavItem('About', _aboutKey),
              SizedBox(
                width: size.width / 24,
              ),
              _buildNavItem('Tech', _techKey),
              SizedBox(
                width: size.width / 24,
              ),
              _buildNavItem('Projects', _projectsKey),
              SizedBox(
                width: size.width / 24,
              ),
              _buildNavItem('Expertise', _expertiseKey),
              SizedBox(
                width: size.width / 24,
              ),
              _buildNavItem('Contact', _contactKey),
              SizedBox(
                width: size.width / 24,
              ),
              PopupMenuButton<int>(
                icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xff25262A),
                  child: Icon(
                    CupertinoIcons.snow,
                    color: themecolor,
                  ),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<int>(
                      value: 1,
                      child: Column(
                        children: [
                          _buildColorRow([
                            Color(0xffBEFFF7),
                            Color(0xff62F3A5),
                            Colors.blue
                          ]),
                          SizedBox(height: 10),
                          _buildColorRow([
                            Color(0xff00CDAC),
                            Colors.orangeAccent,
                            Colors.cyanAccent
                          ]),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (int value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorRow(List<Color> colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {
            _changeThemeColor(color);
            Navigator.of(context).pop(); // Close the popup menu
          },
          child: CircleAvatar(
            backgroundColor: color,
            radius: 20,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNavItem(String title, GlobalKey key) {
    return NavItem(title: title, onTap: () => _scrollToSection(key));
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Spacer(),
          SizedBox(width: 150),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Neel Patel',
                style: TextStyle(
                    fontSize: 52,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: themecolor,
                  ),
                  SizedBox(
                    width: 250.0,
                    child: AnimatedTextKit(
                      animatedTexts: titles
                          .map((title) => TypewriterAnimatedText(
                                title,
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: themecolor,
                                ),
                                speed: Duration(milliseconds: 100),
                              ))
                          .toList(),
                      repeatForever: true,
                      pause: Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSocialIcon(
                    FontAwesomeIcons.linkedin,
                    'https://www.linkedin.com/in/neelwork',
                  ),
                  _buildSocialIcon(
                    FontAwesomeIcons.github,
                    'https://github.com/patelneel9080',
                  ),
                  _buildSocialIcon(
                    FontAwesomeIcons.xTwitter,
                    'https://x.com/patelneel9080',
                  ),
                  _buildSocialIcon(
                    FontAwesomeIcons.youtube,
                    'https://www.youtube.com/channel/UCNNesGhDEIZyfp5KNWLUtvw',
                  ),
                  _buildSocialIcon(
                    FontAwesomeIcons.instagram,
                    'https://www.instagram.com/code_with_neel',
                  ),
                ],
              ),
              SizedBox(height: 50),
              _buildStats(),
            ],
          ),
          SizedBox(width: 100),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 600,
              width: 600,
              child: Image.asset(
                'assets/Images/1 (1).png', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return SocialIcon(
      icon: icon,
      url: url,
    );
  }

  Widget _buildStats() {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _scrollToContact(); // Scroll to the Contact section when tapped
          },
          child: Text(
            "Let's Chat!",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: themecolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themecolor,
            ),
          ),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatItem(initialValue: '20', label: 'Projects Completed'),
            SizedBox(
              width: size.width / 44,
            ),
            StatItem(initialValue: '600', label: 'Content Followers'),
            SizedBox(
              width: size.width / 44,
            ),
            StatItem(
                initialValue: '12607', label: 'Content Impression & Views'),
          ],
        )
      ],
    );
  }
  void _scrollToContact() {
    Scrollable.ensureVisible(_contactKey.currentContext!,
        duration: Duration(seconds: 2), curve: Curves.easeInOut);
  }


  Widget _buildAboutSection() {
    return Padding(
      padding: EdgeInsets.all(8),
      key: _aboutKey,
      child: Container(
        color: Color(0xff25262A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About me",
                        style: TextStyle(
                            fontSize: 32,decoration: TextDecoration.underline,
                            decorationColor: themecolor,
                            fontWeight: FontWeight.bold,
                            color: themecolor),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Hello there! My name is Neel",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: themecolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\"Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.\"",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'A self-taught developer who has worked on many personal projects across various niches such as safety apps, to-do management apps, e-commerce, coffee buying apps, music apps, and event management apps, as well as lifestyle and storytelling apps. I enjoy learning new technologies and continuously explore new fields. My interests have led me to experiment with software development, AI, machine learning, and beyond.I have open-sourced numerous projects on my GitHub.\n',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                        maxLines: 8,
                        textWidthBasis: TextWidthBasis.parent,
                      ),
                      SizedBox(height: 20),
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovered = true),
                        onExit: (_) => setState(() => _isHovered = false),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: _isHovered ? themecolor : Colors.transparent,
                                blurRadius: 12,
                                spreadRadius: -3,
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _launchURL('https://drive.google.com/file/d/1NdsIKxAaF5RngtRYDjnmD4n4xBd6kjj8/view?usp=drive_link');
                            },
                            icon: Icon(Icons.download, color: Colors.black), // Change color based on hover state
                            label: Text('Download Resume', style: TextStyle(color: Colors.black)), // Change color based on hover state
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 50),
                              foregroundColor: _isHovered ? Colors.white : Colors.black, // Change text color based on hover state
                              backgroundColor: _isHovered  ? Colors.white : themecolor, // Change button color based on hover state
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(width: 150),
                Container(
                  height: 450,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                          image: AssetImage("assets/Images/about.jpg"),
                          fit: BoxFit.cover)),
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget _buildTechSection() {
    return Padding(
      padding: EdgeInsets.all(24),
      key: _techKey,
      child: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Spacer(),
              SizedBox(width: 150),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TechStack",
                      style: TextStyle(decoration: TextDecoration.underline,
                          decorationColor: themecolor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: themecolor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Change is inevitable, so I keep on exploring new technology, learn it in a minimal possible way and then build something out of it to see how well I did :)',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    _buildTechCategory(
                        'Mobile development', ['Flutter', 'Dart']),
                    _buildTechCategory(
                        'Web development', ['HTML', 'CSS', 'Javascript']),
                    _buildTechCategory('Server side', [
                      'Node.js',
                      'REST APIs',
                    ]),
                    _buildTechCategory('Databases', ['Firebase', 'My SQL']),
                    _buildTechCategory('Version controlling & management',
                        ['GitHub', 'GitLab']),
                    _buildTechCategory('UI/UX Design', ['Figma', 'Adobe XD']),
                  ],
                ),
              ),
              SizedBox(width: 150),
              Container(
                height: 450,
                width: 450,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Images/techstack.png"))),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechCategory(String title, List<String> technologies) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white54,
            ),
          ),
          SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: technologies.map((tech) {
              bool isHovered = _hoverStates[tech] ?? false;
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) {
                  setState(() {
                    _hoverStates[tech] = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hoverStates[tech] = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isHovered ? Colors.white : themecolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: isHovered ? themecolor : Colors.transparent,
                        blurRadius: 8,
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      getTechIcon(tech,color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        tech,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }


  Widget _buildProjectsSection() {
    return Container(
      color: Color(0xff25262A),
      key: _projectsKey,
      padding: const EdgeInsets.symmetric(horizontal: 250),
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text(
            "Projects",
            style: TextStyle(
              decoration: TextDecoration.underline,
                decorationColor: themecolor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: themecolor),
          ),
          SizedBox(height: 20,),
          Container(
            height: 700,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                childAspectRatio: 2.2 / 2,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                if (index >= projects.length - 2) {
                  return Center(
                    child: ProjectCard(project: project),
                  );
                }
                return ProjectCard(project: project);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildExpertiseSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 220),
      alignment: Alignment.center,
      child: ExpertiseSection(key: _expertiseKey),
    );
  }


  Widget _buildContactSection() {
    return Container(
      color:  Color(0xff25262A),
        padding: EdgeInsets.symmetric(horizontal: 220),
        alignment: Alignment.center,
        child: ContactPage(key: _contactKey));
  }



  Widget _buildSection(
      {required GlobalKey key,
      required String title,
      required String content}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: themecolor),
          ),
          SizedBox(height: 20),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

