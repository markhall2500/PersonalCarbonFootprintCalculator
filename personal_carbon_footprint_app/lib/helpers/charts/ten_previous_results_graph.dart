import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/data/sp_helper.dart';
import 'package:personal_carbon_footprint_app/helpers/charts/resources/line_data.dart';

class TenPreviousResultsGraph extends StatefulWidget {
  const TenPreviousResultsGraph({Key? key}) : super(key: key);

  @override
  State<TenPreviousResultsGraph> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<TenPreviousResultsGraph> {
  late int showingTooltipSpot;
  final SPHelper helper = SPHelper();
  _LineChartWidgetState();

  @override
  void initState() {
    showingTooltipSpot = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LineData lineData = LineData();
    var lineDataList = lineData.intialiseLineData();

    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 200,
          minX: 9,
          maxX: 0,
          lineBarsData: [
            LineChartBarData(
                spots: lineDataList
                    .map((point) => FlSpot(point.x, point.y))
                    .toList(),
                isCurved: false,
                dotData: const FlDotData(
                  show: false,
                ),
                color: Colors.red),
          ],
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }
}
