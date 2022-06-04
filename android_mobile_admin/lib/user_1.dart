


import 'package:country_pickers/country.dart';

import 'package:flutter/material.dart';


import 'package:country_pickers/country_pickers.dart';
import 'step2.dart';
import 'globals (1).dart'as globlas;
import 'package:file_picker/file_picker.dart';
import 'newbranch.dart';
import 'dart:convert';


enum WidgetMarker
{
  list,
  stepper,
  adder
}
List<List<branch>> outerobjbranch = [];
List<List<steper2>> outerobjstepper2 = [];
List<Map<String,dynamic>> outerlist =
[
  // {
  //   "Display_name" : "Displaynam",
  //   "organization_name" : "organization",
  //   "organization_email" : "karthi@gmail.com",
  //   "organization_phone_number" :1111111114,
  //   "organization_address" : "Vadasery",
  //   "organization_country" : "India",
  //   "organization_pincode" : 333338,
  //   "organization_document" :
  //   [
  //     {
  //       "doc": []
  //     }
  //   ],
  //   "branches":
  //   [
  //   {
  //     'branch_name':"Branch1",
  //     "branch_email" : "branch@gmail.com",
  //     "branch_phone_number" : 1111111111,
  //     "branch_address" : "Address",
  //     "branch_country" : "India",
  //     "branch_pincode" : 692330,
  //     'Image':
  //     [
  //       {
  //         "b1" : []
  //       }
  //     ],
  //   }
  //   ],
  //   "user":[
  //     {
  //       'user_name':"uname1",
  //       "user_email" : "uname1@gmail.com",
  //       "user_privilege" : "Admin",
  //       "user_belongs_to" : [],
  //     }
  //   ],
  // }
];
TextEditingController outerdisplay_name_controller = TextEditingController();
bool outerbool = false;
/*class user extends StatelessWidget {
  const user({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}*/
class user extends StatefulWidget {
  @override
  ///remove _ for access variable
  State<user> createState() => userState();
}

