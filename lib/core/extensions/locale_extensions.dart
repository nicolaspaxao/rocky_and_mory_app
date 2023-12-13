import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension LocaleExtension on Locale {
  IconData get iconForLocation {
    IconData icon = FontAwesomeIcons.earthAfrica;

    switch (this) {
      case const Locale('pt_BR'):
        icon = FontAwesomeIcons.earthAmericas;
        break;
      case const Locale('en_US'):
        icon = FontAwesomeIcons.earthAmericas;
        break;
      default:
        icon = FontAwesomeIcons.earthAmericas;
        break;
    }
    return icon;
  }

  String get textForLocation {
    String text = '';

    switch (this) {
      case const Locale('pt_BR'):
        text = 'Português';
        break;
      case const Locale('en_US'):
        text = 'English';
        break;
      default:
        text = 'Português';
        break;
    }
    return text;
  }
}
