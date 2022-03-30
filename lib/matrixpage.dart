import 'dart:async';
import 'dart:math';
import 'dart:ui';
// import 'dart:html';
// import 'package:allitson/script.dart';
import 'package:allitson/chart.dart';
import 'package:badges/badges.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:measured_size/measured_size.dart';

import 'package:shimmer/shimmer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

final List<Map<String, dynamic>> ticket = [
  {
    "HostName": "PCAL0050",
    "Image": "assets/vectorright.png",
    "Severity": "High",
    "Type": "Manual",
    "sysNumber": "C0001",
    "problemText":
        "Browser not opening tried to fix but not possible Browser not opening tried to fix but not possible Browser not opening tried to fix but not possible ",
    "problemTime": "04:53",
    "dateTime": "01-12-2021 8.00 AM",
    "Status": "Not Resolved",
    "loadingIndicator": false,
  },
  {
    "HostName": "PCAL0051",
    "Image": "assets/greenticket.png",
    "Severity": "Medium",
    "Type": "Automatic",
    "sysNumber": "C0002",
    "problemText": "Browser not opening tried to fix but not possible",
    "problemTime": "04:53",
    "dateTime": "01-12-2021 8.00 AM",
    "Status": "Resolved",
    "loadingIndicator": false,
  },
  {
    "HostName": "PCAL0052",
    "Image": "assets/yellowticket.png",
    "Severity": "Low",
    "Type": "Manual",
    "sysNumber": "C0003",
    "problemText": "Browser not opening tried to fix but not possible",
    "problemTime": "04:53",
    "dateTime": '01-12-2021 8.00 AM',
    "Status": 'Not Resolved',
    "loadingIndicator": false,
  },
  {
    "HostName": "PCAL0053",
    "Image": 'assets/whiteticket.png',
    "Severity": 'Information',
    "Type": 'Automatic',
    "sysNumber": 'C0004',
    "problemText": 'Browser not opening tried to fix but not possible',
    "problemTime": '04:53',
    "dateTime": '01-12-2021 8.00 AM',
    "Status": 'Resolved',
    "loadingIndicator": false,
  },
];

List _elements = [
  {
    'Time': '8:00 AM',
    'Color': Color(0xff9B4244),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff569556),
    'Severity': 'Medium',
    'SystemNumber': 'A0002',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffB7AA5E),
    'Severity': 'Low',
    'SystemNumber': 'A0003',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffA66A40),
    'Severity': 'Information',
    'SystemNumber': 'A0004',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff4C709A),
    'Severity': 'Average',
    'SystemNumber': 'A0005',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0006',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0007',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0008',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0009',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': 'Today'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0010',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': 'Today'
  }, //
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0011',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0012',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0013',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0014',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0015',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0016',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0017',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0018',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0019',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '03-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0020',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '03-02-2022'
  }, //
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '02-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '02-02-2022'
  }, //
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '01-02-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '01-02-2022'
  }, //
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffE20000),
    'Severity': 'High',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff8CE95E),
    'Severity': 'Medium',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffEDE13D),
    'Severity': 'Low',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xffFDFDFD),
    'Severity': 'Information',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it shows no boot files found.',
    'group': '31-01-2022'
  },
  {
    'Time': '8:00 AM',
    'Color': Color(0xff99E9EE),
    'Severity': 'Average',
    'SystemNumber': 'A0001',
    'ErrorText': 'System is not booting, it show an unknow error ',
    'group': '31-01-2022'
  },
];

enum WidgetMarker { dashboard, incident, devices }                          // Drawer
enum IncidentMarker { main, chat, notification, script, terminal} // Inside Incident
enum DevicesMarker {discover, discovered}

class MatrixPage extends StatefulWidget {
  const MatrixPage({Key? key}) : super(key: key);

