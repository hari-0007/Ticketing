
import 'package:flutter/material.dart';
import 'package:neworganization/user_1.dart';
import 'user_1.dart';
enum BestTutorSite { admin,user,extra }
class steper2 extends StatelessWidget {

  TextEditingController user_name_Controller = TextEditingController();
  TextEditingController user_email_Controller = TextEditingController();

  final GlobalKey<FormState> step2validate = GlobalKey<FormState>();
  String Admin = "Admin";
  String User = "User";
  List Userpopup_Branch= [];
  BestTutorSite site = BestTutorSite.extra;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Column(
          children: [
          /*  GestureDetector(
                onTap: (){
                  setState(()
                  {
                    globlas.textfieldactive = false;
                  });},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(child: Text("Edit",style: TextStyle(color: Colors.blue),),),
                  ],
                )),*/
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                readOnly:userState().textfieldactive,
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return "*Enter User_Name";
                  }
                  return null;
                },
                controller: user_name_Controller,
                decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color().v),
                ),
                  // border: OutlineInputBorder(),
                  hintText: 'User_Name',
                  labelText: 'User_Name',
                ),
                // decoration: InputDecoration(hintText: "User_Name"),
                onChanged: (value){
                  setState((){
                  });
                },
              ),
            ),Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                readOnly:userState().textfieldactive,
                maxLength: 20,
                validator: ( value) {
                  ///charactorname
                  ///specialcharactor
                  ///gmail.com
                  if (!RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value!)) {
                    return 'This is not a valid email';
                  }
                },
                // validator: (val) => val!.contains('@') ? null : '*Email @ is required ',
                controller: user_email_Controller,
                decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color().v),
                ),
                  // border: OutlineInputBorder(),
                  hintText: 'User_Email',
                  labelText: 'User_Email',
                ),
                // decoration: InputDecoration(hintText: "User_Email"),
                onChanged: (value){
                  setState((){
                  });
                },
              ),
            ),
            ///
            Row(
              children: [
                Flexible(
                  child: ListTile(onTap: ()
                  {
                   // for(int i = 0; i < userState().objbranch[userState().displayname.length].length;i++){
                   //   print(userState().objbranch[userState().displayname.length][i].branch_name_Controller.text);
                   // }
                    print(Userpopup_Branch);
                  },
                    title: const Text('User'),
                    leading: Radio(
                      value: BestTutorSite.user,
                      groupValue: site,
                      onChanged: ( value) {
                        setState(() {
                          site =  BestTutorSite.user;
                          // privilages = Admin;
                        });
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: const Text('Admin'),
                    leading: Radio(
                      value: BestTutorSite.admin,
                      groupValue: site,
                      onChanged: ( value) {
                        setState(() {
                          site = BestTutorSite.admin;
                          // privilages = User;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent,
                border:Border.all(width: 2,color:  color().v), borderRadius: BorderRadius.circular(12),),
              // width:  MediaQuery.of(context).size.height-290,
              child: Column(

                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(
                    //         color: Colors.black.withOpacity(0.55),
                    //         width: 1,
                    //         style: BorderStyle.solid
                    //     )
                    // ),
                    child:

                    Userpopup_Branch.isNotEmpty
                                   ?
                        Wrap(
                        children: [
                        for(var i in  Userpopup_Branch)...
                        [
                            Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
                            child: Chip(label: Text(i)),
                            )
                        ]
                        ]
                        )
                               :
                          InkWell(
                            onTap: ()
                            {
                              print(userState().objstepper2);
                              print(userState().objbranch[0][0].branch_name_Controller.text);
                              print(userState().objbranch[userState().displayname.length][0].branch_name_Controller.text);
                            },
                              child: Chip(label: Text("No Branches")))

                  ),
                  Align(
                    child: IconButton(
                        onPressed: () async {

                          await     showDialog(context: context,barrierDismissible: false,
                              builder: (BuildContext context)
                              {
                                return
                                  alerdialoge_Box();
                              }
                          );
                          // Userpopup_Branch.add({});
                          setState(() {

                          });

                        },
                        icon: Icon(Icons.add_box_outlined,)),
                    alignment: Alignment(1,1),
                  ),
                ],
              ),
            ),
            ///

        ]);
      },
    );
  }

Widget alerdialoge_Box(){
    return
      StatefulBuilder(builder: (context, setState) =>
         AlertDialog(
          backgroundColor:Colors.grey,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title:  Column(
            children: [
              Text("Organization",style: TextStyle(fontWeight: FontWeight.bold),),
              Card( shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      for(int p = 0; p<userState().objbranch[userState().displayname.length].length; p++)
                        {
                          if(Userpopup_Branch.contains(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text))
                          {
                            Userpopup_Branch.remove(userState().objbranch[userState().displayname.length][p]
                                .branch_name_Controller.text.toString());

                          }
                          else {
                            Userpopup_Branch.add(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text);
                            print(Userpopup_Branch);
                            print(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text);
                          }
                        }
                      // for (int p = 0; p <= userState().objbranch[userState().displayname.length].length-1; p++)
                      // {
                      //   ///popup organization enable and disable selection
                      //   if(Userpopup_Branch[userState().displayname.length]
                      //       .contains(userState().objbranch[userState().displayname.length][p]
                      //       .branch_name_Controller.text))
                      //   {
                      //     Userpopup_Branch[userState().displayname.length]
                      //         .remove(userState().objbranch[userState().displayname.length][p]
                      //         .branch_name_Controller.text);
                      //   }
                      //   else
                      //     Userpopup_Branch[userState().displayname.length]
                      //         .add(userState().objbranch[userState().displayname.length][p]
                      //         .branch_name_Controller.text);
                      //   print(Userpopup_Branch[userState().displayname.length]);
                      // }
                    });
                  },
                  child: Container(
                    height: 80,
                    child: Center(
                        child:  Text(userState().display_name_controller.text)
                    ),
                  ),
                ),
              ),
            ],
          ),
              content:Column(
                                          children: [
                                            Text("Branch",style: TextStyle(fontWeight: FontWeight.bold),),
                                            Card(
                                              shape:  RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                              color: Colors.grey.shade100,
                                              child: Container(
                                                height:MediaQuery.of(context).size.height-310,
                                                child: SingleChildScrollView(

                                                  scrollDirection: Axis.vertical,
                                                  child: Column(
                                                    children: [
                                                      for(int p = 0; p<userState().objbranch[userState().displayname.length].length; p++)...[

                                                        GestureDetector(
                                                          onTap: ()
                                                          {
                                                            // print(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text);
                                                          },

                                                          child:
                                                            CheckboxListTile(
                                                              value:
                                                              Userpopup_Branch
                                                                  .contains(
                                                                  userState().objbranch[userState().displayname.length][p]
                                                                      .branch_name_Controller.text)
                                                                  ?
                                                                 true
                                                                  :
                                                                 false,
                                                              onChanged: (val)
                                                              {
                                                                if(Userpopup_Branch.contains(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text))
                                                                {
                                                                  Userpopup_Branch.remove(userState().objbranch[userState().displayname.length][p]
                                                                      .branch_name_Controller.text.toString());
                                                                  setState((){});
                                                                }
                                                                else {
                                                                  Userpopup_Branch.add(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text);
                                                                  print(Userpopup_Branch);
                                                                  print(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text);
                                                                setState((){});
                                                                }
                                                                /*   if(Userpopup_Branch*//*[userState().displayname.length]*//*.contains(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text))
                                                                {
                                                                  setState(()
                                                                  {
                                                                    Userpopup_Branch*//*[userState().displayname.length]*//*
                                                                        .remove(userState().objbranch[userState().displayname.length][p]
                                                                        .branch_name_Controller.text.toString());
                                                                    print( Userpopup_Branch*//*[userState().displayname.length]*//*);
                                                                  });
                                                                }
                                                                else
                                                                {
                                                                  setState(()
                                                                  {
                                                                    Userpopup_Branch*//*[userState().displayname.length]*//*.add(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text.toString());
                                                                    print( Userpopup_Branch[userState().displayname.length]);
                                                                  });
                                                                }
                                                                print(( Userpopup_Branch*//*[userState().displayname.length]*//*));
*/

                                                              },
                                                              title: Text(userState().objbranch[userState().displayname.length][p].branch_name_Controller.text),)
                                                       ///

                                                       ///
                                                        ),
                                                      ]
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(()
                      {
                        Userpopup_Branch.clear();
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
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



}


/*class UB2{

  Set UserBelongsTo;


  UB2({required this.UserBelongsTo});

  *//*@override toString() {
    return '{Date:$date,Message:$name}';
    // return 'Message: $name';
    // '{id: $id, title: $title}'
  }*//*

  Map<String, dynamic> toMap() {
    return {
      'userBelongsTo':UserBelongsTo,

    };
  }
}*/


class stepper2class{

  String username;
  String useremail;
  String privilages;
  List belongsto =[];

  stepper2class({
    required this.username,
    required this.useremail,
    required this.privilages,
    required this.belongsto
  });

  Map<String, dynamic> toMap() {
    return
      {
        'user_name':username,
        "user_email" : useremail,
        "user_privilege" : privilages,
        "user_belongs_to" : belongsto,
      };
  }

}

class color
{
  var v =   Color(0xFF00BFFF);
}