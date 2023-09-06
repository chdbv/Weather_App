import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/weather_info_screen.dart';
import 'package:weather_app/internal/helpers/theme_helper.dart';

class BuildTopImage extends StatelessWidget {
  const BuildTopImage({
    super.key,
    required this.widget,
  });

  final WeatherInfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110,
      left: 150,
      right: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: CachedNetworkImage(
          imageUrl:
              'https://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon}@4x.png',
          progressIndicatorBuilder: (context, url, progress) {
            return const CircularProgressIndicator();
          },
          errorWidget: (context, url, error) {
            return Icon(
              Icons.error,
              size: 40,
              color: ThemeHelper.primaryBlack,
            );
          },
        ),
      ),
    );
  }
}
