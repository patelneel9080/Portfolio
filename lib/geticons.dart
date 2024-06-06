import 'package:flutter/material.dart';

Icon getTechIcon(String tech, {Color? color}) {
  switch (tech) {
    case 'Flutter':
      return Icon(Icons.flutter_dash, color: color ?? Color(0xff25262A));
    case 'Dart':
      return Icon(Icons.code, color: color ?? Color(0xff25262A));
    case 'HTML 5':
      return Icon(Icons.language, color: color ?? Color(0xff25262A));
    case 'CSS 3':
      return Icon(Icons.style, color: color ?? Color(0xff25262A));
    case 'Javascript':
      return Icon(Icons.javascript, color: color ?? Color(0xff25262A));
    case 'Node.js':
      return Icon(Icons.nature, color: color ?? Color(0xff25262A));
    case 'REST APIs':
      return Icon(Icons.api, color: color ?? Color(0xff25262A));
    case 'Firebase':
      return Icon(Icons.cloud, color: color ?? Color(0xff25262A));
    case 'My SQL':
      return Icon(Icons.storage, color: color ?? Color(0xff25262A));
    case 'GitHub':
      return Icon(Icons.code, color: color ?? Color(0xff25262A));
    case 'GitLab':
      return Icon(Icons.code, color: color ?? Color(0xff25262A));
    case 'Figma':
      return Icon(Icons.design_services, color: color ?? Color(0xff25262A));
    case 'Adobe XD':
      return Icon(Icons.design_services, color: color ?? Color(0xff25262A));
    default:
      return Icon(Icons.device_unknown);
  }
}
