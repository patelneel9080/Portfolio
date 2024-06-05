import 'package:flutter/material.dart';


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

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
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
            SizedBox(height: 300  ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '<Hamza/>',
            style: TextStyle(
                fontSize: 24, color: Colors.white54, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _buildNavItem('About', _aboutKey),
              _buildNavItem('Tech', _techKey),
              _buildNavItem('Projects', _projectsKey),
              _buildNavItem('Experience', _experienceKey),
              _buildNavItem('Community', _communityKey),
              SizedBox(width: 20),
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
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
              'https://example.com/path-to-image.jpg'), // Replace with your image URL
        ),
        SizedBox(height: 20),
        Text(
          'Full Stack Flutter Expert',
          style: TextStyle(
            fontSize: 16,
            color: Colors.greenAccent,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Muhammad',
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.w300, color: Colors.white54),
        ),
        Text(
          'Hamza',
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
        SizedBox(height: 10),
        Icon(Icons.play_arrow, color: Colors.greenAccent),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(Icons.link),
            _buildSocialIcon(Icons.gite),
            _buildSocialIcon(Icons.article),
            _buildSocialIcon(Icons.facebook),
            _buildSocialIcon(Icons.install_desktop),
            _buildSocialIcon(Icons.transfer_within_a_station),
          ],
        ),
        SizedBox(height: 50),
        _buildStats(),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return SocialIcon(icon: icon);
  }

  Widget _buildStats() {
    return Column(
      children: [
        Text(
          "LET'S CHAT!",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem('4', 'Years Experience'),
            _buildStatItem('35+', 'Projects Completed\nin 10+ Countries'),
            _buildStatItem('110k', 'Content Reach & Views'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String description) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
        SizedBox(height: 5),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white54),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return _buildSection(
      key: _aboutKey,
      title: 'About Me',
      content: 'This is the about section. Here you can describe yourself and your background.',
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

  Widget _buildSection({required GlobalKey key, required String title, required String content}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.greenAccent),
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
              color: _isHovered ? Colors.greenAccent : Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatefulWidget {
  final IconData icon;

  SocialIcon({required this.icon});

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          widget.icon,
          size: 30,
          color: _isHovered ? Colors.greenAccent : Colors.white54,
        ),
      ),
    );
  }
}
