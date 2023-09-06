part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class GetWeatherInfoEvent extends WeatherEvent {
  final String value;

  GetWeatherInfoEvent({required this.value});
}
