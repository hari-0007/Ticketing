import 'dart:async';
import 'dart:convert';

import 'package:allitson/matrixpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(const MyApp());
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel(email: '',password: '',);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/loginpagefull.png'),
              fit: BoxFit.fill,
            )
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
                        Card(
                            semanticContainer: false,
                            borderOnForeground: true,
                            elevation: 20,
                            color: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(60,120),
                                topRight: Radius.elliptical(60,120),
                              ),
                            ),
                            child: Shimmer.fromColors(
                              highlightColor:Color(0xffB50005),
                              baseColor: Color(0xff333333),
                              enabled: true,
                              direction: ShimmerDirection.ltr,
                              child: Image.asset(
                                'assets/allitson.png',
                                width: 120,
                                height: 120,
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                        Positioned(
                          left: 4,
                          bottom: 3.9,
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Color(0xff333333),
                            enabled: true,
                            direction: ShimmerDirection.ltr,
                            child:
                            Image.asset(
                              'assets/allitsonname.png',
                              width: 119.9,
                              height: 23,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 64.3,
                          top: 41.7,
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Color(0xff333333),
                            enabled: true,
                            direction: ShimmerDirection.ltr,
                            child:
                            Image.asset(
                              'assets/onlykey.png',
                              width:16.7,
                              // fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ):GestureDetector(
                    key: Key('1'),
                    onTap: (){
                      setState(() {
                        image=!image;
                      });
                    },
                    child: Card(
                      semanticContainer: false,
                      borderOnForeground: true,
                      elevation: 20,
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(60,120),
                          topRight: Radius.elliptical(60,120),
                        ),
                      ),
                      child: Image.asset(
                        'assets/allitson.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(1, 0),
                            color: Colors.black.withOpacity(0.4)),//3dright
                        BoxShadow(
                            blurRadius: 0,
                            offset: Offset(0, 1),
                            color: Colors.black.withOpacity(0.4)),//3dbottom
                        BoxShadow(
                            blurRadius: 5,
                            offset: -Offset(1, 0),
                            color: Colors.black.withOpacity(0.4)),//3dleft
                        BoxShadow(
                            blurRadius: 0,
                            offset: -Offset(0, 1),
                            color: Colors.black.withOpacity(0.4)),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/userword.png'),
                        fit: BoxFit.fill,
                      )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    cursorColor: Colors.white,
                    obscureText: false,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      hintText: 'Username',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.6)
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (input){
                      setState(() {
                        loginRequestModel.email = input.trim();
                      });
                    },
                  ),
                ),

                SizedBox(height: 15,),

                Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(1, 0),
                            color: Colors.black.withOpacity(0.4)),//3dright
                        BoxShadow(
                            blurRadius: 0,
                            offset: Offset(0, 1),
                            color: Colors.black.withOpacity(0.4)),//3dbottom
                        BoxShadow(
                            blurRadius: 5,
                            offset: -Offset(1, 0),
                            color: Colors.black.withOpacity(0.4)),//3dleft
                        BoxShadow(
                            blurRadius: 0,
                            offset: -Offset(0, 1),
                            color: Colors.black.withOpacity(0.4)),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/userword.png'),
                        fit: BoxFit.fill,
                      )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      hintText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.6)
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (input){
                      setState(() {
                        loginRequestModel.password = input.trim();
                      });
                    },
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
                  onTap: () {
                    // sendRequest();
                    // print(emailController.text);
                    FocusManager.instance.primaryFocus?.unfocus();
                    // print(json.encode(loginRequestModel));
                    // print(json.encode(data));
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>  MatrixPage()
                        )
                    );
                  },
                  child: Container(
                    height: 32,
                    width: 175,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              offset: Offset(1, 0),
                              color: Colors.black.withOpacity(0.4)),//3dright
                          BoxShadow(
                              blurRadius: 0,
                              offset: Offset(0, 1),
                              color: Colors.black.withOpacity(0.4)),//3dbottom
                          BoxShadow(
                              blurRadius: 5,
                              offset: -Offset(1, 0),
                              color: Colors.black.withOpacity(0.4)),//3dleft
                          BoxShadow(
                              blurRadius: 0,
                              offset: -Offset(0, 1),
                              color: Colors.black.withOpacity(0.4)),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage('assets/loginbutton.png'),
                          fit: BoxFit.fill,
                        )
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
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
    );
  }


  sendRequest() async {

    /*Map<String, dynamic> data = {
      "method" : "user.login",
      "jsonrpc" : "2.0",
      "params" : {
          "username": "keerthi",
          "password": "123"
        },
      "id" : "1"
    };*/

    var url = 'http://192.168.0.102:8000/';
    var response = await http.post(Uri.parse(url), body: json.encode(loginRequestModel),
      headers: {
      'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Some token"
      },
    );
    //     .then((response) {
    //   if(response.statusCode==200){
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text('Login Successful'),));
    //   }else{
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text('Login UnSuccessful'),));
    //   }
    //   print(response.statusCode);
    //   print(response.body);
    //   print(response.request);
    //   print(response.reasonPhrase);
    //   print(response.persistentConnection);
    //   print(response.isRedirect);
    // });
    if(response.statusCode==200){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Login Successful'),
      ));
      Timer(Duration(seconds: 1),(){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>  MatrixPage()
            )
        );
      });
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(jsonDecode(response.body)["error"]),
      ));
    }
    print(response.statusCode);
    print(jsonDecode(response.body));
    print(jsonDecode(response.body)["result"]);
    print(response.request);
    print(response.reasonPhrase);
    print(response.persistentConnection);
    print(response.isRedirect);
    print(Uri.parse(url).isAbsolute);
  }

  /*sendRequest() async {

    Map data = {
      "method" : "user.login",
      "jsonrpc" : "2.0",
      "username" : "keerthi",
      "password" : "123",
      "id" : "1"
    };

    var url = 'http://192.168.0.104:8000/';
    http.post(Uri.parse(url), body: data)
        .then((response) {
      print(response.statusCode);
      if(response.statusCode==200){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successful'),));
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login UnSuccessful'),));
    }
      print(response.body);
      print(response.request);
      print(response.reasonPhrase);
      print(response.persistentConnection);
      print(response.isRedirect);
    });
  }*/

}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "method" : "user.login",
      "jsonrpc" : "2.0",
      "params" : {
        "username": email,
        "password": password
      },
      "id" : 1
    };

    return map;
  }
}


