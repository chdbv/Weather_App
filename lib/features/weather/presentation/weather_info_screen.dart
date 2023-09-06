import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_info_widgets/common_top_image.dart';
import 'package:weather_app/internal/helpers/commons/common_background.dart';
import 'package:weather_app/internal/helpers/commons/common_image.dart';

import 'package:weather_app/internal/helpers/commons/weather_logo.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_info_widgets/common_container.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_info_widgets/common_info_screen.dart';

class WeatherInfoScreen extends StatefulWidget {
  final WeatherModel weatherModel;

  const WeatherInfoScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          const CommonBackground(),
          CommonImage(context: context),
          BuildTopImage(widget: widget),
          CommonInfoScreen(weatherModel: widget.weatherModel),
          buildInfoContainer(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.only(right: 60),
        child: WeatherLogo(),
      ),
    );
  }

  Widget buildInfoContainer() {
    return Positioned(
      bottom: 60,
      left: 20,
      right: 20,
      child: CommonContainer(weatherModel: widget.weatherModel),
    );
  }
}
