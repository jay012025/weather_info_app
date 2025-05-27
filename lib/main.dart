import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_final/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_final/presentation/screens/weather_screen.dart';

import 'bloc/weather_bloc.dart';
import 'data/respository/weather_repository.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return RepositoryProvider(
            create: (context) => WeatherRepository(WeatherDataProvider()),
            child: BlocProvider(
                create: (context) => WeatherBloc(context.read<WeatherRepository>()),
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData.dark(useMaterial3: true),
                    home: const WeatherScreen())
            )
        );
    }

}
