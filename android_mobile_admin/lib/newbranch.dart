import 'package:flutter/material.dart';
import 'user_1.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'countrycode.dart';
import 'globals (1).dart'as globlas;
class branch extends StatelessWidget {

  TextEditingController branch_name_Controller = TextEditingController();
  TextEditingController branch_email_Controller = TextEditingController();
  TextEditingController branch_number_Controller = TextEditingController();
  TextEditingController branch_address_Controller = TextEditingController();
  TextEditingController branch_pincode_Controller = TextEditingController();
  Country branchselecteDialogCountry =
  CountryPickerUtils.getCountryByName('India');
  String Cc = "";
  Country branchselecteDialogcode =
  CountryPickerUtils.getCountryByPhoneCode('91');
  String pc = "";
  List<countrycode> objcountry= [];
  List<DocumentWidget> branchdocumentWidget =  [];

  List selectedindex = [];
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Column(
          children: [

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                readOnly:userState().textfieldactive,

                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return "*BranchName is Empty";
                  }
                  return null;
                },
                controller: branch_name_Controller,

                decoration: InputDecoration(
                  hintText: "Branch_Name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color().v),
                  ),),
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
                controller: branch_email_Controller,
                decoration: InputDecoration(
                  hintText: "Branch_E-Mail",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color().v),
                  ),),
                onChanged: (value){
                  setState((){

                  });
                },
              ),
            ),
            Row(
              children: [
                Flexible(child:
                StatefulBuilder(
                  builder: (context, setState) => ListTile(
                    onTap: (){
                      setState((){
                        showDialog(
                          context: context,
                          builder: (context) =>  Theme(
                            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                            child: CountryPickerDialog(
                              titlePadding: EdgeInsets.all(8.0),
                              searchCursorColor: Colors.pinkAccent,
                              searchInputDecoration: InputDecoration(hintText: 'Search...'),
                              isSearchable: true,
                              title: Text('Select your phone code'),
                              onValuePicked: (Country country) =>
                                  setState(()
                                  {
                                    branchselecteDialogcode = country;
                                    pc  = branchselecteDialogcode.phoneCode;
                                    print(branchselecteDialogcode.phoneCode);
                                  }),
                              itemBuilder: _branchbuildDialogcode,
                              priorityList: [
                                CountryPickerUtils.getCountryByIsoCode('IN'),
                                // CountryPickerUtils.getCountryByIsoCode('US'),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    title:_branchbuildDialogcode(branchselecteDialogcode),
                    trailing:  Icon(Icons.arrow_drop_down),
                  ),
                )
                  // mobileCountrycode()

                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      readOnly:userState().textfieldactive,

                      maxLength: 10,
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
                      keyboardType: TextInputType.number,
                      controller: branch_number_Controller,
                      decoration: InputDecoration(
                        hintText: "Branch_Number",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: color().v),
                        ),),
                      onChanged: (value){
                        setState((){

                        });
                      },
                    ),
                  ),
                ),
              ],
            ),Container(

              margin: EdgeInsets.all(10),
              child: TextFormField(
                readOnly:userState().textfieldactive,
                maxLength: 60,
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return "*BranchAddress should not be Empty";
                  }
                  return null;
                },
                maxLines: null,
                controller: branch_address_Controller,
                decoration: InputDecoration(
                  hintText: "Branch_Address",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color().v),
                  ),),
                onChanged: (value){
                  setState((){

                  });
                },
              ),
            ),
            Row(
              children: [
                Flexible(child:
                StatefulBuilder(
                  builder: (context, setState) => ListTile(
                    onTap: (){
                      setState((){
                        showDialog(
                          context: context,
                          builder: (context) =>  Theme(
                            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                            child:
                            // ListView.builder(
                            //   itemCount: Cc.length,
                            //   shrinkWrap: true,
                            //   itemBuilder: (context, index) =>
                              CountryPickerDialog(
                                titlePadding: EdgeInsets.all(8.0),
                                searchCursorColor: Colors.pinkAccent,
                                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                                isSearchable: true,
                                title: Text('Select your CountryCode'),
                                onValuePicked: (Country country) =>
                                    setState(()
                                    {
                                      branchselecteDialogCountry = country;
                                      Cc= branchselecteDialogCountry.name;
                                      print(Cc);
                                    }),
                                itemBuilder: _branchbuildDialog,
                                priorityList:
                                [
                                  CountryPickerUtils.getCountryByIsoCode('IN'),
                                ],
                              ),
                            // ),
                          ),
                        );
                      });
                    },
                    title:_branchbuildDialog(branchselecteDialogCountry),
                    trailing:  Icon(Icons.arrow_drop_down),
                  ),
                )

                ),

                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      readOnly:userState().textfieldactive,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "*Pincode is mandatory";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: branch_pincode_Controller,
                      decoration: InputDecoration(
                        hintText: "Branch_Pincode",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: color().v),
                        ),),
                      onChanged: (value){
                        setState((){

                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              Flexible(child: Text("Branch_Documents")),
              Flexible(child: IconButton(onPressed: () {
                setState(() {
                  branchdocumentWidget.add(DocumentWidget());
                });
              },icon: Icon(Icons.add),))
            ],),

               ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: branchdocumentWidget.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Flexible(
                                flex: 5,
                                child: branchdocumentWidget[index]),
                            Flexible(
                              child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      branchdocumentWidget.removeAt(index);
                                    });
                                  }, child: Icon(Icons.remove_circle)
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                },
              ),
          ],
        );
      },
    );
  }
  Widget _branchbuildDialogcode(Country country) =>Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),
        Flexible(child: Text("(${country.isoCode})"),),
        // SizedBox(width: 8.0),
        Flexible(child: Text("+${country.phoneCode}")),

        // SizedBox(width: 8.0),
      ]
  );

  Widget _branchbuildDialog(Country country) =>Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),
        Flexible(child: Text(country.name),),
        // SizedBox(width: 8.0),
        // Flexible(child: Text("+${country.phoneCode}")),
        // SizedBox(width: 8.0),
      ]
  );


}



class branchDocumentclass{

  String branchname;
  String branchemail;
  String branchnumber;
  String branchaddress;
  String branchcountry;
  String branchpincode;

  List <Map> image  = [];

  branchDocumentclass({required this.branchname,
    required this.image,
    required this.branchaddress, required this.branchemail, required this.branchnumber,required this.branchpincode,
    required this.branchcountry
  });

  /*@override toString() {
    return '{Date:$date,Message:$name}';
    // return 'Message: $name';
    // '{id: $id, title: $title}'
  }*/

  Map<String, dynamic> toMap() {
    return
      {
        'branch_name':branchname,
        "branch_email" : branchemail,
        "branch_phone_number" : branchnumber,
        "branch_address" : branchaddress,
        "branch_country" : branchcountry,
        "branch_pincode" : branchpincode,
        'Image': image,
      };
  }
}