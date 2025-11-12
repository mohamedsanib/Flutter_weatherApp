import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> temps;
  final List<double> pops; // probability of precipitation
  final List<String> labels; // short time labels

  const TemperatureChart({super.key, required this.temps, required this.pops, required this.labels});

  @override
  Widget build(BuildContext context) {
    final spots = List.generate(temps.length, (i) => FlSpot(i.toDouble(), temps[i]));

    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) {
              final idx = value.toInt();
              if (idx >= 0 && idx < labels.length) {
                return Text(labels[idx], style: const TextStyle(color: Colors.white70, fontSize: 10));
              }
              return const Text('');
            })),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
          minY: temps.reduce((a, b) => a < b ? a : b) - 2,
          maxY: temps.reduce((a, b) => a > b ? a : b) + 2,
        ),
      ),
    );
  }
}