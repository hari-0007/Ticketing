import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:grouped_list/grouped_list.dart';


List<Map<String, dynamic>> _elements = [
  {'devices': 'C0001', 'group': 'Online'},
  {'devices': 'C0002', 'group': 'Online'},
  {'devices': 'C0003', 'group': 'Online'},
  {'devices': 'C0004', 'group': 'Online'},
  {'devices': 'C0005', 'group': 'Online'},
  {'devices': 'C0006', 'group': 'Online'},
  {'devices': 'A0001', 'group': 'Offline'},
  {'devices': 'C0007', 'group': 'Online'},
  {'devices': 'A0002', 'group': 'Offline'},
  {'devices': 'A0003', 'group': 'Offline'},
  {'devices': 'A0004', 'group': 'Offline'},
  {'devices': 'A0005', 'group': 'Offline'},
  {'devices': 'A0006', 'group': 'Offline'},
  {'devices': 'B0001', 'group': 'Disabled'},
  {'devices': 'A0007', 'group': 'Offline'},
  {'devices': 'B0002', 'group': 'Disabled'},
  {'devices': 'B0003', 'group': 'Disabled'},
  {'devices': 'B0004', 'group': 'Disabled'},
  {'devices': 'B0005', 'group': 'Disabled'},
  {'devices': 'B0006', 'group': 'Disabled'},
  {'devices': 'B0007', 'group': 'Disabled'},
];

