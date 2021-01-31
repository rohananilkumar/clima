import '../services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future getLocationWeather() async {
    Location l = Location();
    await l.getCurrentLocation();
    String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=${l.Latitude}&lon=${l.Longitude}&appid=af09684701127fbe13fb14c30485851b&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    return networkHelper.getData();
  }

  Future getCityWeather(String cityName) async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=af09684701127fbe13fb14c30485851b&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    return networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