///remove _ for access variable
class userState extends State<user>
  with AutomaticKeepAliveClientMixin {
  bool textfieldactive = outerbool;
///total branch list
  List<List<Map>> branchlist = [];
///total userlist
  List<List<Map>> userlist = [];
///object Branch
  List<List<branch>> objbranch = outerobjbranch;
///Emailvalidation
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
///Object Stepper2
  List<List<steper2>> objstepper2 = outerobjstepper2;
///Document class
  List<List<Map>> document = [];
///Document With Branch
  List<List<List<Map>>> nesteddocument = [];
///User Belongs To
  List<List<List<Map>>> belongstolist = [];
///Organization document design
  List<List<DocumentWidget>> organizationdocument = [];
  bool branchwarning =false;
  bool documentwarning =false;
  var currentstep = 0;
///User BelongsTo => PopUp

///For Editing Purpose(Displayname.length)
  int selectedindex = 0;
  void clearText()
  {
    display_name_controller.clear();
    display_org_controller.clear();
    display_mail_controller.clear();
    display_num_controller.clear();
    display_address_controller.clear();
    display_pincode_controller.clear();
  }
  List<Map<String,dynamic>> displayname = outerlist;

  TextEditingController editdisplay_name_controller = TextEditingController();

  TextEditingController editdisplay_org_controller = TextEditingController();

  TextEditingController editdisplay_mail_controller = TextEditingController();

  TextEditingController editdisplay_num_controller = TextEditingController();

  TextEditingController editdisplay_address_controller = TextEditingController();

  TextEditingController editdisplay_pincode_controller = TextEditingController();

  TextEditingController display_name_controller = outerdisplay_name_controller;

  TextEditingController display_org_controller = TextEditingController();

  TextEditingController display_mail_controller = TextEditingController();

  TextEditingController display_num_controller = TextEditingController();

  TextEditingController display_address_controller = TextEditingController();

  TextEditingController display_pincode_controller = TextEditingController();

/*  List <TextEditingController> branch_name_controller = [];

  List <TextEditingController> branch_email_controller = [];

  List <TextEditingController> branch_num_controller =[];

  List<TextEditingController> branch_address_controller = [];

  List <TextEditingController> branch_pincode_controller = [];

  void dispose() {


    for (final controller in branch_name_controller) {
      controller.dispose();
    }
    for (final controller in branch_email_controller) {
      controller.dispose();
    }
    for (final controller in branch_num_controller) {
      controller.dispose();
    }
    for (final controller in branch_address_controller) {
      controller.dispose();
    }
    for (final controller in branch_pincode_controller) {
      controller.dispose();
    }
    super.dispose();
  }*/
///validation
  final GlobalKey<FormState> step1form = GlobalKey<FormState>();
  final GlobalKey<FormState> step2form = GlobalKey<FormState>();

  ///mobile code
  Country _selectedDialogCountry =
  CountryPickerUtils.getCountryByPhoneCode('91');

  ///country name
  Country _selecteDialogCountry =
  CountryPickerUtils.getCountryByName('India');

  WidgetMarker selectedWidgetMarker = WidgetMarker.list;

  ///for handle data
  void initState() {
    super.initState();
    print('first initState');
  }

  @override
  Widget build(BuildContext context) {

    ///switchcase
    Widget getCustomContainer(){
      switch (selectedWidgetMarker){
        case WidgetMarker.stepper:
          return getStepper();
        case WidgetMarker.list:
          return getList();
        case WidgetMarker.adder:
          return getAdder();
      }
    }

    return
      getCustomContainer();
    /* Scaffold(
          resizeToAvoidBottomInset: true,

          body: Theme(data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary:color().v )
          ), child: getCustomContainer())
      );*/
  }
///step adder
  List<Step> getAddSteps(){
    return [
      ///step - 1
      Step(
          state: currentstep>=0 ? StepState.complete : StepState.indexed,
          isActive: currentstep >=0,
          title: Text("0rganization"),
          content:
          Form(
            key: step1form,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children:
            [
              Container(

                height: 38,
                color: color().v,
                child: Center(child:
                Text("Organization",
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),)
                ),
              ),
              Divider(),
              // editing(),
              TextFormField(
                // enabled: globlas.textfieldactive,
                validator: (value)
                {
                 /* if (value!.isEmpty)
                  {
                    return "*Enter the valid Name";
                  }
                  else
                  {
                    return null;
                  }
                  */
                  for(int j=0;j<displayname.length;j++){
                    for(int k=j+1;k<displayname.length;k++){
                      if(value![j]==value[k]){
                        // newList.remove(list[j]);
                        print(value[j]);
                      }
                    }}
                },
                onSaved: (value)
                {
                  display_name_controller.text = value!;
                },
                maxLength: 10,
                controller: display_name_controller,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color().v),
                  ),
                  labelText: 'Display-Name',
                  // counterText: "a",   ///right bottom text
                  // errorText: 'Display Name',   ////error text
                  // helperText: "asd", ///same witout error
                  hintText: 'Display Name',
                ),
                inputFormatters: [],
              ),
              Container(   decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: new BorderRadius.circular(10.0),
              ),
                child: TextFormField(
                  // enabled: globlas.textfieldactive,
                  maxLength: 20,
                  validator: (value)
                  {
                    if (value!.isEmpty)
                    {
                      return "Enter the valid Organization";
                    }
                    return null;
                  },
                  onSaved: (value)
                  {
                    display_org_controller.text = value!;
                    // _org = value as List<String>;
                  },
                  controller: display_org_controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color().v),
                    ),
                    hintText: ' Organization Name',
                    labelText: ' Organization Name',
                  ),
                  inputFormatters: [],
                ),
              ),
              TextFormField(
                // enabled:globlas. textfieldactive,
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
                onSaved: (value) {
                  // _email = value as List<String> ;
                  display_mail_controller.text = value!;
                },
                controller: display_mail_controller,
                maxLength: 20,
                decoration: InputDecoration(
                  hintText: 'E-Mail',
                  labelText: 'E-Mail',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:color().v),
                  ),
                ),
                inputFormatters: [],),
              Row(
                children: [
                  Flexible(
                    child: StatefulBuilder(
                      builder: (context, setState) =>  ListTile(
                        onTap: (){
                          setState((){showDialog(
                            context: context,
                            builder: (context) => Theme(
                              data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                              child: CountryPickerDialog(
                                titlePadding: EdgeInsets.all(8.0),
                                searchCursorColor: Colors.pinkAccent,
                                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                                isSearchable: true,
                                title: Text('Select your phone code'),
                                onValuePicked: (Country country) =>
                                    setState(() {

                                      _selectedDialogCountry = country;
                                      print(_selectedDialogCountry.phoneCode);
                                    }
                                    ),
                                itemBuilder: _buildDialogItem,
                                priorityList: [
                                  CountryPickerUtils.getCountryByIsoCode('IN'),
                                  // CountryPickerUtils.getCountryByIsoCode('US'),
                                ],
                              ),
                            ),
                          );});
                        },
                        title: _buildDialogItem(_selectedDialogCountry),
                        trailing:  Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Flexible(
                    // flex: 2,
                    child: TextFormField(
                      // enabled: globlas.textfieldactive,
                      validator: (value)
                      {
                        RegExp regExp = new RegExp(patttern);
                        if (value!.length == 0) {
                          return 'Please enter mobile number';
                        }
                        else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      },
                      /*validator: (value)
                      {
                        if (value!.isEmpty)
                        {
                          return "*Enter the Mobile Number";
                        }
                        if(value.length<10)
                        {
                          return "*The number length must be 10";
                        }

                        return null;
                      },*/
                      onSaved: (value)
                      {
                        // _num = value as Map<String>;
                        display_num_controller.text = value!;
                      },
                      maxLength: 10,
                      controller: display_num_controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color().v),
                      ),
                        hintText: 'Mobile',
                        labelText: 'Mobile',
                      ),
                      inputFormatters: [],
                    ),
                  ),
                ],
              ),
              // Divider(),
              TextFormField(
                // enabled: globlas.textfieldactive,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return "*Address is required";
                  }
                  return null;
                },
                onSaved: (value) {
                  // _address = value as List<String>;
                  display_address_controller.text = value!;
                },
                controller: display_address_controller,
                maxLines: null,
                maxLength: 60,
                decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: color().v),
                ),
                  border: OutlineInputBorder(),
                  hintText: ' Address',
                  labelText: 'Address',
                ),
                inputFormatters: [],
              ),
              // Divider(),
              Row(
                children: [
                  Flexible(
                    child: StatefulBuilder(
                      builder: (context, setState) =>  ListTile(
                        onTap: (){setState((){
                          showDialog(
                            context: context,
                            builder: (context) => Theme(
                              data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                              child: CountryPickerDialog(
                                titlePadding: EdgeInsets.all(8.0),
                                searchCursorColor: Colors.pinkAccent,
                                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                                isSearchable: true,
                                title: Text('Select your phone code'),
                                onValuePicked: (Country country) =>
                                    setState(() {
                                      _selecteDialogCountry = country;
                                      print(_selecteDialogCountry.name);
                                    }
                                    ),
                                itemBuilder: _buildDialog,
                                priorityList:
                                [
                                  CountryPickerUtils.getCountryByName('India'),
                                ],
                              ),
                            ),
                          );
                        }
                        );
                        },
                        title: _buildDialog(_selecteDialogCountry),
                        trailing:  Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Flexible(
                    child: TextFormField(
                      // enabled: globlas.textfieldactive,
                      validator: (value)
                      {
                        if (value!.isEmpty)
                        {
                          return "Pincode Box is Empty";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        display_pincode_controller.text = value!;
                      },
                      controller: display_pincode_controller,
                      maxLines: null,
                      maxLength: 15,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color().v),
                      ),
                        // border: OutlineInputBorder(),
                        hintText: 'Pincode',
                        labelText: 'Pincode',
                      ),
                      inputFormatters: [],
                    ),
                  ),
                ],
              ),
              Divider(),

              Row(children: [
                Flexible(child: Text("Documents")),
                Flexible(child: IconButton(onPressed: () {
                  print(organizationdocument);

                  setState(()
                  {
                    documentwarning = false;
                    // globlas.filewarning = false;

                    organizationdocument[displayname.length].add(DocumentWidget());
                    // document[displayname.length].add({});
                    print(organizationdocument[displayname.length].length);
                  });
                },icon: Icon(Icons.add),))
              ],),

              Visibility(
                  child: Container(
                    color: Colors.red.shade100,
                    child: Text("*Alteast One Document Mandatory",style: TextStyle(color: Colors.red),),
                  ),
                  visible: documentwarning
              ),
              Visibility(
                child: Container(
                  color: Colors.red.shade100,
                  child: Text("*Upload a file",style: TextStyle(color: Colors.red),),
                ),
                visible: false,
                // visible: globlas.filewarning
              ),


              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: organizationdocument[displayname.length].length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    Column(
                      children: [

                        Row(
                          children: [
                            Flexible(child: organizationdocument[displayname.length][index]),
                            GestureDetector(
                                onTap: ()
                                {

                                    // document[displayname.length].removeAt(index);
                                  setState(() {
                                    organizationdocument[displayname.length].removeAt(index);
                                  });
                                },
                                child: Icon(Icons.remove_circle)
                            ),
                          ],
                        ),
                      ],
                    );
                },
              ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Text("BRANCH", style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24))),
                      Flexible(child: IconButton(
                        onPressed: () {
                          print(objbranch);
                          setState(() {
                            objbranch[displayname.length].add(branch());
                            // heightlength +=   MediaQuery.of(context).size.height-200;
                            branchwarning = false;
                            print(displayname.length);
                          });} ,icon: Icon(Icons.add_circle_outline_rounded,color: Colors.white,),))
                    ],
                  ),
                  height: 38,
                  color: color().v,
                ),
              Divider(color: Colors.transparent),
                Visibility(
                  child: Container(
                    color: Colors.red.shade100,
                    child: Text("*Alteast One Branch Mandatory",style: TextStyle(color: Colors.red),),
                  ),
                  visible: branchwarning,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: objbranch[displayname.length].length,
                  itemBuilder: (BuildContext context, branchindex) {
                    return
                      Column(
                      children: [
                        Visibility(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(child: Text("Branch  : ${branchindex}",style: TextStyle(fontWeight: FontWeight.bold),)),
                              Flexible(child: IconButton(icon:
                              Icon(Icons.remove_circle),color: Colors.red,
                                onPressed: (){ setState(() {
                                  objbranch[displayname.length].removeAt(branchindex);
                                });},)),
                            ],
                          ),
                          visible:objbranch[displayname.length].length>1 ? true : false ,
                        ),
                        objbranch[displayname.length][branchindex],
                      ],
                    );
                  },
                ),
            ],),
          )
      ),
      ///
      /// step - 2
      ///
      Step(
        state: currentstep>=1 ? StepState.complete : StepState.indexed,
        isActive: currentstep >=1,
        title: Text("User"),
        content:
      Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Text("User", style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24))),
                        Flexible(
                          child: IconButton(
                          onPressed: () {
                          setState(() {
                              addstepper2();
                            });} ,icon:  Icon(Icons.add_circle_outline_rounded,color: Colors.white,),))
                      ],
                    ),
                    height: 38,
                    color: color().v,
                  ),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: objstepper2[displayname.length].length,
                      itemBuilder:(context, userindex) {
                        return
                          Column(
                            children: [
                              Visibility(
                                child:
                                Row(
                                  children:
                                  [
                                    Flexible(
                                        child: Text("User :${userindex}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                    ),
                                    Flexible(
                                        child: IconButton(
                                          icon: Icon(
                                              Icons.remove_circle,
                                              color: Colors.red
                                          ),
                                          onPressed: () {
                                            setState(()
                                            {
                                              objstepper2[displayname.length].removeAt(userindex);
                                            });
                                          },)
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                ),
                                 visible: objstepper2[displayname.length].length > 1 ? true : false,
                              ),
                              objstepper2[displayname.length][userindex],

                              Divider(color: Colors.transparent,)

                            ],
                          );
                      }
                  )
        ])
      ),

      Step(
        state: currentstep>=2 ? StepState.complete : StepState.indexed,
        isActive: currentstep >=2,
        title: Text("Payments"),
        content: Container(
          child: Column(
            children: [

            ],
          ),
        ),
      )
    ];
  }



  ///stepper2 add widget

  addstepper2()
  {
    objstepper2[displayname.length].add(steper2());
    setState(() {});
  }




  ///mobile code(outer)
  Widget _buildDialogItem(Country country) => Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),
        Flexible(child: Text("(${country.isoCode})"),),
        // SizedBox(width: 8.0),
        Flexible(child: Text("+${country.phoneCode}")),
        // SizedBox(width: 8.0),
      ]
  );

  ///country(outer)
  Widget _buildDialog(Country country) =>Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),
        Flexible(child: Text(country.name),),
        // SizedBox(width: 8.0),
        // Flexible(child: Text("+${country.phoneCode}")),
        // SizedBox(width: 8.0),
      ]
  );

  ///
  ///
  ///
  ///

