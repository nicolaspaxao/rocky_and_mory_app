import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class StandardLoading extends StatelessWidget {
  const StandardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.blueAccent),
    ).paddingAll(8);
  }
}
