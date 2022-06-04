// // // // // //
// // // // //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:im_stepper/main.dart';
// // // import 'package:im_stepper/stepper.dart';
// // //
// // // void main() {
// // //   runApp(IconStepperDemo());
// // // }
// // //
// // // class IconStepperDemo extends StatefulWidget {
// // //   @override
// // //   _IconStepperDemo createState() => _IconStepperDemo();
// // // }
// // //
// // // class _IconStepperDemo extends State<IconStepperDemo> {
// // //   // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
// // //   int activeStep = 2; // Initial step set to 5.
// // //
// // //   int upperBound = 3; // upperBound MUST BE total number of icons minus 1.
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('IconStepper Example'),
// // //         ),
// // //         body: Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: Column(
// // //             children: [
// // //               NumberStepper(numbers: [1,2,3],
// // //
// // //                 // activeStep property set to activeStep variable defined above.
// // //                 activeStep: activeStep,
// // //
// // //                 // This ensures step-tapping updates the activeStep.
// // //                 onStepReached: (index) {
// // //                   setState(() {
// // //                     activeStep = index;
// // //                   });
// // //                 },
// // //               ),
// // //               header(),
// // //               // Expanded(
// // //               //   child: FittedBox(
// // //               //     child: Center(
// // //               //       child: Text('$activeStep'),
// // //               //     ),
// // //               //   ),
// // //               // ),
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   previousButton(),
// // //                   nextButton(),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// Returns the next button.
// // //   Widget nextButton() {
// // //     return ElevatedButton(
// // //       onPressed: () {
// // //         // Increment activeStep, when the next button is tapped. However, check for upper bound.
// // //         if (activeStep < upperBound) {
// // //           setState(() {
// // //             activeStep++;
// // //           });
// // //         }
// // //       },
// // //       child: Text('Next'),
// // //     );
// // //   }
// // //
// // //   /// Returns the previous button.
// // //   Widget previousButton() {
// // //     return ElevatedButton(
// // //       onPressed: () {
// // //         // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
// // //         if (activeStep > 0) {
// // //           setState(() {
// // //             activeStep--;
// // //           });
// // //         }
// // //       },
// // //       child: Text('Prev'),
// // //     );
// // //   }
// // //
// // //   /// Returns the header wrapping the header text.
// // //   Widget header() {
// // //     return Container(
// // //       // height: double.infinity,
// // //       decoration: BoxDecoration(
// // //         color: Colors.orange,
// // //         borderRadius: BorderRadius.circular(5),
// // //       ),
// // //       child: Row(
// // //         children: [
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Text(
// // //               headerText(),
// // //               style: TextStyle(
// // //                 color: Colors.black,
// // //                 fontSize: 20,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Returns the header text based on the activeStep.
// // //   String headerText() {
// // //     switch (activeStep+1) {
// // //       case 1:
// // //         return 'Preface';
// // //
// // //       case 2:
// // //         return 'Table of Contents';
// // //
// // //       case 3:
// // //         return 'About the Author';
// // //
// // //       default:
// // //         return 'Introduction';
// // //     }
// // //   }
// // // }
// //
// // // import 'package:flutter/material.dart';
// // //
// // // import 'package:im_stepper/stepper.dart';
// // //
// // // void main() {
// // //   runApp(IconStepperDemo());
// // // }
// // //
// // // class IconStepperDemo extends StatefulWidget {
// // //   @override
// // //   _IconStepperDemo createState() => _IconStepperDemo();
// // // }
// // //
// // // class _IconStepperDemo extends State<IconStepperDemo> {
// // //   // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
// // //   int activeStep = 3; // Initial step set to 5.
// // //
// // //   int upperBound = 6; // upperBound MUST BE total number of icons minus 1.
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('IconStepper Example'),
// // //         ),
// // //         body: Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: Column(
// // //             children: [
// // //               NumberStepper(numbers:
// // //               [
// // //                 1,
// // //                 2,
// // //                 3,
// // //               ],
// // //
// // //                 // activeStep property set to activeStep variable defined above.
// // //                 activeStep: activeStep,
// // //
// // //                 // This ensures step-tapping updates the activeStep.
// // //                 onStepReached: (index) {
// // //                   setState(() {
// // //                     activeStep = index;
// // //                   });
// // //                 },
// // //               ),
// // //               header(),
// // //               // Expanded(
// // //               //   child: FittedBox(
// // //               //     child: Center(
// // //               //       child: Text('$activeStep'),
// // //               //     ),
// // //               //   ),
// // //               // ),
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   previousButton(),
// // //                   nextButton(),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   /// Returns the next button.
// // //   Widget nextButton() {
// // //     return ElevatedButton(
// // //       onPressed: () {
// // //         // Increment activeStep, when the next button is tapped. However, check for upper bound.
// // //         if (activeStep < upperBound) {
// // //           setState(() {
// // //             activeStep++;
// // //           });
// // //         }
// // //       },
// // //       child: Text('Next'),
// // //     );
// // //   }
// // //
// // //   /// Returns the previous button.
// // //   Widget previousButton() {
// // //     return ElevatedButton(
// // //       onPressed: () {
// // //         // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
// // //         if (activeStep > 0) {
// // //           setState(() {
// // //             activeStep--;
// // //           });
// // //         }
// // //       },
// // //       child: Text('Prev'),
// // //     );
// // //   }
// // //
// // //   /// Returns the header wrapping the header text.
// // //   Widget header() {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.orange,
// // //         borderRadius: BorderRadius.circular(5),
// // //       ),
// // //       child: Row(
// // //         children: [
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Text(
// // //               headerText(),
// // //               style: TextStyle(
// // //                 color: Colors.black,
// // //                 fontSize: 20,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Returns the header text based on the activeStep.
// // //   String headerText() {
// // //     switch (activeStep) {
// // //       case 1:
// // //         return 'Preface';
// // //
// // //       case 2:
// // //         return 'Table of Contents';
// // //
// // //       case 3:
// // //         return 'About the Author';
// // //
// // //       case 4:
// // //         return 'Publisher Information';
// // //
// // //       case 5:
// // //         return 'Reviews';
// // //
// // //       case 6:
// // //         return 'Chapters #1';
// // //
// // //       default:
// // //         return 'Introduction';
// // //     }
// // //   }
// // // }
// //
//
//
// /*import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'dart:io';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool? _isConnected;
//
//   // This function is triggered when the floating button is pressed
//   Future<void> _checkInternetConnection() async {
//     try {
//       final response = await InternetAddress.lookup('www.kindacode.com');
//       if (response.isNotEmpty) {
//         setState(() {
//           _isConnected = true;
//         });
//       }
//     } on SocketException catch (err) {
//       setState(() {
//         _isConnected = false;
//       });
//       if (kDebugMode) {
//         print(err);
//       }
//     }
//   }
//
//   // This will check the connection at the beginning
//   @override
//   void initState() {
//     _checkInternetConnection();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: Center(
//         child: Text(_isConnected == true ? 'Connected' : 'Not Connected',
//             style: const TextStyle(fontSize: 24)),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: _checkInternetConnection, child: const Icon(Icons.info)),
//     );
//   }
// }*/



/*import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? _isConnected;

  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // This will check the connection at the beginning
  @override
  void initState() {
    _checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Center(
        child: Text(_isConnected == true ? 'Connected' : 'Not Connected',
            style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _checkInternetConnection, child: const Icon(Icons.info)),
    );
  }
}*/






// class MyPets extends StatefulWidget {
//   @override
//   _MyPetsState createState() => _MyPetsState();
// }
//
// class _MyPetsState extends State<MyPets> {
//   Map<String, String> _formdata = {};
//   var _myPets = <Widget>[];
//   int _index = 0;
//
//   void _add() {
//     _myPets = List.from(_myPets)
//       ..add(Column(
//         children: <Widget>[
//           ListTile(
//             leading: Text('Pet ${_index+1} : '),
//             title: TextField(
//               onChanged: (val) => _formdata['pet$_index'] = val,
//             ),
//           ),
//           ListTile(
//             leading: Text('Name of Pet ${_index+1} : '),
//             title: TextField(
//               onChanged: (val) {
//                 _formdata['name$_index'] = val;
//               },
//             ),
//           ),
//         ],
//       ));
//
//     setState(() => ++_index);
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _add();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: ()=>print(_formdata),
//           child: Text('Save'),
//         ),
//         appBar: AppBar(
//           title: Text('Add your pets'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('Add another'),
//               onPressed: _add,
//             ),
//           ],
//         ),
//         body: ListView(
//           children: _myPets,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'profile.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool image =true; //logo image
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(6, 4),
              colors: <Color>[
                Color(0xFF269cc4),
                Color(0xFFffffff),
                Color(0xFF269cc4),
                Color(0xFFffffff),
              ], // red to yellow
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 450
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 750),
                    child: image? GestureDetector(
                      key: Key('2'),
                      onTap: (){
                        setState(() {
                          image=!image;
                        });
                      },
                      child: Stack(
                        children: [
                          Shimmer.fromColors(
                            highlightColor:Color(0xffB50005),
                            baseColor: Color(0xff333333),
                            enabled: true,
                            direction: ShimmerDirection.ltr,
                            child: Image.asset(
                              'image/allitson_login.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Positioned(
                          //   left: 4,
                          //   bottom: 3.9,
                          //   child: Shimmer.fromColors(
                          //     highlightColor: Colors.white,
                          //     baseColor: Color(0xff333333),
                          //     enabled: true,
                          //     direction: ShimmerDirection.ltr,
                          //     // child:
                          //     // Image.asset(
                          //     //   'image/allitson_login.png',
                          //     //   width: 119.9,
                          //     //   height: 23,
                          //     //   fit: BoxFit.fill,
                          //     // ),
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 64.3,
                          //   top: 41.7,
                          //   child: Shimmer.fromColors(
                          //     highlightColor: Colors.white,
                          //     baseColor: Color(0xff333333),
                          //     enabled: true,
                          //     direction: ShimmerDirection.ltr,
                          //     // child:
                          //     // Image.asset(
                          //     //   'assets/onlykey.png',
                          //     //   width:16.7,
                          //     //   // fit: BoxFit.fill,
                          //     // ),
                          //   ),
                          // )
                        ],
                      ),
                    ):GestureDetector(
                      key: Key('1'),
                      onTap: (){
                        setState(() {
                          image=!image;
                        });
                      },
                      // child: Image.asset(
                      //   'assets/allitson.png',
                      //   width: 120,
                      //   height: 120,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),

                  SizedBox(height: 25),

                  Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //       // blurRadius: 5,
                      //       // offset: Offset(1, 0),
                      //       color: Colors.white),//3dright
                      //   BoxShadow(
                      //       // blurRadius: 0,
                      //       // offset: Offset(0, 1),
                      //       color: Colors.white),//3dbottom
                      //   BoxShadow(
                      //       // blurRadius: 5,
                      //       // offset: -Offset(1, 0),
                      //       color: Colors.white),//3dleft
                      //   BoxShadow(
                      //       // blurRadius: 0,
                      //       // offset: -Offset(0, 1),
                      //       color: Colors.white),
                      // ],
                      borderRadius: BorderRadius.circular(15),
                      // image: DecorationImage(
                      //   image: AssetImage('assets/userword.png'),
                      //   fit: BoxFit.fill,
                      // )
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(

                      focusNode: myFocusNode,
                      cursorColor: Colors.white,
                      autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color:  Color(0xFF00BFFF),
                        ),
                        hintText: 'Username',
                        labelStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //       // blurRadius: 5,
                      //       // offset: Offset(1, 0),
                      //       color: Colors.white),//3dright
                      //   BoxShadow(
                      //       // blurRadius: 0,
                      //       // offset: Offset(0, 1),
                      //       color: Colors.white),//3dbottom
                      //   BoxShadow(
                      //       // blurRadius: 5,
                      //       // offset: -Offset(1, 0),
                      //       color: Colors.white),//3dleft
                      //   BoxShadow(
                      //       // blurRadius: 0,
                      //       // offset: -Offset(0, 1),
                      //       color: Colors.white),
                      // ],
                      borderRadius: BorderRadius.circular(15),
                      // image: DecorationImage(
                      //   image: AssetImage('assets/userword.png'),
                      //   fit: BoxFit.fill,
                      // )
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(

                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_rounded,
                          color: Color(0xFF00BFFF),
                        ),
                        hintText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.5,),

                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6)
                      ),
                    ),
                  ),

                  SizedBox(height: 12.5,),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  myapp()));
                    },
                    child: Container(
                      height: 32,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        // image: DecorationImage(
                        //   image: AssetImage('assets/loginbutton.png'),
                        //   fit: BoxFit.fill,
                        // )
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}