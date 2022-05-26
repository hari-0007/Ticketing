


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'globals (1).dart'as globals;

class bnch extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<bnch>
    with AutomaticKeepAliveClientMixin {
  bool isChecked = false;

  void clearText()
  {
    _BenchName_controller.clear();
    _BenchEmail_controller.clear();
    _BenchMobile_controller.clear();
    _BenchAddress_controller.clear();
    _BenchQualification_controller.clear();
    _BenchDocuments_controller.clear();
    _BenchExperiance_controller.clear();
  }

  final TextEditingController _BenchName_controller = TextEditingController();
  final TextEditingController _BenchEmail_controller = TextEditingController();
  final TextEditingController _BenchMobile_controller = TextEditingController();
  final TextEditingController _BenchAddress_controller = TextEditingController();
  final TextEditingController _BenchQualification_controller = TextEditingController();
  final TextEditingController _BenchDocuments_controller = TextEditingController();
  final TextEditingController _BenchExperiance_controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String _bench_name = "";
  String _bench_email = "";
  String _bench_mobile = "";
  var _bench_address = "";
  String _bench_qualification = "";
  String _bench_documents = "";
  String _bench_experiance = "";

  List<Map<String, dynamic>> _foundUsers = [];
  final List<Map<String, dynamic>> nouser = [];
  List<String>newlist = List<String>.generate(0,(counter) => " $counter");
  @override
  void initState()
  {
    _foundUsers = nouser;
    super.initState();
  }


  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty)
    {
      // if the search field is empty or only contains white-space, we'll display all users
      results = nouser;
      return _runFilter(enteredKeyword);
    }
    else
    {
      results = globals.allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState
      (()
    {
       results = _foundUsers ;
    });
  }

  double animated_width = 0;
  double animated_height = 0;



  @override
  Widget build(BuildContext context) {
    // empty_List.forEach((element) {
    //   print(element);
    // });
    // var _value = 1;

    // bool value = false;
    return
      // MaterialApp(
      //   home:
        Scaffold(
          backgroundColor: Colors.white12,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    TextField(cursorColor: Colors.white,
                      onChanged: (value) => _runFilter(value),
                      decoration: const InputDecoration(
                        labelText: 'Search', prefixIcon: Icon(Icons.search),),
                    ),
                    Positioned(
                      right: 1,
                      top: 7,
                      child:
                      IconButton(onPressed: () {
                        setState(() {
                          // print(globals.glbuserlist[0]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => form_field(context)),
                          );
                        });
                      },
                          icon: Icon(Icons.add)),
                    )

                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: newlist.length,
                        itemBuilder: (context, index) {
                          return
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return
                                            // org_details();
                                            globals.glbuserlist[index];
                                        }
                                    );
                                  });
                                },
                                child:
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: Colors.grey.shade400,
                                  child: Center(child: Text("BENCH - ${newlist[index]}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                )
                            );

                        }

                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

