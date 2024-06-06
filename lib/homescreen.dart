import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/statitem.dart';

import 'const.dart';

Color themeColor = Color(0xffBEFFF7); // Default theme color
final List<Color> themeColors = [
  Color(0xffBEFFF7),
  Color(0xffFF6F61),
  Color(0xff6B5B95)
];
bool _isHovered = false;

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _communityKey = GlobalKey();

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
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        _currentTitleIndex = (_currentTitleIndex + 1) % titles.length;
      });
    });
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
            SizedBox(height: 150),
            _buildExperienceSection(),
            SizedBox(height: 150),
            _buildCommunitySection(),
            SizedBox(height: 300),
          ],
        ),
      ),
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
              _buildNavItem('Experience', _experienceKey),
              SizedBox(
                width: size.width / 24,
              ),
              _buildNavItem('Community', _communityKey),
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

  Widget _buildColorToggle(String label, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: themeColor == color,
          onChanged: (bool selected) {
            if (selected) {
              _changeThemeColor(color);
            }
          },
          activeColor: color,
        ),
      ],
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
        Text(
          "Let's Chat!",
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: themecolor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: themecolor,
          ),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatItem(initialValue: '4', label: 'Years Experience'),
            SizedBox(
              width: size.width / 44,
            ),
            StatItem(initialValue: '20', label: 'Projects Completed'),
            SizedBox(
              width: size.width / 44,
            ),
            StatItem(
                initialValue: '12262', label: 'Content Impression & Views'),
          ],
        )
      ],
    );
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
                            fontSize: 32,
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
                                    color: _isHovered
                                        ? themecolor
                                        : Colors.transparent,
                                    blurRadius: 12,
                                    spreadRadius: -5)
                              ]),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _launchURL(
                                  'https://drive.google.com/file/d/1NdsIKxAaF5RngtRYDjnmD4n4xBd6kjj8/view?usp=drive_link');
                            },
                            icon: Icon(Icons.download, color: Colors.black),
                            label: Text('Download Resume',
                                style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 50),
                              foregroundColor: Colors.black,
                              backgroundColor: themecolor,
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

  Widget _buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        path,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
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
                      style: TextStyle(
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
                        'Web development', ['HTML 5', 'CSS 3', 'Javascript']),
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
    Color _techHover = Color(0xff25262A);

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
                color: Colors.white54),
          ),
          SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: technologies.map((tech) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) {
                  setState(() {
                    _techHover = themecolor;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _techHover = themecolor;
                  });
                },
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: themecolor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: _isHovered ? themecolor : Colors.transparent,
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _getTechIcon(tech),
                        SizedBox(width: 8),
                        Text(
                          tech,
                          style: TextStyle(color: Color(0xff25262A)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Icon _getTechIcon(String tech) {
    switch (tech) {
      case 'Flutter':
        return Icon(Icons.flutter_dash, color: Color(0xff25262A));
      case 'Dart':
        return Icon(Icons.code, color: Color(0xff25262A));
      case 'HTML 5':
        return Icon(Icons.language, color: Color(0xff25262A));
      case 'CSS 3':
        return Icon(Icons.style, color: Color(0xff25262A));
      case 'Javascript':
        return Icon(Icons.javascript, color: Color(0xff25262A));
      case 'Node.js':
        return Icon(Icons.nature, color: Color(0xff25262A));
      case 'REST APIs':
        return Icon(Icons.api, color: Color(0xff25262A));
      case 'Firebase':
        return Icon(Icons.cloud, color: Color(0xff25262A));
      case 'My SQL':
        return Icon(Icons.storage, color: Color(0xff25262A));
      case 'GitHub':
        return Icon(Icons.code, color: Color(0xff25262A));
      case 'GitLab':
        return Icon(
          Icons.code,
          color: Color(0xff25262A),
        );
      case 'Figma':
        return Icon(Icons.design_services, color: Color(0xff25262A));
      case 'Adobe XD':
        return Icon(Icons.design_services, color: Color(0xff25262A));
      default:
        return Icon(Icons.device_unknown);
    }
  }

  Widget _buildProjectsSection() {
    // return _buildSection(
    //   key: _projectsKey,
    //   title: 'Projects',
    //   content: 'Showcase your projects here.',
    // );
    return Column(
      key: _projectsKey,
      children: [
        Text(
          "Projects",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: themecolor),
        ),
      ],
    );
  }

  Widget _buildExperienceSection() {
    return _buildSection(
      key: _experienceKey,
      title: 'Experience',
      content: 'Detail your work experience in this section.',
    );
  }

  Widget _buildCommunitySection() {
    return _buildSection(
      key: _communityKey,
      title: 'Community Involvement',
      content: 'Talk about your community involvement here.',
    );
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

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  NavItem({required this.title, required this.onTap});

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              color: _isHovered ? themecolor : Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  SocialIcon({required this.icon, required this.url});

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovered = false;

  Future<void> _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: _isHovered ? 1 : 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: GestureDetector(
              onTap: _launchURL,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: _isHovered ? themecolor : Colors.transparent,
                          blurRadius: 5,
                          spreadRadius: -5)
                    ]),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff25262A),
                  child: Icon(
                    widget.icon,
                    size: 20,
                    color: _isHovered ? Colors.white : themecolor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StatItem extends StatefulWidget {
  final String initialValue;
  final String label;

  const StatItem({
    Key? key,
    required this.initialValue,
    required this.label,
  }) : super(key: key);

  @override
  _StatItemState createState() => _StatItemState();
}

class _StatItemState extends State<StatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: double.parse(widget.initialValue),
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Column(
          children: [
            Text(
              '${_animation.value.toInt()}',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: themecolor),
            ),
            Text(widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white54)),
          ],
        );
      },
    );
  }
}
