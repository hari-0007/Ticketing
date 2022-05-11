// import 'package:flutter/cupertino.dart';
import 'dart:async';
// import 'dart:math';
import 'package:allitson/user.dart';
import 'package:random_color/random_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:grouped_list/grouped_list.dart';


List<Map<String, dynamic>> _elements = [
  {
    'devices': 'Allitson-01',
    "UserName": "Welcome001",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789123,
    "ipAddress": "170.30.30.151",
    "publicIP": "8.8.8.8",
    "localIP": "103.78.159.123",
    "macAddress": "000.a83.b1c.08e",
    'statusLive': 'Online',
    "lastActive": "1 Hour Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-02',
    "UserName": "Welcome002",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789456,
    "ipAddress": "170.30.30.123",
    "publicIP": "8.8.8.81",
    "localIP": "103.78.159.456",
    "macAddress": "000.a83.zxc.08e",
    'statusLive': 'Online',
    "lastActive": "30 Minutes Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-03',
    "UserName": "Welcome003",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789789,
    "ipAddress": "170.30.30.456",
    "publicIP": "8.8.8.82",
    "localIP": "103.78.159.789",
    "macAddress": "000.a83.cvb.08e",
    'statusLive': 'Online',
    "lastActive": "1 Hour Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-04',
    "UserName": "Welcome004",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789321,
    "ipAddress": "170.30.30.789",
    "publicIP": "8.8.8.83",
    "localIP": "103.78.159.987",
    "macAddress": "000.a83.bnm.08e",
    'statusLive': 'Online',
    "lastActive": "1 Hour Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-05',
    "UserName": "Welcome005",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789654,
    "ipAddress": "170.30.30.987",
    "publicIP": "8.8.8.84",
    "localIP": "103.78.159.654",
    "macAddress": "000.a83.asd.08e",
    'statusLive': 'Online',
    "lastActive": "3 Hour Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-06',
    "UserName": "Welcome006",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789987,
    "ipAddress": "170.30.30.654",
    "publicIP": "8.8.8.85",
    "localIP": "103.78.159.321",
    "macAddress": "000.a83.dfg.08e",
    'statusLive': 'Online',
    "lastActive": "4 Hour Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-07',
    "UserName": "Welcome007",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789159,
    "ipAddress": "170.30.30.321",
    "publicIP": "8.8.8.86",
    "localIP": "103.78.159.147",
    "macAddress": "000.a83.ghj.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-08',
    "UserName": "Welcome008",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789357,
    "ipAddress": "170.30.30.147",
    "publicIP": "8.8.8.87",
    "localIP": "103.78.159.258",
    "macAddress": "000.a83.jkl.08e",
    'statusLive': 'Online',
    "lastActive": "2 Hour Ago",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-09',
    "UserName": "Welcome009",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789951,
    "ipAddress": "170.30.30.258",
    "publicIP": "8.8.8.88",
    "localIP": "103.78.159.369",
    "macAddress": "000.a83.qwe.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-10',
    "UserName": "Welcome010",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789753,
    "ipAddress": "170.30.30.369",
    "publicIP": "8.8.8.89",
    "localIP": "103.78.159.963",
    "macAddress": "000.a83.ert.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-11',
    "UserName": "Welcome011",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789478,
    "ipAddress": "170.30.30.963",
    "publicIP": "8.8.8.9",
    "localIP": "103.78.159.852",
    "macAddress": "000.a83.tyu.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-12',
    "UserName": "Welcome012",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789236,
    "ipAddress": "170.30.30.852",
    "publicIP": "8.8.8.91",
    "localIP": "103.78.159.741",
    "macAddress": "000.a83.uio.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-13',
    "UserName": "Welcome013",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789874,
    "ipAddress": "170.30.30.741",
    "publicIP": "8.8.8.92",
    "localIP": "103.78.159.478",
    "macAddress": "000.a83.iop.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-14',
    "UserName": "Welcome014",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789632,
    "ipAddress": "170.30.30.159",
    "publicIP": "8.8.8.93",
    "localIP": "103.78.159.874",
    "macAddress": "000.a83.zaq.08e",
    'statusLive': 'Disabled',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-15',
    "UserName": "Welcome015",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789759,
    "ipAddress": "170.30.30.951",
    "publicIP": "8.8.8.94",
    "localIP": "103.78.159.159",
    "macAddress": "000.a83.xsw.08e",
    'statusLive': 'Offline',
    "lastActive": "Offline",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': false,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-16',
    "UserName": "Welcome016",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789153,
    "ipAddress": "170.30.30.753",
    "publicIP": "8.8.8.95",
    "localIP": "103.78.159.951",
    "macAddress": "000.a83.cde.08e",
    'statusLive': 'Offline',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-17',
    "UserName": "Welcome017",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789957,
    "ipAddress": "170.30.30.357",
    "publicIP": "8.8.8.96",
    "localIP": "103.78.159.236",
    "macAddress": "000.a83.vfr.08e",
    'statusLive': 'Disabled',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-18',
    "UserName": "Welcome018",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789351,
    "ipAddress": "170.30.30.478",
    "publicIP": "8.8.8.97",
    "localIP": "103.78.159.632",
    "macAddress": "000.a83.bgt.08e",
    'statusLive': 'Disabled',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-19',
    "UserName": "Welcome019",
    "platform": "Windows",
    "osDetails": "Windows 10 64-bits",
    "agentID": 123456789486,
    "ipAddress": "170.30.30.874",
    "publicIP": "8.8.8.98",
    "localIP": "103.78.159.486",
    "macAddress": "000.a83.nhy.08e",
    'statusLive': 'Disabled',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":true,
  },
  {
    'devices': 'Allitson-20',
    "UserName": "Welcome020",
    "platform": "Mac",
    "osDetails": "macOS Monterey",
    "agentID": 123456789426,
    "ipAddress": "170.30.30.236",
    "publicIP": "8.8.8.99",
    "localIP": "103.78.159.684",
    "macAddress": "000.a83.mju.08e",
    'statusLive': 'Disabled',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":false,
  },
  {
    'devices': 'Allitson-21',
    "UserName": "Welcome021",
    "platform": "Android",
    "osDetails": "Android 11",
    "agentID": 123456789684,
    "ipAddress": "170.30.30.632",
    "publicIP": "8.8.9.0",
    "localIP": "103.78.159.000",
    "macAddress": "000.a83.lop.08e",
    'statusLive': 'Disabled',
    "lastActive": "Disable",
    "hardWareDetails": {
      "cpu":"Intel(R) Core(TM) i5-10400 CPU @ 2.90GHz",
      "Ram":"16.0 GB 2667 MHz",
    },
    "callPermission": false,
    "disableCall":false,
    "remotePermission":false,
    "disableRemote":false,
    "disableScript":false,
    'disable': true,
    "block": false,
    "members":true,
  },
];

