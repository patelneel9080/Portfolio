import 'package:flutter/material.dart';

import 'const.dart';

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
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                color: _isHovered ? themecolor : Colors.white54,
              ),
            ),
            SizedBox(height: 5),
            Visibility(
              visible: _isHovered,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                height: 2,
                width: 20,
                color: themecolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