///adder
  Widget getAdder(){
    return
      Scaffold(
        body: Stepper(
          onStepTapped: (step)=>setState(() {
            currentstep = step;
          }),

          elevation: 5,
          steps: getAddSteps(),
          type: StepperType.horizontal,
          currentStep: currentstep,
          controlsBuilder: (context,  ControlsDetails details) {
            return
              Visibility(
                visible: currentstep == 1 &&  objstepper2[displayname.length].length<1 ? false : true,
                child: Container(
                  width:  MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: details.onStepCancel,
                          child: Container(
                            height: 50,
                            color: Colors.grey.shade500,
                            width: MediaQuery.of(context).size.width-230,
                            child: Center(child: Text( currentstep == 0? 'Cancel' : "Back")),
                          )),
                      GestureDetector(
                          onTap: details.onStepContinue,
                          child: Container(
                            width: MediaQuery.of(context).size.width-230,
                            height: 50,
                            color: color().v,
                            child: Center(child: Text(currentstep == 2 ? "Submit" : "Next",style: TextStyle(color: Colors.white),)),)),
                    ],
                  ),
                ),
              );} ,
          onStepCancel: ()
          {
            currentstep <= 0 ?
            setState(()
            {
              selectedWidgetMarker = WidgetMarker.list;
            })
                :
            setState(()
            {
              currentstep -= 1;
            });
          },
          onStepContinue: ()
          {
            if(currentstep == 0)
            {
              print(displayname);
            }



            final isLastStep = currentstep == getSteps().length - 1;
            if(isLastStep)
            {
              setState(() {
                if (step1form.currentState!.validate() ) {



                  ///for add
                  ///nesteddocument[displayname.length][i].add(Document(
                  ///username
                  ///useremail
                  ///uprivilages
                  for (int i = 0; i <
                            objstepper2[displayname.length].length; i++) {
                          ///          *WARNING*
                          /// send this to final step
                          // if (objstepper2[displayname.length][i].user_name_Controller
                          //     .text.length != 0) {
                            userlist[displayname.length].add(
                                stepper2class(
                                    useremail: objstepper2[displayname.length][i]
                                        .user_email_Controller.text,
                                    privilages: objstepper2[displayname.length][i].site
                                        .name,
                                    username: objstepper2[displayname.length][i]
                                        .user_name_Controller.text,
                                    belongsto:  objstepper2[displayname.length][i].Userpopup_Branch
                                ).toMap()
                            );
                          // }
                        }

                  ///documents
                  organizationdocument[displayname.length].forEach((element) {
                    // document[displayname.length].add({});
                    document[displayname.length].add(Document(
                        fileName: element.controller.text,
                        image: element.imagepath).toMap());
                  });

                  /// branch documents
                  for(int i=0 ; i<objbranch[displayname.length].length; i++){
                    print("${i.toString()}:${objbranch[displayname.length][i]}");
                    nesteddocument[displayname.length].add([]);
                    for(int d=0;d<objbranch[displayname.length][i].branchdocumentWidget.length;d++){
                      // branch_Document[i].add([])
                      // print("${(d+1).toString()}:${branchWidget[ticket.length][i].branchDocument[d]}");
                      nesteddocument[displayname.length][i].add(Document(
                          fileName: objbranch[displayname.length][i]
                                    .branchdocumentWidget[d]
                                    .controller.text,
                          image: objbranch[displayname.length][i]
                                 .branchdocumentWidget[d]
                                 .imagepath).toMap());
                    }
                  }

                  ///branch
                  for(int i=0;i<objbranch[displayname.length].length;i++) {
                    // objbranch[_display_name.length].forEach((element) {
                    branchlist[displayname.length].add(branchDocumentclass(
                        branchname:objbranch[displayname.length][i].branch_name_Controller.text,
                        branchemail: objbranch[displayname.length][i].branch_email_Controller.text,
                        branchnumber: objbranch[displayname.length][i].branch_number_Controller.text,
                        branchcountry: objbranch[displayname.length][i].branchselecteDialogCountry.name,
                        branchaddress: objbranch[displayname.length][i].branch_address_Controller.text,
                        branchpincode: objbranch[displayname.length][i].branch_pincode_Controller.text,
                        image: nesteddocument[displayname.length][i]).toMap(),);
                  }

                  displayname.add({
                    "Display_name" : display_name_controller.text,
                    "organization_name" :display_org_controller.text,
                    "organization_email" : display_mail_controller.text,
                    "organization_phone_number" :
                    // "+${_selectedDialogCountry.phoneCode } "
                    "${ display_num_controller.text}",
                    "organization_address" : display_address_controller.text,
                    "organization_country" : _selecteDialogCountry.name,
                    "organization_pincode" : display_pincode_controller.text,
                    "organization_document" : document[displayname.length],
                    "branches":branchlist[displayname.length],
                    "user":userlist[displayname.length]
                  });

                  selectedWidgetMarker = WidgetMarker.list;
                  currentstep = 0;

                  clearText();
                  ///convert into json
                  // String jsonTags = jsonEncode(displayname);
                  // print(jsonTags);

                  // convert each item to a string by using JSON encoding
                  final jsonList = displayname.map((item) => jsonEncode(item)).toList();

                  // using toSet - toList strategy
                  final uniqueJsonList = jsonList.toSet().toList();

                  // convert each item back to the original form using JSON decoding
                  final result = uniqueJsonList.map((item) => jsonDecode(item)).toList();

                  print(result);
                  globlas.g_user += objstepper2.length;
                }

              }
              );
              print("Completed");

            }
            else
              setState(() {
                if(step1form.currentState!.validate())
                {
                  if(organizationdocument[displayname.length].length>=1)
                  {
                    if(objbranch[displayname.length].length>=1)
                    {
                      currentstep += 1;
                    }
                    else{
                      branchwarning = true;
                    }
                  }
                  else
                  {
                    documentwarning = true;
                  }
                }
              });
            // print(_display_name);
          },

        ),
      );
  }