/*Map demo = {
  "Document0":"Hello",
  "Document1":"hello1"
};*/

enum DevicesMarker {members, discovered}

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  var selectedItem ;

  List colors = [];

  List<ChartData> chartData =[];

  Map map = Map();

  List group= [];

  bool selectAll = false;

  bool checkBox = false;

  List<Map<String, dynamic>> _discover = [];
  Set checkBoxAdd = {};
  Set visibleCheckBox = {};

  // late List<ChartData> data;
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

    // _elements.sort((a, b) => a["devices"].compareTo(b["devices"]));

    _discover = _elements;

    _tooltip=TooltipBehavior(enable: true,elevation: 2,color: Colors.blueGrey,duration: 5000,animationDuration: 500,);

    _discover.forEach((element) {
      group.add(element["statusLive"]);
    });

    group.forEach((x) => map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));

    for(int i=0;i<map.keys.toList().length;i++){
      chartData.add(ChartData(map.keys.toList()[i], map[map.keys.toList()[i]].toInt()));

      colors.add(RandomColor().randomColor(
        colorHue: ColorHue.custom(Range.staticValue(HSLColor.fromColor(Color(0xff19547b)).hue.toInt())),
        colorSaturation: ColorSaturation.highSaturation,
        colorBrightness: ColorBrightness.custom(Range.staticValue((i+1)*10))/*ColorBrightness.custom(Range.staticValue(Random().nextInt(50))),*/
        // debug: true
      ).value.toInt());

    }

    print(colors);

    super.initState();
  }

  void _devicesSearch(String enteredKeyword) {
    // _elements.sort((a, b) => a["devices"].compareTo(b["devices"]));
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _elements;
    } else {
      results = _elements
          .where((user) =>_deviceflag==true?
          user["devices"].toLowerCase().contains(enteredKeyword.toLowerCase()) : user["statusLive"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList()/*..sort((a, b) => a["devices"].compareTo(b["devices"]))*/;
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      // results.sort((a, b) => a["devices"].compareTo(b["devices"]));
      _discover = results;
      // _discover.sort((a, b) => a["devices"].compareTo(b["devices"]));
    });
  }



  @override
  Widget build(BuildContext context) {

    // List group= [];

    // _discover.forEach((element) {
    //   group.add(element["statusLive"]);
    // });

    // var reversed = group.reversed;

    // Map map = Map();

    // reversed.forEach((x) => map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));

    // _elements.sort((a, b) => a["devices"].compareTo(b["devices"]));
    // _discover.sort((a, b) => a["devices"].compareTo(b["devices"]));

    // var _chart = {
    //   "Online":15,
    //   "Offline":15,
    //   "Disabled":20
    // };

    // final List<ChartData> chartData = [
    //   ChartData(map.keys.toList()[0], map[map.keys.toList()[0]].toInt(), Color(0xff001F61)),
    //   ChartData(map.keys.toList()[1],  map[map.keys.toList()[1]].toInt(), Color(0xff0247BA)),
    //   ChartData(map.keys.toList()[2],  map[map.keys.toList()[2]].toInt(), Color(0xff0068D7)),
    // ];

    return Column(
      children: [
        Stack(
          children: [
            SfCircularChart(
              margin: EdgeInsets.zero,
              tooltipBehavior: _tooltip,
              onLegendTapped: (data){
                // setState(() {
                //   _discover.reversed.forEach((element) {
                //     print("${element["devices"]}:${element.containsValue(chartData[data.pointIndex!].x)}");
                //   });
                //   print(chartData[data.pointIndex!].x);
                // });
                print(chartData[data.pointIndex!].x);
              },
              /*onDataLabelTapped: (data){
                setState(() {
                  print("hello");
                  print(chartData[data.pointIndex].x);
                });
                },*/
              legend: Legend(
                  // legendItemBuilder: (String name, dynamic series,dynamic point, int index){
                  //   return Container(
                  //     height: 30,
                  //       width: 80,
                  //       color: index==0?Colors.green:Colors.red,
                  //       // margin: index==0?EdgeInsets.only(top: 40):EdgeInsets.only(top: 20),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             name.toString(),
                  //             textAlign: TextAlign.start,
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 20,
                  //                 shadows: [
                  //                   Shadow(
                  //                     offset: Offset(1, 1),
                  //                     blurRadius: 1,
                  //                     color: Colors.black.withOpacity(0.8),
                  //                   ),
                  //                 ]
                  //             ),
                  //           ),
                  //
                  //         ],
                  //       )
                  //   );
                  //
                  //   //   Text(
                  //   //     name.toString(),
                  //   //   style: TextStyle(
                  //   //       color: Colors.white,
                  //   //       fontWeight: FontWeight.bold,
                  //   //       fontSize: 20,
                  //   //       shadows: [
                  //   //         Shadow(
                  //   //           offset: Offset(1, 1),
                  //   //           blurRadius: 1,
                  //   //           color: Colors.black.withOpacity(0.8),
                  //   //         ),
                  //   //       ]
                  //   //   ),
                  //   // );
                  // },

                isResponsive: false,
                toggleSeriesVisibility: false,
                isVisible: true,
                overflowMode: LegendItemOverflowMode.none,
                alignment: ChartAlignment.center,
                  position: LegendPosition.right,
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
                              _discover.length.toString(),
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
                  legendIconType: LegendIconType.seriesType,
                    /*onPointDoubleTap: (value){
                      setState(() {
                        _devicesSearch(chartData[value.pointIndex!].x);
                        print(chartData[value.pointIndex!].x);
                      });
                    },*/
                    onPointTap: (value){
                      print(value.pointIndex);
                      print(explode);
                      print(explodeIndex);
                      print(chartData[value.pointIndex!].x);

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
                        overflowMode: OverflowMode.none,
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
                    pointColorMapper: (ChartData data, int){

                      // Color _color = RandomColor().randomColor(
                      //   colorHue: ColorHue.blue,
                      //   colorSaturation: ColorSaturation.highSaturation,
                      //   colorBrightness: ColorBrightness.veryDark,
                      //   debug: true
                      // );
                      //
                      // return _color;

                      // Color _ms = RandomColor().randomColor(
                      //     colorHue: ColorHue.custom(Range.staticValue(
                      //         HSLColor.fromColor(Colors.blue).hue.toInt()
                      //     )),
                      //     colorSaturation: ColorSaturation.highSaturation,
                      //     colorBrightness: ColorBrightness.veryDark,
                      //     // debug: true
                      // );
                      //
                      // return _ms;

                      return Color(colors[int]);

                    },
                    // pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y
                )
              ],
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment(1,0.90),
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Container(
                    padding: EdgeInsets.all(2.5),
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
                          bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                      child: GestureDetector(
                        onTap: (){

                          // _elements.sort((a, b) => a["devices"].compareTo(b["devices"])); //sorting
                          // _elements.forEach((element) {
                          //   print(element["devices"]);
                          // });

                          /*List group= [];

                          _discover.forEach((element) {
                            group.add(element["group"]);
                          });

                          var map = Map();

                          group.forEach((x) => map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));*/

                          print(map);
                          print(map.keys.toList());

                          // group.sort();
                          // print(group.toSet());

                          // print("GROUP");
                          // final index1 = _elements.indexWhere((element) => element["devices"]=="Allitson-01");
                          // print(_discover.length-index1-1);
                          // print(index1);
                          // print(_discover[index1]);
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 5,
                          child: Container(
                              padding: EdgeInsets.all(10),
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
                              child: Text(
                                "GROUP",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  InkWell(
                    onTap: () {

                      print(UsersState().usersFilter);

                      UsersState().usersFilter.forEach((element) {
                        print(element["name"]);
                      });

                      /*setState(() {
                        _discover[0].addEntries([MapEntry("Document",demo)]);
                      });*/
                      // print(_discover[0]);

                      /*_discover.reversed.forEach((element) {
                        checkBoxAdd.add(element["devices"]);
                      });

                      print(checkBoxAdd);*/
                      print(checkBoxAdd);

                      /*for(var devices in checkBoxAdd){
                        print(devices);
                        setState(() {
                          _discover.where((element){
                            return element["devices"];
                          });
                        });
                      }*/

                      /*if(_discover.last.containsValue("Allitson-01")){
                        _discover.last["disable"]=!_discover.last["disable"];
                        print(_discover.last);
                      }else{
                        print("hello");
                      }*/

                      /*for(var i in {"Allitson-01","Allitson-02"}){
                        _discover.forEach((element) {
                          if(element.containsValue(i)){
                           element["disable"] = true;
                          }else{
                            return;
                          }
                        });
                      }*/

                      /*_discover.forEach((element){
                        print(element);
                      });*/

                      /*setState(() {
                        _discover.sort((a, b) => a["devices"].compareTo(b["devices"])); //sorting
                        _discover.forEach((element) {
                          print(element["devices"]);
                        });
                      });*/

                      // print(_discover.last["disable"]);

                      _devicesSearch("");
                      setState(() {

                        // _devicesSearch("");
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

                            Card(
                              color: Colors.transparent,
                              elevation: 5,
                              child: GestureDetector(
                                onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {

                                      return AlertDialog(
                                        actionsAlignment: MainAxisAlignment.center,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        backgroundColor: Colors.white70,
                                        actionsOverflowButtonSpacing: 10,
                                        elevation: 5,
                                        scrollable: true,
                                        // titlePadding: EdgeInsets.zero,
                                        // contentPadding: EdgeInsets.zero,
                                        title: Text("Group",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Container(
                                          // height: 200,
                                          // width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              // Text("GROUP"),

                                              // SizedBox(height: 17.5,),

                                              Container(
                                                // padding: EdgeInsets.symmetric(horizontal: 5),
                                                height: 47,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(
                                                        color: Colors.black.withOpacity(0.55))),
                                                child: TextField(
                                                  cursorColor: Colors.white,
                                                  autofocus: false,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: "Name",
                                                    border: InputBorder.none,
                                                      labelStyle: TextStyle(
                                                          color: Colors.black.withOpacity(0.6))
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 9,),



                                              /*Container(
                                                height: 47,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black.withOpacity(0.55)),
                                                ),
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: Center(
                                                  child: DropdownButton<String>(
                                                    hint: Text("Select Users"),
                                                    isExpanded: true,
                                                    value: selectedItem,
                                                    selectedItemBuilder: (BuildContext context) {
                                                      return items.map<Widget>((String item) {
                                                        return Text(item);
                                                      }).toList();
                                                    },
                                                    isDense: true,
                                                      onChanged: (String? string){
                                                        setState(() => selectedItem = string!);
                                                      },
                                                    items: UsersState().usersFilter.map((e){
                                                      return DropdownMenuItem<String>(
                                                          value: e["name"],
                                                        child: Text(e["name"]),
                                                      );
                                                    }).toList(),
                                                    // UsersState().usersFilter.forEach((element) {
                                                    //   element["name"].map((String item){
                                                    //     return DropdownMenuItem<String>(
                                                    //       value: item,
                                                    //       child: Text('Log $item'),
                                                    //     );
                                                    //   });
                                                    // }),
                                                    // items.map((String item) {
                                                    //   return DropdownMenuItem<String>(
                                                    //     value: item,
                                                    //     child: Text('Log $item'),
                                                    //   );
                                                    // }).toList(),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 9,),*/

                                              GestureDetector(
                                                onTap: (){

                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        actionsAlignment: MainAxisAlignment.center,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                        backgroundColor: Colors.white70,
                                                        insetPadding: EdgeInsets.zero,
                                                        // contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                                        titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                                                        actionsOverflowButtonSpacing: 10,
                                                        elevation: 5,
                                                        scrollable: false,
                                                        title: Text(
                                                          "Users",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.black.withOpacity(0.75),
                                                          ),
                                                        ),
                                                        content: Container(
                                                          width: MediaQuery.of(context).size.width*0.8,
                                                          // padding: EdgeInsets.all(20),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius: BorderRadius.circular(30.0),
                                                          ),
                                                          child: SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                for(int i=0;i<UsersState().usersFilter.length;i++)...[
                                                                  Row(
                                                                    children: [

                                                                      Flexible(
                                                                          child: Center(
                                                                              child: Text(
                                                                                  "${UsersState().usersFilter[i]["name"]}",
                                                                              )
                                                                          )
                                                                      ),

                                                                      Flexible(
                                                                        child: Center(
                                                                          child: Checkbox(
                                                                              value: false,
                                                                              onChanged: (value){
                                                                                print(UsersState().usersFilter[i]["name"]);
                                                                              }
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  )
                                                                ]
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(
                                                      color: Colors.black.withOpacity(0.55),
                                                      /*width: 1.5,
                                                      style: BorderStyle.solid*/
                                                    )
                                                  ),
                                                  child: Column(
                                                    children: [

                                                      Padding(
                                                        padding: const EdgeInsets.only(top:10,bottom: 10),
                                                        child: Text("USERS",
                                                          style: TextStyle(
                                                              color: Colors.black.withOpacity(0.75)),
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 5,bottom: 5),
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Icon(
                                                              Icons.add_box_outlined,
                                                            color: Colors.black.withOpacity(0.7),
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              )


                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black.withOpacity(0.5),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 0,
                                            offset: Offset(2, 4),
                                            color: Colors.black12.withOpacity(0.15)), //3dright
                                      ]),
                                  child: Row(
                                      children: [
                                        SizedBox(width: 3,),
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
                                            'Group',
                                            style: TextStyle(
                                                fontFamily: 'fonts/Roboto-Light.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.white.withOpacity(0.75)),
                                          ),
                                        ),
                                        SizedBox(width: 7.5,),
                                      ]),
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                  ),
                  /*gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)*/
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
                    Visibility(
                      visible: checkBox,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                height: 25,
                                margin: EdgeInsets.only(left: 7.5,right: 1,top: 1,bottom: 2.5),
                                child: ElevatedButton(
                                  onPressed: (){

                                    if(checkBoxAdd.isNotEmpty){

                                      for(var i in checkBoxAdd){
                                        _discover.forEach((element) {
                                          setState(() {
                                            if(element.containsValue(i)){
                                              element["disable"] = true;
                                            }else{
                                              return;
                                            }
                                          });
                                        });
                                      }

                                      setState(() {
                                        checkBox=false;
                                        selectAll=false;
                                        checkBoxAdd.clear();
                                      });

                                    }else{
                                      return;
                                    }

                                  },
                                  child: Text("Disable"),
                                  style: ButtonStyle(
                                    textStyle: MaterialStateProperty.all( TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    )
                                    ),
                                    animationDuration: Duration(milliseconds: 0),
                                    foregroundColor: MaterialStateProperty.resolveWith((states){
                                      if(states.contains(MaterialState.pressed)){
                                        return Colors.white;
                                      }
                                      return Color(0xff467695);
                                    }),
                                    backgroundColor:  MaterialStateProperty.resolveWith((states){
                                      if(states.contains(MaterialState.pressed)){
                                        return Color(0xff19547b);
                                      }
                                      return Colors.white;/*Color(0xffF1F1F1);*///0xffE2E2E2
                                    }),
                                    overlayColor:MaterialStateProperty.all(Colors.transparent),
                                  ),
                                ),
                              )
                          ),

                          Expanded(
                              child: Container(
                                height: 25,
                                margin: EdgeInsets.only(left: 1,right: 7.5,top: 1,bottom: 2.5),
                                child: ElevatedButton(
                                  onPressed: (){

                                    if(checkBoxAdd.isNotEmpty){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            alignment: Alignment.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            scrollable: true,
                                            insetPadding: EdgeInsets.zero,
                                            contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
                                            titlePadding: EdgeInsets.only(top: 15,bottom: 0),
                                            actionsPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.white,
                                            /*title: Text(
                                              "Remove Devices",
                                              style: TextStyle(),
                                              textAlign: TextAlign.center,
                                            ),*/
                                            title: Center(
                                              child: Text(
                                                "Are you sure you want to remove ?",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            content: Container(
                                              // height: 200,
                                              width: 350,
                                              constraints: BoxConstraints(
                                                  maxHeight: 200
                                              ),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Wrap(
                                                      children: [
                                                        for(var i in checkBoxAdd)
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 2.5,right: 2.5,top: 0,bottom: 0),
                                                            child: Chip(
                                                              label: Text(i),
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                                            actions: [

                                              SizedBox(
                                                width: 150,
                                                child: TextButton(
                                                    onPressed: (){
                                                      for(var devices in checkBoxAdd){
                                                        print(devices);
                                                        setState(() {
                                                          _discover.removeWhere((element) => element["devices"]==devices);
                                                          selectAll=false;
                                                        });

                                                        /*setState(() {
                                                          checkBox=false;
                                                          selectAll=false;
                                                          checkBoxAdd.clear();
                                                        });*/

                                                      }
                                                      checkBox=false;
                                                      checkBoxAdd.clear();
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                        color: Color(0xff19547b).withOpacity(0.9),
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ),

                                              SizedBox(
                                                width: 150,
                                                child: TextButton(
                                                    onPressed: (){
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                        color: Color(0xff19547b).withOpacity(0.9),
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                ),
                                              ),

                                            ],
                                          );
                                        },
                                      );
                                    }else{
                                      return;
                                    }


                                    /*for (var e in _elements){
                                      print(e);
                                    }*/

                                    /*for(var e in [0,1,2,3,4]){
                                      print(e);
                                      _discover.removeAt(e);
                                    }*/

                                    print(checkBoxAdd);

                                    /*for(var e in ["Allitson-01","Allitson-02"]){
                                      print(e);
                                      setState(() {
                                        _discover.removeWhere((element) => element["devices"]==e);
                                      });
                                    }*/

                                    /*print(checkBoxAdd[0]);
                                    print(_discover.last);*/
                                    /*setState(() {
                                      _discover.removeWhere((element) => element["devices"]=="Allitson-01");
                                    });*/

                                    /*_discover.forEach((element){
                                      setState(() {
                                        _discover.remove(element);
                                      });
                                    });*/

                                    // _discover.last.containsValue("Allitson-01");

                                    /*setState(() {
                                      _discover.removeAt(0);
                                    });*/

                                    /*_elements.forEach((element) {
                                      _discover.remove(element);
                                    });*/
                                  },
                                  child: Text("Remove"),
                                  style: ButtonStyle(
                                    textStyle: MaterialStateProperty.all( TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    )
                                    ),
                                    animationDuration: Duration(milliseconds: 0),
                                    foregroundColor: MaterialStateProperty.resolveWith((states){
                                      if(states.contains(MaterialState.pressed)){
                                        return Colors.white;
                                      }
                                      return Color(0xff467695);
                                    }),
                                    backgroundColor:  MaterialStateProperty.resolveWith((states){
                                      if(states.contains(MaterialState.pressed)){
                                        return Color(0xff19547b);
                                      }
                                      return Colors.white;/*Color(0xffF1F1F1);*///0xffE2E2E2
                                    }),
                                    // MaterialStateProperty.all(Color(0xffD3D3D3)),
                                    // /*backgroundColor: MaterialStateProperty.all(Colors.white),
                                    // overlayColor:MaterialStateProperty.resolveWith((states){
                                    //   if(states.contains(MaterialState.pressed)){
                                    //     return Color(0xff19547b);
                                    //   }
                                    //   return Colors.white;
                                    // }),*/
                                    overlayColor:MaterialStateProperty.all(Colors.transparent),
                                    /*shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.5),))*/
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),
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
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                  style: BorderStyle.solid,
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
                                    disController.animateTo(disController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
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
                                        color: Colors.white.withOpacity(0.3),
                                        width: 1,
                                        style: BorderStyle.solid,
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
            padding: EdgeInsets.only(right: 7.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5),
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
                  child: GestureDetector(
                    onTap: (){
                      _discover.forEach((element) {
                        if(element["members"]==true){
                          print(element["devices"]);
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                          "Last Activation",
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 5,),

                AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child:checkBox?IgnorePointer(
                    ignoring: _discover.isEmpty,
                    child: Transform.scale(
                      scale: 1,
                      child: Checkbox(
                        value: (visibleCheckBox.length==checkBoxAdd.length)?true:false,/*selectAll,*/
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (value){

                          setState(() {
                            selectAll=value!;
                          });

                          if(selectAll==true){
                            _discover.reversed.forEach((element) {
                              if(element["members"]==true){
                                checkBoxAdd.add(element["devices"]);
                              }else{return;}
                              // checkBoxAdd.add(element["devices"]);
                            });

                            print(checkBoxAdd);
                          }else{
                            checkBoxAdd.clear();
                          }

                          print(selectAll);

                          /*_discover.reversed.forEach((element) {
                            setState(() {
                              element["disable"]=value;
                              *//*print(element);*//*
                            });
                          });*/
                        },
                      ),
                    ),
                  ):SizedBox(
                    width: 48,
                  ),
                ),

                /*Transform.scale(
                  scale: 0.90,
                  child: Checkbox(
                    value: false,
                    onChanged: (bool? value){},
                  ),
                ),*/
                /*SizedBox(
                  width: 47.5,
                ),*/
              ],
            ),
          ),

          Expanded(
              child: GroupedListView<dynamic, String>(
                elements: _discover,
                groupBy: (_element) => _element['statusLive'],
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
                  return element["members"]? Card(
                    elevation: 5/*element["disable"]?0:5*/,
                    color: Colors.white.withOpacity(0.4),
                    shadowColor: Colors.black,
                    margin: EdgeInsets.only(left: 2.50,right: 2.50,top: 5,bottom: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: (){

                        // print(element["hardWareDetails"]["Ram"]);

                        /*_discover.sort((a, b) => a["devices"].length.compareTo(b["group"].length));
                        _discover.asMap().forEach((key, value) {
                          // print(-key+_discover.length);
                          print("${(-key+_discover.length)-1}:${value["devices"]}");
                        });*/

                        // print(_discover);

                        /*setState(() {
                          _discover.sort((a, b) => a["devices"].compareTo(b["devices"])); //sorting
                          _discover.forEach((element) {
                            print(element["devices"]);
                          });
                        });*/

                        /*setState(() {
                          _discover[_discover.length-int-1]["disable"] = true;
                        });
                        print(_discover[int]["disable"]);
                        print(element["disable"]);*/
                        // print(element["ipAddress"]);
                        /*print(element["disable"]);
                        print(element["remove"]);
                        print(element["enable"]);*/

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              scrollable: true,
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                              titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                              backgroundColor: Colors.white70,
                              title: Text(
                                element["devices"],
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                              content: Container(
                                height: 500,
                                width: 350,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      element["UserName"],
                                    ),

                                    /*Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 82),
                                              child: Text(
                                                  element["UserName"],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                            element["lastActive"],
                                        )
                                      ],
                                    ),*/

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("Last Active"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            element["lastActive"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("Platform"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            element["platform"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("OS"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            element["osDetails"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("CPU"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            element["hardWareDetails"]["cpu"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("RAM"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            element["hardWareDetails"]["Ram"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Agent ID"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              element["agentID"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "IP Address"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              element["ipAddress"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Public IP"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              element["publicIP"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Local IP"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              element["localIP"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Mac Address"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              element["macAddress"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        );

                        /*showDialog(
                            context: context,
                          builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, void Function(void Function()) setState) {
                                  return AlertDialog(
                                    alignment: Alignment.bottomCenter,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    scrollable: true,
                                    insetPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                    titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                                    backgroundColor: Colors.white70,
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          element["devices"],
                                          style: TextStyle(),
                                          textAlign: TextAlign.center,
                                        ),

                                        *//*Expanded(
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:47.5),
                                              child: Text(
                                                element["devices"],
                                                style: TextStyle(),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),*//*

                                        *//*Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            PopupMenuButton(
                                              onCanceled: (){
                                                print("onCanceled : $element");
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0),
                                                ),
                                              ),
                                              padding: EdgeInsets.zero,
                                              offset: Offset(-1,-1),
                                              enabled: true*//**//*(element["group"]=="Disabled")?false:true*//**//*,
                                              itemBuilder: (BuildContext context) {
                                                return [

                                                  PopupItem(
                                                    enabled: (element["group"]=="Offline"  || element["group"]=="Online"),
                                                    child: StatefulBuilder(
                                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                                        return IgnorePointer(
                                                          ignoring: !(element["group"]=="Offline"  || element["group"]=="Online"),
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              setState((){
                                                                element["disable"]=!element["disable"];
                                                                print(element);
                                                              });
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Text("Disable"),
                                                                ),
                                                                Expanded(
                                                                  child: Checkbox(
                                                                      value: element["disable"]==null?false:element["disable"],
                                                                      onChanged: (bool? value){
                                                                        *//**//*setState((){
                                                                          element["disable"]=value;
                                                                        });*//**//*
                                                                      }
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),

                                                  PopupItem(
                                                    enabled: (element["group"]=="Disabled"),
                                                    child: StatefulBuilder(
                                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                                        return IgnorePointer(
                                                          ignoring: !(element["group"]=="Disabled"),
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              setState((){
                                                                element["enable"]=!element["enable"];
                                                                print(element);
                                                              });
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Text("Enable"),
                                                                ),
                                                                Expanded(
                                                                  child: Center(
                                                                    child: Checkbox(
                                                                        value: element["enable"]==null?false:element["enable"],
                                                                        onChanged: (bool? value){
                                                                          *//**//*setState((){
                                                                          element["enable"]=value;
                                                                        });*//**//*
                                                                        }
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),

                                                  PopupItem(
                                                    enabled: (element["group"]=="Online"),
                                                      child: StatefulBuilder(
                                                        builder: (BuildContext context, void Function(void Function()) setState) {
                                                          return IgnorePointer(
                                                            ignoring: !(element["group"]=="Online"),
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                setState((){
                                                                  element["remove"]=!element["remove"];
                                                                  print(element);
                                                                });
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text("Remove"),
                                                                  ),
                                                                  Expanded(
                                                                    child: Center(
                                                                      child: Checkbox(
                                                                          value: element["remove"]==null?false:element["remove"],
                                                                          onChanged: (bool? value){
                                                                            *//**//*setState((){
                                                                        element["remove"]=value;
                                                                      });*//**//*
                                                                          }
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      )
                                                  ),

                                                  *//**//*PopupMenuItem(
                                                    enabled: (element["group"]=="Offline"  || element["group"]=="Online"),
                                                    onTap: (){
                                                      setState((){
                                                        element["disable"]=!element["disable"];
                                                      });
                                                    },
                                                      child: IgnorePointer(
                                                        ignoring: (element["group"]=="Offline"  || element["group"]=="Online"),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text("Disable"),
                                                            ),
                                                            Expanded(
                                                              child: Checkbox(
                                                                  value: element["disable"]==null?false:element["disable"],
                                                                  onChanged: (value){
                                                                    setState((){
                                                                      element["disable"]=value;
                                                                    });
                                                                  }
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ),*//**//*

                                                  *//**//*PopupMenuItem(
                                                      enabled: (element["group"]=="Disabled"),
                                                      onTap: (){
                                                        setState((){
                                                          element["enable"]=!element["enable"];
                                                        });
                                                      },
                                                      child: IgnorePointer(
                                                        ignoring: (element["group"]=="Disabled"),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text("Enable"),
                                                            ),
                                                            Expanded(
                                                              child: Center(
                                                                child: Checkbox(
                                                                    value: element["enable"]==null?false:element["enable"],
                                                                    onChanged: (bool? value){
                                                                      *//**//**//**//*setState((){
                                                                        element["enable"]=value;
                                                                      });*//**//**//**//*
                                                                    }
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ),*//**//*

                                                  *//**//*PopupMenuItem(
                                                    enabled: (element["group"]=="Online"),
                                                    onTap: (){
                                                      setState((){
                                                        element["remove"]=!element["remove"];
                                                      });
                                                    },
                                                    child: IgnorePointer(
                                                      ignoring: (element["group"]=="Online"),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text("Remove"),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Checkbox(
                                                                  value: element["remove"]==null?false:element["remove"],
                                                                  onChanged: (bool? value){
                                                                    *//**//**//**//*setState((){
                                                                      element["remove"]=value;
                                                                    });*//**//**//**//*
                                                                  }
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),*//**//*

                                                ];
                                              },
                                            ),
                                          ],
                                        )*//*

                                      ],
                                    ),
                                    content: Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      // height: 350,
                                      width: 350,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
*//**//*
                                          *//*SizedBox(
                                            height: 45,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                          "Agent ID"
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        element["agentID"].toString()
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),*//*

                                          *//*SizedBox(
                                            height: 45,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                          "IP Address"
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        element["ipAddress"].toString()
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),*//*

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                  child: Checkbox(
                                                      value: element["callPermission"],
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.grey,
                                                      shape:  RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      onChanged:(value){
                                                        *//*print(element);
                                                          print(_discover[_discover.length-int-1]);*//*
                                                        setState(() {
                                                          element["callPermission"]=value;
                                                        });
                                                      })
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Call Permission",
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                  child: Checkbox(
                                                      value: element["remotePermission"],
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.grey,
                                                      shape:  RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      onChanged:(value){
                                                        setState(() {
                                                          element["remotePermission"] = value;
                                                        });
                                                      })
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Remote Permission",
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                  child: Checkbox(
                                                      value: element["disableRemote"],
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.grey,
                                                      shape:  RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      onChanged:(value){
                                                        setState(() {
                                                          element["disableRemote"]=value;
                                                        });
                                                      })
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Disable Remote",
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                  child: Checkbox(
                                                      value: element["disableCall"],
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.grey,
                                                      shape:  RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      onChanged:(value){
                                                        setState(() {
                                                          element["disableCall"]=value;
                                                        });
                                                      })
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Disable Call",
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                  child: Checkbox(
                                                      value: element["disableScript"],
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.grey,
                                                      shape:  RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      onChanged:(value){
                                                        setState(() {
                                                          element["disableScript"]=value;
                                                        });
                                                      })
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Disable Script",
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                          },
                        );*/

                        /*setState(() {
                          _discover.remove(element);
                        });*/


                      },
                      onLongPress: (){
                        // print(checkBox);
                        // checkBox=true;
                        // checkDialog();

                        setState(() {

                          _discover.reversed.forEach((element) {
                            if(element["members"]==true){
                              visibleCheckBox.add(element["devices"]);
                            }else{return;}
                            // checkBoxAdd.add(element["devices"]);
                          });

                          checkBox=!checkBox;
                        });

                        print(visibleCheckBox);

                        /*showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.95,
                          ),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              *//*constraints: BoxConstraints(
                                maxHeight: *//**//*MediaQuery.of(context).size.height - *//**//*300,
                              ),*//*
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
                        );*/

                      },
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: element["disable"]?Color(0xff19547b).withOpacity(0.9):Color(0xff19547b).withOpacity(0.6)/*Color(0xff404b60).withOpacity(0.9)*/
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
                                ),

                                AnimatedSwitcher(
                                  duration: Duration(milliseconds: 250),
                                  child: checkBox?Checkbox(
                                      value: checkBoxAdd.contains(element["devices"]),/*element["disable"],*/
                                      checkColor: Colors.white,
                                      activeColor: Colors.grey,
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onChanged: (value){


                                        Clipboard.setData(ClipboardData()); // Vibration
                                        HapticFeedback.heavyImpact();

                                        if(checkBoxAdd.contains(element["devices"])){
                                          setState(() {
                                            checkBoxAdd.remove(element["devices"]);
                                          });
                                        }else{
                                          setState(() {
                                            checkBoxAdd.add(element["devices"]);
                                          });
                                        }

                                        print(checkBoxAdd);
                                        // print(value);
                                        /*setState(() {
                                          element["disable"]=value;
                                          print(element);
                                        });*/
                                      }
                                  ):PopupMenuButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (BuildContext context) {
                                      return [

                                        PopupMenuItem(
                                          child: Text("Edit"),
                                          onTap: (){

                                            WidgetsBinding.instance?.addPostFrameCallback((_){
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext context, void Function(void Function()) setState) {
                                                      return AlertDialog(
                                                        alignment: Alignment.bottomCenter,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30.0),
                                                        ),
                                                        scrollable: true,
                                                        insetPadding: EdgeInsets.zero,
                                                        contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                                        titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                                                        backgroundColor: Colors.white70,
                                                        title: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [

                                                            Text(
                                                              element["devices"],
                                                              style: TextStyle(),
                                                              textAlign: TextAlign.center,
                                                            ),

                                                          ],
                                                        ),
                                                        content: Container(
                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                          // height: 350,
                                                          width: 350,
                                                          padding: EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius: BorderRadius.circular(30.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Expanded(
                                                                      child: Checkbox(
                                                                          value: element["callPermission"],
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.grey,
                                                                          shape:  RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          onChanged:(value){
                                                                            /*print(element);
                                                                            print(_discover[_discover.length-int-1]);*/
                                                                            setState(() {
                                                                            element["callPermission"]=value;
                                                                            print(element);
                                                                            });
                                                                          })
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Call Permission",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Expanded(
                                                                      child: Checkbox(
                                                                          value: element["remotePermission"],
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.grey,
                                                                          shape:  RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          onChanged:(value){
                                                                            setState(() {
                                                                              element["remotePermission"] = value;
                                                                            });
                                                                          })
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Remote Permission",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Expanded(
                                                                      child: Checkbox(
                                                                          value: element["disableRemote"],
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.grey,
                                                                          shape:  RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          onChanged:(value){
                                                                            setState(() {
                                                                              element["disableRemote"]=value;
                                                                            });
                                                                          })
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Disable Remote",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Expanded(
                                                                      child: Checkbox(
                                                                          value: element["disableCall"],
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.grey,
                                                                          shape:  RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          onChanged:(value){
                                                                            setState(() {
                                                                              element["disableCall"]=value;
                                                                            });
                                                                          })
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Disable Call",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  Expanded(
                                                                      child: Checkbox(
                                                                          value: element["disableScript"],
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.grey,
                                                                          shape:  RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          onChanged:(value){
                                                                            setState(() {
                                                                              element["disableScript"]=value;
                                                                            });
                                                                          })
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Disable Script",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            });
                                          },
                                        ),

                                        PopupMenuItem(
                                          child: Text("Remove"),
                                          onTap: (){
                                            setState(() {
                                              _discover.remove(element);
                                            });
                                          },
                                        ),

                                        PopupMenuItem(
                                          onTap: (){
                                            setState(() {
                                              element["disable"]=!element["disable"];
                                            });
                                            print(element);
                                          },
                                          child: Text(
                                            element["disable"]?"Enable":"Disable",
                                            style: TextStyle(
                                              // color: element["disable"]?Colors.grey:null,
                                            ),
                                          ),

                                        ),

                                        /*CustomPopupMenuItem(
                                          onTap:(){
                                            element["disable"]=!element["disable"];
                                            print(element["disable"]);
                                          },
                                          color: element["disable"]?Colors.green:Colors.transparent,
                                          child: Text("Disable"),
                                        ),*/

                                      ];
                                    },
                                  ),
                                ),

                                /*Checkbox(
                                    value: false,
                                    onChanged: (bool? value){}
                                ),*/

                                /*PopupMenuButton(
                                  itemBuilder: (BuildContext context) {
                                    return [

                                      PopupMenuItem(
                                        child: Text("Edit"),
                                      ),

                                      PopupMenuItem(
                                        child: Text("Remove"),
                                      ),

                                      PopupMenuItem(
                                        child: Text("Disable"),
                                      )
                                    ];
                                  },
                                ),*/
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
                  ):Container();
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
          // padding: EdgeInsets.only(top: 12.5),
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                height: 27.5,
                padding: EdgeInsets.only(right: 7.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Row(
                  children: [

                    SizedBox(width: 10,),

                    Flexible(
                      child: Center(
                        child: Text(
                          "Host Name",
                        ),
                      ),
                    ),

                    Flexible(
                      child: Center(
                        child: Text(
                          "Agent ID",
                        ),
                      ),
                    ),

                    Flexible(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Discovered Time",
                        ),
                      ),
                    ),

                    // SizedBox(width: 48,),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: disController,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: _discover.length,
                  itemBuilder: (BuildContext context, int index) {

                    _discover..sort((a,b) => b["block"].toString().compareTo(a["block"].toString()));

                    return _discover[index]["members"]?Container():GestureDetector(
                      onTap: (){

                        // print(_discover.reversed);

                        /*setState(() {
                          _discover.sort((a,b) => a["disable"].toString().compareTo(b["disable"].toString()));
                          // print(_discover.reversed);
                          _discover.forEach((element) {
                            print(element["disable"]);
                          });
                        });*/

                        // print(DateTime.now());
                        //
                        // print("${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}");

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              scrollable: true,
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                              titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                              backgroundColor: Colors.white70,
                              title: Text(
                                _discover[index]["devices"],
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                              content: Container(
                                height: 500,
                                // width: MediaQuery.of(context).size.width*0.95,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      _discover[index]["UserName"],
                                    ),

                                    /*Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 82),
                                              child: Text(
                                                _discover[index]["UserName"],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          _discover[index]["lastActive"],
                                        )
                                      ],
                                    ),*/

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: Center(
                                              child: Text("Last Active"),
                                            ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            _discover[index]["lastActive"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("Platform"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            _discover[index]["platform"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text("OS"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            _discover[index]["osDetails"],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Agent ID"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              _discover[index]["agentID"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "IP Address"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              _discover[index]["ipAddress"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "IP Address"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0),
                                                child: Text(
                                                    "Public IP : ${_discover[index]["publicIP"].toString()}"
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8.0),
                                                child: Text(
                                                   "Local IP : ${_discover[index]["localIP"].toString()}"
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                    /*Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Public IP"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              _discover[index]["publicIP"].toString()
                                          ),
                                        ),
                                      ],
                                    ),*/

                                    /*Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Local IP"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              _discover[index]["localIP"].toString()
                                          ),
                                        ),
                                      ],
                                    ),*/

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                "Mac Address"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              _discover[index]["macAddress"].toString()
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Card(
                        elevation: 5/*_discover[index]["block"]?0:8.0*/,
                        color: Colors.white.withOpacity(0.4),
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(left: 2.50,right: 2.50,top: 5,bottom: 5),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color:_discover[index]["block"]?Colors.grey.withOpacity(0.4):Color(0xff19547b).withOpacity(0.65),/*Color(0xff19547b).withOpacity(0.85),*/ /*Colors.blueGrey.withOpacity(0.9)*/),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Text(_discover[index]['devices']),

                              Text(_discover[index]["agentID"].toString()/*.substring(8)*/),

                              Text("${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}"),

                              SizedBox(
                                width: 20,
                                child: Center(
                                  child: PopupMenuButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (BuildContext context) {
                                      return [

                                        PopupMenuItem(
                                            onTap: (){
                                              setState(() {
                                                _discover[index]["members"] = true;
                                              });
                                            },
                                            child: Text("Add")),

                                        PopupMenuItem(
                                          onTap: (){
                                            setState(() {
                                              /*final int removeInt = index;
                                              _discover.removeAt(removeInt);*/
                                              _discover.remove(_discover[index]);
                                            });
                                            // print(_discover[index]);
                                          },
                                          child: Text("Remove"),
                                        ),

                                        PopupMenuItem(
                                          onTap: (){

                                            setState(() {
                                              _discover[index]["block"] = !_discover[index]["block"];
                                            });

                                            /*setState(() {
                                              final block = _discover[index];
                                              _discover.remove(block);
                                              _discover.insert(0, block);
                                            });*/
                                            print(_discover[index]);
                                          },
                                          child: Text(_discover[index]["block"]?"Unblock":"Block"),
                                        ),
                                      ];
                                    },
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
  ChartData(this.x, this.y/*,this.color*/);
  final String x;
  final int y;
  // final Color color;
}

/*class PopupItem extends PopupMenuItem {
  const PopupItem({
    required Widget child,
    bool enabled = true,
    // VoidCallback? onTap,
    Key? key,
  }) : super(key: key, child: child, enabled: enabled*//*,onTap: onTap*//*);

  @override
  _PopupItemState createState() => _PopupItemState();
}

class _PopupItemState extends PopupMenuItemState {
  @override
  void handleTap() {
    // widget.onTap?.call();
  }
}*/





/*class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final Color color;

  const CustomPopupMenuItem({
    Key? key,
    T? value,
    bool enabled = true,
    Widget? child,
    VoidCallback? onTap,
    required this.color,
  }) : super(key: key, value: value, enabled: enabled, child: child,onTap: onTap);

  @override
  _CustomPopupMenuItemState<T> createState() => _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T> extends PopupMenuItemState<T, CustomPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: super.build(context),
      color: widget.color,
    );
  }
}*/