enum DevicesMarker {discover, discovered}

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  List<Map<String, dynamic>> _discover = [];


  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  bool _deviceWidth = true;
  bool _deviceflag = false;

  DevicesMarker selectedDevicesMarker = DevicesMarker.discover;

  @override
  void initState() {

    _discover = _elements;

    _tooltip=TooltipBehavior(enable: true,elevation: 2,color: Colors.blueGrey,duration: 2000,animationDuration: 1000);

    super.initState();
  }

  void _devicesSearch(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _elements;
    } else {
      results = _elements
          .where((user) =>_deviceflag==true?
          user["devices"].toLowerCase().contains(enteredKeyword.toLowerCase()) : user["group"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _discover = results;
    });
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

    return Column(
      children: [
        Stack(
          children: [
            SfCircularChart(

              margin: EdgeInsets.zero,
              tooltipBehavior: _tooltip,
              onLegendTapped: (data){
                setState(() {
                  print(chartData[data.pointIndex!].x);
                });
              },
              /*onDataLabelTapped: (data){
                setState(() {
                  print("hello");
                  print(chartData[data.pointIndex].x);
                });
                },*/
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
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
                    width: /*"111.5%",*/"105%",
                    height: /*"111.5%",*/"105%",
                    widget: GestureDetector(
                      onTap: (){
                        setState(() {
                          print("hello");
                          _devicesSearch("");
                        });
                      },
                      child: PhysicalModel(
                          shape: BoxShape.circle,
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: Colors.transparent,/*Color(0xffe6e6e6),*/
                          child: Container(
                            decoration: BoxDecoration(
                              /*border: Border.all(
                                color: Colors.white,
                                width: 5
                              ),*/
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage('assets/rectangleintocircle.png'),
                                fit: BoxFit.fill,
                                opacity: 1
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
                      ),
                    )
                ),
                /*CircularChartAnnotation(
                    width: *//*"111.5%",*//*"105%",
                    height: *//*"111.5%",*//*"105%",
                    widget: GestureDetector(
                      onTap: (){
                        setState(() {
                          print("hello");
                          _devicesSearch("");
                        });
                      },
                    )
                )*/
              ],
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<ChartData, String>(
                    /*onPointTap: (value){
                      setState(() {
                        print(chartData[value.pointIndex!].y);
                      });
                    },*/
                    /*onPointDoubleTap: (value){
                      setState(() {
                        print(chartData[value.pointIndex!].y);
                      });
                    },*/
                    onPointTap: (value){
                      setState(() {
                        _devicesSearch(chartData[value.pointIndex!].x);
                        print(chartData[value.pointIndex!].x);
                      });
                    },
                    /*startAngle: 0,
                    endAngle: 360,*/
                    explodeOffset: "10%",
                    strokeColor: Colors.transparent,
                    // explodeAll: false,
                    dataLabelMapper: (ChartData data, _) => data.y.toString(),
                    dataLabelSettings: DataLabelSettings(isVisible: true,overflowMode: OverflowMode.shift),
                    enableTooltip: true,
                    radius: "80%",
                    innerRadius: "60%",
                    explode: true,
                    // explodeIndex: 1,
                    explodeGesture: ActivationMode.singleTap,
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y
                )
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  InkWell(
                    onTap: () {

                      setState(() {

                        _deviceWidth = !_deviceWidth;
                        _deviceflag = false;

                      });

                    },
                    child: AnimatedContainer(
                      constraints: BoxConstraints(
                          minWidth: 25),
                      duration: Duration(milliseconds: 0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        // color: Colors.white60,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                      ),
                      // width: !width? null : 15,
                      height: 50,
                      child: Visibility(
                        visible: !_deviceWidth,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(4.0),
                          children: [
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: _deviceflag
                                  ? GestureDetector(
                                key: Key('2'),
                                onTap: () {
                                  setState(() {
                                    _deviceflag = !_deviceflag;
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        color: Colors.black.withOpacity(0.5),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 0,
                                              offset: Offset(2, 4),
                                              color: Colors.black12
                                                  .withOpacity(
                                                  0.15)), //3dright
                                        ]),
                                    child: Row(children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Center(
                                        child: Container(
                                            width: 150,
                                            child: TextField(
                                              onChanged: (value) => _devicesSearch(value),
                                              autofocus: true,
                                              cursorColor: Colors.white24,
                                              keyboardType:
                                              TextInputType.text,
                                              style: TextStyle(
                                                  fontFamily:
                                                  'fonts/Roboto-Bold.ttf',
                                                  fontSize: 18,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                              decoration:
                                              InputDecoration.collapsed(
                                                hintText: "Search",
                                                hintStyle: TextStyle(
                                                    color: Colors.white70),
                                                border: InputBorder.none,
                                              ),
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.5,
                                      ),
                                      SizedBox(
                                        height: 24.5,
                                        child: Icon(
                                          Icons.search_sharp,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                  ),
                                ),
                              )
                                  : GestureDetector(
                                key: Key('1'),
                                onTap: () {
                                  setState(() {
                                    _deviceflag = !_deviceflag;
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        color: Colors.black.withOpacity(0.5),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 0,
                                              offset: Offset(2, 4),
                                              color: Colors.black12
                                                  .withOpacity(
                                                  0.15)), //3dright
                                        ]),
                                    child: Row(
                                        children: [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      SizedBox(
                                        height: 22.5,
                                        child: Icon(
                                          Icons.search_sharp,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Search',
                                          style: TextStyle(
                                              fontFamily:
                                              'fonts/Roboto-Light.ttf',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.white
                                                  .withOpacity(0.75)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ),

                            Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),

        Expanded(
            child:Container(
              margin: EdgeInsets.only(left: 7.5,right: 7.5,top: 0,bottom: 0),
              padding: EdgeInsets.only(top: 5,bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap : (){
                            setState(() {
                              selectedDevicesMarker = DevicesMarker.discover;
                            });
                          },
                          child: Container(
                            height: 22.5,
                            margin: EdgeInsets.only(left: 7.5,right: 1),
                            decoration: BoxDecoration(
                                color: (selectedDevicesMarker == DevicesMarker.discover)?Colors.blueGrey:Colors.transparent,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                            ),
                            child: Center(
                              child: Text(
                                "Members",
                                style: TextStyle(
                                  color: (selectedDevicesMarker == DevicesMarker.discover)?Colors.white:Colors.black,
                                  // fontWeight: FontWeight.w400,
                                  // fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          child: GestureDetector(
                            onTap : (){
                              setState(() {
                                selectedDevicesMarker = DevicesMarker.discovered;
                              });
                            },
                            child: Container(
                              height: 22.5,
                              margin: EdgeInsets.only(left: 1,right: 7.5),
                              decoration: BoxDecoration(
                                  color: (selectedDevicesMarker == DevicesMarker.discovered)?Colors.blueGrey:Colors.transparent,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20))
                              ),
                              child: Center(
                                  child: Text(
                                    "Discovered",
                                    style: TextStyle(
                                      color: (selectedDevicesMarker == DevicesMarker.discovered)?Colors.white:Colors.black,
                                      // fontWeight: FontWeight.w400,
                                      // fontFamily: 'Roboto',
                                    ),
                                  )
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                  getDevicesSwitchContainer(),
                ],
              ),
            )
        ),

      ],
    );
  }

  Widget getDevicesSwitchContainer(){
    switch (selectedDevicesMarker) {
      case DevicesMarker.discover:
        return getDiscover();
      case DevicesMarker.discovered:
        return getDiscovered();
    }
  }

  Widget getDiscover(){
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 3.5,right: 3.5,top: 0,bottom: 0),
          color: Colors.transparent,
          child: GroupedListView<dynamic, String>(
            elements: _discover,
            groupBy: (_element) => _element['group'],
            sort: true,
            order: GroupedListOrder.DESC,
            itemComparator: (item1, item2) => item2['devices'].compareTo(item1['devices']),
            useStickyGroupSeparators: true,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal:0),
            stickyHeaderBackgroundColor: Colors.transparent,
            floatingHeader: false,
            groupSeparatorBuilder: (String value) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.blueGrey,
                gradient: LinearGradient(
                  colors: [
                    Colors.blueGrey,
                    Colors.white.withOpacity(0.0)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.497,1]
                )
              ),
              margin: EdgeInsets.only(left: 4,right: 4,top: 0),
              padding: EdgeInsets.only(top :5,bottom: 5),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
              ),
            ),
            itemBuilder: (c, element) {
              return Card(
                elevation: 8.0,
                color: Colors.transparent,
                shadowColor: Colors.black,
                child: Container(
                    height: 47.5,
                    decoration: BoxDecoration(color: Color(0xff404b60).withOpacity(0.9)),
                    child: Center(
                      child: Text(
                          element['devices'],
                      ),
                    )
                ),
              );
            },
          )


          /*ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                child: Container(
                  height: 47.5,
                  decoration: BoxDecoration(color: Color(0xff404b60).withOpacity(0.9)),
                ),
              );
            },
          ),*/
        )
    );
  }

  Widget getDiscovered(){
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 0,right: 0,top: 2.5,bottom: 0),
          color: Colors.transparent,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            reverse: true,
            itemCount: _discover.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                child: Container(
                  height: 47.5,
                  decoration: BoxDecoration(color:Color(0xff19547b).withOpacity(0.85), /*Colors.blueGrey.withOpacity(0.9)*/),
                  child: Center(
                    child: Text(_discover[index]['devices']),
                  ),
                ),
              );
            },
          ),
        )
    );
  }

}

class ChartData {
  ChartData(this.x, this.y,this.color);
  final String x;
  final int y;
  final Color color;
}