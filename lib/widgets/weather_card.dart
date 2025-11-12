import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final double temp;
  final String condition;
  final String city;

  const WeatherCard({super.key, required this.temp, required this.condition, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF15193B), Color(0xFF0B132B)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city,
                  style: const TextStyle(color: Colors.white70, fontSize: 16)),
              const SizedBox(height: 8),
              Text('${temp.toStringAsFixed(0)}°C',
                  style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(condition, style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const Icon(Icons.wb_sunny, color: Colors.yellow, size: 64),
        ],
      ),
    );
  }
}