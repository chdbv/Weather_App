import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/internal/helpers/text_helper.dart';
import 'package:weather_app/internal/helpers/theme_helper.dart';
import 'package:weather_app/internal/helpers/utils.dart';

class CommonInfoScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const CommonInfoScreen({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 115),
          Text(
            weatherModel.name ?? '',
            style: TextHelper.style30,
          ),
          Text(
            dateConverter(weatherModel.sys?.sunset ?? 0),
            style: TextHelper.style17,
          ),
          const SizedBox(height: 60),
          Text(
            tempConverter(weatherModel.main?.temp ?? 0),
            style: TextHelper.style70,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/icons1.png',
                width: 25,
                color: ThemeHelper.primaryWhite,
              ),
              Text(
                'min: ${tempConverter(weatherModel.main?.tempMax ?? 0)} / max:  ${tempConverter(weatherModel.main?.tempMin ?? 0)}',
                style: TextHelper.style17,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
