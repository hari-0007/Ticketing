
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:neworganization/user_1.dart';
import 'newbranch.dart';
import 'user_1.dart';
import 'globals (1).dart'as globlas;
enum WidgetMarker
{
  list,
  Editing,
  adder
}
class group extends StatefulWidget {
  @override
  State<group> createState() => _groupState();
}

class _groupState extends State<group>
    with AutomaticKeepAliveClientMixin {
  // ///visible scroll container
  // static final _containerHeight = 50.0;
  //
  // // You don't need to change any of these variables
  // var _fromTop = -_containerHeight;
  // var _controller = ScrollController();
  // var _allowReverse = true, _allowForward = true;
  // var _prevOffset = 0.0;
  // var _prevForwardOffset = -_containerHeight;
  // var _prevReverseOffset = 0.0;

///Stepper variable
  var currentstep = 0;
  List forvariable = [];
///Team Name Controller
  TextEditingController teamname_controller = TextEditingController();
  TextEditingController editteamname_controller = TextEditingController();

///organization added list
///assigned
  List organizationaddedlist = [];
late user p;
///bench name added list
  List benchaddedlist = [];

/// Total list of team members
///Editing process
  int selectedindex = 0;

///bench Member
  List <String> benchmember = [
    'Arun',
    'Berlin',
    'Catlinsnow',
    'Dom',
    'Esterlla',
    'Felix',
  ];

///member onchange variable
  var membervalue;

///organization onchange variable
///Assigned
  var organizationvalue;

///Handle value after switch to next page
  @override
  bool get wantKeepAlive => true;

///organization dropdown with search bar
  List<String> organization_list =
  [
    "Organization 1",
    "Organization 2",
    "Organization 3",
    "Organization 4",
    "Organization 5",
    "Organization 6",
    "Organization 7",
    "Organization 8",
    "Organization 9",
    "Organization 10"
  ];

///Total Team list With Maping
  List <Map> teamlist= [];

///used to handle data while switching
  void initState() {
    super.initState();
    // _controller.addListener(_listener);
    print('first initState');
  }
  List<Set> userpopup_branch= [];
  List<List<branch>> objbranch = [];
  ///scroll container
  // void _listener() {
  //   double offset = _controller.offset;
  //   var direction = _controller.position.userScrollDirection;
  //
  //   if (direction == ScrollDirection.reverse) {
  //     _allowForward = true;
  //     if (_allowReverse) {
  //       _allowReverse = false;
  //       _prevOffset = offset;
  //       _prevForwardOffset = _fromTop;
  //     }
  //
  //     var difference = offset - _prevOffset;
  //     _fromTop = _prevForwardOffset + difference;
  //     if (_fromTop > 0) _fromTop = 0;
  //   } else if (direction == ScrollDirection.forward) {
  //     _allowReverse = true;
  //     if (_allowForward) {
  //       _allowForward = false;
  //       _prevOffset = offset;
  //       _prevReverseOffset = _fromTop;
  //     }
  //
  //     var difference = offset - _prevOffset;
  //     _fromTop = _prevReverseOffset + difference;
  //     if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
  //   }
  //   setState(() {}); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  // }

  WidgetMarker selectedWidgetMarker = WidgetMarker.list;
  @override
  Widget build(BuildContext context)
  {

    Widget getteamcontainer(){
      switch (selectedWidgetMarker){
        case WidgetMarker.adder:
          return getAdder();
        case WidgetMarker.list:
          return getList();
      case WidgetMarker.Editing:
        return editingwidget();
      }
    }
    return getteamcontainer();
    /* MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white12,
            resizeToAvoidBottomInset: false,
            body: getteamcontainer()));*/
  }

  List<Step> Add_steps(){
    return [
      Step(
          state: currentstep>=0 ? StepState.complete : StepState.indexed,
          isActive: currentstep >=0,
          title: Text("Name"),
          content:Container(
            child:    TextFormField(
              // enabled: globlas.textfieldactive,
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return "*Enter the valid Name";
                }
                return null;
              },
              onSaved: (value)
              {
                // _display_name_controller.text = value!;
              },
              maxLength: 10,
              controller: teamname_controller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:Colors.blue),
                ),
                labelText: 'TeamName',
                hintText: 'TeamName',
              ),
              inputFormatters: [],
            ),

          )

      ),

      Step(
        state: currentstep>=1 ? StepState.complete : StepState.indexed,
        isActive: currentstep >=1,
        title: Text("Member"),
        content:
        Column(
          children: [
            Container(
              // height: 50,
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  ///search names
                  Align(
                    alignment: Alignment(1,1),
                    child: DropdownSearch<String>.multiSelection(
                      dropdownSearchDecoration: InputDecoration(labelText: "Select Member"),
                      //mode of dropdown
                      mode: Mode.MENU,
                      showSearchBox: true,
                      showSelectedItems: true,
                      items: benchmember,
                      onChanged: (val)
                      {
                        membervalue = val;
                      },
                    ),
                  ),
                  ///display searched names

                ],
              ),
            ),
            Divider(color: Colors.transparent,)
          ],
        ),
      ),

      Step(
        state: currentstep>=2 ? StepState.complete : StepState.indexed,
        isActive: currentstep >=2,
        title: Text("Assigned"),
        content:
        Column(
          children: [
            Container(
              color: Colors.white10,
              child:
              Column(
                children: [
                  Container(
                       decoration: BoxDecoration(
                       color: Colors.white10,
                       border:Border.all(
                       width: 2,
                       color:  color().v),
                       borderRadius: BorderRadius.circular(12),),
                       child: Column(
                       children: [
                            DropdownSearch.multiSelection(
                                                dropdownSearchDecoration: InputDecoration(
                                                labelText: "${userState().displayname[1]["organization_name"]}",
                                                labelStyle: TextStyle(fontWeight: FontWeight.bold,),),
                                                items:[],
                                                showSearchBox: true,
                                          ),



                     /*   if(userState().displayname.length>=1)...
                        [
                          Container(
                            child:
                             ListView.builder(
                                              physics: ScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:userState().displayname.length,
                                              itemBuilder: (context, index)
                                              {
                                                return

                                                Column(
                                                  children: [


                                              DropdownSearch.multiSelection(
                                                dropdownSearchDecoration: InputDecoration(
                                                labelText: "${userState().displayname[index]["organization_name"]}",
                                                labelStyle: TextStyle(fontWeight: FontWeight.bold,),),
                                                items:
                                                  [
                                                     for (int i = 0;
                                                          i <= userState().displayname[index]["branches"].length;
                                                          i++) ...
                                                          [
                                                             userState().displayname[index]["branches"][i]["branch_name"]
                                                          ]
                                                  ],showSearchBox: true,
                                                    ),
                                                  ],
                                                );
                                              }),


                            height:
                            MediaQuery.of(context).size.height-500,
                          ),
                        ]


                        else...
                        [
                          Center(child: Text("No Organizations")),
                        ],*/

                        Align(
                          child: IconButton(
                              onPressed: () async {

                                await     showDialog(context: context,
                                    builder: (BuildContext context)
                                    {
                                      return

                                        StatefulBuilder(
                                          builder: (context, setState) =>  AlertDialog(
                                            // title:  Column(
                                            //   children: [
                                            //     Text("Organization"),
                                            //     Card(
                                            //       color: Colors.grey.shade200,
                                            //       child: GestureDetector(
                                            //         onTap: (){
                                            //           setState(() {
                                            //           /*      print("sdf");
                                            //             for (int p = 0; p <= objbranch[teamlist.length].length-1; p++)
                                            //             {
                                            //               userpopup_branch[teamlist.length]
                                            //                   .add(objbranch[teamlist.length][p]
                                            //                   .branch_name_Controller.text);
                                            //               print(userpopup_branch[teamlist.length]);
                                            //             }*/
                                            //           });
                                            //         },
                                            //         child: Container(
                                            //           height: 80,
                                            //           child: Center(
                                            //               child:  Text("organization")
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            content:

                                            setupAlertDialoadContainer(),
                                            /*Column(
                                              children: [
                                                Text("Branch"),
                                                Expanded(
                                                  child: SizedBox(
                                                    height:MediaQuery.of(context).size.height-350,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount : 1,
                                                      itemBuilder: (context,index) =>
                                                      new     GestureDetector(
                                                        onTap: ()
                                                        {
                                                          // print(objbranch[teamlist.length][p].branch_name_Controller.text);
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Flexible(
                                                              child: Container(
                                                                  padding: EdgeInsets.all(10),
                                                                  child: Text("objbranch[p][q].branch_name_Controller.text.toString()")
                                                              ),
                                                            ),
                                                            ///Checkbox
                                                            // Flexible(child:
                                                            //
                                                            // Visibility(
                                                            //   visible: objbranch[teamlist.length][p]
                                                            //       .branch_name_Controller.text.length>=1
                                                            //       ?
                                                            //   true
                                                            //       :
                                                            //   false,
                                                            //   child:
                                                            //   Checkbox(
                                                            //     value:
                                                            //     ///userpop_branch {List<List<Set>>}
                                                            //     ///
                                                            //     userpopup_branch[teamlist.length]
                                                            //         .contains(
                                                            //         objbranch[teamlist.length][p]
                                                            //             .branch_name_Controller.text.toString())
                                                            //         ?
                                                            //     true
                                                            //         :
                                                            //     false,
                                                            //     onChanged: ( value)
                                                            //     {
                                                            //
                                                            //
                                                            //       if(userpopup_branch[teamlist.length].contains(objbranch[teamlist.length][p].branch_name_Controller.text))
                                                            //       {
                                                            //         setState(()
                                                            //         {
                                                            //           userpopup_branch[teamlist.length]
                                                            //               .remove(objbranch[teamlist.length][p]
                                                            //               .branch_name_Controller.text.toString());
                                                            //           print( userpopup_branch[teamlist.length]);
                                                            //         });
                                                            //       }
                                                            //       else
                                                            //       {
                                                            //         setState(()
                                                            //         {
                                                            //           userpopup_branch[teamlist.length].add(objbranch[teamlist.length][p].branch_name_Controller.text.toString());
                                                            //           print( userpopup_branch[teamlist.length]);
                                                            //         });
                                                            //       }
                                                            //       print(( userpopup_branch[teamlist.length]));
                                                            //
                                                            //     },),
                                                            // )
                                                            // )
                                                            ///CheckBoxEn
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),*/

                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Flexible(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                        setState((){});
                                                      },

                                                      child: const Text('Close'),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                        setState(() {});
                                                      },
                                                      child: const Text('Submit'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                    }
                                );
                                setState(() {

                                });

                              },
                              icon: Icon(Icons.add_box_outlined,)),
                          alignment: Alignment(1,1),
                        ),
                      ],
                    ),
                  )
            /*      Align(
                    alignment: Alignment(1,1),
                    child: DropdownSearch<String>.multiSelection(

                      //mode of dropdown
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(labelText: "Select Member"),
                      //to show search box
                      showSearchBox: true,
                      showSelectedItems: true,

                      items: organization_list,

                      onChanged: (val)
                      {
                        organizationvalue = val;
                      },
                      //show selected item

                    ),
                  ),*/
                  ///display searched names

                ],
              ),
            ),
            Divider(color: Colors.transparent,)
          ],
        ),
      )
    ];

  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: MediaQuery.of(context).size.height-350, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:userState().displayname.length,
        itemBuilder: (BuildContext context, int index) {
          return
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                onTap: ()
                {
                  // for (int i = 0; i <= userState().displayname[index]["branches"].length; i++) {

                  userState().displayname[index].forEach((key, value) {["branches"]
                      .forEach((element) {print;});});

                  // }
                      setState(() {


                      });
                },
                  title: Text(userState().displayname[index]["organization_name"])),
            );
          // Align(
          //   alignment: Alignment(1,1),
          //   child:
          //   DropdownSearch<String>.multiSelection(
          //
          //     dropdownSearchDecoration: InputDecoration(
          //         labelText: "${userState().displayname[index]["organization_name"]}"),
          //     //mode of dropdown
          //     mode: Mode.MENU,
          //     //to show search box
          //     showSearchBox: true,
          //     showSelectedItems: true,
          //     // showSelectedItem: true,
          //     //list of dropdown items
          //     items:userState().displayname[index]["branches"][i]["branch_name"],
          //     // selectedItems: member,
          //     onChanged: (val)
          //     {
          //       membervalue = val;
          //     },
          //   ),
          // );

          //   Column(
          //     children: [
          //       Text("ORGANIZATIONS"),
          //       ListTile(
          //       onTap: ()
          //       {
          //               print(userState().branchlist[userState().displayname.length]);
          //       },
          //       title: Text(userState().displayname[index]["organization_name"]),
          // ),
          //     ],
          //   );
        },
      ),
    );
  }

  // void teamAssistan(int index) {
  //   for (int i = 0; i <= userState().displayname[index]["branches"].length-1; i++)
  //   {
  //     // DropdownSearch(
  //     //   items:
  //     return
  //       userState().displayname[index]["branches"][i]["branch_name"];
  //
  //   }
  // }
