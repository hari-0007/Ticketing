import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum DevicesMarker {discover, discovered}

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  bool _deviceWidth = true;
  bool _deviceflag = false;

  DevicesMarker selectedDevicesMarker = DevicesMarker.discover;

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
                    width: "110%",
                    height: "110%",
                    widget: PhysicalModel(
                        shape: BoxShape.circle,
                        elevation: 10,
                        shadowColor: Colors.black,
                        color: Colors.transparent,/*Color(0xffe6e6e6),*/
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              print("hello");
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 5
                              ),
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage('assets/rectangle.png'),
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
                          ),
                        )
                    )
                )
              ],
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<ChartData, String>(
                    onPointTap: (value){
                      setState(() {
                        print(chartData[value.pointIndex!].y);
                      });
                    },
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
                                              /*onChanged: (value) =>
                                                  _runFilter(value),*/
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
                                    child: Row(children: [
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
                            /*Card(
                              color: Colors.transparent,
                              elevation: 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _deviceWidth  = !_deviceWidth ;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          actionsAlignment:
                                          MainAxisAlignment.center,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0),
                                          ),
                                          actionsOverflowButtonSpacing: 10,
                                          elevation: 5,
                                          backgroundColor: Colors.white70,
                                          // context: context,
                                          // title: "CREATE",
                                          scrollable: true,
                                          title: Text(
                                            'Create',
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 47,
                                                padding: EdgeInsets.only(left: 15),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.55))),
                                                child: TextField(
                                                  cursorColor: Colors.white,
                                                  autofocus: false,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                      Icons.email_outlined,
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                    ),
                                                    hintText: 'Email',
                                                    labelStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              Container(
                                                height: 47,
                                                padding: EdgeInsets.only(left: 15),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.55))),
                                                child: TextField(
                                                  cursorColor: Colors.white,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      icon: Icon(
                                                        Icons
                                                            .account_circle_outlined,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                      ),
                                                      hintText: 'Agent ID',
                                                      labelStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              Center(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                            color: Color(0xffC4C4C4)
                                                                .withOpacity(0.20),
                                                            border: Border.all(
                                                                color: Colors.black87)),
                                                        width: 350,
                                                        height: 70,
                                                        alignment: Alignment(0, -0.5),
                                                        child: TextField(
                                                          minLines: 1,
                                                          maxLines: 3,
                                                          scrollPadding:
                                                          EdgeInsets.only(top: 40),
                                                          showCursor: true,
                                                          cursorColor: Colors.white70,
                                                          keyboardType:
                                                          TextInputType.multiline,
                                                          textInputAction:
                                                          TextInputAction.done,
                                                          style: TextStyle(
                                                            fontFamily:
                                                            'fonts/Roboto-Bold.ttf',
                                                            fontSize: 18,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                          decoration:
                                                          InputDecoration.collapsed(
                                                            hintText: "Notes",
                                                            border: InputBorder.none,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 9,
                                                      ),
                                                      ElevatedButton(
                                                          child: Text(
                                                            "SUBMIT",
                                                            style: TextStyle(
                                                                color: Colors.black
                                                                    .withOpacity(0.75)),
                                                          ),
                                                          style:
                                                          ElevatedButton.styleFrom(
                                                            primary: Colors.white70,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          }),
                                                      // Container(
                                                      //   height: 25,
                                                      //   width: 100,
                                                      //   child: Center(
                                                      //     child: Text('SUBMIT'),
                                                      //   ),
                                                      // )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black.withOpacity(0.5),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 0,
                                            offset: Offset(2, 4),
                                            color: Colors.black12
                                                .withOpacity(0.15)), //3dright
                                      ]),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 3,
                                    ),
                                    SizedBox(
                                      height: 30.5,
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Center(
                                      child: Text(
                                        'Create',
                                        style: TextStyle(
                                            fontFamily: 'fonts/Roboto-Light.ttf',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.white.withOpacity(0.75)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.5,
                                    ),
                                  ]),
                                ),
                              ),
                            ),*/
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
                                "Discover",
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
          margin: EdgeInsets.only(left: 0,right: 0,top: 2.5,bottom: 0),
          color: Colors.transparent,
          child: ListView.builder(
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
          ),
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
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                child: Container(
                  height: 47.5,
                  decoration: BoxDecoration(color:Color(0xff19547b).withOpacity(0.85), /*Colors.blueGrey.withOpacity(0.9)*/),
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