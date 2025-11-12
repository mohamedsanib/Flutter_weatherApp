import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather_service.dart';
import '../widgets/weather_card.dart';
import '../widgets/temperature_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _service = WeatherService();
  bool _loading = true;
  String _city = 'New Delhi';
  double _temp = 0.0;
  String _condition = '';
  List<double> temps = [];
  List<double> pops = [];
  List<String> labels = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final weather = await _service.fetchCurrentWeatherByCity(_city);
      final forecast = await _service.fetchForecastByCity(_city);

      // Pick next 8 forecast entries (24 hours at 3-hour intervals)
      final next = forecast.take(8).toList();

      setState(() {
        _temp = weather.temp;
        _condition = weather.description;
        temps = next.map((e) => (e['temp'] as double)).toList();
        pops = next.map((e) => (e['pop'] as double)).toList();
        labels = next.map((e) => (e['dt_txt'] as String).split(' ')[1].substring(0,5)).toList();
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Weather Forecast'),
      ),
      body: _loading
          ? const Center(child: SpinKitFadingCircle(color: Colors.white, size: 48))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherCard(temp: _temp, condition: _condition, city: _city),
                  const SizedBox(height: 20),
                  const Text('Today', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  TemperatureChart(temps: temps, pops: pops, labels: labels),
                  const SizedBox(height: 20),
                  const Text('Hourly (next 24h)', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: temps.length,
                      itemBuilder: (context, i) {
                        return Container(
                          width: 90,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF15193B),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(labels[i], style: const TextStyle(color: Colors.white70)),
                              const Icon(Icons.cloud_queue, color: Colors.white70),
                              Text('${temps[i].toStringAsFixed(0)}°', style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}