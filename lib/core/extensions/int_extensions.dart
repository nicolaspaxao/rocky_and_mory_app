import 'package:flutter/material.dart';

extension IntExtension on int {
  Widget get heightSpace => SizedBox(height: double.parse(toString()));
  Widget get widthSpace => SizedBox(width: double.parse(toString()));
}
