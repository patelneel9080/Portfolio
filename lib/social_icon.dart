import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'const.dart';

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