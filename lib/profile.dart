//
import 'package:flutter/material.dart';
import 'home.dart';
import 'user_1.dart';
import 'bench.dart';
import 'settings.dart';
import 'team.dart';

// void main() {
//
//   runApp( myapp());
// }
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final items = [
  //   BottomNavigationBarItem (icon: Icon (Icons. home), label: 'Home Page'),
  //   BottomNavigationBarItem (icon: Icon (Icons. music_video), label:'Listen'),
  //   // BottomNavigationBarItem (icon: Icon (Icons. message), label: 'message')
  // ];
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final bodyList = [
    dartboard(),
    user(),
    group(),
    bnch(),
    setting(),
  ];

  final pageController = PageController();

  int currentIndex = 0;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      /*MaterialApp(
      home: */SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          drawer:
          Container(
            width:MediaQuery.of(context).size.width-200,
            child: Drawer(
                child:
                Container(
                  decoration: BoxDecoration(
                      gradient:  LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(6, 6),
                          colors: <Color>[
                            Color(0xFF269cc4),
                            Color(0xFFffffff),
                            Color(0xFF269cc4),
                            Color(0xFFffffff),])),
                  child: Column(
                    children: [
                      Divider(),
                      Column(
                        children: [
                          CircleAvatar(radius: 50,backgroundImage: AssetImage("image/karolis-profile-pic.jpg")),
                        ],
                      ),
                      Text("_USER_NAME_",style: TextStyle(),),
                      Divider(),
                      Expanded(
                        child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){setState(() {
                                  pageController.jumpToPage(0);

                                  _scaffoldKey.currentState!.openEndDrawer();

                                });},
                                child: Container(
                                  color: currentIndex == 0? Colors.white10 : Colors.transparent,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      VerticalDivider(),
                                      Flexible(
                                        // flex: 5,
                                          child: Icon(Icons.home,)),
                                      VerticalDivider(),
                                      Flexible(
                                        // flex: 2,
                                          child: Text("Home",style: TextStyle(),)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: (){setState(() {
                                  pageController.jumpToPage(1);


                                  _scaffoldKey.currentState!.openEndDrawer();


                                });},
                                child: Container(
                                  color: currentIndex == 1? Colors.white10 : Colors.transparent,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      VerticalDivider(),
                                      Flexible(child: Icon(Icons.verified_user,)),
                                      VerticalDivider(),
                                      Flexible(child: Text("Organization",style: TextStyle(),)),
                                    ],
                                  ),
                                ),
                              ),  Divider(),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    pageController.jumpToPage(2);
                                    // selectedWidgetMarker = page.group;

                                    _scaffoldKey.currentState!.openEndDrawer();

                                  });
                                },
                                child: Container(
                                  color: currentIndex == 2? Colors.white10 : Colors.transparent,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      VerticalDivider(),
                                      Flexible(child: Icon(Icons.group,)),
                                      VerticalDivider(),
                                      Flexible(child: Text("Team",style: TextStyle(),)),


                                    ],
                                  ),
                                ),
                              ),  Divider(),
                              GestureDetector(
                                onTap: (){setState(() {
                                  pageController.jumpToPage(3);
                                  // selectedWidgetMarker = page.bench;

                                  _scaffoldKey.currentState!.openEndDrawer();

                                });},
                                child: Container(
                                  color: currentIndex == 3? Colors.white10 : Colors.transparent,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      VerticalDivider(),
                                      Flexible(child: Icon(Icons.person_add_alt_1_rounded,)),
                                      VerticalDivider(),
                                      Flexible(child: Text("Bench",style: TextStyle(),)),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap:(){setState(()
                            {
                              print("setup");
                            });},
                            child: Container(
                              color: currentIndex == 4? Colors.white10 : Colors.transparent,
                              child: Row(
                                children: [
                                  VerticalDivider(),
                                  Flexible(child: Icon(Icons.portrait_rounded,)),
                                  VerticalDivider(),
                                  Flexible(child: Text("Profile",style: TextStyle(),)),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                print("signout");
                              });
                            },
                            child: Container(
                              color: currentIndex == 5 ? Colors.white10 : Colors.transparent,
                              child: Row(
                                children: [
                                  VerticalDivider(),
                                  Flexible(child: Icon(Icons.login,)),
                                  VerticalDivider(),
                                  Flexible(child: Text("Signout",style: TextStyle(),)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ) ,
                    ],
                  ),
                )

              /*Column(
                  children: [
                    GestureDetector(
                      onTap: ()
                      {
                        // currentIndex = 1;
                      setState(() {
                        pageController.jumpToPage(0);
                          _scaffoldKey.currentState!.openEndDrawer();
                      });
                      },
                      child: Container(
                        child:Text("Home") ,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()
                      {
                        // currentIndex = 1;
                       setState(() {
                         pageController.jumpToPage(1);
                           _scaffoldKey.currentState?.openEndDrawer();
                       });
                      },
                      child: Container(
                        child:Text("Listen") ,
                      ),
                    ),

                  ],
                ),*/
            ),
          ),
          // BottomNavigationBar(
          //     items: items, currentIndex: currentIndex, onTap: onTap),
          // body: bodyList[currentIndex],
          body: PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: bodyList,
            physics: NeverScrollableScrollPhysics(), // No sliding
          )),
      // ),
    );
  }
}
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// enum WidgetMarker{list,edit,add}
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
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//       ),
//       home:  MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   List<List<List<Map>>> branch_Document = [];
//
//   List<List<Map>> branch= [];
//
//   List<List<BranchWidget>> branchWidget = [];
//
//   List<List<Map>> document = [];
//
//   List<List<DocumentWidget>> documentWidget = [];
//
//   WidgetMarker selectedWidgetMarker = WidgetMarker.list;
//
//   int selectedIndex = 0;
//   int currentStep = 0;
//
//   final firstName =TextEditingController();
//   final lastName =TextEditingController();
//
//   List<Map<String, dynamic>> ticket = [];
//
//   @override
//   Widget build(BuildContext context) {
//
//     Widget getCustomContainer(){
//       switch (selectedWidgetMarker){
//         case WidgetMarker.edit:
//           return getEditer();
//         case WidgetMarker.list:
//           return getList();
//         case WidgetMarker.add:
//           return getAdder();
//       }
//     }
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//
//           /*ticket[0].forEach((key, value) {
//               print("${key}:${value}");
//             });
//
//             print("docuMent");
//             for(int i=0;i<ticket[0]["docuMent"].length;i++){
//               print(ticket[0]["docuMent"][i]);
//             }
//
//             for(int j=0;j<ticket[0]["branch"].length;j++){
//               print(ticket[0]["branch"][j]["Branch_Name"]);
//               print(ticket[0]["branch"][j]["Org_Name"]);
//               for(int k=0; k<ticket[0]["branch"][j]["Branch_Doc"].length;k++){
//                 print(ticket[0]["branch"][j]["Branch_Doc"][k]);
//               }
//             }*/
//
//           for(int l=0;l<ticket.length;l++){
//             print(ticket[l]);
//             print("firstName ${ticket[l]["firstName"]}");
//             print("lastName ${ticket[l]["lastName"]}");
//             for(int m=0;m<ticket[l]["docuMent"].length;m++){
//               print("docuMent${(m+1)}:${ticket[l]["docuMent"][m]}");
//             }
//             for(int n=0;n<ticket[l]["branch"].length;n++){
//               print(ticket[l]["branch"][n]["Branch_Name"]);
//               print(ticket[l]["branch"][n]["Org_Name"]);
//               for(int o=0;o<ticket[l]["branch"][n]["Branch_Doc"].length;o++){
//                 print(ticket[l]["branch"][n]["Branch_Doc"][o]);
//               }
//             }
//
//
//           }
//
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: (){
//
//                 setState(() {
//                   branch_Document.add([]);
//                   branch.add([]);
//                   branchWidget.add([]);
//
//                   document.add([]);
//                   documentWidget.add([]);
//
//                   selectedWidgetMarker = WidgetMarker.add;
//                 });
//                 // print(branch[0]);
//
//               },
//               icon: Icon(Icons.add)
//           )
//         ],
//       ),
//       body: Center(
//
//         child: getCustomContainer(),
//       ),
//     );
//   }
//
//   Widget getList(){
//     return Container(
//       child: ListView.builder(
//         itemCount: ticket.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//
//             onTap: (){
//
//               print(branch_Document[selectedIndex]);
//
//               setState(() {
//                 selectedIndex = index;
//                 selectedWidgetMarker = WidgetMarker.edit;
//               });
//               print(selectedIndex);
//
//
//               print(ticket[selectedIndex]);
//               print(ticket[selectedIndex]["branch"]);
//
//               // firstName.text = ticket[selectedIndex]["firstName"];
//               // lastName.text = ticket[selectedIndex]["lastName"];
//
//               // print(ticket[selectedIndex]["firstName"]);
//               // print(ticket[selectedIndex]["lastName"]);
//
//               // print(firstName.text);
//               // print(lastName.text);
//
//             },
//
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Container(
//                 // height: 300,
//                 color: Colors.green,
//                 child: Column(
//                   children: [
//
//                     Text("First : ${ticket[index]["firstName"]}"),
//
//                     SizedBox(height: 10,),
//
//                     Text("Last : ${ticket[index]["lastName"]}"),
//
//                     SizedBox(height: 10,),
//
//                     Text(
//                       // "${documentWidget[index]}"
//                         "${ticket[index]["docuMent"]}"
//                     ),
//
//                     SizedBox(height: 10,),
//
//                     /*for(i in ticket[index]["branch"]){
//
//                     }*/
//
//                     for (int i =0;i<ticket[index]["branch"].length;i++)...[
//                       Text(ticket[index]["branch"][i].toString()),
//                       SizedBox(height: 10,),
//                     ],
//
//                     /*Expanded(
//                       child: ListView.builder(
//                         itemCount: ticket[index]["branch"].length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             margin: EdgeInsets.all(5),
//                             child: Text(ticket[0]["branch"][index].toString()),
//                             // width: 10,
//                           );
//                         },
//                       ),
//                     ),*/
//
//                     /*Expanded(
//                         child: Text(
//                           "${ticket[index]["branch"]}"
//                         )
//                     ),*/
//
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//
//       ),
//     );
//   }
//
//   Widget getAdder(){
//     return Stepper(
//       type: StepperType.horizontal,
//       currentStep: currentStep,
//       steps: [
//
//         Step(
//           title: Text("1"),
//           isActive: currentStep>=0,
//           content: Container(
//             height: MediaQuery.of(context).size.height-265,
//             width: MediaQuery.of(context).size.width,
//             child: SingleChildScrollView(
//               reverse: false,
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//
//                   TextField(
//                     controller: firstName,
//                     /*onSubmitted: (value){
//                       firstName.text=value;
//                     },*/
//                   ),
//
//                   ElevatedButton(
//                       onPressed: (){
//
//                         print(documentWidget);
//
//                         setState(() {
//                           documentWidget[ticket.length].add(DocumentWidget());
//                         });
//
//                       },
//                       child: Text("ADD")
//                   ),
//
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: documentWidget[ticket.length].length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//
//                           Flexible(child: documentWidget[ticket.length][index]),
//                           SizedBox(width: 10,),
//                           GestureDetector(
//                               onTap: (){
//                                 setState(() {
//                                   documentWidget[ticket.length].removeAt(index);
//                                 });
//                               },
//                               child: Icon(Icons.remove_circle)
//                           )
//                         ],
//                       );
//                     },
//                   ),
//
//                   ElevatedButton(
//                       onPressed: (){
//                         setState(() {
//                           branchWidget[ticket.length].add(BranchWidget());
//                         });
//                       },
//                       child: Text("Branch")
//                   ),
//
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: branchWidget[ticket.length].length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Row(
//                         children: [
//
//                           Text((index+1).toString()),
//
//                           Flexible(child: branchWidget[ticket.length][index]),
//
//                           SizedBox(width: 10,),
//
//                           GestureDetector(
//                               onTap:(){
//                                 setState(() {
//                                   branchWidget[ticket.length].removeAt(index);
//                                 });
//                               },
//                               child: Icon(
//                                 Icons.remove,
//                                 color: Colors.red,
//                               )
//                           )
//                         ],
//                       );
//                     },
//                   ),
//
//                   // Expanded(child: Container())
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//
//         Step(
//             title: Text("2"),
//             isActive: currentStep>=1,
//             content: Container(
//               height: MediaQuery.of(context).size.height-265,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: lastName,
//                     /*onSubmitted: (value){
//                     lastName.text=value;
//                   },*/
//                   ),
//                 ],
//               ),
//             )
//         ),
//
//         Step(
//             title: Text("3"),
//             isActive: currentStep>=2,
//             content: Container(
//               height: MediaQuery.of(context).size.height-265,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   Text("First Name : ${firstName.text}"),
//                   Text("Last Name : ${lastName.text}"),
//
//                   for ( var i in documentWidget[ticket.length])
//                     Text("${i.controller.text}:${i.extension.toString()}")
//
//
//                   /*documentWidget[ticket.length].forEach((element) {
//                     Text(element.controller.text);
//                   })*/
//
//                   // Text(documentWidget[ticket.length]),
//                   // Text("${ticket[ticket.length]["docuMent"]}")
//                 ],
//               ),
//             )
//         )
//
//       ],
//
//       onStepCancel: (){
//
//         if(currentStep==1){
//
//           setState(() {
//             currentStep--;
//           });
//
//         }
//
//       },
//
//       onStepContinue: (){
//         if(currentStep==0){
//
//           // print(currentStep);
//           setState(() {
//             currentStep++;
//           });
//
//           for(int i=0 ; i<branchWidget[ticket.length].length; i++){
//             print("${i.toString()}:${branchWidget[ticket.length][i]}");
//             branch_Document[ticket.length].add([]);
//             for(int d=0;d<branchWidget[ticket.length][i].branchDocument.length;d++){
//               // branch_Document[i].add([]);
//               // print("${(d+1).toString()}:${branchWidget[ticket.length][i].branchDocument[d]}");
//               branch_Document[ticket.length][i].add(Document(
//                   fileName: branchWidget[ticket.length][i].branchDocument[d].controller.text,
//                   image: branchWidget[ticket.length][i].branchDocument[d].imagepath).toMap());
//             }
//           }
//
//           // print(branchWidget[ticket.length]);
//           // print(branchWidget[ticket.length][0]);
//           print(branch_Document);
//
//           /*branchWidget[ticket.length].forEach((element) {
//             branch[ticket.length].add(Branch(branchName: element.branchName.text, orgName: element.orgName.text,branchDoc: branch_Document[ticket.length][0]).toMap());
//           });*/
//
//           for(int i=0;i<branchWidget[ticket.length].length;i++){
//             branch[ticket.length].add(Branch(
//                 branchName: branchWidget[ticket.length][i].branchName.text,
//                 orgName: branchWidget[ticket.length][i].orgName.text,
//                 branchDoc: branch_Document[ticket.length][i]).toMap());
//           }
//
//           print(branch[ticket.length]);
//
//         }
//         else if(currentStep==1){
//
//           setState(() {
//             currentStep++;
//           });
//
//           // print(branchWidget[ticket.length]);
//
//         }else if(currentStep==2){
//
//           // document.clear();
//
//           documentWidget[ticket.length].forEach((element) {
//             document[ticket.length].add(Document(fileName: element.controller.text, image: element.imagepath).toMap());
//
//             /*branchWidget[ticket.length].forEach((element) {
//               branch[ticket.length].add(Branch(branchName: element.branchName.text, orgName: element.orgName.text).toMap());
//             });*/
//
//             print(branch[ticket.length]);
//
//           });
//
//           setState(() {
//
//             selectedWidgetMarker=WidgetMarker.list;
//             currentStep = 0;
//
//             ticket.add(
//                 {
//                   "firstName":firstName.text,
//                   "lastName":lastName.text,
//                   "docuMent":document[ticket.length],
//                   "branch":branch[ticket.length],
//                 }
//             );
//
//           });
//
//           print(ticket);
//
//           firstName.clear();
//           lastName.clear();
//
//         }
//       },
//
//     );
//   }
//
//   Widget getEditer(){
//
//     firstName.text = ticket[selectedIndex]["firstName"];
//     lastName.text = ticket[selectedIndex]["lastName"];
//
//     return Stepper(
//       type: StepperType.horizontal,
//       currentStep: currentStep,
//       steps: [
//
//         Step(
//             title: Text("E1"),
//             isActive: currentStep>=0,
//             content: Container(
//               height: MediaQuery.of(context).size.height-265,
//               width: MediaQuery.of(context).size.width,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: firstName,
//
//                       onChanged: (value){
//                         ticket[selectedIndex]["firstName"]=value;
//                       },
//
//                       /*onSubmitted: (value){
//                       setState(() {
//                         ticket[selectedIndex]["firstName"]=value;
//                       });
//                     },*/
//                     ),
//
//                     ElevatedButton(
//                         onPressed: (){
//
//                           setState(() {
//                             documentWidget[selectedIndex].add(DocumentWidget());
//                           });
//
//                           setState(() {
//
//                           });
//
//                           print(documentWidget[selectedIndex]);
//
//                         },
//                         child: Text("Edit ADD")
//                     ),
//
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: documentWidget[selectedIndex].length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//
//                             Flexible(child: documentWidget[selectedIndex][index]),
//
//
//
//                             GestureDetector(
//                                 onTap: (){
//
//                                   // print(document[selectedIndex]);
//
//                                   setState(() {
//                                     // document[selectedIndex].removeAt(index);
//                                     documentWidget[selectedIndex].removeAt(index);
//                                   });
//
//                                   print(documentWidget[selectedIndex]);
//
//                                 },
//                                 child: Icon(Icons.remove_circle)
//                             )
//
//                           ],
//                         );
//                       },
//                     ),
//
//                     ElevatedButton(
//                         onPressed: (){
//
//                           setState(() {
//                             branchWidget[selectedIndex].add(BranchWidget());
//                           });
//
//                         },
//                         child: Text("Branch Edit Add")
//                     ),
//
//                     ListView.builder(
//                       itemCount: branchWidget[selectedIndex].length,
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Row(
//                           children: [
//
//                             Text((index+1).toString()),
//
//                             Flexible(child: branchWidget[selectedIndex][index]),
//
//                             SizedBox(width: 10,),
//
//                             GestureDetector(
//                                 onTap:(){
//                                   setState(() {
//                                     // branch[selectedIndex].removeAt(index);
//                                     branchWidget[selectedIndex].removeAt(index);
//                                   });
//                                 },
//                                 child: Icon(
//                                   Icons.remove,
//                                   color: Colors.red,
//                                 )
//                             )
//                           ],
//                         );
//                       },
//                     )
//
//                   ],
//                 ),
//               ),
//             )
//         ),
//
//         Step(
//             title: Text("E2"),
//             isActive: currentStep>=1,
//             content: Container(
//               height: MediaQuery.of(context).size.height-265,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: lastName,
//
//                     onChanged: (value){
//                       ticket[selectedIndex]["lastName"]=value;
//                     },
//
//                     /*onSubmitted: (value){
//                       setState(() {
//                         ticket[selectedIndex]["lastName"]=value;
//                       });
//                     },*/
//                   ),
//                 ],
//               ),
//             )
//         ),
//
//         Step(
//             title: Text("E3"),
//             isActive: currentStep>=2,
//             content: Container(
//               height: MediaQuery.of(context).size.height-265,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   Text("First Name : ${firstName.text}"),
//                   Text("Last Name : ${lastName.text}"),
//
//                   Text("${firstName.text}${lastName.text}"),
//
//                   for ( var i in documentWidget[selectedIndex])
//                     Text("${i.controller.text}:${i.extension.toString()}")
//
//                 ],
//               ),
//             )
//         ),
//
//       ],
//
//       onStepContinue: (){
//
//         print(currentStep);
//
//         if(currentStep==0){
//
//           setState(() {
//             currentStep++;
//           });
//
//           document[selectedIndex].clear();
//           documentWidget[selectedIndex].forEach((element) {
//             document[selectedIndex].add(Document(fileName: element.controller.text, image: element.imagepath).toMap());
//             // print(Document(fileName: element.controller.text, image: element.imagepath).toMap());
//           });
//
//           /*for(int i=0 ; i<branchWidget[ticket.length].length; i++){
//               print("${i.toString()}:${branchWidget[ticket.length][i]}");
//               branch_Document[ticket.length].add([]);
//               for(int d=0;d<branchWidget[ticket.length][i].branchDocument.length;d++){
//                 // branch_Document[i].add([]);
//                 // print("${(d+1).toString()}:${branchWidget[ticket.length][i].branchDocument[d]}");
//                 branch_Document[ticket.length][i].add(Document(fileName: branchWidget[ticket.length][i].branchDocument[d].controller.text, image: branchWidget[ticket.length][i].branchDocument[d].imagepath).toMap());
//               }
//             }*/
//
//           branch_Document[selectedIndex].clear();
//           // print(branchWidget[selectedIndex].length);
//           for(int i=0 ; i<branchWidget[selectedIndex].length; i++){
//             print("${i.toString()}:${branchWidget[selectedIndex][i]}");
//             branch_Document[selectedIndex].add([]);
//             for(int d=0;d<branchWidget[selectedIndex][i].branchDocument.length;d++){
//               print("${(d+1).toString()}:${branchWidget[selectedIndex][i].branchDocument[d]}");
//               branch_Document[selectedIndex][i].add(Document(fileName: branchWidget[selectedIndex][i].branchDocument[d].controller.text, image: branchWidget[selectedIndex][i].branchDocument[d].imagepath).toMap());
//             }
//           }
//
//
//           branch[selectedIndex].clear();
//           for(int i=0;i<branchWidget[selectedIndex].length;i++){
//             branch[selectedIndex].add(Branch(
//                 branchName: branchWidget[selectedIndex][i].branchName.text,
//                 orgName: branchWidget[selectedIndex][i].orgName.text,
//                 branchDoc: branch_Document[selectedIndex][i]).toMap());
//           }
//
//           print(branch_Document[selectedIndex]);
//           print(branch[selectedIndex]);
//
//
//         }else if(currentStep==1){
//
//           setState(() {
//             currentStep++;
//           });
//
//         }else if(currentStep==2){
//
//           setState(() {
//             selectedWidgetMarker=WidgetMarker.list;
//             currentStep = 0;
//           });
//           print(ticket[selectedIndex]);
//
//           ticket[selectedIndex]["firstName"]= firstName.text;
//           ticket[selectedIndex]["lastName"]= lastName.text;
//           firstName.clear();
//           lastName.clear();
//           print("Complete");
//           print(ticket);
//
//         }
//       },
//
//       onStepCancel: (){
//         if(currentStep==1){
//           setState(() {
//             currentStep--;
//           });
//         }
//       },
//
//     );
//   }
//
// }
//
// class BranchWidget extends StatelessWidget {
//
//   List<DocumentWidget> branchDocument = [];
//   TextEditingController branchName = TextEditingController();
//   TextEditingController orgName = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//         return Column(
//           children: [
//             TextField(
//               controller: branchName,
//             ),
//
//             TextField(
//               controller: orgName,
//             ),
//
//             ElevatedButton(
//               onPressed: (){
//                 setState((){
//                   branchDocument.add(DocumentWidget());
//                 });
//               },
//               child: Text("BranchDoc"),
//             ),
//
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: branchDocument.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//
//                     Flexible(child: branchDocument[index]),
//
//                     SizedBox(width: 10,),
//
//                     GestureDetector(
//                         onTap: (){
//                           setState((){
//                             branchDocument.removeAt(index);
//                           });
//                         },
//                         child: Icon(Icons.remove_circle)
//                     )
//
//                   ],
//                 );
//               },
//             )
//
//             /*Flexible(
//               child: ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     height: 10,
//                     width: 10,
//                     color: Colors.black,
//                   );
//                 },
//               ),
//             )*/
//
//           ],
//         );
//       },
//     );
//   }
// }
//
//
// class DocumentWidget extends StatelessWidget {
//
//   TextEditingController controller = TextEditingController();
//
//   String imagepath = "";
//   String? extension ;
//
//   /*Map<String, dynamic> toMap() {
//     return {
//       'name': controller.text.toString(),
//     };
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//         return Row(
//           children: [
//
//             Expanded(
//               // height: 40,
//               // width: 190,
//               // margin: EdgeInsets.all(10),
//               child: TextField(
//                 controller: controller,
//                 decoration: InputDecoration(hintText: "enter data"),
//                 onChanged: (value){
//                   setState((){
//
//                   });
//                 },
//               ),
//             ),
//
//             IgnorePointer(
//               ignoring: !(controller.text.length>2),
//               child: GestureDetector(
//                 onTap: () async{
//
//                   print(!(controller.text.length>2));
//                   final pickedImage = await FilePicker.platform.pickFiles(
//                     allowCompression: true,
//                   );
//
//                   if(pickedImage != null){
//                     print(pickedImage.paths.toString());
//                     setState((){
//                       imagepath = pickedImage.paths[0].toString();
//                       extension =pickedImage.files[0].extension;
//                     });
//                     print(imagepath);
//                   }else{
//                     print("No Image Selected");
//                   }
//
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.photo,
//                       color: imagepath.length>0?Colors.blue:Colors.black,
//                     ),
//
//                     Text(extension==null?"No file Chosen":extension.toString()),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         );
//       },
//     );
//   }
// }
//
// class Document{
//
//   String fileName;
//   String image;
//
//   Document({required this.fileName, required this.image});
//
//   /*@override toString() {
//     return '{Date:$date,Message:$name}';
//     // return 'Message: $name';
//     // '{id: $id, title: $title}'
//   }*/
//
//   Map<String, dynamic> toMap() {
//     return {
//       'FileName':fileName,
//       'Image': image,
//     };
//   }
// }
//
// class Branch{
//
//   String branchName;
//   String orgName;
//   List<Map> branchDoc = [];
//
//   Branch({required this.branchName, required this.orgName,required this.branchDoc});
//
//   Map<String,dynamic> toMap(){
//     return {
//       "Branch_Name":branchName,
//       "Org_Name":orgName,
//       "Branch_Doc":branchDoc
//     };
//   }
//
// }
//
//

// import 'package:flutter/material.dart';
// import 'package:sidebarx/sidebarx.dart';
// import 'home.dart';
// import 'user_1.dart';
// import 'bench.dart';
// import 'settings.dart';
// import 'team.dart';
//
// enum page {home,user,group,bench,settings}
// // void main() {
// //   runApp(admin());
// // }
//
// class admin extends StatefulWidget {
//   admin({Key? key}) : super(key: key);
//
//   @override
//   State<admin> createState() => _adminState();
// }
//
// class _adminState extends State<admin> {
//   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   var selectedWidgetMarker = page.group;
//   @override
//   Widget build(BuildContext context) {
//
//     return
//       // MaterialApp(
//       // title: 'SidebarX Example',
//       // debugShowCheckedModeBanner: false,
//       //
//       // home:
//     Scaffold(key: _scaffoldKey,
//         resizeToAvoidBottomInset: false,
//         body:
//         getCustomContainer(),
//         drawer:Container(
//           width: MediaQuery.of(context).size.width-200,
//           child: Drawer(
//             // backgroundColor: color().v,
//             child: Container(
//                 decoration: BoxDecoration(
//                     gradient:  LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment(6, 6),
//                         colors: <Color>[
//                           Color(0xFF269cc4),
//                           Color(0xFFffffff),
//                           Color(0xFF269cc4),
//                           Color(0xFFffffff),])),
//                 child: Column(
//                   children: [
//                     Divider(),
//                     Column(
//                       children: [
//                         CircleAvatar(radius: 50,backgroundImage: AssetImage("image/karolis-profile-pic.jpg")),
//                       ],
//                     ),
//                     Text("_USER_NAME_",style: TextStyle(color: txt),),
//                     Divider(),
//                     Expanded(
//                       child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: (){setState(() {
//                                 selectedWidgetMarker = page.home;
//                                 if (_scaffoldKey.currentState!.isDrawerOpen) {
//                                   _scaffoldKey.currentState!.openEndDrawer();
//                                 }
//                               });},
//                               child: Container(
//                                 color:  selectedWidgetMarker == page.home? Colors.white10 : Colors.transparent,
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     VerticalDivider(),
//                                     Flexible(
//                                       // flex: 5,
//                                         child: Icon(Icons.home,color: txt,)),
//                                     VerticalDivider(),
//                                     Flexible(
//                                       // flex: 2,
//                                         child: Text("Home",style: TextStyle(color: txt),)
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Divider(),
//                             GestureDetector(
//                               onTap: (){setState(() {
//                                 selectedWidgetMarker = page.user;
//                                 if (_scaffoldKey.currentState!.isDrawerOpen) {
//                                   _scaffoldKey.currentState!.openEndDrawer();
//                                 }
//                                 // _scaffoldKey.currentState?.openEndDrawer();
//                               });},
//                               child: Container(
//                                 color: selectedWidgetMarker == page.user? Colors.white10 : Colors.transparent,
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     VerticalDivider(),
//                                     Flexible(child: Icon(Icons.verified_user,color: txt,)),
//                                     VerticalDivider(),
//                                     Flexible(child: Text("Organization",style: TextStyle(color: txt),)),
//                                   ],
//                                 ),
//                               ),
//                             ),  Divider(),
//                             GestureDetector(
//                               onTap: (){
//                                 setState(() {
//                                   selectedWidgetMarker = page.group;
//                                   if (_scaffoldKey.currentState!.isDrawerOpen) {
//                                     _scaffoldKey.currentState!.openEndDrawer();
//                                   }
//                                 });
//                               },
//                               child: Container(
//                                 color: selectedWidgetMarker == page.group? Colors.white10 : Colors.transparent,
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     VerticalDivider(),
//                                     Flexible(child: Icon(Icons.group,color: txt,)),
//                                     VerticalDivider(),
//                                     Flexible(child: Text("Team",style: TextStyle(color: txt),)),
//
//
//                                   ],
//                                 ),
//                               ),
//                             ),  Divider(),
//                             GestureDetector(
//                               onTap: (){setState(() {
//                                 selectedWidgetMarker = page.bench;
//                                 if (_scaffoldKey.currentState!.isDrawerOpen) {
//                                   _scaffoldKey.currentState!.openEndDrawer();
//                                 }
//                               });},
//                               child: Container(
//                                 color: selectedWidgetMarker == page.bench? Colors.white10 : Colors.transparent,
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     VerticalDivider(),
//                                     Flexible(child: Icon(Icons.person_add_alt_1_rounded,color: txt,)),
//                                     VerticalDivider(),
//                                     Flexible(child: Text("Bench",style: TextStyle(color: txt),)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ]),
//                     ),
//                     Column(
//                       children: [
//                         GestureDetector(
//                           onTap:(){setState(()
//                           {
//                             print("setup");
//                           });},
//                           child: Container(
//                             // color: selectedWidgetMarker == page.bench? Colors.white10 : Colors.transparent,
//                             child: Row(
//                               children: [
//                                 VerticalDivider(),
//                                 Flexible(child: Icon(Icons.settings,color: txt,)),
//                                 VerticalDivider(),
//                                 Flexible(child: Text("Setup",style: TextStyle(color: txt),)),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Divider(),
//                         GestureDetector(
//                           onTap: (){
//                             setState(() {
//                               print("signout");
//                             });
//                           },
//                           child: Container(
//                             // color: selectedWidgetMarker == page.bench? Colors.white10 : Colors.transparent,
//                             child: Row(
//                               children: [
//                                 VerticalDivider(),
//                                 Flexible(child: Icon(Icons.login,color: txt,)),
//                                 VerticalDivider(),
//                                 Flexible(child: Text("Signout",style: TextStyle(color: txt),)),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ) ,
//                   ],
//                 )
//             ),
//           ),
//         ),
//
//       // ),
//     );
//   }
//
//
//
//   Widget getCustomContainer() {
//
//     switch (selectedWidgetMarker) {
//       case page.settings:
//         return getSettingContainer();
//       case page.user:
//         return getUserContainer();
//       case page.home:
//         return getHomeContainer();
//       case page.bench:
//         return getbenchontainer();
//       case page.group:
//         return getTech_UserContainer();
//     }
//     return getHomeContainer();
//   }

//   Widget getHomeContainer()
//   {
//     return dartboard();
//   }
//
//   Widget getUserContainer()
//   {
//     return user();
//   }
//
//   Widget getTech_UserContainer()
//   {
//     return group();
//   }
//
//   Widget getbenchontainer()
//   {
//     return bnch();
//   }
//
//   Widget getSettingContainer()
//   {
//     return setting();
//   }
//
//
// }
//
//
// const primaryColor = Color(0xFFffffff);
// /////drawercolor
// const canvasColor =  Color(0xFF2C4B94);
// ////mainBackGround
// const txt = Colors.black;
// ////selected
// const accentCanvasColor = Color(0xFF3E3E61);
//
// // const white = Colors.white;
//
// // final actionColor = const Color(0xFFffffff).withOpacity(0.6);
//
// // final divider = Divider(color: white.withOpacity(1), height: 5);