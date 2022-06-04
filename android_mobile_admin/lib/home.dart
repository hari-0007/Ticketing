import 'package:flutter/material.dart';
import 'package:neworganization/user_1.dart';
import 'globals (1).dart'as globlas;
class dartboard extends StatefulWidget {
  const dartboard({Key? key}) : super(key: key);

  @override
  State<dartboard> createState() => _dartboardState();
}

class _dartboardState extends State<dartboard> {
  @override
  Widget build(BuildContext context) {
    return /*MaterialApp(
      debugShowCheckedModeBanner: false,
      home:*/ SafeArea(
      child:
      ListView(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 50, right: 10,),
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(6, 4),
                    colors: <Color>[
                      Color(0xFF269cc4),
                      Color(0xFFffffff),])),
            child: Column(children: [
              Text("Organization",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
              Divider(height: 2,color: Colors.black,thickness: 2.4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("${userState().displayname.length}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Active",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("100",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("InActive",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("50",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Package_Experied",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("10",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              )

            ],),
          ),
          SizedBox(height: 50,),
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 50, right: 10),
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(6, 4),
                    colors: <Color>[
                      Color(0xFF269cc4),
                      Color(0xFFffffff),])),
            child: Column(children: [
              Text("DEVICE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
              Divider(height: 2,color: Colors.black,thickness: 2.4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Online",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("500",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Offline",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("100",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discovered",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("50",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("InActive",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("10",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              )
            ],),
          ),
          SizedBox(height: 0,),
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 50, right: 10),
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(6, 4),
                    colors: <Color>[
                      Color(0xFF269cc4),
                      Color(0xFFffffff),])),
            child: Column(children: [
              Text("Admin User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
              Divider(height: 2,color: Colors.black,thickness: 2.4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("${globlas.g_user+1}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Active",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("InActive",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
            ],),
          ),
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 50, right: 10),
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(6, 4),
                    colors: <Color>[
                      Color(0xFF269cc4),
                      Color(0xFFffffff),])),
            child: Column(children: [
              Text("Tech User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
              Divider(height: 2,color: Colors.black,thickness: 2.4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Active",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("InActive",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white))
                ],
              ),
            ],),
          ),

        ],
      ));
     /*),
      ),
    );*/
  }
}