///Editing useage
  List<Step> getSteps(){

    return
      [
        Step(
            isActive:currentstep >= 0 ,
            title: Text("Organization"),
            content:StatefulBuilder(
              ///organization ignorpointer sT-1
              builder: (context, setState) =>  Column(
                children: [
                  GestureDetector(
                      onTap: (){
                        setState(()
                        {
                          ///active field with ignorepointer
                          textfieldactive = false;
                        });},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(child: Text("Edit",style: TextStyle(color: Colors.blue),),),
                        ],
                      )),
                  IgnorePointer(
                    ignoring: textfieldactive,
                    child: Form(
                      key: step1form,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 38,
                                color: color().v,
                                child: Center(child:
                                Text("Organization",
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),)
                                ),
                              ),

                              Container(child:
                              TextFormField(

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
                                  displayname[selectedindex]["Display_name"] = value;
                                },
                                maxLength: 15,
                                controller: editdisplay_name_controller,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: color().v),
                                  ),
                                  // labelStyle: TextStyle(color: color().v),
                                  labelText: "display_name",
                                  hintText: 'Display Name',
                                ),
                                inputFormatters: [],
                              ),
                              ),
                              Container(   decoration: BoxDecoration(
                                // color: Colors.grey,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                                child: TextFormField(
                                  // readOnly:textfieldactive,
                                  maxLength: 20,
                                  validator: (value)
                                  {
                                    if (value!.isEmpty)
                                    {
                                      return "Enter the valid Organization";
                                    }
                                    return null;
                                  },
                                  onChanged: (value)
                                  {
                                    // _org = value as List<String>;
                                    displayname[selectedindex]["organization_name"] = value;
                                  },
                                  controller: editdisplay_org_controller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color().v),
                                    ),
                                    hintText: 'Organization Name',
                                    labelText:  'Organization Name',
                                  ),
                                  inputFormatters: [],
                                ),
                              ),
                              TextFormField(
                                // readOnly:textfieldactive,
                                validator: (val) =>
                                val!.contains('@') ? null : '*Email @ is required ',
                                onChanged: (String value)
                                {
                                  displayname[selectedindex]["organization_email"] = value;
                                  // _email = value as List<String> ;
                                },
                                controller: editdisplay_mail_controller,
                                decoration: InputDecoration(
                                  hintText: 'E-Mail',
                                  labelText: 'E-Mail',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:color().v),
                                  ),
                                ),
                                inputFormatters: [],),
                              Row(
                                children: [
                                  Flexible(
                                    child: StatefulBuilder(
                                      builder: (context, setState) =>  ListTile(
                                        onTap: (){
                                          setState((){showDialog(
                                            context: context,
                                            builder: (context) => Theme(
                                              data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                                              child: CountryPickerDialog(
                                                titlePadding: EdgeInsets.all(8.0),
                                                searchCursorColor: Colors.pinkAccent,
                                                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                                                isSearchable: true,
                                                title: Text('Select your phone code'),
                                                onValuePicked: (Country country) =>
                                                    setState(() => _selectedDialogCountry = country),
                                                itemBuilder: _buildDialogItem,
                                                priorityList: [
                                                  CountryPickerUtils.getCountryByIsoCode('IN'),
                                                  // CountryPickerUtils.getCountryByIsoCode('US'),
                                                ],
                                              ),
                                            ),
                                          );});
                                        },
                                        title: _buildDialogItem(_selectedDialogCountry),
                                        trailing:  Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Flexible(
                                    // flex: 2,
                                    child: TextFormField(
                                      // readOnly:textfieldactive,
                                      validator: (value)
                                      {
                                        if (value!.isEmpty)
                                        {
                                          return "*Enter the Mobile Number";
                                        }
                                        if(value.length<10)
                                        {
                                          return "*The number length must be 10";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        // _num = value as Map<String>;
                                        displayname[selectedindex]["organization_phone_number"] = value;
                                      },
                                      maxLength: 10,
                                      controller: editdisplay_num_controller,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: color().v),
                                      ),
                                        hintText: 'Mobile',
                                        labelText: 'Mobile',
                                      ),
                                      inputFormatters: [],
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                // readOnly:textfieldactive,
                                validator: (value)
                                {
                                  if (value!.isEmpty)
                                  {
                                    return "*Address is required";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  // _address = value as List<String>;
                                  displayname[selectedindex]["organization_address"] = value;
                                },
                                controller: editdisplay_address_controller,
                                maxLines: null,
                                decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color().v),
                                ),
                                  // border: OutlineInputBorder(),
                                  hintText: 'Address',
                                  labelText: 'Address',
                                ),
                                inputFormatters: [],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: StatefulBuilder(
                                      builder: (context, setState) =>  ListTile(
                                        onTap: (){setState((){
                                          showDialog(
                                            context: context,
                                            builder: (context) => Theme(
                                              data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                                              child: CountryPickerDialog(
                                                titlePadding: EdgeInsets.all(8.0),
                                                searchCursorColor: Colors.pinkAccent,
                                                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                                                isSearchable: true,
                                                title: Text('Select your phone code'),
                                                onValuePicked: (Country country) =>
                                                    setState(() => _selecteDialogCountry = country),
                                                itemBuilder: _buildDialog,
                                                priorityList:
                                                [
                                                  CountryPickerUtils.getCountryByName('India'),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                        );
                                        },
                                        title: _buildDialog(_selecteDialogCountry),
                                        trailing:  Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Flexible(
                                    child: TextFormField(
                                      // readOnly:textfieldactive,
                                      validator: (value)
                                      {
                                        if (editdisplay_pincode_controller.text.isEmpty)
                                        {
                                          return "*Pincode box is Empty";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        // _address = value as List<String>;
                                        displayname[selectedindex]["organization_pincode"] = value;
                                      },
                                      keyboardType: TextInputType.number,
                                      controller: editdisplay_pincode_controller,
                                      maxLines: null,
                                      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: color().v),
                                      ),
                                        // border: OutlineInputBorder(),
                                        hintText: 'Pincode',
                                        labelText: 'Pincode',
                                      ),
                                      inputFormatters: [],
                                    ),
                                  ),
                                ],
                              ),
                              ///edit document
                              Row(children: [
                                Flexible(child: Text("Documents")),
                                Flexible(child: IconButton(onPressed: () {
                                  print(organizationdocument);

                                  setState(()
                                  {
                                    documentwarning = false;
                                    // globlas.filewarning = false;

                                    organizationdocument[selectedindex].add(DocumentWidget());
                                    // document[displayname.length].add({});
                                    print(organizationdocument[selectedindex].length);
                                  });
                                },icon: Icon(Icons.add),))
                              ],),

                              Visibility(
                                  child: Container(
                                    color: Colors.red.shade100,
                                    child: Text("*Alteast One Document Mandatory",style: TextStyle(color: Colors.red),),
                                  ),
                                  visible: documentwarning
                              ),
                              Visibility(
                                child: Container(
                                  color: Colors.red.shade100,
                                  child: Text("*Upload a file",style: TextStyle(color: Colors.red),),
                                ),
                                visible: false,
                                // visible: globlas.filewarning
                              ),


                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: organizationdocument[selectedindex].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return
                                    Column(
                                      children: [

                                        Row(
                                          children: [
                                            Flexible(child: organizationdocument[selectedindex][index]),
                                            GestureDetector(
                                                onTap: ()
                                                {

                                                  // document[displayname.length].removeAt(index);
                                                  setState(() {
                                                    organizationdocument[selectedindex].removeAt(index);
                                                  });
                                                },
                                                child: Icon(Icons.remove_circle)
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                },
                              ),
                              ///edit document
                              ///
                              ///

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(child: Text("BRANCH", style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24))),
                                    Flexible(child: IconButton(
                                      onPressed: () {
                                        print(objbranch);
                                        setState(() {
                                          objbranch[selectedindex].add(branch());
                                          // heightlength +=   MediaQuery.of(context).size.height-200;
                                          branchwarning = false;
                                          print(selectedindex);
                                        });} ,icon: Icon(Icons.add_circle_outline_rounded,color: Colors.white,),))
                                  ],
                                ),
                                height: 38,
                                color: color().v,
                              ),
                              Divider(color: Colors.transparent),
                              Visibility(
                                child: Container(
                                  color: Colors.red.shade100,
                                  child: Text("*Alteast One Branch Mandatory",style: TextStyle(color: Colors.red),),
                                ),
                                visible: branchwarning,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: objbranch[selectedindex].length,
                                itemBuilder: (BuildContext context, branchindex) {
                                  return
                                    Column(
                                      children: [
                                        Visibility(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Flexible(child: Text("Branch  : ${branchindex}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                              Flexible(child: IconButton(icon:
                                              Icon(Icons.remove_circle),color: Colors.red,
                                                onPressed: (){ setState(() {
                                                  objbranch[selectedindex].removeAt(branchindex);
                                                });},)),
                                            ],
                                          ),
                                          visible:objbranch[selectedindex].length>1 ? true : false ,
                                        ),
                                        objbranch[selectedindex][branchindex],
                                      ],
                                    );
                                },
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.transparent,)
                ],
              ),
            )
        ),
        ///Editing step - 2
        Step(
            isActive:currentstep >= 1 ,
            title: Text("User"),
            content:Column(
              children: [
                IgnorePointer(
                ignoring: true,
                  child: Form(
                    key: step2form,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(child: Text("User", style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24))),
                              Flexible(child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    // totalvariable = {};
                                    // addstepper2();
                                    objstepper2[selectedindex].add(steper2());
                                  });} ,icon: Icon(Icons.add_circle_outline_rounded,color: Colors.white,),))
                            ],
                          ),
                          height: 38,
                          color: color().v,
                        ),
                        ///edit step 2

                        ListView.builder(
                          shrinkWrap:true,
                          padding: EdgeInsets.zero,
                          physics: ScrollPhysics(),
                          itemCount: objstepper2[selectedindex].length,
                          itemBuilder: (BuildContext context, edituserindex) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        objstepper2[selectedindex].removeAt(edituserindex);
                                      });
                                    },
                                    child:
                                    Visibility(
                                      child:
                                      Row(
                                        children:
                                        [
                                          Flexible(
                                              child: Text("User :${edituserindex}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              )
                                          ),
                                          Flexible(
                                              child: IconButton(
                                                icon: Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red
                                                ),
                                                onPressed: () {
                                                  setState(()
                                                  {
                                                    objstepper2[selectedindex].removeAt(edituserindex);
                                                  });
                                                },)
                                          )
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      ),
                                      visible: objstepper2[selectedindex].length > 1 ? true : false,
                                    ),
                                ),
                                objstepper2[selectedindex][edituserindex],

                              ],
                            );
                          },
                        ),
                        ///

                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.transparent,)
              ],
            )


        ),