  @override
  _MatrixPageState createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {

  final CustomTimerController _controllerTime = CustomTimerController();

  @override
  void dispose() {
    _controllerTime.dispose();
    super.dispose();
  }

  final GlobalKey<AnimatorWidgetState> basicAnimation =
  GlobalKey<AnimatorWidgetState>();

  List<Map<String, dynamic>> _foundTicket = [];                   //Search at getAssignedTicket

  Map<String, Set<String>> memorybar = Map();                     // Memorybar Data


  @override
  initState() {
    // at the beginning, all users are shown
    _foundTicket = ticket;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = ticket;
    } else {
      results = ticket
          .where((user) => user["sysNumber"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundTicket = results;
    });
  }

  double value = 0;
  IncidentMarker selectedIncidentWidgetMarker = IncidentMarker.main;   //Inside Incident Starting home
  WidgetMarker selectedWidgetMarker = WidgetMarker.devices;           // Drawer Starting home
  DevicesMarker selectedDevicesMarker = DevicesMarker.discover;

  bool _ticketExpand = false;                                           // getAssignedTicket
  bool _isChatButton = true;                                            // getAssignedTicket -> Stack -> Red:White
  bool _isCallButton = true;                                            // getAssignedTicket -> Stack -> Red:White
  bool _isRemoteButton = true;                                          // getAssignedTicket -> Stack -> Red:White
  bool _isScriptButton = true;                                          // getAssignedTicket -> Stack -> Red:White
  bool _isTerminalButton = true;                                        // getAssignedTicket -> Stack -> Red:White
  bool _isUpdatesButton = true;                                         // getAssignedTicket -> Stack -> Red:White
  bool _isActionsButton = true;                                         // getAssignedTicket -> Stack -> Red:White
  bool _isForwardButton = true;                                         // getAssignedTicket -> Stack -> Red:White
  bool _isPendingButton = true;                                         // getAssignedTicket -> Stack -> Red:White
  bool _isUnAvailableButton = true;                                     // getAssignedTicket -> Stack -> Red:White
  bool _isResolveButton = true;                                         // getAssignedTicket -> Stack -> Red:White
  bool _isActionCloseButton = true;                                     // getAssignedTicket -> Stack -> Red:White
  bool _buttonPosition = false;                                         // getAssignedTicket -> Stack -> Red:White

  bool _selectedTicketIndex = true;
  int selectedIndex = -1;
  bool _enterAction = true;                                             // getAssignedTicket -> Visibility Chat to Actions

  bool width = true;                                                    // Search at getAssignedTicket Expand
  bool flag = false;                                                    // Search at getAssignedTicket AnimatedSwitcher

  Size mySize = Size.zero;

  bool _remote = false;                                                  // Remote Visible <-> Invisible
  var _sysNumber = "System Number";

  var _index ;

  bool _callIgnore = false;

  bool mic = false;
  bool speaker = false;
  bool call = false;

  bool _callVisibility = false;

  /*var memoryWidgets = <String>[];
  var _memoryWidgets = [];*/

  bool memory() {
    if (memorybar[_sysNumber]?.length == null) {
      return false;
    } else if (memorybar[_sysNumber]?.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  /*double target() {
    if (_remote == false &&
        _foundTicket[_index]['loadingIndicator'] == false &&
        _ticketExpand == false) {
      return MediaQuery.of(context).size.height - 348;
    } else if (_remote == false &&
        _foundTicket[_index]['loadingIndicator'] == true &&
        _ticketExpand == false) {
      return MediaQuery.of(context).size.height - 348;
    } else if (_ticketExpand == true &&
        _foundTicket[_index]['loadingIndicator'] == false) {
      return MediaQuery.of(context).size.height - 348;
    } else if (_remote == false && _ticketExpand == true) {
      return MediaQuery.of(context).size.height - 393;
    } else if (_foundTicket[_index]['loadingIndicator'] == true &&
        _ticketExpand == true &&
        _remote == false) {
      return MediaQuery.of(context).size.height - 393;
    } else if (_remote == true) {
      return MediaQuery.of(context).size.height * 0.25;
    } else {
      return 0;
    }
  }*/


  @override
  Widget build(BuildContext context) {

    memorybar.forEach((key, value) {
      if (key == _foundTicket[_index]['sysNumber']) {
        if (value.length > 0) {
          _foundTicket[_index]['loadingIndicator'] = true;
        } else {
          _foundTicket[_index]['loadingIndicator'] = false;
        }
      }
    });

    /*_memoryWidgets=memoryWidgets.toSet().toList();*/

    // for (final i in ticket){
    //   // print(i['sysNumber']);
    //   // memorybar.keys;
    //   i['sysNumber'].add(memorybar);
    // }
    // print(memorybar);

    /*memorybar.forEach((key, value) {
      print('${key}: ${value.toList()}');
    });

    print(_sysNumber);
    // print(memorybar['C0001']!.length);

    if(memorybar['C0001']?.length==null){
      print('hello');
    }else{
      print(memorybar['C0001']?.length);
    }*/
    // main();
    /*print(memorybar);*/

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                /*image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    AssetImage('assets/rectangle.png')),*/
                /*gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)*/
          gradient: LinearGradient(
              colors: [
                Color(0xffB0C8C8),
                // Color(0xffCE90AE),
                // Color(0xff8D6679),
                Color(0xff19547b),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
              // color: Colors.black87
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.all(0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      // borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                          'https://static.wikia.nocookie.net/dcanimated/images/2/21/Batman_%28BTAS%29.png/revision/latest?cb=20191206112827',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, loadingBuilder:
                              (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return ClipOval(
                          child: Shimmer(
                            period: Duration(milliseconds: 1500),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.2),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            // highlightColor: Colors.white,
                            // baseColor: Colors.black,
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              /*child: CircularProgressIndicator(
                                        color: Colors.black,
                                        value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),*/
                            ),
                          ),
                        );
                      }),
                    ),
                    //  CircleAvatar(
                    //   radius: 50,
                    //   backgroundImage: NetworkImage(
                    //       'https://static.wikia.nocookie.net/dcanimated/images/2/21/Batman_%28BTAS%29.png/revision/latest?cb=20191206112827'),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'USERNAME',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 20),
                    ),
                  ],
                )),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.dashboard;
                            value = 0;
                          });
                        },
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/dashboardlarge.png',
                              color: Colors.white.withOpacity(1)),
                        ),
                        title: Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.incident;
                            value = 0;
                          });
                        },
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/incidentlarge.png',
                              color: Colors.white.withOpacity(1)),
                        ),
                        title: Text(
                          'Incidents',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            selectedWidgetMarker = WidgetMarker.devices;
                            value = 0;
                          });
                        },
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/deviceslarge.png',
                              color: Colors.white.withOpacity(1)),
                        ),
                        title: Text(
                          'Devices',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      // ListTile(
                      //   onTap: () {},
                      //   leading: Icon(Icons.settings),
                      //   title: Text('Report'),
                      // ),
                      ListTile(
                        onTap: () {},
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/report.png',
                              color: Colors.white.withOpacity(1)),
                        ),
                        title: Text(
                          'Report',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/userslarge.png',
                              color: Colors.white.withOpacity(1)),
                        ),
                        title: const Text(
                          'Users',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/settinglarge.png',
                              color: Colors.white.withOpacity(1)),
                        ),
                        title: Text(
                          'Profile',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DefaultTextStyle(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white54,
                              ),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0),
                                child:
                                    Text('Terms of Service | Privacy Policy'),
                              ),
                            ),
                            // Icon(
                            //   Icons.power_settings_new_sharp,
                            //   color: Colors.white60,
                            //   size: 35.0,
                            //   semanticLabel: 'Text to announce in accessibility modes',
                            // ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInSine,
              builder: (_, double val, __) {
                return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0019)
                      ..setEntry(0, 3, 260 * val)
                      ..rotateY((pi / 12) * val),
                    child: Stack(
                      children: [

                        getSelectedDrawer(),

                        Caller(),
                      ],
                    )
                );
              })
        ],
      ),
    );
  }

  Widget getSelectedDrawer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.dashboard:
        return getDashboard();
      case WidgetMarker.incident:
        return getIncident();
      case WidgetMarker.devices:
        return getDevices();
    }
  }

  Widget getDashboard() {
    return WillPopScope(
      onWillPop: () async {
        print('hello');
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                borderRadius: value == 1
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.green,
                      Colors.white
                      // Color(0xff497D7D),
                      // Color(0xff8D6679)
                    ])),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top+20)),
                getDashboardAppbar(),
              ],
            )
            // GestureDetector(
            //   onTap: (){
            //     setState(() {
            //       value==0 ? value=1 : value=0;
            //     });
            //   },
            // )
            ),
      ),
    );
  }

  Widget getDashboardAppbar() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/incidentappbar.png')),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(1, 1),
                  color: Color(0xff000000).withOpacity(0.30)),
              BoxShadow(
                  blurRadius: 10,
                  offset: -Offset(1, 1),
                  color: Color(0xff000000).withOpacity(0.30)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(70)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      AnimatedSwitcher(
                        switchInCurve: Curves.linear,
                        switchOutCurve: Curves.easeOut,
                        duration: Duration(milliseconds: 750),
                        reverseDuration: Duration(milliseconds: 0),
                        transitionBuilder: (child, animation) =>
                            RotationTransition(
                          child: child,
                          turns: animation,
                        ),
                        child: value == 1
                            ? GestureDetector(
                                key: Key('2'),
                                onTap: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: Colors.black.withOpacity(0.7),
                                        width: 3),
                                  ),
                                  child: Icon(
                                    Icons.clear_rounded,
                                    color: Colors.black.withOpacity(0.7),
                                    size: 26.5,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                key: Key('1'),
                                onTap: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                                child: Image.asset(
                                  'assets/menu12.png',
                                  width: 32,
                                  height: 32,
                                  color: Colors.black.withOpacity(0.7),
                                  // color: Colors.black,
                                ),
                              ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 7.5)),
                      GestureDetector(
                        onTap: () {
                          /*Navigator.of(context).pop();*/
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatrixIncident()));*/
                        },
                        child: GradientText(
                          'DASHBOARD',
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          colors: [
                            // Color(0xFFffffff),
                            Colors.grey,
                            Color(0xFF063D61),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            /*shadows: [
                              Shadow(
                                offset: Offset(0.5, 0.5),
                                blurRadius: 1,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],*/
                            /*color:Color(0xff451618),*//*Colors.black.withOpacity(0.85),*//* Color(0XFF19547B).withOpacity(1),*/
                            fontFamily: 'Roboto-Thin',
                            fontWeight: FontWeight.w900,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }

  /*Widget getSelectedDrawer(){
    switch (selectedWidgetMarker){
      case WidgetMarker.dashboard:
        return getDashboard();
      case WidgetMarker.incident:
        return getIncident();
    }
  }*/

  Widget getIncidentSwitchContainer() {
    switch (selectedIncidentWidgetMarker) {
      case IncidentMarker.main:
        return getstartingIncident();
      case IncidentMarker.chat:
        return getChatContainer();
      case IncidentMarker.notification:
        return getNotification();
      case IncidentMarker.script:
        return getScript();
      case IncidentMarker.terminal:
        return getTerminal();
    }
  }

  Widget getIncident() {
    /*DateTime _lastExitTime = DateTime.now();*/
    return WillPopScope(
      onWillPop: () async {
        if(_remote==true){
          setState(() {
            _remote = false;
          });
          return false;
        }else if(selectedIncidentWidgetMarker == IncidentMarker.chat){
          setState(() {
            selectedIncidentWidgetMarker = IncidentMarker.main;
          });
          return false;
        }else if(selectedIncidentWidgetMarker == IncidentMarker.notification){
          setState(() {
            selectedIncidentWidgetMarker = IncidentMarker.main;
          });
          return false;
        }else if(selectedIncidentWidgetMarker == IncidentMarker.script){
          setState(() {
            selectedIncidentWidgetMarker = IncidentMarker.main;
          });
          return false;
        }/*else if(_buttonPosition==true){
          print('hello');
          setState(() {
            _selectedTicketIndex = false;
            selectedIndex = _index;

            _buttonPosition = true;
            _ticketExpand = true;
          });
          return false;
        }*/else if(_enterAction==false){
          setState(() {
            _enterAction=true;
          });
          return false;
        }else if(_callVisibility == true){
          setState(() {
            _callVisibility = false;
          });
          return false;
        }else{
          _foundTicket.forEach((element) {
            element["loadingIndicator"]=false;
          });
          return true;
          /*if (DateTime.now().difference(_lastExitTime) >= Duration(milliseconds: 750)) {
            //showing message to user
            final snack =  SnackBar(
              elevation: 6,
              margin: EdgeInsets.all(10),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content:  Text(
                  "Press the back button again to exit",
                style: TextStyle(color: Colors.white70),
              ),
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            _lastExitTime = DateTime.now();
            return false; // disable back press
          } else {
            return true; //  exit the app
          }*/
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: Color(0xffB0C8C8),
                borderRadius: value == 1
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff19547b),
                      Color(0xffB0C8C8),
                     /* Color(0xff8D6679),
                      Color(0xff7EB4F2),
                      Color(0xff8D6679),*/])
            ),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_callVisibility==true){
                        _callVisibility=false;
                      }
                    });
                  },
                ),
                IgnorePointer(
                  ignoring: _callVisibility==true?true:false,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top+20)),
                      getIncidentAppbar(),

                      Visibility(
                        visible: (memory() && _ticketExpand == true),
                        /*(memorybar[_sysNumber]?.length!=null||memorybar[_sysNumber]?.length==0),*/
                        /*memorybar[_sysNumber]?.length==null?false:true,*/
                        /*memorybar[_sysNumber]?.length != null?true:false,*/
                        // memorybar.containsKey(_sysNumber)?true:false,
                        child: Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin:
                              EdgeInsets.only(top: 7.5, bottom: 5, left: 0, right: 0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/incidentappbar.png')),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(1, 1),
                                    color: Color(0xff000000).withOpacity(0.30)),
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: -Offset(1, 1),
                                    color: Color(0xff000000).withOpacity(0.30)),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(70)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 7.5, vertical: 0.5),
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: memorybar.containsKey(_sysNumber)
                                            ? memorybar[_sysNumber]!.length
                                            : 0,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // memorybar.remove('C0001');
                                                memorybar.forEach((key, value) {
                                                  if (key == _sysNumber) {                            //Switching on Visible MemoryBar only Remote and Chat Added
                                                    /*value.remove('assets/calliconpadding.png');*/
                                                    if (value.toList()[index] ==
                                                        'assets/chaticon250.png') {
                                                      if (selectedIncidentWidgetMarker ==
                                                          IncidentMarker.main) {                      // Switching Between Main and Chat Container
                                                        selectedIncidentWidgetMarker =
                                                            IncidentMarker.chat;
                                                        _remote = false;
                                                      } else {
                                                        selectedIncidentWidgetMarker =
                                                            IncidentMarker.main;
                                                        _remote = false;
                                                      }
                                                    } else if (value.toList()[index] ==
                                                        'assets/remoteiconpadding.png') {            // Turning ON and OFF Remote
                                                      _remote = !_remote;
                                                    } else if (value.toList()[index] ==
                                                        'assets/callicongreenpadding1.gif'){
                                                      _callVisibility=!_callVisibility;
                                                    } else if (value.toList()[index] == 'assets/calliconpadding.png'){
                                                      _callVisibility=!_callVisibility;
                                                    } else if (value.toList()[index] == 'assets/scripticonpadding.png'){
                                                      if (selectedIncidentWidgetMarker ==
                                                          IncidentMarker.main){
                                                        selectedIncidentWidgetMarker =
                                                            IncidentMarker.script;
                                                        _remote = false;
                                                      }else {
                                                        selectedIncidentWidgetMarker =
                                                            IncidentMarker.main;
                                                        _remote = false;
                                                      }
                                                    } else if(value.toList()[index] == 'assets/terminaliconpadding.png'){
                                                      if (selectedIncidentWidgetMarker == IncidentMarker.main){
                                                        selectedIncidentWidgetMarker = IncidentMarker.terminal;
                                                        _remote = false;
                                                      }else {
                                                        selectedIncidentWidgetMarker =
                                                            IncidentMarker.main;
                                                        _remote = false;
                                                      }
                                                    }
                                                    /*for (String i in value.toList()){
                                                      if(i=='assets/chaticon250.png'){
                                                        if(selectedIncidentWidgetMarker == IncidentMarker.main){
                                                          selectedIncidentWidgetMarker = IncidentMarker.chat;
                                                        }else{
                                                          selectedIncidentWidgetMarker = IncidentMarker.main;
                                                        }
                                                      }else if(i=='assets/remoteiconpadding.png'){
                                                        _remote = !_remote;
                                                      }
                                                    }*/
                                                  }
                                                });
                                              });
                                              // print(memorybar[_sysNumber]);
                                            },
                                            child: LongPressDraggable(
                                              data: memorybar[_sysNumber],
                                              onDragStarted: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  duration: Duration(seconds: 60),
                                                  padding: EdgeInsets.zero,
                                                  backgroundColor: Colors.transparent,
                                                  behavior: SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(24),
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context).size.height -
                                                              62.5),
                                                  content: DragTarget(
                                                    onAccept: (remove) {

                                                      setState(() {

                                                        /*if(memorybar[_sysNumber]?.contains('assets/callicongreenpadding1.gif')==true){
                                                          print('_callIgnore1=false');
                                                          _callIgnore=false;
                                                        } else if(memorybar[_sysNumber]?.contains('assets/calliconpadding.png')==true){
                                                          print('_callIgnore2=false');
                                                          _callIgnore=false;
                                                        }*/

                                                        memorybar.forEach((key, value) {
                                                          if (key == _sysNumber) {
                                                            value.remove(
                                                                memorybar[_sysNumber]!.toList()[index]);

                                                            if(value.contains('assets/callicongreenpadding1.gif')){
                                                              print('$key , hello1');
                                                              _callIgnore=true;
                                                            }else if(value.contains('assets/calliconpadding.png')){
                                                              print('$key , hello2');
                                                              _callIgnore=true;
                                                            }else{
                                                              _callIgnore=false;
                                                              _controllerTime.reset();
                                                            }

                                                            selectedIncidentWidgetMarker =
                                                                IncidentMarker.main;
                                                            _remote = false;
                                                          }
                                                        });
                                                      });
                                                      // print(memorybar[_sysNumber]);
                                                    },
                                                    builder: (context, _, __) => Container(
                                                      height: 62.5,
                                                      width:
                                                          MediaQuery.of(context).size.width,
                                                      decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: [
                                                            Color(0xffE35353),
                                                            Color(0xffE35353)
                                                                .withOpacity(0.0),
                                                          ],
                                                              begin: Alignment.topCenter,
                                                              end: Alignment.bottomCenter)),
                                                    ),
                                                  ),
                                                ));
                                              },
                                              onDragEnd: (remove) {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                              },
                                              childWhenDragging: SizedBox(width: 45),
                                              feedback: Material(
                                                color: Colors.transparent,
                                                child: Transform.scale(
                                                  alignment: Alignment(0,1.25),
                                                  scale: 2.5,
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    margin: EdgeInsets.only(left: 8.5),
                                                    child: Image.asset(
                                                      memorybar[_sysNumber]!.elementAt(index),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              child: Container(
                                                height: 32.5,
                                                width: 32.5,
                                                margin: EdgeInsets.only(left: 10),
                                                child: Image.asset(
                                                    memorybar[_sysNumber]!.elementAt(index),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12.5),
                                  child: Text(
                                    _sysNumber,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3,
                                          color: Colors.black,
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /*Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(top: 7.5, left: 0, right: 0, bottom: 5),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/incidentappbar.png')),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(1, 1),
                                  color: Color(0xff000000).withOpacity(0.30)),
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: -Offset(1, 1),
                                  color: Color(0xff000000).withOpacity(0.30)),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                          ),
                          child: Row(
                            children: _widgetMemory.toList()
                          ),
                      ),
                      ),*/

                      /*Visibility(
                        visible: _memoryWidgets.length!=0?true:false,
                        child: DelayedDisplay(
                          slidingBeginOffset: Offset(0, -0.20),
                          fadeIn: true,
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(top: 7.5,left: 0,right: 0,bottom: 5),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/incidentappbar.png')),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(1, 1),
                                      color: Color(0xff000000).withOpacity(0.30)),
                                  BoxShadow(
                                      blurRadius: 10,
                                      offset: -Offset(1, 1),
                                      color: Color(0xff000000).withOpacity(0.30)),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(70)),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 7.5,vertical: 0.5),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                  itemCount: _memoryWidgets.length,
                                    itemBuilder: (context, index){
                                      return LongPressDraggable(
                                        data: memoryWidgets,
                                        onDragEnd: (remove){
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        },
                                        onDragStarted: (){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: Duration(seconds: 60),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.transparent,
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom:  MediaQuery.of(context).size.height - 62.5
                                            ),
                                                content: DragTarget(
                                                  onAccept: (remove){
                                                    setState(() {
                                                      this.memoryWidgets.removeAt(index);
                                                    });
                                                  },
                                                  builder: (context, _, __) => Container(
                                                    height: 62.5,
                                                    width: MediaQuery.of(context).size.width,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xffE35353),
                                                          Color(0xffE35353).withOpacity(0.0),
                                                        ],
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter
                                                      )
                                                    ),
                                                  ),
                                                ),
                                          ));
                                        },
                                        childWhenDragging: Container(),
                                        feedback: Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            height: 32.5,
                                            width: 32.5,
                                            margin: EdgeInsets.only(left: 5),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(_memoryWidgets[index])
                                                )
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          height: 32.5,
                                          width: 32.5,
                                          margin: EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(_memoryWidgets[index])
                                            )
                                          ),
                                        ),
                                      );
                            }),
                              )
                              */ /*Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Container()]*/ /**/ /*this.memoryWidgets.toSet().toList()*/ /**/ /*
                              ),*/ /*
                          ),
                          ),
                        ),
                      ),*/

                      Container(
                        padding:
                            EdgeInsets.only(top: 0, left: 17.5, right: 17.5, bottom: 0),
                        margin: EdgeInsets.only(top: 2.5),
                        child: Column(
                          children: [
                            Visibility(
                              visible: _remote,
                              child: DelayedDisplay(
                                slidingBeginOffset: Offset(-0.5, 0.0),
                                fadingDuration: Duration(milliseconds: 750),
                                fadeIn: _remote,
                                child: Card(
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Colors.transparent,
                                  elevation: 5,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/monitor.png',
                                        ),
                                      ),
                                      /*AnimatedContainer(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage('assets/screenshot.png'),
                                            fit: BoxFit.contain
                                          )
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        // margin: EdgeInsets.only(top: 7.5,left: 20,right: 20,bottom: 7.5),
                                        height: _remote?210:0,
                                        width: _remote?MediaQuery.of(context).size.width:0,
                                      ),*/
                                      Positioned(
                                        top: 6,
                                        right: 5,
                                        child: DelayedDisplay(
                                          fadingDuration: Duration(milliseconds: 2750),
                                          fadeIn: _remote,
                                          child: Icon(
                                            Icons.fullscreen,
                                            color: Colors.white,
                                            size: 21,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _remote,
                              child: DelayedDisplay(
                                fadingDuration: Duration(milliseconds: 1250),
                                fadeIn: _remote,
                                child: Align(
                                  alignment: Alignment(1, 0),
                                  child: Card(
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: Colors.transparent,
                                    elevation: 5,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 1000),
                                      height: 22,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xff6F0309),
                                          borderRadius: BorderRadius.circular(25)),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 7.5, bottom: 0),
                                            child: Icon(
                                              Icons.fullscreen,
                                              color: Colors.white,
                                              size: 21,
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 7.5),
                                              child: Text(
                                                'View on Full screen',
                                                style: TextStyle(
                                                    fontSize: 14, color: Colors.white),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      getIncidentSwitchContainer(),
                      // getAssignedTicket(),
                      // getUnAssignedTicket(),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget getstartingIncident() {
    return Expanded(
      child: Column(
        children: [
          getAssignedTicket(),
          // getUnAssignedTicket(),
          Expanded(
              child:Container(
                margin: EdgeInsets.only(left: 7.5,right: 7.5,top: 15,bottom: 0),
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
      )
    );
    /*Expanded(
      child: Column(
        children: [
          getAssignedTicket(),
          getUnAssignedTicket(),
        ],
      ),
    );*/
  }

  Widget getChatContainer() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.blueGrey,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.white70.withOpacity(0.1),
                    width: 0.5,
                  ),
                  gradient: LinearGradient(
                      colors: [
                        // Color(0xffB0C8C8),
                        Color(0xff19547b),
                        // Color(0xff497D7D).withOpacity(0.8),
                        // Color(0xff91BBD2).withOpacity(0.35),
                        Color(0xff91BBD2).withOpacity(0.8),
                        // Color(0xff8D6679).withOpacity(0.8),
                      ],
                      // stops: [0.0,1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      offset: Offset(1, 0),
                      color: Colors.black.withOpacity(0.4)),
                  //3dright
                  BoxShadow(
                      blurRadius: 3,
                      offset: Offset(0, 1),
                      color: Colors.black.withOpacity(0.4)),
                  // 3dbottom
                  // BoxShadow(
                  //     blurRadius: 1,
                  //     offset: -Offset(1, 0),
                  //     color: Colors.black.withOpacity(0.5)),
                  //3dleft
                  // BoxShadow(
                  //     blurRadius: 1,
                  //     offset: -Offset(0, 1),
                  //     color: Colors.black.withOpacity(0.9)),
                ],
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors: [
                  Color(0xffEAE2E2).withOpacity(0.9),
                  Color(0xffABA4A4)
                  // Colors.white,
                  // Colors.black,
                ], stops: [
                  0.6,
                  1.0
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                color: Colors.black,
              ),
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 7.5),
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    CustomPopupMenu(
                      arrowColor: Colors.transparent,
                      horizontalMargin: 17.5,
                      verticalMargin: 5,
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color(0xff1A5099).withOpacity(1),
                        size: 32.5,
                      ),
                      menuBuilder: () {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DelayedDisplay(
                              delay: Duration(milliseconds: 300),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.transparent,
                                elevation: 8,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffEAE2E2).withOpacity(0.9),
                                          Color(0xffABA4A4)
                                          // Colors.white,
                                          // Colors.black,
                                        ],
                                        stops: [
                                          0.6,
                                          1.0
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.insert_photo_outlined,
                                      color: Color(0xff1A5099).withOpacity(1),
                                      size: 32.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            DelayedDisplay(
                              delay: Duration(milliseconds: 200),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.transparent,
                                elevation: 8,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffEAE2E2).withOpacity(0.9),
                                          Color(0xffABA4A4)
                                          // Colors.white,
                                          // Colors.black,
                                        ],
                                        stops: [
                                          0.6,
                                          1.0
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.ondemand_video_outlined,
                                      color: Color(0xff1A5099).withOpacity(1),
                                      size: 32.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            DelayedDisplay(
                              delay: Duration(milliseconds: 100),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.transparent,
                                elevation: 8,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffEAE2E2).withOpacity(0.9),
                                          Color(0xffABA4A4)
                                          // Colors.white,
                                          // Colors.black,
                                        ],
                                        stops: [
                                          0.6,
                                          1.0
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.folder_outlined,
                                      color: Color(0xff1A5099).withOpacity(1),
                                      size: 32.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      pressType: PressType.singleClick,
                    ),
                    /*Icon(
                    Icons.add_circle_outline_rounded,
                    color: Color(0xff1A5099).withOpacity(1),
                    size: 32.5,
                  ),*/
                    Expanded(
                      child: Container(
                        // height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(left: 5, right: 5),
                        padding: EdgeInsets.only(left: 7.5, right: 7.5),
                        width: 50,
                        child: TextField(
                          minLines: 1,
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black.withOpacity(0.25),
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: 'Message',
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          'assets/send1.png',
                          height: 31,
                        )),
                    /*Icon(
                    Icons.send_rounded,
                    color: Color(0xff1A5099).withOpacity(1),
                    size: 32.5,
                  ),*/
                  ],
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.vertical,
          ),
        ],
      ),
    );
  }

  Widget getNotification() {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height-100,
        // color: Colors.blueGrey,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              style: BorderStyle.solid,
              color: Colors.white70.withOpacity(0.1),
              width: 0.5,
            ),
            gradient: LinearGradient(
                colors: [
                  // Color(0xffB0C8C8),
                  Color(0xff19547b),
                  // Color(0xff497D7D).withOpacity(0.8),
                  // Color(0xff91BBD2).withOpacity(0.35),
                  // Color(0xff9A85B4),
                  // Color(0xffA3818F)
                  Color(0xff91BBD2).withOpacity(0.8),
                  // Color(0xff8D6679).withOpacity(0.8),
                ],
                // stops: [0.0,1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Notification',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getScript(){
    final _controllerScripting = TextEditingController();
    _controllerScripting.text = "Scripting";

    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height-100,
        // color: Colors.blueGrey,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                style: BorderStyle.solid,
                color: Colors.white70.withOpacity(0.1),
                width: 0.5,
              ),
              gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.1),
                    // Color(0xffB0C8C8),
                    // Color(0xff19547b),
                    // Color(0xff497D7D).withOpacity(0.8),
                    // Color(0xff91BBD2).withOpacity(0.35),
                    // Color(0xff9A85B4),
                    // Color(0xffA3818F)
                    // Color(0xff91BBD2).withOpacity(0.8),
                    // Color(0xff8D6679).withOpacity(0.8),
                  ],
                  // stops: [0.0,1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(30.0),
                            ),
                            scrollable: true,
                            insetPadding: EdgeInsets.all(40),
                            contentPadding: EdgeInsets.all(0),
                            backgroundColor: Colors.white60,
                            content: Container(
                              height: 300,
                              width: 320,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black
                                      .withOpacity(0.8),
                                  width: 3,
                                ),
                                // color: Color(0xffB5B5B5),
                                borderRadius:
                                BorderRadius.circular(30.0),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff19547b),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ShutDown',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Colors.black.withOpacity(0.2),
                                          width: 1),
                                    ),
                                    height: 100,
                                    margin: EdgeInsets.only(
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text(
                                              'Script:',
                                              style: TextStyle(
                                                color: Colors.black87.withOpacity(0.5),
                                                fontSize: 15.5,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'fonts/Roboto-Regular.ttf',
                                              ),)
                                          ],
                                        ),
                                        TextField(
                                          controller: _controllerScripting,
                                          minLines: null,
                                          maxLines: null,
                                          keyboardType: TextInputType.multiline,
                                          textInputAction: TextInputAction.done,
                                          cursorColor: Colors.black.withOpacity(0.2),
                                          showCursor: true,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelStyle:
                                              TextStyle(
                                                fontFamily: 'raster',
                                                color: Colors.black.withOpacity(0.6),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: Colors.black.withOpacity(0.2),
                                            width: 1),
                                      ),
                                      height: 100,
                                      margin: EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 0,
                                          bottom: 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Description:',
                                                style: TextStyle(
                                                  color: Colors.black87.withOpacity(0.5),
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'fonts/Roboto-Regular.ttf',
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.only(left: 10,right: 10),
                                            child: Text(
                                              'To Shutdown the Computer in schedule time',
                                              style: TextStyle(
                                                color: Colors.black87.withOpacity(0.6),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'fonts/Roboto-Regular.ttf',
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  ElevatedButton(
                                      child: Text(
                                        "RUN SCRIPT",
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            color:
                                            Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), // <-- Radius
                                        ),
                                        primary: Color(0xff19547b),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: ListTile(
                    leading: Image.asset(
                      'assets/scriptscripting.png',
                      height: 60,
                      width: 60,
                    ),
                    title:Text("ShutDown",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.75),
                    ),),
                    subtitle: Text('To Shutdown the Computer in schedule time'),
                  ),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("LockScreen",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Sleep",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Defender Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("ShutDown",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("LockScreen",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Sleep",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Defender Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("ShutDown",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("LockScreen",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Sleep",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Defender Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("ShutDown",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("LockScreen",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Sleep",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Image.asset(
                    'assets/scriptscripting.png',
                    height: 60,
                    width: 60,
                  ),
                  title:Text("Windows Defender Update",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.75),
                  ),),
                  subtitle: Text('To Shutdown the Computer in schedule time'),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget getTerminal(){

    final _controllerTerminal = TextEditingController();
    _controllerTerminal.text = 'Microsoft Windows [Version 10.0.19044.1586]\n(c) Microsoft Corporation. All rights reserved.\n\nC:\Users\ADMIN>';

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height-100,
              // color: Colors.blueGrey,
              decoration: BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.white70.withOpacity(0.1),
                    width: 0.5,
                  ),
              ),
              padding: EdgeInsets.only(left: 10,right: 10),
              margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
              child: TextField(
                maxLines:null,
                focusNode: FocusNode(),
                textInputAction: TextInputAction.go,
                controller: _controllerTerminal,
                // onChanged: (value){
                //  print( _controllerTerminal.text);
                // },
                onSubmitted: (value){
                  print( _controllerTerminal.text);
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.vertical,
          ),
        ],
      ),
    );
  }

  Widget getIncidentAppbar() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 7.5),
      margin: EdgeInsets.only(bottom: 9),
      child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/incidentappbar.png')),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(1, 1),
                  color: Color(0xff000000).withOpacity(0.30)),
              BoxShadow(
                  blurRadius: 10,
                  offset: -Offset(1, 1),
                  color: Color(0xff000000).withOpacity(0.30)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(70)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      AnimatedSwitcher(
                        switchInCurve: Curves.linear,
                        switchOutCurve: Curves.easeOut,
                        duration: Duration(milliseconds: 750),
                        reverseDuration: Duration(microseconds: 0),
                        transitionBuilder: (child, animation) =>
                            /*ScaleTransition(
                          child: child,
                          scale: animation,
                        ),*/
                            RotationTransition(
                          child: child,
                          turns: animation,
                        ),
                        child: value == 1
                            ? GestureDetector(
                                key: Key('2'),
                                onTap: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: Colors.black.withOpacity(0.7),
                                        width: 3),
                                  ),
                                  child: Icon(
                                    Icons.clear_rounded,
                                    color: Colors.black.withOpacity(0.7),
                                    size: 26.0,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                key: Key('1'),
                                onTap: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                                child: Image.asset(
                                  'assets/menu12.png',
                                  width: 32,
                                  height: 32,
                                  color: Colors.black.withOpacity(0.7),
                                  // color: Colors.black,
                                ),
                              ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 7.5)),
                      GestureDetector(
                        onTap: () {
                          /*Navigator.of(context).pop();*/
                          setState(() {
                            /*print(_foundTicket[0]['loadingIndicator']);*/
                            print( selectedIncidentWidgetMarker == IncidentMarker.main);
                            selectedIncidentWidgetMarker = IncidentMarker.main;
                          });
                        },
                        child: GradientText(
                          'INCIDENTS',
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          colors: [
                            // Color(0xFFffffff),
                            Colors.grey,
                            Color(0xFF063D61),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            /*shadows: [
                              Shadow(
                                offset: Offset(0.5, 0.5),
                                blurRadius: 1,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],*/
                            /*color:Color(0xff451618),*//*Colors.black.withOpacity(0.85),*//* Color(0XFF19547B).withOpacity(1),*/
                            fontFamily: 'Roboto-Thin',
                            fontWeight: FontWeight.w900,
                            fontSize: 19,
                          ),
                        ),
                          /*Shimmer(
                            enabled: true,
                            period: Duration(seconds: 3),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF19547B),
                                  Color(0xFF19547B),
                                  Color(0xFF19547B),
                                  Color(0xFF19547B),
                                  Colors.white,
                                  Color(0xFF19547B),
                                  Color(0xFF19547B),
                                  Color(0xFF19547B),
                                  Color(0xFF19547B),
                                ]
                            ),
                            child: Text(
                              'INCIDENTS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // shadows: [
                                //   Shadow(
                                //     offset: Offset(1, 1),
                                //     blurRadius: 2,
                                //     color: Colors.black.withOpacity(0.5),
                                //   ),
                                // ],
                                *//*color:Color(0xff451618),*//**//*Colors.black.withOpacity(0.85),*//**//* Color(0XFF19547B).withOpacity(1),*//*
                                fontFamily: 'Roboto-Thin',
                                fontWeight: FontWeight.w900,
                                fontSize: 19,
                              ),
                            ),
                          )*/
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  // onDoubleTap: (){
                  //   setState(() {
                  //     selectedIncidentWidgetMarker = IncidentMarker.main;
                  //   });
                  // },
                  onTap: () {
                    _remote = false;
                    basicAnimation.currentState!.forward();
                    setState(() {

                      _selectedTicketIndex = true;
                      selectedIndex = (_index==null)?0:_index;

                      _buttonPosition = false;
                      _ticketExpand = false;

                      selectedIncidentWidgetMarker =
                          IncidentMarker.notification;
                    });
                  },
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Badge(
                          position: BadgePosition.topStart(top: -3),
                          toAnimate: true,
                          shape: BadgeShape.circle,
                          showBadge: false,
                          animationType: BadgeAnimationType.fade,
                          badgeColor: Colors.deepPurple,
                          badgeContent: Text(
                            '1',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          child: Tada(
                            key: basicAnimation,
                            child: Icon(
                              Icons.notifications_sharp,
                              color: Colors.black.withOpacity(0.85),
                              size: 32,
                            ),
                          ),
                        )),
                  ),
                )
              ])),
    );
  }

  Widget getAssignedTicket() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 230,
                  margin: EdgeInsets.only(left: 15, right: 15,top: 2.5),
                  color: Colors.transparent,
                  child: ListView.builder(
                    /*separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 0);
              },*/
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _foundTicket.length,
                      itemBuilder: (context, index) {
                        return Visibility(
                          visible: (_selectedTicketIndex || selectedIndex == index)
                              ? true
                              : false,
                          child: Container(
                            // padding: EdgeInsets.only(left: 0),
                            // margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                            color: Colors.transparent,
                            width: _ticketExpand ? 333 : 188.94,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    /*print(index);*/
                                    setState(() {
                                      _selectedTicketIndex = !_selectedTicketIndex;
                                      selectedIndex = index;

                                      _buttonPosition = !_buttonPosition;
                                      _ticketExpand = !_ticketExpand;

                                      _remote = false;

                                      if (_enterAction == false) {
                                        _enterAction = true;
                                      }
                                      _index = index;
                                      _sysNumber = ticket[index]['sysNumber'];
                                    });

                                    /*setState(() {
                            if( _enterAction == false ){
                               _enterAction= true;
                            }
                          });*/
                                  },
                                  child: LongPressDraggable(
                                    data: ticket,
                                    maxSimultaneousDrags: 1,
                                    delay: Duration(milliseconds: 500),
                                    onDragStarted: () {
                                      _index = index;
                                      final snackBar = SnackBar(
                                          duration: Duration(seconds: 60),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          behavior: SnackBarBehavior.floating,
                                          margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                          backgroundColor:
                                          Colors.transparent.withOpacity(0.2),
                                          content: DragTarget(
                                            onAccept: (receivedContainer) {
                                              showModalBottomSheet(
                                                constraints: BoxConstraints(
                                                  maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.958,
                                                  minHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.80,
                                                ),
                                                isScrollControlled: true,
                                                backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    constraints: BoxConstraints(
                                                      // minHeight: MediaQuery.of(context).size.height *0.80,
                                                      maxHeight:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.80,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'assets/assignedticketsdetails.png')),
                                                      borderRadius: BorderRadius.only(
                                                        topRight: Radius.circular(45),
                                                        topLeft: Radius.circular(45),
                                                        bottomRight:
                                                        Radius.circular(30),
                                                        bottomLeft:
                                                        Radius.circular(30),
                                                      ),
                                                    ),
                                                    child: SingleChildScrollView(
                                                      reverse: true,
                                                      child: ConstrainedBox(
                                                        constraints: BoxConstraints(
                                                            minHeight:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.80),
                                                        child: IntrinsicHeight(
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      20.0)),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Center(
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index][
                                                                      "sysNumber"],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                          fontSize:
                                                                          24),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Center(
                                                                      child:
                                                                      GestureDetector(
                                                                        // onTap: () => Navigator.pop(context),
                                                                        child:
                                                                        Container(
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(50)),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                  blurRadius:
                                                                                  5,
                                                                                  offset: Offset(8,
                                                                                      8),
                                                                                  color:
                                                                                  Color(0xff000000).withOpacity(0.10)),
                                                                            ],
                                                                          ),
                                                                          child:
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(50)),
                                                                            child:
                                                                            GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                // Navigator.pop(context, "This string will be passed back to the parent",);
                                                                              },
                                                                              child:
                                                                              Container(
                                                                                color:
                                                                                Color(0xff5F4E4E).withOpacity(0.45),
                                                                                height:
                                                                                19,
                                                                                width:
                                                                                115,
                                                                                child:
                                                                                Center(
                                                                                  child:
                                                                                  Text(
                                                                                    'Records',
                                                                                    style: TextStyle(
                                                                                      color: Colors.white,
                                                                                      fontFamily: 'fonts/Roboto-Bold.ttf',
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'HostName',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index][
                                                                      'HostName'],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'IP Address',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'IP Address',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Date & Time',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index][
                                                                      "dateTime"],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          17),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Duration',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Duration',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Severity',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index][
                                                                      'Severity'],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Type',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index]
                                                                      ["Type"],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Notes',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index][
                                                                      "problemText"],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      5.0)),
                                                              Expanded(
                                                                  child: Container()),
                                                              Row(
                                                                children: [
                                                                  // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                  Expanded(
                                                                      child:
                                                                      Container()),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      'Status',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 4,
                                                                    fit:
                                                                    FlexFit.tight,
                                                                    child: Text(
                                                                      _foundTicket[
                                                                      index]
                                                                      ['Status'],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                          'fonts/Roboto-Bold.ttf',
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                          18),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                          right:
                                                                          10.0)),
                                                                ],
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      10.0)),
                                                              Center(
                                                                child:
                                                                // Padding(padding: EdgeInsets.only(right: 15.0)),
                                                                Text(
                                                                  'Updates:',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'fonts/Roboto-Bold.ttf',
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                      fontSize: 18),
                                                                ),
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      15.0)),
                                                              // TextField(),
                                                              Center(
                                                                  child: ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius
                                                                            .circular(
                                                                            10)),
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(
                                                                              context)
                                                                              .size
                                                                              .width *
                                                                              0.90,
                                                                          color: Color(
                                                                              0xffC4C4C4)
                                                                              .withOpacity(
                                                                              0.20),
                                                                          height: 70,
                                                                          child:
                                                                          TextField(
                                                                            scrollPadding:
                                                                            EdgeInsets
                                                                                .only(
                                                                                top: 40),
                                                                            showCursor:
                                                                            true,
                                                                            cursorColor:
                                                                            Colors
                                                                                .white70,
                                                                            keyboardType:
                                                                            TextInputType
                                                                                .text,
                                                                            textInputAction:
                                                                            TextInputAction
                                                                                .done,
                                                                            style:
                                                                            TextStyle(
                                                                              fontFamily:
                                                                              'fonts/Roboto-Bold.ttf',
                                                                              fontSize:
                                                                              18,
                                                                            ),
                                                                            textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                            decoration:
                                                                            InputDecoration
                                                                                .collapsed(
                                                                              hintText:
                                                                              "Notes",
                                                                              border:
                                                                              InputBorder
                                                                                  .none,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: MediaQuery.of(
                                                                              context)
                                                                              .size
                                                                              .width *
                                                                              0.90,
                                                                          color: Color(
                                                                              0xff486C7B),
                                                                          child: Text(
                                                                            'Update',
                                                                            textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                            style:
                                                                            TextStyle(
                                                                              color: Colors
                                                                                  .white,
                                                                              fontFamily:
                                                                              'fonts/Roboto-Bold.ttf',
                                                                              fontWeight:
                                                                              FontWeight
                                                                                  .w600,
                                                                              fontSize:
                                                                              18,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .viewInsets
                                                                    .vertical,
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                      10.0)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                              // }
                                            },
                                            builder: (context, _, __) => SizedBox(
                                                height: (mySize.height.toDouble())-25.5,
                                                /* target(),*/
                                                /*height: MediaQuery.of(context).size.height-338,*/
                                                // 508.07142857142856-30,
                                                child: Center(
                                                    child: Shimmer.fromColors(
                                                        highlightColor:
                                                        Color(0xff333333),
                                                        baseColor: Colors.white,
                                                        child: Text(
                                                          'Drop Here For More Info!',
                                                          style:
                                                          TextStyle(fontSize: 18),
                                                        )))),
                                          ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    onDraggableCanceled: (a, b) {
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      });
                                    },
                                    onDragEnd: (hello) {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    },
                                    feedback: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        height: 210,
                                        width: 153.94,
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.5),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(1, 0),
                                                color: Colors.black.withOpacity(0.8)),
                                            //3dright
                                            BoxShadow(
                                                blurRadius: 0,
                                                offset: Offset(0, 1),
                                                color: Colors.black.withOpacity(0.9)),
                                            //3dbottom
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: -Offset(1, 0),
                                                color: Colors.black.withOpacity(0.8)),
                                            //3dleft
                                            BoxShadow(
                                                blurRadius: 0,
                                                offset: -Offset(0, 1),
                                                color: Colors.black.withOpacity(0.9)),
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                              AssetImage('assets/rectangle.png')),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(top: 10.0)),
                                            Row(
                                              children: [
                                                if(_foundTicket[index]["Severity"]=="High") ...[
                                                  Image.asset("assets/vectorright.png")
                                                ]else if(_foundTicket[index]["Severity"]=="Medium") ...[
                                                  Image.asset("assets/greenticket.png")
                                                ]else if(_foundTicket[index]["Severity"]=="Low") ...[
                                                  Image.asset("assets/yellowticket.png")
                                                ]else if(_foundTicket[index]["Severity"]=="Information") ...[
                                                  Image.asset("assets/whiteticket.png")
                                                ],
                                                /*Image.asset(
                                                    _foundTicket[index]["Image"]),*/
                                                Padding(
                                                    padding:
                                                    EdgeInsets.only(right: 5.0)),
                                                Text(
                                                  _foundTicket[index]['sysNumber'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'fonts/Roboto-Bold.ttf',
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 24),
                                                ),
                                                /*Visibility(
                                            visible: false,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 4, left: 5),
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: LoadingIndicator(
                                                  indicatorType:
                                                      Indicator.ballScale,
                                                  colors: [
                                                    Colors.green,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),*/
                                              ],
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 3.0)),
                                            SizedBox(
                                              height: 108,
                                              width: 112,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Text(
                                                  _foundTicket[index]['problemText'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 13.0)),
                                            Text(
                                              _foundTicket[index]['problemTime'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 1.5)),
                                            Text(
                                              _foundTicket[index]['dateTime'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.65),
                                                  fontFamily: 'fonts/Roboto-Thin.ttf',
                                                  // fontWeight: FontWeight.normal,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    childWhenDragging: Stack(
                                      children: [
                                        Container(
                                          height: 210,
                                          width: 153.94,
                                          margin: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: Offset(1, 0),
                                                  color:
                                                  Colors.black.withOpacity(0.8)),
                                              //3dright
                                              BoxShadow(
                                                  blurRadius: 0,
                                                  offset: Offset(0, 1),
                                                  color:
                                                  Colors.black.withOpacity(0.9)),
                                              //3dbottom
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: -Offset(1, 0),
                                                  color:
                                                  Colors.black.withOpacity(0.8)),
                                              //3dleft
                                              BoxShadow(
                                                  blurRadius: 0,
                                                  offset: -Offset(0, 1),
                                                  color:
                                                  Colors.black.withOpacity(0.9)),
                                            ],
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/rectangle.png')),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 10.0)),
                                              Row(
                                                children: [
                                                  if(_foundTicket[index]["Severity"]=="High") ...[
                                                    Image.asset("assets/vectorright.png")
                                                  ]else if(_foundTicket[index]["Severity"]=="Medium") ...[
                                                    Image.asset("assets/greenticket.png")
                                                  ]else if(_foundTicket[index]["Severity"]=="Low") ...[
                                                    Image.asset("assets/yellowticket.png")
                                                  ]else if(_foundTicket[index]["Severity"]=="Information") ...[
                                                    Image.asset("assets/whiteticket.png")
                                                  ],
                                                  /*Image.asset(
                                                      _foundTicket[index]["Image"]),*/
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 5.0)),
                                                  Text(
                                                    _foundTicket[index]['sysNumber'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'fonts/Roboto-Bold.ttf',
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 24),
                                                  ),
                                                  /*Visibility(
                                              visible: false,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0.0,
                                                    bottom: 4,
                                                    left: 5),
                                                child: SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: LoadingIndicator(
                                                    indicatorType:
                                                        Indicator.ballScale,
                                                    colors: [
                                                      Colors.green,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),*/
                                                ],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(top: 3.0)),
                                              SizedBox(
                                                height: 108,
                                                width: 112,
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: Text(
                                                    _foundTicket[index]
                                                    ['problemText'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 13.0)),
                                              Text(
                                                _foundTicket[index]['problemTime'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(top: 1.5)),
                                              Text(
                                                _foundTicket[index]['dateTime'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff000000)
                                                        .withOpacity(0.65),
                                                    fontFamily:
                                                    'fonts/Roboto-Thin.ttf',
                                                    // fontWeight: FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned.fill(
                                            child: BackdropFilter(
                                              filter:
                                              ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                              child: Container(
                                                color: Colors.transparent,
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                    child: Card(
                                      color: Colors.transparent,
                                      elevation: 5,
                                      shadowColor: Colors.black.withOpacity(0.15),
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..setEntry(3, 2, 0.0019)
                                          ..setEntry(0, 3, 0)
                                          ..rotateY(!_ticketExpand ? 0 : -(pi / 18)),
                                        child: Container(
                                          height: 210,
                                          width: 153.94,
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10, top: 0, bottom: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.5),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: Offset(1, 0),
                                                  color:
                                                  Colors.black.withOpacity(0.8)),
                                              //3dright
                                              BoxShadow(
                                                  blurRadius: 0,
                                                  offset: Offset(0, 1),
                                                  color:
                                                  Colors.black.withOpacity(0.9)),
                                              //3dbottom
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: -Offset(1, 0),
                                                  color:
                                                  Colors.black.withOpacity(0.8)),
                                              //3dleft
                                              BoxShadow(
                                                  blurRadius: 0,
                                                  offset: -Offset(0, 1),
                                                  color:
                                                  Colors.black.withOpacity(0.9)),
                                            ],
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/rectangle.png')),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 10.0)),
                                              Row(
                                                children: [
                                                  if(_foundTicket[index]["Severity"]=="High") ...[
                                                    Image.asset("assets/vectorright.png")
                                                  ]else if(_foundTicket[index]["Severity"]=="Medium") ...[
                                                    Image.asset("assets/greenticket.png")
                                                  ]else if(_foundTicket[index]["Severity"]=="Low") ...[
                                                    Image.asset("assets/yellowticket.png")
                                                  ]else if(_foundTicket[index]["Severity"]=="Information") ...[
                                                    Image.asset("assets/whiteticket.png")
                                                  ],
                                                  /*Image.asset(
                                                      _foundTicket[index]["Image"]),*/
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 5.0)),
                                                  Text(
                                                    _foundTicket[index]['sysNumber'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'fonts/Roboto-Bold.ttf',
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 24),
                                                  ),
                                                  Visibility(
                                                    visible: _foundTicket[index]
                                                    ['loadingIndicator'],
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 0.0,
                                                          bottom: 2.5,
                                                          left: 5),
                                                      child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          SizedBox(
                                                            width: 25,
                                                            height: 25,
                                                            child: LoadingIndicator(
                                                              indicatorType: Indicator
                                                                  .ballScaleMultiple,
                                                              colors: [
                                                                Colors.green
                                                                    .withOpacity(
                                                                    0.9),
                                                                /*Color(0xff3B8DC2)
                                                                    .withOpacity(
                                                                    1),*/
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 7.5,
                                                            width: 7.5,
                                                            decoration: BoxDecoration(
                                                                color: Colors.green,
                                                                /*Color(0XFF19547B),*/
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    50)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(top: 3.0)),
                                              SizedBox(
                                                height: 108,
                                                width: 112,
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: Text(
                                                    _foundTicket[index]
                                                    ['problemText'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 13.0)),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [

                                                  /*Visibility(
                                                    visible: true,
                                                    child: Badge(
                                                      position: BadgePosition(top: 3,end: 3),
                                                      toAnimate: true,
                                                      padding: EdgeInsets.all(2.5),
                                                      shape: BadgeShape.circle,
                                                      alignment: Alignment(1,-1),
                                                      showBadge: true,
                                                      elevation: 2,
                                                      animationType: BadgeAnimationType.fade,
                                                      badgeColor: Colors.white.withOpacity(0.4),
                                                      badgeContent: Text(
                                                        '10',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.black.withOpacity(0.7),
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.mail_outline_rounded,
                                                        color: Colors.black.withOpacity(0.65),
                                                        size: 26,
                                                      ),
                                                    ),
                                                  ),*/
                                                  Visibility(
                                                    visible: false,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 2),
                                                      child: Icon(
                                                        Icons.mail_rounded,
                                                        color: /*Color(0xff134074),*/Color(0xff19547b),
                                                        size: 26,
                                                      ),
                                                    ),
                                                  ),

                                                  Text(
                                                    _foundTicket[index]['problemTime'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 18),
                                                  ),

                                                  SizedBox(width: 3,),

                                                ],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(top: 1.5)),
                                              Text(
                                                _foundTicket[index]['dateTime'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff000000)
                                                        .withOpacity(0.65),
                                                    fontFamily:
                                                    'fonts/Roboto-Thin.ttf',
                                                    // fontWeight: FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 18,
                                      duration: Duration(milliseconds: 250),
                                      child: GestureDetector(
                                        onTap: () {
                                          /*_sysNumber= ticket[index]['sysNumber'];*/
                                          _remote = false;
                                          setState(() {
                                            selectedIncidentWidgetMarker =
                                                IncidentMarker.chat;
                                            /*this._memoryWidgets.add('assets/chaticon250.png');*/
                                            /*memorybar[ticket[index]['sysNumber']] = ['Call'];*/

                                            if (memorybar.containsKey(
                                                ticket[index]['sysNumber']) ==
                                                true) {
                                              memorybar[ticket[index]['sysNumber']]
                                                  ?.add('assets/chaticon250.png');
                                            } else {
                                              memorybar.addEntries([
                                                MapEntry(ticket[index]['sysNumber'],
                                                    {'assets/chaticon250.png'})
                                              ]);
                                            }
                                          });
                                        },
                                        onTapDown: (pressing) {
                                          setState(() {
                                            _isChatButton = false;
                                          });
                                        },
                                        onTapUp: (pressing) {
                                          setState(() {
                                            _isChatButton = true;
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 174,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              tileMode: TileMode.mirror,
                                              focalRadius: 10,
                                              radius: 2,
                                              colors: [
                                                _isChatButton
                                                    ? Color(0xffD3D3D3)
                                                    : Color(0xff19547b),
                                                _isChatButton
                                                    ? Colors.white
                                                    : Color(0xff467695),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(1, 1),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.60)),
                                              // BoxShadow(
                                              //     blurRadius: 10,
                                              //     offset: -Offset(1, 1),
                                              //     color: Color(0xff000000).withOpacity(0.30)),
                                            ],
                                            // color: Color(0xffECECEC),
                                            borderRadius: BorderRadius.circular(12.5),
                                          ),
                                          alignment: Alignment(-0.385, 0),
                                          child: Text(
                                            'CHAT',
                                            style: TextStyle(
                                                color: _isChatButton
                                                    ? Color(0xff467695)
                                                    : Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    // ChatButton(),
                                  ),
                                ),



                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 44,
                                      duration: Duration(milliseconds: 350),
                                      child: IgnorePointer(
                                        ignoring: _callIgnore,
                                        child: GestureDetector(
                                          onTap: () {
                                            _controllerTime.start();
                                            _callIgnore=true;
                                            setState(() {
                                              _callVisibility=!_callVisibility;

                                              /*this.memoryWidgets.add('assets/calliconpadding.png');*/
                                              /*memorybar.addEntries([
                                  MapEntry(ticket[index]['sysNumber'],['Call'])
                                ]);*/
                                              // memorybar[ticket[index]['sysNumber']];
                                              /*memorybar[ticket[index]['sysNumber']] = ['Call'];*/
                                              /*memorybar.forEach((key, value) {

                                });*/
                                              /*memorybar[ticket[index]['sysNumber']]?.insertAll(memorybar[ticket[index]['sysNumber']]!.length,['Call']);*/
                                              if (memorybar.containsKey(
                                                  ticket[index]['sysNumber']) ==
                                                  true) {
                                                memorybar[ticket[index]['sysNumber']]
                                                    ?.add('assets/callicongreenpadding1.gif');
                                              } else {
                                                memorybar.addEntries([
                                                  MapEntry(ticket[index]['sysNumber'],
                                                      {'assets/callicongreenpadding1.gif'})
                                                ]);
                                              }
                                            });
                                            // memorybar.forEach((k,v) => print('${k}: ${v}'));
                                            // print(memorybar[ticket[index]['sysNumber']]?.toList());
                                            /*memorybar.forEach((key, value) {
                                print('${key}: ${value.toList()}');
                              });*/

                                            /*print(memorybar['C0001']?.elementAt(1));*/
                                          },
                                          onTapDown: (pressing) {
                                            setState(() {
                                              _isCallButton = false;
                                            });
                                          },
                                          onTapUp: (pressing) {
                                            setState(() {
                                              _isCallButton = true;
                                            });
                                          },
                                          child: Container(
                                            height: 24,
                                            width: 174,
                                            decoration: BoxDecoration(
                                              gradient: RadialGradient(
                                                tileMode: TileMode.mirror,
                                                focalRadius: 10,
                                                radius: 2,
                                                colors: [
                                                  _isCallButton
                                                      ? Color(0xffD3D3D3)
                                                      : Color(0xff19547b),
                                                  _isCallButton
                                                      ? Colors.white
                                                      : Color(0xff467695),
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    offset: Offset(1, 1),
                                                    color: Color(0xff000000)
                                                        .withOpacity(0.60)),
                                                // BoxShadow(
                                                //     blurRadius: 10,
                                                //     offset: -Offset(1, 1),
                                                //     color: Color(0xff000000).withOpacity(0.30)),
                                              ],
                                              // color: Color(0xffECECEC),
                                              borderRadius: BorderRadius.circular(12.5),
                                            ),
                                            alignment: Alignment(-0.40, 0),
                                            child: Text(
                                              'CALL',
                                              style: TextStyle(
                                                  color: _isCallButton
                                                      ? Color(0xff467695)
                                                      : Colors.white,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      )
                                    // CallButton(),
                                  ),
                                ),
                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 70,
                                      duration: Duration(milliseconds: 450),
                                      child: GestureDetector(
                                        onTap: () {
                                          _remote = !_remote;
                                          setState(() {
                                            /*this.memoryWidgets.add('assets/remoteiconpadding.png');*/

                                            if (memorybar.containsKey(
                                                ticket[index]['sysNumber']) ==
                                                true) {
                                              memorybar[ticket[index]['sysNumber']]
                                                  ?.add(
                                                  'assets/remoteiconpadding.png');
                                            } else {
                                              memorybar.addEntries([
                                                MapEntry(ticket[index]['sysNumber'],
                                                    {'assets/remoteiconpadding.png'})
                                              ]);
                                            }
                                          });
                                        },
                                        onTapDown: (pressing) {
                                          setState(() {
                                            _isRemoteButton = false;
                                          });
                                        },
                                        onTapUp: (pressing) {
                                          setState(() {
                                            _isRemoteButton = true;
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 174,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              tileMode: TileMode.mirror,
                                              focalRadius: 10,
                                              radius: 2,
                                              colors: [
                                                _isRemoteButton
                                                    ? Color(0xffD3D3D3)
                                                    : Color(0xff19547b),
                                                _isRemoteButton
                                                    ? Colors.white
                                                    : Color(0xff467695),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(1, 1),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.60)),
                                              // BoxShadow(
                                              //     blurRadius: 10,
                                              //     offset: -Offset(1, 1),
                                              //     color: Color(0xff000000).withOpacity(0.30)),
                                            ],
                                            // color: Color(0xffECECEC),
                                            borderRadius: BorderRadius.circular(12.5),
                                          ),
                                          alignment: Alignment(-0.30, 0),
                                          child: Text(
                                            'REMOTE',
                                            style: TextStyle(
                                                color: _isRemoteButton
                                                    ? Color(0xff467695)
                                                    : Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    // RemoteButton(),
                                  ),
                                ),
                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 96,
                                      duration: Duration(milliseconds: 550),
                                      child: GestureDetector(
                                        onTap: () {
                                          _remote = false;
                                          setState(() {

                                            selectedIncidentWidgetMarker =
                                                IncidentMarker.script;
                                            /*this.memoryWidgets.add('assets/scripticonpadding.png');*/
                                            /*memorybar.addEntries([
                                  MapEntry(ticket[index]['sysNumber'],['Script'])
                                ]);*/
                                            /*memorybar[ticket[index]['sysNumber']];*/
                                            /*memorybar[ticket[index]['sysNumber']] = ['script'];*/
                                            /* memorybar[ticket[index]['sysNumber']]?.insertAll(memorybar[ticket[index]['sysNumber']]!.length,['Script']);*/
                                            if (memorybar.containsKey(
                                                ticket[index]['sysNumber']) ==
                                                true) {
                                              memorybar[ticket[index]['sysNumber']]
                                                  ?.add(
                                                  'assets/scripticonpadding.png');
                                            } else {
                                              memorybar.addEntries([
                                                MapEntry(ticket[index]['sysNumber'],
                                                    {'assets/scripticonpadding.png'})
                                              ]);
                                            }
                                          });
                                          /*print(memorybar);*/
                                        },
                                        onTapDown: (pressing) {
                                          setState(() {
                                            _isScriptButton = false;
                                          });
                                        },
                                        onTapUp: (pressing) {
                                          setState(() {
                                            _isScriptButton = true;
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 174,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              tileMode: TileMode.mirror,
                                              focalRadius: 10,
                                              radius: 2,
                                              colors: [
                                                _isScriptButton
                                                    ? Color(0xffD3D3D3)
                                                    : Color(0xff19547b),
                                                _isScriptButton
                                                    ? Colors.white
                                                    : Color(0xff467695),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(1, 1),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.60)),
                                              // BoxShadow(
                                              //     blurRadius: 10,
                                              //     offset: -Offset(1, 1),
                                              //     color: Color(0xff000000).withOpacity(0.30)),
                                            ],
                                            // color: Color(0xffECECEC),
                                            borderRadius: BorderRadius.circular(12.5),
                                          ),
                                          alignment: Alignment(-0.33, 0),
                                          child: Text(
                                            'SCRIPT',
                                            style: TextStyle(
                                                color: _isScriptButton
                                                    ? Color(0xff467695)
                                                    : Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    // ScriptButton(),
                                  ),
                                ),
                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 122,
                                      duration: Duration(milliseconds: 650),
                                      child: GestureDetector(
                                        onTap: () {
                                          _remote = false;
                                          setState(() {
                                            /*this.memoryWidgets.add('assets/terminaliconpadding.png');*/
                                            selectedIncidentWidgetMarker =
                                                IncidentMarker.terminal;

                                            if (memorybar.containsKey(
                                                ticket[index]['sysNumber']) ==
                                                true) {
                                              memorybar[ticket[index]['sysNumber']]
                                                  ?.add(
                                                  'assets/terminaliconpadding.png');
                                            } else {
                                              memorybar.addEntries([
                                                MapEntry(ticket[index]['sysNumber'], {
                                                  'assets/terminaliconpadding.png'
                                                })
                                              ]);
                                            }

                                            /*memorybar.addEntries([
                                  MapEntry(ticket[index]['sysNumber'],['Terminal'])
                                ]);*/
                                            /*memorybar[ticket[index]['sysNumber']];*/
                                            /*memorybar[ticket[index]['sysNumber']] = ['terminal'];*/
                                          });
                                          /*print(memorybar);*/
                                        },
                                        onTapDown: (pressing) {
                                          setState(() {
                                            _isTerminalButton = false;
                                          });
                                        },
                                        onTapUp: (pressing) {
                                          setState(() {
                                            _isTerminalButton = true;
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 174,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              tileMode: TileMode.mirror,
                                              focalRadius: 10,
                                              radius: 2,
                                              colors: [
                                                _isTerminalButton
                                                    ? Color(0xffD3D3D3)
                                                    : Color(0xff19547b),
                                                _isTerminalButton
                                                    ? Colors.white
                                                    : Color(0xff467695),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(1, 1),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.60)),
                                              // BoxShadow(
                                              //     blurRadius: 10,
                                              //     offset: -Offset(1, 1),
                                              //     color: Color(0xff000000).withOpacity(0.30)),
                                            ],
                                            // color: Color(0xffECECEC),
                                            borderRadius: BorderRadius.circular(12.5),
                                          ),
                                          alignment: Alignment(-0.20, 0),
                                          child: Text(
                                            'TERMINAL',
                                            style: TextStyle(
                                                color: _isTerminalButton
                                                    ? Color(0xff467695)
                                                    : Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    // TerminalButton(),
                                  ),
                                ),
                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 148,
                                      duration: Duration(milliseconds: 750),
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(30.0),
                                                  ),
                                                  scrollable: true,
                                                  insetPadding: EdgeInsets.all(40),
                                                  contentPadding: EdgeInsets.all(0),
                                                  backgroundColor: Colors.white60,
                                                  content: Container(
                                                    height: 260,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                        width: 3,
                                                      ),
                                                      // color: Color(0xffB5B5B5),
                                                      borderRadius:
                                                      BorderRadius.circular(30.0),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xff19547b),
                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Updates',
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    color: Colors.white,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(
                                                              left: 15, right: 15),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white
                                                                  .withOpacity(0.8),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(0)),
                                                          height: 176,
                                                          margin: EdgeInsets.only(
                                                              left: 0,
                                                              right: 0,
                                                              top: 0,
                                                              bottom: 0),
                                                          child: TextField(
                                                            minLines: null,
                                                            maxLines: null,
                                                            keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                            textInputAction:
                                                            TextInputAction.done,
                                                            cursorColor: Colors.black
                                                                .withOpacity(0.2),
                                                            showCursor: true,
                                                            decoration:
                                                            InputDecoration(
                                                                border:
                                                                InputBorder
                                                                    .none,
                                                                labelStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                      0.6),
                                                                )),
                                                          ),
                                                        ),
                                                        /*Container(
                                                          height: 35,
                                                          width: 85,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xff8D3030),
                                                            borderRadius: BorderRadius.circular(15),
                                                            border: Border.all(
                                                              color: Colors.white,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "SUBMIT",
                                                              style: TextStyle(
                                                                  fontFamily: 'Roboto',
                                                                fontSize: 14.5,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color:
                                                                  Colors.white),
                                                            ),
                                                          ),
                                                        ),*/
                                                        ElevatedButton(
                                                            child: Text(
                                                              "SUBMIT",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color:
                                                                  Colors.white),
                                                            ),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              side: BorderSide(
                                                                color: Colors.white,
                                                                width: 2.0,
                                                              ),
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    15), // <-- Radius
                                                              ),
                                                              primary:
                                                              Color(0xff19547b),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                            }
                                                            ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        onTapDown: (pressing) {
                                          setState(() {
                                            _isUpdatesButton = false;
                                          });
                                        },
                                        onTapUp: (pressing) {
                                          setState(() {
                                            _isUpdatesButton = true;
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 174,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              tileMode: TileMode.mirror,
                                              focalRadius: 10,
                                              radius: 2,
                                              colors: [
                                                _isUpdatesButton
                                                    ? Color(0xffD3D3D3)
                                                    : Color(0xff19547b),
                                                _isUpdatesButton
                                                    ? Colors.white
                                                    : Color(0xff467695),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(1, 1),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.60)),
                                              // BoxShadow(
                                              //     blurRadius: 10,
                                              //     offset: -Offset(1, 1),
                                              //     color: Color(0xff000000).withOpacity(0.30)),
                                            ],
                                            // color: Color(0xffECECEC),
                                            borderRadius: BorderRadius.circular(12.5),
                                          ),
                                          alignment: Alignment(-0.20, 0),
                                          child: Text(
                                            'UPDATES',
                                            style: TextStyle(
                                                color: _isUpdatesButton
                                                    ? Color(0xff467695)
                                                    : Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    // UpdatesButton(),
                                  ),
                                ),
                                Visibility(
                                  visible: _enterAction,
                                  child: AnimatedPositioned(
                                      curve: Curves.fastOutSlowIn,
                                      left: _buttonPosition
                                          ? 152
                                          : MediaQuery.of(context).size.width + 175,
                                      top: 174,
                                      duration: Duration(milliseconds: 850),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _enterAction = false;
                                          });
                                        },
                                        onTapDown: (pressing) {
                                          setState(() {
                                            _isActionsButton = false;
                                          });
                                        },
                                        onTapUp: (pressing) {
                                          setState(() {
                                            _isActionsButton = true;
                                          });
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 174,
                                          decoration: BoxDecoration(
                                            gradient: RadialGradient(
                                              tileMode: TileMode.mirror,
                                              focalRadius: 10,
                                              radius: 2,
                                              colors: [
                                                _isActionsButton
                                                    ? Color(0xffD3D3D3)
                                                    : Color(0xff19547b),
                                                _isActionsButton
                                                    ? Colors.white
                                                    : Color(0xff467695),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(1, 1),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.60)),
                                              // BoxShadow(
                                              //     blurRadius: 10,
                                              //     offset: -Offset(1, 1),
                                              //     color: Color(0xff000000).withOpacity(0.30)),
                                            ],
                                            // color: Color(0xffECECEC),
                                            borderRadius: BorderRadius.circular(12.5),
                                          ),
                                          alignment: Alignment(-0.255, 0),
                                          child: Text(
                                            'ACTIONS',
                                            style: TextStyle(
                                                color: _isActionsButton
                                                    ? Color(0xff467695)
                                                    : Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    // ActionsButton(),
                                  ),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.fastOutSlowIn,
                                  left: _enterAction == false
                                      ? 152
                                      : MediaQuery.of(context).size.width + 175,
                                  top: 18,
                                  duration: Duration(milliseconds: 250),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _enterAction = true;
                                        });
                                      },
                                      child: RedActionButton()),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.fastOutSlowIn,
                                  left: _enterAction == false
                                      ? 152
                                      : MediaQuery.of(context).size.width + 175,
                                  top: 44,
                                  duration: Duration(milliseconds: 350),
                                  child: ForwardButton(),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.fastOutSlowIn,
                                  left: _enterAction == false
                                      ? 152
                                      : MediaQuery.of(context).size.width + 175,
                                  top: 70,
                                  duration: Duration(milliseconds: 450),
                                  child: PendingButton(),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.fastOutSlowIn,
                                  left: _enterAction == false
                                      ? 152
                                      : MediaQuery.of(context).size.width + 175,
                                  top: 96,
                                  duration: Duration(milliseconds: 550),
                                  child: UnAvailableButton(),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.fastOutSlowIn,
                                  left: _enterAction == false
                                      ? 152
                                      : MediaQuery.of(context).size.width + 175,
                                  top: 122,
                                  duration: Duration(milliseconds: 650),
                                  child: ResolveButton(),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.fastOutSlowIn,
                                  left: _enterAction == false
                                      ? 152
                                      : MediaQuery.of(context).size.width + 175,
                                  top: 148,
                                  duration: Duration(milliseconds: 750),
                                  child: ActionCloseButton(),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    // Visibility(
                    //   visible: create,
                    //   child: Expanded(
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         gradient: LinearGradient(
                    //           colors: [
                    //             Colors.white.withOpacity(0.5),
                    //             Colors.white.withOpacity(0.2)
                    //           ],
                    //           stops: [0.0, 1.0],
                    //         ),
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(15),
                    //             bottomLeft: Radius.circular(15),
                    //           topRight: Radius.circular(15),
                    //           bottomRight: Radius.circular(15),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        /*print(memorybar[_sysNumber]?.contains('assets/callicongreenpadding1.gif'));*/
                        print(memorybar);

                        setState(() {
                          // height=height+10;
                          // width!=15.0?width=15.0:width=150;
                          /*_foundTicket[1];*/
                          width = !width;
                          flag = false;
                          /*if(_foundTicket[0].containsValue('C0001')){
                      _foundTicket[0]['loadingIndicator']=true;
                    }*/
                          /*memorybar.forEach((key, value) {
                      if(key=='C0001'){
                        print(value.length);
                      }
                    });*/
                        });

                        /*print(MediaQuery.of(context).size.width);
                  print(WidgetsBinding.instance?.window.physicalSize.width);
                  print(MediaQuery.of(context).size.height);
                  print(WidgetsBinding.instance?.window.physicalSize.height);
                  print(MediaQuery.of(context).orientation);*/

                        /*print(window.viewPadding.top);*/

                        /*print(Platform.isIOS);*/
                        // print(memorybar);
                        /*print(_sysNumber);*/
                        /*print(_index);*/
                        /*print(_foundTicket[_index]['sysNumber']);*/
                      },
                      child: AnimatedContainer(
                        constraints: BoxConstraints(
                          // maxWidth: double.infinity,
                            minWidth: 25),
                        duration: Duration(milliseconds: 0),
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //     begin: Alignment.topCenter,
                          //     end: Alignment.bottomCenter,
                          //     colors: [
                          //       Color(0xff000000).withOpacity(0.9),
                          //       Color(0xffFFFFFF).withOpacity(0.75),
                          //     ]
                          // ),
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
                          visible: !width,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(4.0),
                            children: [
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: flag
                                    ? GestureDetector(
                                  key: Key('2'),
                                  onTap: () {
                                    setState(() {
                                      flag = !flag;
                                    });
                                  },
                                  child: Card(
                                    color: Colors.transparent,
                                    elevation: 5,
                                    child: Container(
                                      // width: 150,
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
                                                onChanged: (value) =>
                                                    _runFilter(value),
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
                                            // Text(
                                            //   'Light',
                                            //   style: TextStyle(
                                            //       fontFamily: 'fonts/Roboto-Light.ttf',
                                            //       fontWeight: FontWeight.w400,
                                            //       fontSize: 16,
                                            //       color: Colors.white.withOpacity(0.75)
                                            //   ),
                                            // ),
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
                                      flag = !flag;
                                    });
                                  },
                                  child: Card(
                                    // shape: StadiumBorder(
                                    //   side: BorderSide(
                                    //     color: Colors.black26,
                                    //     width: 2.0,
                                    //   ),
                                    // ),
                                    // shadowColor: Colors.black,
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
                              Card(
                                // shape: StadiumBorder(
                                //   side: BorderSide(
                                //     color: Colors.black26,
                                //     width: 2.0,
                                //   ),
                                // ),
                                // shadowColor: Colors.black,
                                color: Colors.transparent,
                                elevation: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      width = !width;
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
                                                      /*enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                ),*/
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
                                                        /*enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),*/
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
                                                /*TextField(
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                icon: Icon(
                                                  Icons.report_problem_outlined,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                                hintText: 'Discription',
                                                labelStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                )),
                                          ),*/
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
                                                          /*width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.90,*/
                                                          // color: Color(0xffC4C4C4)
                                                          //     .withOpacity(0.20),
                                                          height: 70,
                                                          alignment: Alignment(0, -0.5),
                                                          child: TextField(
                                                            minLines: 1,
                                                            maxLines: 3,
                                                            scrollPadding:
                                                            EdgeInsets.only(top: 40),
                                                            showCursor: true,
                                                            cursorColor: Colors.white70,
                                                            // onTap: (){
                                                            //   if(MediaQuery.of(context).viewInsets.vertical ==0){
                                                            //     scroll=true;
                                                            //   }else{
                                                            //     scroll=false;
                                                            //   }
                                                            // },
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
                                            /*actions: [
                                        ElevatedButton(
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                              color: Colors.black.withOpacity(0.75)
                                            ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white70,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],*/
                                          );
                                        });
                                    // _onCustomAnimationAlertPressed(context);
                                    // _onAlertWithCustomContentPressed(context);
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
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Colors.white,
                                size: 25,
                              ),
                              // Spacer(),
                              // Text('data')
                            ],
                          ),
                        ),
                        // color: Colors.green[300],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          );
      },);
  }

  /*Widget ChatButton() {
    return GestureDetector(
      onTap : (){
        // print()
        setState(() {
          selectedIncidentWidgetMarker = IncidentMarker.chat;
        });
      },
      onTapDown: (pressing) {
        setState(() {
          _isChatButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isChatButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isChatButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isChatButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.385, 0),
        child: Text(
          'CHAT',
          style: TextStyle(
              color: _isChatButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  /*Widget CallButton() {
    return GestureDetector(
      onTapDown: (pressing) {
        setState(() {
          _isCallButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isCallButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isCallButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isCallButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.40, 0),
        child: Text(
          'CALL',
          style: TextStyle(
              color: _isCallButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  /*Widget RemoteButton() {
    return GestureDetector(
      onTap: (){
        _remote = !_remote;
      },
      onTapDown: (pressing) {
        setState(() {
          _isRemoteButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isRemoteButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isRemoteButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isRemoteButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.30, 0),
        child: Text(
          'REMOTE',
          style: TextStyle(
              color: _isRemoteButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  /*Widget ScriptButton() {
    return GestureDetector(
      onTapDown: (pressing) {
        setState(() {
          _isScriptButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isScriptButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isScriptButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isScriptButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.33, 0),
        child: Text(
          'SCRIPT',
          style: TextStyle(
              color: _isScriptButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  /*Widget TerminalButton() {
    return GestureDetector(
      onTapDown: (pressing) {
        setState(() {
          _isTerminalButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isTerminalButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isTerminalButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isTerminalButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.20, 0),
        child: Text(
          'TERMINAL',
          style: TextStyle(
              color: _isTerminalButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  /*Widget UpdatesButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context){
              return
                AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30.0),
                  ),
                  scrollable: true,
                  insetPadding: EdgeInsets.all(50),
                  contentPadding: EdgeInsets.all(0),
                  backgroundColor: Colors.white60,
                  content: Container(
                    height: 260,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.8),
                        width: 3,
                      ),
                      // color: Color(0xffB5B5B5),
                      borderRadius:
                      BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          'Updates',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15,right: 15),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          height: 170,
                          margin: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                          child: TextField(
                            minLines: 1,
                            maxLines: 250,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.black.withOpacity(0.2),
                            showCursor: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.6),
                                )
                            ),
                          ),
                        ),
                        ElevatedButton(
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            style:
                            ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // <-- Radius
                              ),
                              primary: Color(0xff8D3030),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                );
            });
      },
      onTapDown: (pressing) {
        setState(() {
          _isUpdatesButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isUpdatesButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isUpdatesButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isUpdatesButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.20, 0),
        child: Text(
          'UPDATES',
          style: TextStyle(
              color: _isUpdatesButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  /*Widget ActionsButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _enterAction = false;
        });
      },
      onTapDown: (pressing) {
        setState(() {
          _isActionsButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isActionsButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isActionsButton ? Color(0xffD3D3D3) : Color(0xff7E040A),
              _isActionsButton ? Colors.white : Color(0xff81040A),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment(-0.255, 0),
        child: Text(
          'ACTIONS',
          style: TextStyle(
              color: _isActionsButton ? Color(0XFF81040A) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }*/

  Widget RedActionButton() {
    return Container(
      height: 24,
      width: 174,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          tileMode: TileMode.mirror,
          focalRadius: 10,
          radius: 2,
          colors: [
            Color(0xff19547b),
            Color(0xff467695),
          ],
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(1, 1),
              color: Color(0xff000000).withOpacity(0.60)),
          // BoxShadow(
          //     blurRadius: 10,
          //     offset: -Offset(1, 1),
          //     color: Color(0xff000000).withOpacity(0.30)),
        ],
        // color: Color(0xffECECEC),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(
        'ACTIONS',
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            fontSize: 14),
      ),
    );
  }

  Widget ForwardButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                scrollable: true,
                insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.all(0),
                backgroundColor: Colors.white60,
                content: Container(
                  height: 260,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.8),
                      width: 3,
                    ),
                    // color: Color(0xffB5B5B5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff19547b),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                          ),
                          child: Center(
                            child: Text(
                              'Forward',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(0)),
                        height: 176,
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        child: TextField(
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black.withOpacity(0.2),
                          showCursor: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                      ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // <-- Radius
                            ),
                            primary: Color(0xff19547b),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              );
            });
      },
      onTapDown: (pressing) {
        setState(() {
          _isForwardButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isForwardButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isForwardButton ? Color(0xffD3D3D3) : Color(0xff19547b),
              _isForwardButton ? Colors.white : Color(0xff467695),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment.center,
        child: Text(
          'FORWARD',
          style: TextStyle(
              color: _isForwardButton ? Color(0xff467695): Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget PendingButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                scrollable: true,
                insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.all(0),
                backgroundColor: Colors.white60,
                content: Container(
                  height: 260,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.8),
                      width: 3,
                    ),
                    // color: Color(0xffB5B5B5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff19547b),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                          ),
                          child: Center(
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(0)),
                        height: 176,
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        child: TextField(
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black.withOpacity(0.2),
                          showCursor: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                      ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // <-- Radius
                            ),
                            primary: Color(0xff19547b),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              );
            });
      },
      onTapDown: (pressing) {
        setState(() {
          _isPendingButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isPendingButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isPendingButton ? Color(0xffD3D3D3) : Color(0xff19547b),
              _isPendingButton ? Colors.white : Color(0xff467695),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment.center,
        child: Text(
          'PENDING',
          style: TextStyle(
              color: _isPendingButton ? Color(0xff467695) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget UnAvailableButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                scrollable: true,
                insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.all(0),
                backgroundColor: Colors.white60,
                content: Container(
                  height: 260,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.8),
                      width: 3,
                    ),
                    // color: Color(0xffB5B5B5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff19547b),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                          ),
                          child: Center(
                            child: Text(
                              'UnAvailable',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(0)),
                        height: 176,
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        child: TextField(
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black.withOpacity(0.2),
                          showCursor: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                      ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // <-- Radius
                            ),
                            primary: Color(0xff19547b),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              );
            });
      },
      onTapDown: (pressing) {
        setState(() {
          _isUnAvailableButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isUnAvailableButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isUnAvailableButton ? Color(0xffD3D3D3) : Color(0xff19547b),
              _isUnAvailableButton ? Colors.white : Color(0xff467695),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment.center,
        child: Text(
          'UNAVAILABLE',
          style: TextStyle(
              color: _isUnAvailableButton ? Color(0xff467695): Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget ResolveButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                scrollable: true,
                insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.all(0),
                backgroundColor: Colors.white60,
                content: Container(
                  height: 260,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.8),
                      width: 3,
                    ),
                    // color: Color(0xffB5B5B5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff19547b),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                          ),
                          child: Center(
                            child: Text(
                              'Resolve',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(0)),
                        height: 176,
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        child: TextField(
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black.withOpacity(0.2),
                          showCursor: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                      ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // <-- Radius
                            ),
                            primary: Color(0xff19547b),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              );
            });
      },
      onTapDown: (pressing) {
        setState(() {
          _isResolveButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isResolveButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isResolveButton ?  Color(0xffD3D3D3): Color(0xff19547b),
              _isResolveButton ? Colors.white : Color(0xff467695),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment.center,
        child: Text(
          'RESOLVE',
          style: TextStyle(
              color: _isResolveButton ? Color(0xff467695): Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget ActionCloseButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                scrollable: true,
                insetPadding: EdgeInsets.all(50),
                contentPadding: EdgeInsets.all(0),
                backgroundColor: Colors.white60,
                content: Container(
                  height: 260,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.8),
                      width: 3,
                    ),
                    // color: Color(0xffB5B5B5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff19547b),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                          ),
                          child: Center(
                            child: Text(
                              'Close',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(0)),
                        height: 176,
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        child: TextField(
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black.withOpacity(0.2),
                          showCursor: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                      ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // <-- Radius
                            ),
                            primary: Color(0xff19547b),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              );
            });
      },
      onTapDown: (pressing) {
        setState(() {
          _isActionCloseButton = false;
        });
      },
      onTapUp: (pressing) {
        setState(() {
          _isActionCloseButton = true;
        });
      },
      child: Container(
        height: 24,
        width: 174,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            focalRadius: 10,
            radius: 2,
            colors: [
              _isActionCloseButton ?  Color(0xffD3D3D3): Color(0xff19547b),
              _isActionCloseButton ? Colors.white : Color(0xff467695),
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Color(0xff000000).withOpacity(0.60)),
            // BoxShadow(
            //     blurRadius: 10,
            //     offset: -Offset(1, 1),
            //     color: Color(0xff000000).withOpacity(0.30)),
          ],
          // color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12.5),
        ),
        alignment: Alignment.center,
        child: Text(
          'CLOSE',
          style: TextStyle(
              color: _isActionCloseButton ? Color(0xff467695) : Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget getUnAssignedTicket() {
    return MeasuredSize(
      onChange: (Size) {
        mySize =Size;
      },
      child: Expanded(
        /*key: UniqueKey(),dd*/
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(40, 100),
              topLeft: Radius.elliptical(40, 100),
              bottomRight: Radius.elliptical(40, 100),
              bottomLeft: Radius.elliptical(40, 100)),
          child: GroupedListView<dynamic, String>(
            sort: false,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
            elements: _elements,
            groupBy: (_element) => _element['group'],
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            /*groupHeaderBuilder: (_element) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(_element['group']),
                  ),
                ),
              ),
            ),*/
            stickyHeaderBackgroundColor: Colors.transparent,
            groupSeparatorBuilder: (String value) {
              return Padding(
                padding: EdgeInsets.all(0.0),
                child: Container(
                  height: 27,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'fonts/Roboto-Light.ttf',
                          fontWeight: FontWeight.normal,
                          color: Colors.white.withOpacity(0.875)),
                    ),
                  ),
                ),
              );
            },
            itemBuilder: (context, element) {
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            contentPadding: EdgeInsets.only(left: 0, right: 0),
                            insetPadding: EdgeInsets.only(left: 15, right: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            elevation: 50,
                            backgroundColor: Colors.white,
                            scrollable: true,
                            content: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: Container(
                                  height: 260,
                                  width: 365,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          // opacity: 0.75,
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/unassignedticketimage.png'))),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 210,
                                          width: 345,
                                          decoration: BoxDecoration(
                                            // color: Colors.transparent.withOpacity(0.1),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7.5),
                                                ),
                                                elevation: 5,
                                                child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                    decoration: BoxDecoration(
                                                      color: element['Color']
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.5)),
                                                    ),
                                                    child: Text(
                                                      element['SystemNumber'],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7.5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                element['group'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.black
                                                        .withOpacity(0.5)),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                element['Time'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.black
                                                        .withOpacity(0.5)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 120,
                                            width: 330,
                                            child: Center(
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Text(
                                                  'Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working Keyboard not working ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.black
                                                          .withOpacity(0.75),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Card(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            elevation: 5,
                                            shadowColor: Colors.transparent
                                                .withOpacity(0.9),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xff1A8118),
                                                  // Color(0xff1A8118),
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              padding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 5,
                                                bottom: 5,
                                              ),
                                              child: Text(
                                                'ACCEPT TICKET',
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      offset: Offset(1, 1),
                                                      blurRadius: 2,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )));
                      });
                },
                onTap: () {
                  showModalBottomSheet(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.95,
                      ),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height - 316,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(45),
                              topLeft: Radius.circular(45),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                            // color: Colors.transparent,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/problemclick.png')),
                          ),
                          child: SingleChildScrollView(
                            reverse: true,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 316,
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10.0)),
                                    Center(
                                      child: Text(
                                        element['SystemNumber'],
                                        style: TextStyle(
                                            fontFamily: 'fonts/Roboto-Bold.ttf',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 24),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'HostName',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'HostName',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'IP Address',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'IP Address',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'Date & Time',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'Date & Time',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'Severity',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'Severity',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            'Notes',
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Text(
                                            element['ErrorText'],
                                            style: TextStyle(
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 15.0)),
                                    Center(
                                        child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            color: Color(0xffC4C4C4)
                                                .withOpacity(0.20),
                                            height: 70,
                                            child: TextField(
                                              scrollPadding:
                                                  EdgeInsets.only(top: 40),
                                              showCursor: true,
                                              cursorColor: Colors.white70,
                                              keyboardType: TextInputType.text,
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
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            color: Color(0xff486C7B),
                                            child: Text(
                                              'Update',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    'fonts/Roboto-Bold.ttf',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10.0)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // ),
                        );
                      });
                },
                child: Card(
                  elevation: 5.0,
                  color: Colors.transparent,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 3.0),
                  child: Container(
                    height: 42.5,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(1)
                      /*boxShadow: [
                        BoxShadow(
                            blurRadius: 0,
                            offset: Offset(0, 1.0),
                            color: Colors.black.withOpacity(0.3)),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          // image: AssetImage('assets/rectangleproblem.png')),
                          image:
                              AssetImage('assets/problembarinnershadowleft.png')),*/
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: PhysicalModel(
                            color: Colors.transparent,
                            shadowColor: Colors.black.withOpacity(0.55),
                            elevation: 5,
                            child: Text(
                              element['SystemNumber'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              element['Time'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            )),
                        /*Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: element['Color']*//*.withOpacity(0.6)*//*,
                                borderRadius: BorderRadius.all(Radius.circular(7.5)),
                              ),
                              child: */

                          /*),
                        ),*/
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  element['ErrorText'],
                                  maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                  // softWrap: false
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget Caller(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: BackdropFilter(
        filter:  ImageFilter.blur(sigmaX: _callVisibility?2:0, sigmaY: _callVisibility?2:0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 350),
          height: _callVisibility?300:0,
          margin: EdgeInsets.only(left: 15,right: 15,bottom: 5),
          clipBehavior: Clip.antiAlias,
          padding:  EdgeInsets.only(left: 16,right: 16,top:12.5,bottom: 10),
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/call.png'),
              fit: BoxFit.fill,
            ),
            border: Border.all(
                style: BorderStyle.solid,
                color: Colors.black.withOpacity(0.7),
                width: 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            // itemExtent: 56,
            padding: EdgeInsets.only(top:0),
            children: [
              /*GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Container(
                            height: 35,
                            width: 110,
                            padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                              child: Center(
                                child: Text(
                                  _sysNumber,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ],
                                      fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),*/
              SizedBox(height: 5,),
              PhysicalModel(
                color: Colors.transparent,
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Text(
                    _sysNumber,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3,
                          color: Colors.black,
                        ),
                      ],
                      color: Color(0xffE4E9FA),
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballClipRotatePulse,
                      colors: [
                        Colors.red,
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "Rec",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Center(
                child: CustomTimer(
                  controller: _controllerTime,
                  begin: Duration(),
                  end: Duration(minutes: 60),
                  builder: (time) {
                    return Text(
                        "${time.minutes}:${time.seconds}",
                        style: TextStyle(fontSize: 24.0));
                  },
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: mic?GestureDetector(
                      onTap: (){
                        setState(() {
                          mic=!mic;
                        });
                      },
                      key: Key('M2'),
                      child: Icon(
                        Icons.mic_off_rounded,
                        size: 45,
                      ),
                    ):GestureDetector(
                      onTap: (){
                        setState(() {
                          mic=!mic;
                        });
                      },
                      key: Key('M1'),
                      child: Icon(
                        Icons.mic,
                        size: 45,),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child:speaker? GestureDetector(
                      onTap: (){
                        setState((){
                          speaker=!speaker;
                        });
                      },
                      key: Key('S2'),
                      child: Icon(
                        Icons.volume_up_rounded,
                        size: 45,
                      ),
                    ):GestureDetector(
                      onTap: (){
                        setState((){
                          speaker=!speaker;
                        });
                      },
                      key: Key('S1'),
                      child: Icon(
                        Icons.volume_off,
                        size: 45,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: Duration(microseconds: 200),
                      child:call? GestureDetector(
                        onTap: (){
                          _controllerTime.start();
                          setState((){
                            call=!call;
                          });
                          setState((){
                            memorybar.forEach((key, value) {
                              if(key==_sysNumber){
                                for(final i in memorybar[_sysNumber]!.toList()){
                                  if(i=='assets/calliconpadding.png'){
                                    value.remove(i);
                                    value.add('assets/callicongreenpadding1.gif');
                                  }
                                }
                              }
                            });
                          });
                        },
                        key: Key('C2'),
                        child: Container(
                            height: 37.5,
                            margin: EdgeInsets.only(right: 2.5),
                            decoration: BoxDecoration(
                                color: Color(0xff483B3B),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)
                                )
                            ),
                            child: Center(
                              child: Text(
                                'RESUME',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            )
                        ),
                      ):GestureDetector(
                        onTap: (){
                          _controllerTime.pause();
                          setState((){
                            call=!call;
                          });
                          setState((){
                            memorybar.forEach((key, value) {
                              if(key==_sysNumber){
                                for(final i in memorybar[_sysNumber]!.toList()){
                                  if(i=='assets/callicongreenpadding1.gif'){
                                    value.remove(i);
                                    value.add('assets/calliconpadding.png');
                                  }
                                }
                              }
                            });
                          });
                        },
                        key: Key('C1'),
                        child: Container(
                            height: 37.5,
                            margin: EdgeInsets.only(right: 2.5),
                            decoration: BoxDecoration(
                                color: Color(0xff483B3B),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)
                                )
                            ),
                            child: Center(
                              child: Text(
                                'HOLD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        _callIgnore=false;
                        _controllerTime.reset();
                        setState(() {
                          _callVisibility=!_callVisibility;
                        });
                        setState(() {
                          memorybar.forEach((key, value) {
                            if (key == _sysNumber) {
                              for (final i in memorybar[_sysNumber]!.toList()){
                                if (i=='assets/callicongreenpadding1.gif'){
                                  value.remove(i);
                                  value.add('assets/calliconredpadding.gif');
                                  Timer(Duration(seconds: 2),(){
                                    setState(() {
                                      print('hello11');
                                      value.remove('assets/calliconredpadding.gif');
                                    });
                                  });
                                }else if (i=='assets/calliconpadding.png'){
                                  value.remove(i);
                                  value.add('assets/calliconredpadding.gif');
                                  Timer(Duration(seconds: 2),(){
                                    setState(() {
                                      print('hello123');
                                      value.remove('assets/calliconredpadding.gif');
                                    });
                                  });
                                }
                              }
                              /*value.remove(
                                          memorybar[_sysNumber]!
                                              .toList()[0]);*/
                            }
                          });
                        });
                      },
                      child: Container(
                          height: 37.5,
                          margin: EdgeInsets.only(left: 2.5),
                          decoration: BoxDecoration(
                              color: Color(0xffB91B1B),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25)
                              )
                          ),
                          child: Center(
                            child: Text(
                              'HANGOUT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getDevices() {
    return WillPopScope(
      onWillPop: () async {
        print('hello');
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                borderRadius: value == 1
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff19547b),
                      Color(0xffB0C8C8),
                    ]
                )
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top+20)),
                getDevicesAppbar(),
                Chart(),
                Expanded(
                    child:Container(
                        margin: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 0),
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
            )
          // GestureDetector(
          //   onTap: (){
          //     setState(() {
          //       value==0 ? value=1 : value=0;
          //     });
          //   },
          // )
        ),
      ),
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

  Widget getDevicesAppbar() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/incidentappbar.png')),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(1, 1),
                  color: Color(0xff000000).withOpacity(0.30)),
              BoxShadow(
                  blurRadius: 10,
                  offset: -Offset(1, 1),
                  color: Color(0xff000000).withOpacity(0.30)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(70)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      AnimatedSwitcher(
                        switchInCurve: Curves.linear,
                        switchOutCurve: Curves.easeOut,
                        duration: Duration(milliseconds: 750),
                        reverseDuration: Duration(milliseconds: 0),
                        transitionBuilder: (child, animation) =>
                            RotationTransition(
                              child: child,
                              turns: animation,
                            ),
                        child: value == 1
                            ? GestureDetector(
                          key: Key('2'),
                          onTap: () {
                            setState(() {
                              value == 0 ? value = 1 : value = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black.withOpacity(0.7),
                                  width: 3),
                            ),
                            child: Icon(
                              Icons.clear_rounded,
                              color: Colors.black.withOpacity(0.7),
                              size: 26.5,
                            ),
                          ),
                        )
                            : GestureDetector(
                          key: Key('1'),
                          onTap: () {
                            setState(() {
                              value == 0 ? value = 1 : value = 0;
                            });
                          },
                          child: Image.asset(
                            'assets/menu12.png',
                            width: 32,
                            height: 32,
                            color: Colors.black.withOpacity(0.7),
                            // color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 7.5)),
                      GestureDetector(
                        onTap: () {
                          /*Navigator.of(context).pop();*/
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MatrixIncident()));*/
                        },
                        child: GradientText(
                          'DEVICES',
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          colors: [
                            // Color(0xFFffffff),
                            Colors.grey,
                            Color(0xFF063D61),
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            /*shadows: [
                              Shadow(
                                offset: Offset(0.5, 0.5),
                                blurRadius: 1,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],*/
                            /*color:Color(0xff451618),*//*Colors.black.withOpacity(0.85),*//* Color(0XFF19547B).withOpacity(1),*/
                            fontFamily: 'Roboto-Thin',
                            fontWeight: FontWeight.w900,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }

  /*Future<Object?> Caller(){
    return showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) => StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) =>
        Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 5),
                height: 300,
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/call.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      *//*GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Container(
                            height: 35,
                            width: 110,
                            padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                              child: Center(
                                child: Text(
                                  _sysNumber,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.85),
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.5),
                                        ),
                                      ],
                                      fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),*//*
                      Text(
                        _sysNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3,
                              color: Colors.black,
                            ),
                          ],
                          color: Color(0xffE4E9FA),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 10),
                      *//*CustomTimer(
                          controller: _controllerTime,
                          begin: Duration(),
                          end: Duration(minutes: 60),
                          builder: (time) {
                            return Text(
                                "${time.minutes}:${time.seconds}",
                                style: TextStyle(fontSize: 24.0));
                          },
                          ),*//*
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child: mic?GestureDetector(
                              onTap: (){
                                setState(() {
                                  mic=!mic;
                                });
                              },
                              key: Key('M2'),
                              child: Icon(
                                Icons.mic_off_rounded,
                                size: 50,
                              ),
                            ):GestureDetector(
                              onTap: (){
                                setState(() {
                                  mic=!mic;
                                });
                              },
                              key: Key('M1'),
                              child: Icon(
                                Icons.mic,
                                size: 50,),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child:speaker? GestureDetector(
                              onTap: (){
                                setState((){
                                  speaker=!speaker;
                                });
                              },
                              key: Key('S2'),
                              child: Icon(
                                Icons.volume_up_rounded,
                                size: 50,
                              ),
                            ):GestureDetector(
                              onTap: (){
                                setState((){
                                  speaker=!speaker;
                                });
                              },
                              key: Key('S1'),
                              child: Icon(
                                Icons.volume_off,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AnimatedSwitcher(
                                duration: Duration(microseconds: 200),
                              child:call? GestureDetector(
                                onTap: (){
                                  _controllerTime.start();
                                  setState((){
                                    call=!call;
                                  });
                                  this.setState((){
                                    memorybar.forEach((key, value) {
                                      if(key==_sysNumber){
                                        for(final i in memorybar[_sysNumber]!.toList()){
                                          if(i=='assets/calliconpadding.png'){
                                            value.remove(i);
                                            value.add('assets/callicongreenpadding1.gif');
                                          }
                                        }
                                      }
                                    });
                                  });
                                },
                                key: Key('C2'),
                                child: Container(
                                    height: 37.5,
                                    margin: EdgeInsets.only(right: 2.5),
                                    decoration: BoxDecoration(
                                        color: Color(0xff483B3B),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25)
                                        )
                                    ),
                                    child: Center(
                                      child: Text(
                                        'RESUME',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                ),
                              ):GestureDetector(
                                onTap: (){
                                  _controllerTime.pause();
                                  setState((){
                                    call=!call;
                                  });
                                  this.setState((){
                                    memorybar.forEach((key, value) {
                                      if(key==_sysNumber){
                                        for(final i in memorybar[_sysNumber]!.toList()){
                                          if(i=='assets/callicongreenpadding1.gif'){
                                            value.remove(i);
                                            value.add('assets/calliconpadding.png');
                                          }
                                        }
                                      }
                                    });
                                  });
                                },
                                key: Key('C1'),
                                child: Container(
                                    height: 37.5,
                                    margin: EdgeInsets.only(right: 2.5),
                                    decoration: BoxDecoration(
                                        color: Color(0xff483B3B),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25)
                                        )
                                    ),
                                    child: Center(
                                      child: Text(
                                        'HOLD',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                _callIgnore=false;
                                _controllerTime.reset();
                                Navigator.of(context).pop();
                                print( memorybar[_sysNumber]);
                                this.setState(() {
                                  memorybar.forEach((key, value) {
                                    if (key == _sysNumber) {
                                      for (final i in memorybar[_sysNumber]!.toList()){
                                        if (i=='assets/callicongreenpadding1.gif'){
                                          value.remove(i);
                                        }else if (i=='assets/calliconpadding.png'){
                                          value.remove(i);
                                        }
                                      }
                                      *//*value.remove(
                                          memorybar[_sysNumber]!
                                              .toList()[0]);*//*
                                    }
                                  });
                                });
                              },
                              child: Container(
                                  height: 37.5,
                                  margin: EdgeInsets.only(left: 2.5),
                                  decoration: BoxDecoration(
                                    color: Color(0xffB91B1B),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25)
                                      )
                                  ),
                                  child: Center(
                                    child: Text(
                                      'HANGOUT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }*/

}


/*class CallDialog{
  void showBottomDialog(BuildContext context){
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.only(left: 2.5,right: 2.5),
              height: 300,
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/call.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Container(

                      )
                  ),
                  Row(
                    children: [

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}*/
