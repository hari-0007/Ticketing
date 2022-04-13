// import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:grouped_list/grouped_list.dart';


List<Map<String, dynamic>> _elements = [
  {
    'devices': 'Allitson 1',
    "platform": "Windows",
    'group': 'Online',
    "lastActive": "1 Hour Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 2',
    "platform": "Mac",
    'group': 'Online',
    "lastActive": "30 Minutes Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 3',
    "platform": "Android",
    'group': 'Online',
    "lastActive": "1 Hour Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 4',
    "platform": "Windows",
    'group': 'Online',
    "lastActive": "1 Hour Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 5',
    "platform": "Mac",
    'group': 'Online',
    "lastActive": "3 Hour Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 6',
    "platform": "Android",
    'group': 'Online',
    "lastActive": "4 Hour Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 7',
    "platform": "Windows",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 8',
    "platform": "Mac",
    'group': 'Online',
    "lastActive": "2 Hour Ago",
    'disable': false,
    'remove': false
  },
  {
    'devices': 'Allitson 9',
    "platform": "Android",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 10',
    "platform": "Windows",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 11',
    "platform": "Mac",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 12',
    "platform": "Android",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 13',
    "platform": "Windows",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 14',
    "platform": "Mac",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
  {
    'devices': 'Allitson 15',
    "platform": "Android",
    'group': 'Offline',
    "lastActive": "Offline",
    'disable': false
  },
  {
    'devices': 'Allitson 16',
    "platform": "Windows",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
  {
    'devices': 'Allitson 17',
    "platform": "Mac",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
  {
    'devices': 'Allitson 18',
    "platform": "Android",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
  {
    'devices': 'Allitson 19',
    "platform": "Windows",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
  {
    'devices': 'Allitson 20',
    "platform": "Mac",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
  {
    'devices': 'Allitson 21',
    "platform": "Android",
    'group': 'Disabled',
    "lastActive": "Disable",
    'enable': false
  },
];

enum DevicesMarker {members, discovered}

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  bool checkBox = false;

  List<Map<String, dynamic>> _discover = [];


  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  bool _deviceWidth = true;
  bool _deviceflag = false;

  final disController = ScrollController();

  int explodeIndex = 0;
  var explodeIndexAF;

  bool explode = false;

  DevicesMarker selectedDevicesMarker = DevicesMarker.members;

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


              annotations: [
                CircularChartAnnotation(
                    width: /*"111.5%",*/"105%",
                    height: /*"111.5%",*/"105%",
                    // horizontalAlignment: ChartAlignment.center,
                    // verticalAlignment: ChartAlignment.center,
                    widget: PhysicalModel(
                        shape: BoxShape.circle,
                        elevation: 10,
                        shadowColor: Colors.black,
                        color: Colors.transparent,/*Color(0xffe6e6e6),*/
                        child: Container(
                          decoration: BoxDecoration(
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
                    )
                ),
              ],
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                    /*onPointDoubleTap: (value){
                      setState(() {
                        _devicesSearch(chartData[value.pointIndex!].x);
                        print(chartData[value.pointIndex!].x);
                      });
                    },*/
                    onPointTap: (value){
                      // print(value.pointIndex);
                      /*print(value.pointIndex);
                      print(explode);
                      print(explodeIndex);*/
                      setState(() {
                        explodeIndex=value.pointIndex!;
                        if(explodeIndex == value.pointIndex){
                          explode = !explode;
                          if(explode==true){
                            print("helo");
                            _devicesSearch(chartData[value.pointIndex!].x);
                            explodeIndexAF = explodeIndex;
                          }else{
                            if(explodeIndexAF != value.pointIndex){
                              print(explodeIndexAF);
                              print("helo2");
                              print(value.pointIndex);
                              explode = true;
                              explodeIndexAF = explodeIndex;
                              _devicesSearch(chartData[value.pointIndex!].x);
                            }else{
                              print(value.pointIndex);
                              print("helo1");
                              _devicesSearch("");
                              explode = false;
                              print(explodeIndexAF);
                            }
                            /*print(value.pointIndex);
                            print("helo1");
                            _devicesSearch("");
                            print(explodeIndexAF);*/
                          }
                        }/*else{
                          print("hello2");
                          explode = false;
                        }*/
                      });

                      /*setState(() {
                        if(explode == false){
                          _devicesSearch("");
                        }
                      });*/

                      // explodeIndex=value.pointIndex!;
                      // _devicesSearch(chartData[value.pointIndex!].x);
                      // print(chartData[value.pointIndex!].x);
                      /*setState(() {
                        _devicesSearch(chartData[value.pointIndex!].x);
                        print(chartData[value.pointIndex!].x);
                      });*/
                    },
                    explodeIndex: explodeIndex,
                    explodeOffset: "10%",
                    strokeColor: Colors.transparent,
                    dataLabelMapper: (ChartData data, _) => data.y.toString(),
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        overflowMode: OverflowMode.shift,
                        textStyle: TextStyle(
                            fontSize: 15.5
                        )
                    ),
                    enableTooltip: true,
                    radius: "80%",
                    innerRadius: "60%",
                    explode: explode,
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
              margin: EdgeInsets.only(left: 12.5,right: 12.5,top: 0,bottom: 5),
              padding: EdgeInsets.only(top: 0,bottom: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                  ),
                  gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                ),
                child: Column(
                  children: [
                    getDevicesSwitchContainer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap : (){
                              setState(() {
                                selectedDevicesMarker = DevicesMarker.members;
                              });
                            },
                            child: Container(
                              height: 25,
                              margin: EdgeInsets.only(left: 7.5,right: 1),
                              decoration: BoxDecoration(
                                  color: (selectedDevicesMarker == DevicesMarker.members)?Colors.black38:Colors.transparent,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 1
                                )
                              ),
                              child: Center(
                                child: Text(
                                  "Members",
                                  style: TextStyle(
                                    color: (selectedDevicesMarker == DevicesMarker.members)?Colors.white:Colors.black,
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
                                  Timer(Duration(milliseconds: 200),(){
                                    disController.animateTo(disController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);
                                  });
                                  selectedDevicesMarker = DevicesMarker.discovered;
                                });
                                /*showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (BuildContext context){
                                  return DraggableScrollableSheet(
                                    initialChildSize: 0.9,
                                    minChildSize: 0.2,
                                    maxChildSize: 0.9,
                                    builder: (BuildContext context, ScrollController scrollController) {
                                    return Container(
                                      color: Colors.white,
                                        child: ListView(
                                      controller: scrollController,
                                      children: [
                                      Text("hello")
                                    ],)
                                    );
                                  },
                                  );
                                }
                                );*/
                              },
                              child: Container(
                                height: 25,
                                margin: EdgeInsets.only(left: 1,right: 7.5),
                                decoration: BoxDecoration(
                                    color: (selectedDevicesMarker == DevicesMarker.discovered)?Colors.black38:Colors.transparent,
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.6),
                                        width: 1
                                    )
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
                    // getDevicesSwitchContainer(),
                  ],
                ),
              ),
            )
        ),

      ],
    );
  }

  Widget getDevicesSwitchContainer(){
    switch (selectedDevicesMarker) {
      case DevicesMarker.members:
        return getMembers();
      case DevicesMarker.discovered:
        return getDiscovered();
    }
  }

  Widget getMembers(){
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 27.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Row(
              children: [
                // SizedBox(width: 7.5,),
                Expanded(
                  child: Center(
                    child: Text(
                        "Host Name",
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                        "Platform",
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                        "Last Activation",
                    ),
                  ),
                ),
                // SizedBox(width: 5,),
              ],
            ),
          ),
          Expanded(
              child: GroupedListView<dynamic, String>(
                elements: _discover,
                groupBy: (_element) => _element['group'],
                sort: true,
                order: GroupedListOrder.DESC,
                itemComparator: (item1, item2) => item2['devices'].compareTo(item1['devices']),
                // groupComparator: (value1, value2) => value1.compareTo(value2),
                useStickyGroupSeparators: true,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal:0),
                stickyHeaderBackgroundColor: Colors.black,
                floatingHeader: false,
                groupSeparatorBuilder: (String value) => SizedBox(),
                /*Container(
                  height: 27.5,
                  decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Center(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'fonts/Roboto-Regular.ttf',
                        color: Colors.black
                      ),
                    ),
                  ),
                ),*/

                indexedItemBuilder: (context, element, int){
                  return Padding(
                    padding: EdgeInsets.only(left: 3.5,right: 3.5),
                    child: Card(
                      elevation: 8.0,
                      color: Colors.transparent,
                      shadowColor: Colors.black,
                      child: GestureDetector(
                        onTap: (){
                          /*print(element["disable"]);
                          print(element["remove"]);
                          print(element["enable"]);*/
                          print(element[int]);

                          setState(() {
                            element.removeAt(int);
                          });


                        },
                        onLongPress: (){
                          // print(checkBox);
                          // checkBox=true;
                          // checkDialog();

                          setState(() {
                            checkBox=!checkBox;
                            print(checkBox);
                          });

                          showModalBottomSheet(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.95,
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                /*constraints: BoxConstraints(
                                  maxHeight: *//*MediaQuery.of(context).size.height - *//*300,
                                ),*/
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(45),
                                    topLeft: Radius.circular(45),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                  children: [

                                    Visibility(
                                      visible: (element["group"]=="Offline"  || element["group"]=="Online"),
                                      child: Row(
                                        children: [
                                          Text("Disable"),
                                          Checkbox(
                                              value: element["disable"]==null?false:element["disable"],
                                              onChanged: (bool? value){

                                              }
                                          ),
                                        ],
                                      ),
                                    ),

                                    Visibility(
                                      visible: (element["group"]=="Disabled"),
                                      child: Row(
                                        children: [
                                          Text("Enable"),
                                          Checkbox(
                                              value: element["enable"]==null?false:element["enable"],
                                              onChanged: (bool? value){

                                              }
                                          ),
                                        ],
                                      ),
                                    ),

                                    Visibility(
                                      visible: (element["group"]=="Online"),
                                      child: Row(
                                        children: [
                                          Text("Remove"),
                                          Checkbox(
                                              value: element["remove"]==null?false:element["remove"],
                                              onChanged: (bool? value){

                                              }
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            },
                          );

                        },
                        child: Container(
                            height: 42.5,
                            decoration: BoxDecoration(
                                color: Color(0xff19547b).withOpacity(0.6)/*Color(0xff404b60).withOpacity(0.9)*/
                            ),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  // SizedBox(width: 10),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        element['devices'],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        element["platform"],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          element["lastActive"],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              /*Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        element['devices'],
                                      ),
                                      SizedBox(
                                        // height: 42.5,
                                        width: 70,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                              element["agentID"].toString(),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),


                                  Visibility(
                                    visible: checkBox,
                                    child: Row(
                                      children: [

                                        Visibility(
                                          visible: (element["group"]=="Offline"  || element["group"]=="Online"),
                                          child: Row(
                                            children: [
                                              Text("Disable"),
                                              Checkbox(
                                                  value: element["disable"]==null?false:element["disable"],
                                                  onChanged: (bool? value){

                                                  }
                                              ),
                                            ],
                                          ),
                                        ),

                                        Visibility(
                                          visible: (element["group"]=="Disabled"),
                                          child: Row(
                                            children: [
                                              Text("Enable"),
                                              Checkbox(
                                                  value: element["enable"]==null?false:element["enable"],
                                                  onChanged: (bool? value){

                                                  }
                                              ),
                                            ],
                                          ),
                                        ),

                                        Visibility(
                                          visible: (element["group"]=="Online"),
                                          child: Row(
                                            children: [
                                              Text("Remove"),
                                              Checkbox(
                                                  value: element["remove"]==null?false:element["remove"],
                                                  onChanged: (bool? value){

                                                  }
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              ),*/
                            )
                        ),
                      ),
                    ),
                  );
                },
                /*itemBuilder: (c, element) {
                  return GestureDetector(
                    onTap: (){
                      print(element.toString());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.5,right: 3.5),
                      child: Card(
                        elevation: 8.0,
                        color: Colors.transparent,
                        shadowColor: Colors.black,
                        child: Container(
                            height: 42.5,
                            decoration: BoxDecoration(color: Color(0xff404b60).withOpacity(0.9)),
                            child: Center(
                              child: Text(
                                  element['devices'],
                              ),
                            )
                        ),
                      ),
                    ),
                  );
                },*/
              )
          ),
        ],
      ),
    );
  }

  Widget getDiscovered(){
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 0,right: 0,top:0,bottom: 0),
          padding: EdgeInsets.only(top: 12.5),
          color: Colors.transparent,
          child: ListView.builder(
            controller: disController,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            reverse: true,
            itemCount: _discover.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.only(left: 7.5,right: 7.5,top: 5,bottom: 5),
                child: Container(
                  height: 47.5,
                  decoration: BoxDecoration(
                    color:Color(0xff19547b).withOpacity(0.65),/*Color(0xff19547b).withOpacity(0.85),*/ /*Colors.blueGrey.withOpacity(0.9)*/),
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

  /*Future checkDialog(){
    return showModalBottomSheet(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.95,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: *//*MediaQuery.of(context).size.height - *//*300,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              topLeft: Radius.circular(45),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color: Colors.white,
          ),
        );
      },
    );
  }*/

}

class ChartData {
  ChartData(this.x, this.y,this.color);
  final String x;
  final int y;
  final Color color;
}