///editing final step
        Step(
            isActive:currentstep >= 2 ,
            title: Text("Package"),
            content: Container()),
      ];

  }

///edit
  Widget getStepper(){
    editdisplay_name_controller.text =    displayname[selectedindex]["Display_name"];
    editdisplay_org_controller.text =     displayname[selectedindex]["organization_name"];
    editdisplay_num_controller.text =     displayname[selectedindex]["organization_phone_number"];
    editdisplay_mail_controller.text =    displayname[selectedindex]["organization_email"];
    editdisplay_pincode_controller.text = displayname[selectedindex]["organization_pincode"];
    editdisplay_address_controller.text = displayname[selectedindex]["organization_address"];
    return
      // Scaffold(
      //   body:
        StatefulBuilder(
          builder: (context, setState) =>  Stepper(
            elevation: 5,
            steps:getSteps(),
            controlsBuilder: (context,  ControlsDetails details) {
              return
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: details.onStepCancel,
                        child: Container(
                          height: 50,
                          width: 181,
                          child: Center(child: Text("${ currentstep == 0? 'Cancel' : "Back"}")),
                        )),
                    GestureDetector(
                        onTap: details.onStepContinue,
                        child: Container(
                          width: 181,
                          height: 50,
                          color: color().v,
                          child: Center(child: Text("${currentstep == 2 ? "Submit" : "Next"}")),)),
                  ],
                );} ,
            type: StepperType.horizontal,
            currentStep: currentstep,
            onStepCancel: () {
              currentstep <= 0 ?
              setState(() {
                selectedWidgetMarker = WidgetMarker.list;
              })
                  :
              setState(() {
                currentstep -= 1;
              });
            },

            onStepContinue: (){
              ///seperate stepper condition
              final isLastStep = currentstep == getSteps().length - 1;
              if(isLastStep)
              {
                if(step1form.currentState!.validate())
                  {
                setState(()
                {
                  ///User
                  ///step2 nested
                  for (int i = 0; i <
                      objstepper2[selectedindex].length; i++) {
                    ///          *WARNING*
                    /// send this to final step
                    // if (objstepper2[displayname.length][i].user_name_Controller
                    //     .text.length != 0) {
                    userlist[selectedindex].add(
                        stepper2class(
                            useremail: objstepper2[selectedindex][i]
                                .user_email_Controller.text,
                            privilages: objstepper2[selectedindex][i].site
                                .name,
                            username: objstepper2[selectedindex][i]
                                .user_name_Controller.text,
                            belongsto:  objstepper2[selectedindex][i].Userpopup_Branch
                        ).toMap()
                    );
                    // }
                  }

                  ///organization document

                  document[selectedindex].clear();
                  organizationdocument[selectedindex].forEach((element) {
                    document[selectedindex].add(Document(
                        fileName: element.controller.text,
                        image: element.imagepath).toMap());
                  });

                  /// BranchDocuments

                  for (int i = 0; i <
                      objbranch[selectedindex].length; i++) {
                    print("${i.toString()}:${objbranch[selectedindex][i]}");
                    nesteddocument[selectedindex].add([]);
                    for (int d = 0; d <
                        objbranch[selectedindex][i].branchdocumentWidget
                            .length; d++) {
                      print("${(d + 1)
                          .toString()}:${objbranch[selectedindex][i]
                          .branchdocumentWidget[d]}");
                      nesteddocument[selectedindex][i].add(Document(
                          fileName: objbranch[selectedindex][i]
                              .branchdocumentWidget[d].controller.text,
                          image: objbranch[selectedindex][i]
                              .branchdocumentWidget[d].imagepath
                      ).toMap());
                    }
                  }
                  //
                  //
                  ///Branch & Documents
                  //
                  branchlist[selectedindex].clear();
                  for (int i = 0; i <
                      objbranch[selectedindex].length; i++) {
                        branchlist[selectedindex].add(branchDocumentclass(
                        branchname: objbranch[selectedindex][i]
                            .branch_name_Controller.text,
                        branchemail: objbranch[selectedindex][i]
                            .branch_email_Controller.text,
                        branchnumber: objbranch[selectedindex][i]
                            .branch_number_Controller.text,
                        branchaddress: objbranch[selectedindex][i]
                            .branch_address_Controller.text,
                        branchcountry: objbranch[selectedindex][i]
                            .Cc[i],
                        branchpincode: objbranch[selectedindex][i]
                            .branch_pincode_Controller.text,
                        image: nesteddocument[selectedindex][i]).toMap());
                  }

                  displayname[selectedindex]["Display_name"] =editdisplay_name_controller.text;
                  displayname[selectedindex]["organization_name"] =editdisplay_org_controller.text;
                  displayname[selectedindex]["organization_phone_number"] =  editdisplay_num_controller.text;
                  displayname[selectedindex]["organization_email"] =editdisplay_mail_controller.text;
                  displayname[selectedindex]["organization_address"] =editdisplay_address_controller.text;
                  displayname[selectedindex]["organization_pincode"] =editdisplay_pincode_controller.text;
                  displayname[selectedindex]["organization_document"] = document[selectedindex];
                  displayname[selectedindex]["branches"] = branchlist[selectedindex];
                  displayname[selectedindex]["user"] = userlist[selectedindex];
                  // currentstep = 0;
                }
                );
                setState((){

                });

                print("Completed");
                print(displayname);
                selectedWidgetMarker = WidgetMarker.list;
              }

              }

              else
                setState(() {
                  if(step1form.currentState!.validate())
                  {
                    currentstep +=1;
                  }
                });

            },
          ),
        // ),
      );
  }
