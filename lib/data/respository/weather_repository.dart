import 'dart:convert';

import 'package:weather_app_final/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_final/models/weather_model.dart';

class WeatherRepository {
    final WeatherDataProvider weatherDataProvider;

    WeatherRepository(this.weatherDataProvider);
    Future<WeatherModel> getCurrentWeather() async {
        try {
            String cityName = 'London';
            final weatherData = await weatherDataProvider.getCurrentWeather(cityName);
            //print(result.body);
            final data = jsonDecode(weatherData);
            if (data['cod'] != '200') {
                throw 'An unexpected error occurred';
            }
            return WeatherModel.fromJson(weatherData);
            //temp = (data['list'][0]['main']['temp']);
        } catch (e) {
            throw e.toString();
        }
    }


}