import 'dart:convert';

class WeatherModel {
    final double currentTemp;
    final String currentSky;
    final double currentPressure;
    final double currentWindSpeed;
    final double currentHumidity;
    final List<dynamic> forecastList; // Added full forecast

    WeatherModel({
        required this.currentTemp,
        required this.currentSky,
        required this.currentPressure,
        required this.currentWindSpeed,
        required this.currentHumidity,
        required this.forecastList,
    });

    WeatherModel copyWith({
        double? currentTemp,
        String? currentSky,
        double? currentPressure,
        double? currentWindSpeed,
        double? currentHumidity,
        List<dynamic>? forecastList,
    }) {
        return WeatherModel(
            currentTemp: currentTemp ?? this.currentTemp,
            currentSky: currentSky ?? this.currentSky,
            currentPressure: currentPressure ?? this.currentPressure,
            currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
            currentHumidity: currentHumidity ?? this.currentHumidity,
            forecastList: forecastList ?? this.forecastList,
        );
    }

    factory WeatherModel.fromMap(Map<String, dynamic> map) {
        final currentWeatherData = map['list'][0];

        return WeatherModel(
            currentTemp: currentWeatherData['main']['temp']?.toDouble(),
            currentSky: currentWeatherData['weather'][0]['main'],
            currentPressure: currentWeatherData['main']['pressure']?.toDouble(),
            currentWindSpeed: currentWeatherData['wind']['speed']?.toDouble(),
            currentHumidity: currentWeatherData['main']['humidity']?.toDouble(),
            forecastList: map['list'], // Full list for hourly forecast
        );
    }

    Map<String, dynamic> toMap() {
        return {
            'currentTemp': currentTemp,
            'currentSky': currentSky,
            'currentPressure': currentPressure,
            'currentWindSpeed': currentWindSpeed,
            'currentHumidity': currentHumidity,
            'forecastList': forecastList,
        };
    }

    String toJson() => json.encode(toMap());

    factory WeatherModel.fromJson(String source) =>
        WeatherModel.fromMap(json.decode(source));

    @override
    String toString() {
        return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
    }

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;

        return other is WeatherModel &&
            other.currentTemp == currentTemp &&
            other.currentSky == currentSky &&
            other.currentPressure == currentPressure &&
            other.currentWindSpeed == currentWindSpeed &&
            other.currentHumidity == currentHumidity &&
            other.forecastList == forecastList;
    }

    @override
    int get hashCode {
        return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode ^
        forecastList.hashCode;
    }
}
