import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../secrets.dart';

class WeatherDataProvider {

  Future<String> getCurrentWeather(String cityName) async {
    try {
      final result = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );
      /*//print(result.body);
      final data = jsonDecode(result.body);
      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }*/
      return result.body;
      //temp = (data['list'][0]['main']['temp']);
    } catch (e) {
      throw e.toString();
    }
  }


}