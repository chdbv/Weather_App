import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/helpers/text_helper.dart';

class WeatherLogo extends StatelessWidget {
  const WeatherLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/vector.png',
          width: 50,
        ),
        Text(
          'WeatherApp',
          style: TextHelper.style24,
        ),
      ],
    );
  }
}
