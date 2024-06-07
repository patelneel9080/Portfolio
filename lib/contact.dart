import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/const.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactPage extends StatelessWidget {
  final Key? key;

  ContactPage({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      padding: const EdgeInsets.all(32.0),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get in touch',
              style: TextStyle(
                color: themecolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Let's build something together :)",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 320,
                  width: 300,
                  child: DateCard(),
                ),
                SizedBox(width: 32),
                Container(
                  width: 500,
                  child: ContactInfo(),
                ),
              ],
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class DateCard extends StatefulWidget {
  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  bool _isHovered = false;
  bool _isButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String month = _getMonth(now.month);
    String day = _getDayOfWeek(now.weekday);
    int date = now.day;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        elevation: _isHovered ? 10 : 6,
        shadowColor: _isHovered ? themecolor : Color(0xff2D2E32),
        color: Color(0xff2D2E32),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 60,
                width: 300,
                child: Card(
                  color: themecolor,
                  child: Center(
                    child: Text(
                      month,
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                date.toString(),
                style: TextStyle(color: Colors.white, fontSize: 48),
              ),
              SizedBox(height: 8),
              Text(
                day,
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
              Spacer(),
              MouseRegion(
                onEnter: (_) => setState(() => _isButtonHovered = true),
                onExit: (_) => setState(() => _isButtonHovered = false),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _launchURL('https://calendly.com/patelneel9080/30min');
                  },
                  icon: Icon(Icons.video_call,color: Colors.black,),
                  label: Text("Let's have a 30 min call",style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 60),
                    backgroundColor: _isButtonHovered ? Colors.white : themecolor,
                    foregroundColor: _isButtonHovered ? themecolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Sunday';
      case 2:
        return 'Monday';
      case 3:
        return 'Tuesday';
      case 4:
        return 'Wednesday';
      case 5:
        return 'Thursday';
      case 6:
        return 'Friday';
      case 7:
        return 'Saturday';
      default:
        return '';
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactCard(
          icon: Icons.email,
          text: 'patelneel9080@gmail.com',
          onTap: () => _launchEmail('patelneel9080@gmail.com'),
        ),
        SizedBox(height: 16),
        ContactCard(
          icon: Icons.phone,
          text: '+91 7201091231',
          onTap: () => _launchPhone('+917201091231'),
        ),
        SizedBox(height: 16),
        Divider(color: Colors.white54,),
        SizedBox(height: 16),
        SocialMediaIcons(),
      ],
    );
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
}

class ContactCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ContactCard({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Card(
          elevation: _isHovered ? 10 : 6,
          shadowColor: _isHovered ? themecolor : Color(0xff2D2E32),
          color: Color(0xff2D2E32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(widget.icon, color:themecolor),
                SizedBox(width: 16),
                Text(
                  widget.text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.arrow_forward, color: themecolor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaIconButton(
          icon:   FontAwesomeIcons.linkedin,
          url: 'https://www.linkedin.com/in/neelwork',
        ),
        SizedBox(width: 16),
        SocialMediaIconButton(
          icon:  FontAwesomeIcons.github,
          url: 'https://github.com/patelneel9080',
        ),
        SizedBox(width: 16),
        SocialMediaIconButton(
          icon:  FontAwesomeIcons.xTwitter,
          url: 'https://x.com/patelneel9080',
        ),
        SizedBox(width: 16),
        SocialMediaIconButton(
          icon:  FontAwesomeIcons.youtube,
          url:  'https://www.youtube.com/channel/UCNNesGhDEIZyfp5KNWLUtvw',
        ),
        SizedBox(width: 16),
        SocialMediaIconButton(
          icon:  FontAwesomeIcons.instagram,
          url:'https://www.instagram.com/code_with_neel',
        ),
      ],
    );
  }
}

class SocialMediaIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialMediaIconButton({
    required this.icon,
    required this.url,
  });

  @override
  State<SocialMediaIconButton> createState() => _SocialMediaIconButtonState();
}

class _SocialMediaIconButtonState extends State<SocialMediaIconButton> {
  bool _isHovered = false;
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
                  backgroundColor: Color(0xff2d2e32),
                  child: IconButton(
                    icon: Icon(widget.icon, color: _isHovered ? Colors.white : themecolor),
                    onPressed: () => _launchURL(widget.url),
                  ),
                ),
              ),
            );
          }
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
}
