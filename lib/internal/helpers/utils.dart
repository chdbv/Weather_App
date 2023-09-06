import 'package:intl/intl.dart';

String tempConverter(double value) {
  return '${(value - 273.15).round()}°c';
}

String dateConverter(int date) {
  var convertedDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);

  return DateFormat('dd.MM.yyyy  hh:mm:ss').format(convertedDate);
}

String imageHelper(String description) {
  switch (description) {
    case 'clear sky':
      return 'assets/images/clear.png';

    case 'few clouds':
      return 'assets/images/clouds.png';

    default:
      return 'assets/images/bg_image.jpeg';
  }
}
