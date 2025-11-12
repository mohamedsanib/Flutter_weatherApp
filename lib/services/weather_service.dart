import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../utils/constants.dart';

class WeatherService {
  // Fetch current weather by city name
  Future<WeatherModel> fetchCurrentWeatherByCity(String city) async {
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return WeatherModel.fromCurrentJson(json);
    } else {
      throw Exception('Failed to fetch weather: \${res.statusCode}');
    }
  }

  // Fetch forecast (5 day / 3 hour) by city
  Future<List<Map<String, dynamic>>> fetchForecastByCity(String city) async {
    final url = Uri.parse('$baseUrl/forecast?q=$city&appid=$apiKey&units=metric');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      // return list of forecast entries
      final List list = json['list'];
      // Map to simpler structure: time, temp, pop (probability of precipitation), icon
      return list.map<Map<String, dynamic>>((e) {
        return {
          'dt': e['dt'],
          'dt_txt': e['dt_txt'],
          'temp': (e['main']['temp'] as num).toDouble(),
          'pop': e.containsKey('pop') ? (e['pop'] as num).toDouble() : 0.0,
          'icon': e['weather'][0]['icon'],
          'desc': e['weather'][0]['main'],
        };
      }).toList();
    } else {
      throw Exception('Failed to fetch forecast: \${res.statusCode}');
    }
  }
}