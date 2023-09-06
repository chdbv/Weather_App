import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/internal/helpers/text_helper.dart';
import 'package:weather_app/internal/helpers/theme_helper.dart';
import 'package:weather_app/features/weather/presentation/logic/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/weather_info_screen.dart';
import 'package:weather_app/internal/helpers/commons/weather_logo.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_search_widgets/common_button.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_search_widgets/common_textfield.dart';

class WeatherSearchScreen extends StatelessWidget {
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = WeatherBloc(
      weatherUseCase: WeatherUseCase(
        weatherRepository: WeatherRepositoryImpl(),
      ),
    );

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WeatherLogo(),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextHelper.span20,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Добро пожаловать в ',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                          ),
                        ),
                        TextSpan(
                          text: 'WeatherApp',
                          style: TextStyle(
                            color: Color(0xFF8FB2F5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Выберите место, чтобы просмотреть прогноз погоды.',
                    textAlign: TextAlign.center,
                    style: TextHelper.span14,
                  ),
                  const SizedBox(height: 35),
                  Container(
                    height: 56.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ThemeHelper.primaryButton),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonTextField(controller: controller),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: ThemeHelper.primaryWhite,
                          ),
                          onPressed: () {
                            controller.clear();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocListener<WeatherBloc, WeatherState>(
                    bloc: weatherBloc,
                    listener: (context, state) {
                      if (state is WeatherInfoLoadingState) {
                        SmartDialog.showLoading(msg: 'Загрузка...');
                      }

                      if (state is WeatherInfoErrorState) {
                        SmartDialog.dismiss();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.error.message.toString(),
                            ),
                          ),
                        );
                      }

                      if (state is WeatherInfoLoadedState) {
                        SmartDialog.dismiss();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherInfoScreen(
                              weatherModel: state.weatherModel,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 56.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: CommonButton(
                        weatherBloc: weatherBloc,
                        controller: controller,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
