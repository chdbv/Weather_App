import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/presentation/helpers/text_helper.dart';
import 'package:weather_app/features/weather/presentation/helpers/theme_helper.dart';
import 'package:weather_app/internal/helpers/utils.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  Widget _buildInfoRow(String iconName, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              iconName,
              width: 35,
              color: ThemeHelper.primaryWhite,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: ThemeHelper.primaryWhite,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(value, style: TextHelper.style20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHelper.primaryContainer,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildInfoRow(
              'assets/icons/Icons1.png',
              'Температура',
              tempConverter(weatherModel.main?.temp ?? 0),
            ),
            Divider(height: 32.0, color: ThemeHelper.primaryDivider),
            _buildInfoRow(
              'assets/icons/Icons2.png',
              'Осадки',
              '${weatherModel.clouds?.all ?? 0}%',
            ),
            Divider(height: 32.0, color: ThemeHelper.primaryDivider),
            _buildInfoRow(
              'assets/icons/Icons3.png',
              'Ветер',
              '${weatherModel.wind?.speed?.toString() ?? ''}к/ч',
            ),
            Divider(height: 32.0, color: ThemeHelper.primaryDivider),
            _buildInfoRow(
              'assets/icons/Icons4.png',
              'Влажность',
              '${weatherModel.main?.humidity?.toString() ?? ''}%',
            ),
            Divider(height: 32.0, color: ThemeHelper.primaryDivider),
            _buildInfoRow(
              'assets/icons/Icons5.png',
              'Тепло',
              tempConverter(weatherModel.main?.tempMax ?? 0),
            ),
          ],
        ),
      ),
    );
  }
}
