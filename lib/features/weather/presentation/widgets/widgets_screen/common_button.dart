import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/logic/bloc/weather_bloc.dart';
import 'package:weather_app/internal/helpers/text_helper.dart';
import 'package:weather_app/internal/helpers/theme_helper.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.weatherBloc,
    required this.controller,
  });

  final WeatherBloc weatherBloc;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        weatherBloc.add(GetWeatherInfoEvent(value: controller.text));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeHelper.primaryButton,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text('Поиск', style: TextHelper.button18),
      ),
    );
  }
}
