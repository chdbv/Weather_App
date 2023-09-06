import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  const CommonImage({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      left: 20,
      right: 20,
      bottom: MediaQuery.of(context).size.height / 1.8,
      child: Image.asset(
        'assets/images/weathe.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