///Edit
  List<Step> Editing_Steps(){

    return
      [
        Step(
            isActive:currentstep >= 0 ,
            title: Text("Name"),
            content:Container(
              child:    TextFormField(
                // enabled: globlas.textfieldactive,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return "*Enter the valid Name";
                  }
                  return null;
                },
                onChanged: (value)
                {
                  teamlist[selectedindex]["team_name"] = value;
                  // _display_name_controller.text = value!;
                },
                maxLength: 10,
                controller: editteamname_controller,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue),
                  ),
                  labelText: 'TeamName',
                  // counterText: "a",   ///right bottom text
                  // errorText: 'Display Name',   ////error text
                  // helperText: "asd", ///same witout error
                  hintText: 'TeamName',
                ),
                inputFormatters: [],
              ),)),
        Step(
            isActive:currentstep >= 1 ,
            title: Text("Member"),
            content:Container(
              child : Column(
                children: [
                  ///search names
                  Align(
                    alignment: Alignment(1,1),
                    child: DropdownSearch<String>.multiSelection(
                      dropdownSearchDecoration: InputDecoration(labelText: "Select Member"),
                      //mode of dropdown
                      mode: Mode.MENU,

                      //to show search box
                      showSearchBox: true,
                      showSelectedItems: true,
                      // showSelectedItem: true,
                      //list of dropdown items
                      // items: benchmember,
                      selectedItems: [benchaddedlist[selectedindex].toString()],
                      items:benchmember,
                      onChanged: (val)
                      {
                        print(val);
                        benchaddedlist[selectedindex].add(val);
                        print(benchaddedlist);
                        print(benchaddedlist.length);
                      },
                    ),
                  ),
                  ///display searched names

                ],
              ),
            )
        ),

        Step(
            isActive:currentstep >= 2 ,
            title: Text("Assigned"),
            content: Container(
              child: Column(
                children: [
                  ///search names

                  Align(
                    alignment: Alignment(1,1),
                    child: DropdownSearch<String>.multiSelection(

                      //mode of dropdown
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(labelText: "Select Member"),
                      //to show search box
                      showSearchBox: true,
                      showSelectedItems: true,
                      // showSelectedItem: true,
                      //list of dropdown items
                      items: organization_list,
                      selectedItems: [organizationaddedlist[selectedindex].toString()],
                      onChanged: (val)
                      {
                        print(val);
                        organizationaddedlist[selectedindex].add(val);
                        print(organizationaddedlist[teamlist.length]);


                      },

                    ),
                  ),
                  ///display searched names
                ],
              ) ,
            )),
      ];

  }
  Widget editingwidget(){
    editteamname_controller.text = teamlist[selectedindex]["team_name"];

    return
      StatefulBuilder(
        builder: (context, setState) =>  Stepper(
          elevation: 5,
          steps:Editing_Steps(),
          controlsBuilder: (context,  ControlsDetails details) {
            return
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: details.onStepCancel,
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width-300,
                        child: Center(child: Text("${ currentstep == 0? 'Cancel' : "Back"}")),
                      )),
                  GestureDetector(
                      onTap: details.onStepContinue,
                      child: Container(
                        width: MediaQuery.of(context).size.width-300,
                        height: 30,
                        color: Colors.blue,
                        child: Center(child: Text("${currentstep == 2 ? "Submit" : "Next"}")),)),
                ],
              );} ,
          type: StepperType.vertical,
          currentStep: currentstep,
          onStepCancel: ()
          {
            currentstep == 0  ?
            setState((){
              // if(_formKey.currentState!.validate())
              // {
                setState(()
                {
                  selectedWidgetMarker = WidgetMarker.list;
                });

            })
                :
            setState(() {
              currentstep -=1;
            });
          },
          onStepContinue: ()
          {


            final isLastStep = currentstep == Editing_Steps().length - 1;
            if(isLastStep)
            {
           setState((){

             teamlist[selectedindex]["team_name"] = editteamname_controller.text;
             selectedWidgetMarker = WidgetMarker.list;});
            }
            else
              {
                  setState((){
                    currentstep +=1;
                  });
              }

          },

        ),
      );
  }

  Widget getAdder(){
    return
      Stepper(

        onStepTapped: (step)=>setState(() {
          currentstep = step;
        }),

        elevation: 5,
        steps: Add_steps(),
        type: StepperType.vertical,
        currentStep: currentstep,
        onStepCancel: ()
        {
          currentstep <= 0 ?
          setState(()
          {
            selectedWidgetMarker = WidgetMarker.list;
          })
              :
          setState(() {
            currentstep -=1;
          });
        },
        onStepContinue: ()
        {
          print(userState().displayname);
          if(currentstep == 1)
          {
           print(teamlist.length);
            benchaddedlist.removeAt(teamlist.length);
            benchaddedlist.insert(teamlist.length, membervalue);
            print(benchaddedlist);
          }

          final iflaststep = currentstep == Editing_Steps().length - 1;

          if(iflaststep)
          {
            organizationaddedlist.removeAt(teamlist.length);
            organizationaddedlist.insert(teamlist.length, organizationvalue);
            print(organizationaddedlist);

            setState(() {
              teamlist.add({
                "team_name": teamname_controller.text,
                "Members": benchaddedlist[teamlist.length],
                "assigned": organizationaddedlist[teamlist.length]
              });
              print(teamlist);

              selectedWidgetMarker = WidgetMarker.list;
            });
            // }
            // i += 1;
          }
          else
            setState(() {
              currentstep +=1;
            });

        },
        controlsBuilder: (context,  ControlsDetails details) {
          return
            Container(
              width:  MediaQuery.of(context).size.width,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: details.onStepCancel,
                      child: Container(
                        height: 30,
                        color: Colors.grey.shade500,
                        width: MediaQuery.of(context).size.width-300,
                        child: Center(child: Text( currentstep == 0 ? 'Cancel' : "Back")),
                      )),
                  GestureDetector(
                      onTap: details.onStepContinue,
                      child: Container(
                        width: MediaQuery.of(context).size.width-300,
                        height: 30,
                        color: Colors.blue,
                        child: Center(child: Text(currentstep == 2 ? "Submit" : "Next",style: TextStyle(color: Colors.white),)),)),
                ],
              ),
            );} ,


      );
  }
  Widget getList(){
    return  Container(
      child: Column(
        children: [
          Stack(
            children: [
              TextField(
                cursorColor: Colors.white,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Search', prefixIcon: Icon(Icons.search),),
              ),
              Positioned(
                right: 1,
                top: 7,
                child:
                IconButton(onPressed: () {
                  setState(() {
                  });
                  setState(()
                  {
                    print(userState().displayname.length);
                    currentstep = 0;
                    objbranch.add([]);
                    benchaddedlist.add([]);
                    organizationaddedlist.add({});
                    selectedWidgetMarker = WidgetMarker.adder;
                    teamname_controller.text = "";
                  });
                },
                    icon: Icon(Icons.add)),
              )
            ],
          ),

          _yourListView(),
        ],
      ),

    );
  }
  Widget _yourListView() {
    return  Column(
      children: [
        if(teamlist.length>=1)...[
        ListView.builder(
          shrinkWrap: true,
          itemCount: teamlist.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                setState(()
                {
                  print( benchaddedlist[selectedindex]);
                  print(teamlist.length);
                  selectedWidgetMarker = WidgetMarker.Editing;
                  currentstep = 0;
                  selectedindex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(2, 2),
                        colors: <Color>[
                          Color(0xFF269cc4),
                          Color(0xFFffffff),
                          Color(0xFF269cc4),
                          Color(0xFFffffff),]) ),
                    // color:  Color(0xFF00BFFF).withOpacity(0.4),
                    padding: EdgeInsets.all(10),
                    child:
                    Center(
                      child: Text(
                          "Team : ${teamlist[index]}"),
                    )
                ),
              ),
            );
          },
        ),
    ]
        else...
        [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(child: Text("Team is Empty"),),
          ),
        ]
      ],
    );
  }
 /* Widget _yourContainer() {
    return Opacity(
      opacity: 1 - (-_fromTop / _containerHeight),
      child: Container(
        height: _containerHeight,
        color: Color(0xFF00BFFF).withOpacity(0.8),
        alignment: Alignment.center,
        child: Text("  ", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }*/
}


class color
{
  var v =   Color(0xFF00BFFF);
}