import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../core/models/chartsmodal.dart';

class Gantchart extends StatefulWidget {
  const Gantchart({super.key});

  @override
  State<Gantchart> createState() => _GantchartState();
}

class _GantchartState extends State<Gantchart> {
  List<ChartData> data = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40),
    ChartData('Jun', 38),
    ChartData('Jul', 30),
    ChartData('Aug', 35),
    ChartData('Sep', 28),
    ChartData('Oct', 34),
    ChartData('Nov', 32),
    ChartData('Dec', 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfSparkLineChart.custom(
        trackball:
            SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
        marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
        // Enable data label
        labelDisplayMode: SparkChartLabelDisplayMode.all,
        xValueMapper: (int index) => data[index].year,
        yValueMapper: (int index) => data[index].sales,
        dataCount: 5,
      ),
    );
  }
}
