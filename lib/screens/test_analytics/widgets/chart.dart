import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> _sections = List<PieChartSectionData>();

    PieChartSectionData _item1 = PieChartSectionData(
        color: Color.fromRGBO(223, 87, 83, 100),
        radius: 20,
        value: 25,
        showTitle: false);

    PieChartSectionData _item2 = PieChartSectionData(
      color: Color.fromRGBO(71, 182, 53, 100),
      radius: 20,
      value: 25,
      showTitle: false,
    );
    PieChartSectionData _item3 = PieChartSectionData(
      color: Color.fromRGBO(161, 161, 161, 100),
      radius: 20,
      value: 50,
      showTitle: false,
    );

    _sections = [
      _item3,
      _item1,
      _item2,
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(PieChartData(
          sections: _sections,
          borderData: FlBorderData(show: false),
          // centerSpaceRadius: 40,
          sectionsSpace: 0,
        )),
      ),
    );
  }
}
