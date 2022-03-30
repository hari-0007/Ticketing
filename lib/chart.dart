import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip=TooltipBehavior(enable: true,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var _chart = {
      "Online":15,
      "Offline":15,
      "Disabled":20
    };

    final List<ChartData> chartData = [
      ChartData(_chart.keys.toList()[0], _chart["Online"]!.toInt(), Color(0xff001F61)),
      ChartData(_chart.keys.toList()[1],  _chart["Offline"]!.toInt(), Color(0xff0247BA)),
      ChartData(_chart.keys.toList()[2],  _chart["Disabled"]!.toInt(), Color(0xff0068D7)),
    ];

    return SfCircularChart(
      margin: EdgeInsets.zero,
      tooltipBehavior: _tooltip,
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.none,
        alignment: ChartAlignment.center,
        textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 1,
                color: Colors.black.withOpacity(0.8),
              ),
            ]
        ),
        iconWidth: 10,
        iconHeight:30
      ),
      // title: ChartTitle(text: "Demo chart"),
      annotations: [
        CircularChartAnnotation(
            width: "100%",
            height: "100%",
            widget: PhysicalModel(
                shape: BoxShape.circle,
                elevation: 10,
                shadowColor: Colors.black,
                color: Colors.transparent,/*Color(0xffe6e6e6),*/
                child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage('assets/rectangle.png'),
                          fit: BoxFit.fill,
                          opacity: 0.4
                        )
                      ),
                      child: Center(
                        child: Text(
                          "50",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ]
                          ),
                        ),
                      ),
                    )
                )
            )
        )
      ],
      series: <CircularSeries>[
        // Renders doughnut chart
        DoughnutSeries<ChartData, String>(
            startAngle: 0,
            endAngle: 360,
            explodeIndex: 55,
            strokeColor: Colors.transparent,
            dataLabelMapper: (ChartData data, _) => data.y.toString(),
            dataLabelSettings: DataLabelSettings(isVisible: true,overflowMode: OverflowMode.shift),
            enableTooltip: true,
            radius: "80%",
            innerRadius: "70%",
            explode: true,
            dataSource: chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y,this.color);
  final String x;
  final int y;
  final Color color;
}