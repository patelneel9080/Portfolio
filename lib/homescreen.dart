import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/statitem.dart';

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
            SizedBox(height: 50),
            _buildHeader(),
            SizedBox(height: 50),
            _buildProfileSection(),
            SizedBox(height: 300),
            _buildAboutSection(),
            SizedBox(height: 300),
            _buildTechSection(),
            SizedBox(height: 300),
            _buildProjectsSection(),
            SizedBox(height: 300),
            _buildExperienceSection(),
            SizedBox(height: 300),
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
            '< Neel Patel/>',
            style: TextStyle(
                fontSize: 24,
                color: Colors.white54,
                fontWeight: FontWeight.bold),
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
              Icon(Icons.gite, size: 30, color: Colors.white54),
            ],
          ),
        ],
      ),
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
              SizedBox(height: 40),
              Text(
                'Neel Patel',
                style: TextStyle(
                    fontSize: 52,letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.play_arrow, color: Color(0xff00CDAC)),
                  SizedBox(
                    width: 250.0,
                    child: AnimatedTextKit(
                      animatedTexts: titles
                          .map((title) => TypewriterAnimatedText(
                        title,
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff00CDAC),
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
              SizedBox(height: 80),
              _buildStats(),
            ],
          ),
          SizedBox(width: 100),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height:
              600,
              width: 600  ,
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
          "LET'S CHAT!",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff00CDAC)),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatItem(initialValue: '4', label: 'Years Experience'),
            SizedBox(width: size.width/44,),
            StatItem(initialValue: '20', label: 'Projects Completed'),
            SizedBox(width: size.width/44,),
            StatItem(initialValue: '12262', label: 'Content Impression & Views'),
          ],
        )

      ],
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: EdgeInsets.all(8),
      key: _aboutKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About me",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00CDAC)),
                    ),
                    Text(
                      "Hello there! My name is Neel",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00CDAC),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\"If you are not going to tell the world who you are, the world is not going to tell you, how good you are.\"",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'A Self-taught developer who has developed solutions, MVPs, products, and systems for more than 4 years. I have worked in various niches such as Safety apps, Travel apps like Airlines, Buses, and Hotels booking. In addition to E-Commerce, lifestyle, and storytelling apps. I enjoy learning new tech so I\'m always exploring new stuff. That\'s the reason I\'ve worked with almost every field out there starting with 3D model designing, game, web, and mobile development, along with Machine learning and so on. I\'ve open-sourced numerous projects on my GitHub and I\'ve been writing articles on medium for the last 3 years now. In addition, I\'ve been Google DSC lead and Microsoft Student Ambassador. Currently, I\'m leading the official community Flutter Islamabad, Pakistan. Apart from tech, I love doing UI/UX design, playing video games, and editing videos.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        _launchURL('https://drive.google.com/file/d/1NdsIKxAaF5RngtRYDjnmD4n4xBd6kjj8/view?usp=drive_link'); // Replace the URL with the actual URL of your resume PDF
                      },
                      icon: Icon(Icons.download),
                      label: Text('Download Resume'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color(0xff00CDAC),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Row(
                    children: [
                      _buildImage('assets/Images/img1.jpg'), // Replace with your image paths
                      SizedBox(width: 10),
                      _buildImage('assets/Images/img2.jpg'), // Replace with your image paths
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _buildImage('assets/Images/img3.jpg'), // Replace with your image paths
                      SizedBox(width: 10),
                      _buildImage('assets/Images/img4.jpg'), // Replace with your image paths
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
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
    return _buildSection(
      key: _techKey,
      title: 'Tech Stack',
      content: 'This section lists the technologies you are proficient in.',
    );
  }

  Widget _buildProjectsSection() {
    return _buildSection(
      key: _projectsKey,
      title: 'Projects',
      content: 'Showcase your projects here.',
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
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xff00CDAC)),
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
              color: _isHovered ? Color(0xff00CDAC) : Colors.white54,
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
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: _isHovered
                ? [
              BoxShadow(
                  color: Color(0xff93F9B97),
                  blurRadius: 8,
                  spreadRadius: .5)
            ]
                : [],
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xff25262A),
            // Keeping a constant background color
            child: Icon(
              widget.icon,
              size: 20,
              color: _isHovered ? Colors.white : Color(0xff00CDAC),
            ),
          ),
        ),
      ),
    );
  }
}
