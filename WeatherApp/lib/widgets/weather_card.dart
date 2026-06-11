import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(113, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Lottie.asset(
            weather.description.toLowerCase().contains('rain')
                ? 'assets/rain.json'
                : weather.description.toLowerCase().contains('clear')
                ? 'assets/sunny.json'
                : 'assets/cloudy.json',
            height: 150,
            width: 150,
          ),

          Text(
            weather.cityName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(height: 10),

          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Text(
            weather.description,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Humidity: ${weather.humidity}%',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Wind: ${weather.windSpeed} m/s',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}