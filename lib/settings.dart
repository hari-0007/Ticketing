import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        SafeArea(
          child: Container
            (child: Center
            (child:
          Text("Settings", style: TextStyle(fontSize: 32),
          )
          ),
          ),
        )
    );
  }
}