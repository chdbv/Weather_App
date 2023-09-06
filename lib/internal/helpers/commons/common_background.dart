import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/background.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
