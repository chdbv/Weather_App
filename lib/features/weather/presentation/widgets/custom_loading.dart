import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String msg;

  const CustomLoadingWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
     
      child: Column(
        children: [
          const CircularProgressIndicator(),
          Text(msg),
        ],
      ),
    );
  }
}
