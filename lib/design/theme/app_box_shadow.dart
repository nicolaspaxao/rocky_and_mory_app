import 'package:flutter/material.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class AppBoxShadow {
  static get empty => <BoxShadow>[];
  static get headerBoxShadow => [
        BoxShadow(
          color: AppColors.darkBlue1.withOpacity(0.1),
          offset: const Offset(0, 16),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ];
}