///main list
  Widget getList(){
    return  /*Scaffold(
      body: */
      Column(
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
                  setState(() {

                    clearText();
                    selectedWidgetMarker = WidgetMarker.adder;

                    // objbranch[_display_name.length].length = 1;
                    nesteddocument.add([]);
                    objbranch.add([]);
                    branchlist.add([]);
                    objstepper2.add([]);
                    userlist.add([]);
                    organizationdocument.add([]);
                    document.add([]);
                    objbranch[displayname.length].length = 0;
                    organizationdocument[displayname.length].length = 0;
                    objstepper2[displayname.length].length = 0;

                  });
                },
                    icon: Icon(Icons.add)),
              )
            ],
          ),
          if( displayname.length>=1)...[
          ///Mainlist Container
          ListView.builder(
            shrinkWrap: true,
            itemCount: displayname.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    textfieldactive = true;
                    currentstep = 0;
                    selectedindex = index;
                    selectedWidgetMarker = WidgetMarker.stepper;
                    displayname.forEach((element) {print(element);});
                  });
                  print(selectedindex);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:  LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(6, 6),
                          colors: <Color>[
                            Color(0xFF269cc4),
                            Color(0xFFffffff),
                            Color(0xFF269cc4),
                            Color(0xFFffffff),])
                    ),
                      // color: Colors.green.withOpacity(0.4),
                      padding: EdgeInsets.all(10),
                      child:
                      Center(
                        child: Text(
                            displayname[index]["organization_name"],
                          style: TextStyle(fontWeight: FontWeight.bold),),
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
              child: Center(child: Text("No Organiztion"),),
            )
          ]
        ],
      // ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