//////////////////TEAM MEMBERS
//                 Expanded(
//                     child: _foundUsers.isNotEmpty
//                         ?
//                         ListView.builder(
//
//                       // scrollDirection: Axis.vertical,
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (context, index) =>
//                           Container(
//                             key: ValueKey(_foundUsers[index]),
//
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(40),
//                                   bottomRight: Radius.circular(40)
//                               ),
//                               color: Color(0xFF2C4B94),
//
//                             ),
//                             margin: EdgeInsets.symmetric(vertical: 10),
//                             child: ListTile(
//                               onTap: () {
//                                 setState(() {
//                                   // print("cliked: ${_foundUsers[index].toString()}");
//                                   nouser.add(_foundUsers[index]);
//                                   // nouser.toSet();
//                                 });
//                               },
//                               leading: Text(
//                                 _foundUsers[index]["id"].toString(),
//                                 style: const TextStyle(
//                                     fontSize: 24, color: Colors.white),
//                               ),
//                               title: Text(
//                                 _foundUsers[index]["name"], style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 24),),
//                               subtitle: Text(
//                                 '${_foundUsers[index]["age"]
//                                     .toString()} years old',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18),),
//                             ),
//                           ),
//                     )
//                         : Text("Search Team-Bench")
//                 ),
                //////////
              ],
            ),
          ),
        // )
    );
  }

  AlertDialog org_details() {
    return AlertDialog(
      elevation: 2,
      backgroundColor: Colors.white70,
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text("BENCH - 1",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
            Divider(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(" BENCH_NAME ", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),

                Text(":", textAlign: TextAlign.center,),
                Text(_bench_name, textAlign: TextAlign.end,)
              ],
            ),
            Divider(height: 10, color: Colors.transparent,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("EMAIL ", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Center(child: Text(":")),
                Text(_bench_email)
              ],
            ), Divider(height: 10, color: Colors.transparent,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("MOBILE ", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Center(child: Text(":")),
                Text(_bench_mobile)
              ],
            ), Divider(height: 10, color: Colors.transparent,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("ADDRESS :", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text(_bench_address)
              ],
            ), Divider(height: 10, color: Colors.transparent,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("QUALIFICATION :", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text(_bench_qualification)
              ],
            ), Divider(height: 10, color: Colors.transparent,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("EXPERIANCE :", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text(_bench_experiance)
              ],
            ),
            Divider(height: 10, color: Colors.transparent,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Text("DOCUMENTS :", textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text(_bench_documents)
              ],
            ),


          ],),
      ),
    );
  }

  Widget form_field(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(
              border:
              Border
                (
                  left: BorderSide(color: Colors.transparent, width: 25),
                  right: BorderSide(color: Colors.transparent, width: 25),
                  top: BorderSide(color: Colors.transparent, width: 25)
              ),
            ),

            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Divider(height: 50,),
                  Center(child:
                  Text("Name Of Bench Member",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24),)
                  ),

                  TextFormField(

                    maxLength: 15,
                    validator: (value)
                    {
                      if (value!.isEmpty)
                      {
                        return "Name is required";
                      }
                      return null;
                    },
                    onChanged: (String value)
                    {
                      _bench_name = value;
                    },
                    controller: _BenchName_controller,
                    decoration: InputDecoration(
                      hintText: 'Bench_Name',
                    ),
                    inputFormatters: [],
                  ),

                  Stack(
                    children: [
                      TextFormField(
                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return "Enter the valied Email";
                          }
                          return null;
                        },
                        onChanged: (value)
                        {
                          _bench_email = value;
                        },
                        controller: _BenchEmail_controller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'dummy@gmail.com',
                        ),
                        inputFormatters: [],
                      ),
                      Positioned(
                        right: 12,
                        child: Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            }
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  TextFormField(
                    validator: (value)
                    {
                      if (value!.isEmpty)
                      {
                        return "Enter a valied number";
                      }
                      if(value.length<10)
                      {
                        return "The number should be equal to 10 ";
                      }
                      return null;
                    },
                    maxLength: 15,
                    onChanged: (String value)
                    {
                      _bench_mobile = value;
                    },
                    controller: _BenchMobile_controller,
                    decoration: InputDecoration
                      (
                      hintText: 'Mobile',
                    ),
                    inputFormatters: [],
                  ),

                  TextFormField(maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Qualification Required";
                      }
                      return null;
                    },
                    onChanged: (value)
                    {
                      _bench_qualification = value;
                    },
                    controller: _BenchQualification_controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Qualification',
                    ),
                    inputFormatters: [],
                  ),

                  TextFormField(
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return "Enter the valid email";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _bench_address = value;
                    },
                    controller: _BenchAddress_controller,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'address',
                    ),
                    inputFormatters: [],
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Experiance is Required";
                      }
                      return null;
                    },
                    maxLength: 10,
                    onChanged: (value) {
                      _bench_experiance = value;
                    },
                    controller: _BenchExperiance_controller,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      hintText: 'experiance',
                    ),
                    inputFormatters: [],
                  ),

                  TextFormField(
                    validator: (value)
                    {
                      if (value!.isEmpty)
                      {
                        return "Document is Required";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _bench_documents = value;
                    },
                    controller: _BenchDocuments_controller,
                    decoration: InputDecoration(
                      hintText: 'documents',
                    ),
                    inputFormatters: [],
                  ),

                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                          onPressed: ()
                          {
                            // empty_List.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"), color: Colors.grey),
                      FlatButton(onPressed: ()
                      {
                        newlist.add
                          (
                            _BenchName_controller.text+
                                _BenchEmail_controller.text+
                                _BenchMobile_controller.text+
                                _BenchAddress_controller.text+
                                _BenchQualification_controller.text+
                                _BenchDocuments_controller.text+
                                _BenchExperiance_controller.text
                        );

                        print(newlist.length);

                        // print(empty_List[2]);



                        if (_formKey.currentState!.validate()) {
                          // return;
                          _formKey.currentState!.save();
                          newlist += newlist;
                          // widget.onSubmit(_bench_name);
                        }
                      },
                        child: Text("Submit"), color: Colors.blue,),

                    ],
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}






class UserDetails {
  final String id;
  final String Name, Email, Mobile, Address, Qualification, Documents,
      Experiance;

  UserDetails(
      {
        required this.id,
        required this.Name,
        required this.Email,
        required this.Mobile,
        required this.Address,
        required this.Qualification,
        required this.Documents,
        required this.Experiance,
      }
      );

}


