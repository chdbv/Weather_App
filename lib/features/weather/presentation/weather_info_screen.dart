import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/presentation/helpers/theme_helper.dart';

import 'package:weather_app/features/weather/presentation/widgets/weather_logo.dart';
import 'package:weather_app/features/weather/presentation/widgets/widgets_info/common_container.dart';
import 'package:weather_app/features/weather/presentation/widgets/widgets_info/common_info_screen.dart';

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
  // Future<void> _refreshWeather() async {

  //   await Future.delayed(Duration(seconds: 2));

  //   setState(() {

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          buildBackgroundImages(),
          buildBackgroundImage2(context),
          buildCenteredTopImage(),
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

  Widget buildBackgroundImages() {
    return Image.asset(
      'assets/images/Background.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget buildBackgroundImage2(BuildContext context) {
    return Positioned(
      top: 90,
      left: 20,
      right: 20,
      bottom: MediaQuery.of(context).size.height / 1.8,
      child: Image.asset(
        'assets/images/Weathe.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCenteredTopImage() {
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
            return Icon(Icons.error, size: 40, color: ThemeHelper.primaryBlack);
          },
        ),
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
