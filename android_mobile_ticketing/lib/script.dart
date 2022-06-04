import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainerWidget  extends StatelessWidget {
  final String text;

  const MyContainerWidget ({Key? key,required this.text} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/folderblue.png'),
                fit: BoxFit.contain,
              )
          ),
        ),
        Text(
            text,
          style: TextStyle(
            color: Colors.black87.withOpacity(0.8),
            fontSize: 15.5,
            fontWeight: FontWeight.w400,
            fontFamily: 'fonts/Roboto-Regular.ttf',
          ),
        ),
      ],
    );
  }
}