///document
class DocumentWidget extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  String imagepath ="";
  bool organizationdocbool = false;
  bool filebool = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Row(
          children: [
            Flexible(
              flex: 11,
              child: Column(
                children: [
                  Visibility(
                    child: Text("*Document character is greater then 2",style: TextStyle(color: Colors.red),),
                    visible: controller.text.length > 2 ? false : organizationdocbool,
                  ),
                  TextFormField(
                    readOnly:userState().textfieldactive,
                    maxLength: 10,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "*Enter the File Name";
                      }
                      else if(val.length<=2)
                      {
                        return "File charactor should be greater then 2";
                      }

                      return null;
                    },
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter Documents Name",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color().v),
                      ),),

                    onChanged: (value){
                      setState((){

                      });
                    },

                  ),
                ],
              ),
            ),
            VerticalDivider(),

            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () async{

                  print(!(controller.text.length>2));

                    final pickedImage = await FilePicker.platform.pickFiles(
                      allowCompression: true,
                    );

                    if(pickedImage != null){
                      print(pickedImage..toString());
                      setState((){
                        imagepath = pickedImage.files.first.extension.toString();
                      });
                      print(imagepath);
                    }else
                    {

                      print("No Image Selected");
                    }

                  // }
                },
                child: Icon(
                  Icons.photo,
                  color:
                  imagepath.length>0
                      ?
                  Colors.blue
                      :
                  Colors.black,
                ),
              ),
            ),
            VerticalDivider(),
            if(imagepath.isEmpty)...
            [
              Flexible(
                  flex:6,
                  child: Text("nofilechosen"))
            ]
            else...
            [
              Flexible(
                  flex: 3,
                  child: Text("${imagepath}"))
            ]
          ],
        );
      },
    );
  }
}

class Document{

  String fileName;
  String image;

  Document({required this.fileName, required this.image});

  /*@override toString() {
    return '{Date:$date,Message:$name}';
    // return 'Message: $name';
    // '{id: $id, title: $title}'
  }*/

  Map<String, dynamic> toMap() {
    return {
      'FileName':fileName,
      'Image': image,
    };
  }
}

class color
{
  var v =   Color(0xFF00BFFF);
}