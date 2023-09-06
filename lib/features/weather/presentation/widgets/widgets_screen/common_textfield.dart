import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/helpers/theme_helper.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Введите город',
        hintText: 'Например, Москва',
        labelStyle: TextStyle(color: ThemeHelper.primaryWhite),
        hintStyle: TextStyle(color: ThemeHelper.primaryWhite),
        border: InputBorder.none,
        prefixIcon: PopupMenuButton<String>(
          icon: Icon(
            Icons.location_on,
            color: ThemeHelper.primaryWhite,
          ),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Бишкек',
                child: Text('Бишкек'),
              ),
              const PopupMenuItem<String>(
                value: 'Москва',
                child: Text('Москва'),
              ),
            ];
          },
          onSelected: (String value) {
            controller.text = value;
          },
        ),
      ),
      style: TextStyle(
        fontSize: 16.0,
        color: ThemeHelper.primaryWhite,
      ),
    );
  }
}
