import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_final/data/respository/weather_repository.dart';
import 'package:weather_app_final/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

    final WeatherRepository weatherRepository;
    WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
        on<WeatherFetched>(_getCurrentWeather);
    }

    void _getCurrentWeather(
        WeatherFetched event,
        Emitter<WeatherState> emit)
    async {
        emit(WeatherLoading());
        try{
            final weather = await weatherRepository.getCurrentWeather();
            emit(WeatherSuccess(weatherModel: weather));
        }
        catch(e){
            return emit(WeatherFailure(e.toString()));
        }
    }
}
