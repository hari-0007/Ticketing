import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Button extends StatefulWidget {

  final VoidCallback onTap;
  final String text;
  bool isGroupPressed;

  Button({Key? key, required this.onTap(),required this.text, required this.isGroupPressed}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  // bool isGroupPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset offset = widget.isGroupPressed?Offset(2.5, 2.5):Offset(5, 5);
    double blur = widget.isGroupPressed?1.0:5;
    Color textColor = widget.isGroupPressed?Colors.white.withOpacity(0.9):Colors.white.withOpacity(1);

    return GestureDetector(
      onTap: (){
        setState(() {

          widget.onTap();

          // isGroupPressed=!isGroupPressed;

        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 175),
        decoration: BoxDecoration(
            color: Color(0xff5F8A9F),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [

              BoxShadow(
                blurRadius: blur,
                offset: -offset,
                color: Colors.white.withOpacity(0.35),
                inset: widget.isGroupPressed,
              ),

              BoxShadow(
                blurRadius: blur,
                offset: offset,
                color: Colors.black.withOpacity(0.35),
                inset: widget.isGroupPressed,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.text,
            style: TextStyle(
              color: textColor,
              // shadows: [
              //   Shadow(
              //     offset:isGroupPressed?Offset(0, 0):Offset(1, 1),
              //     blurRadius: isGroupPressed?0:1,
              //     color: isGroupPressed?Colors.black.withOpacity(0.0):Colors.black.withOpacity(0.8),
              //   )
              // ]
            ),
          ),
        ),
      ),
    );
  }
}