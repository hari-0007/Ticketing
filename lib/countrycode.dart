import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';

class mobileCountrycode extends StatefulWidget {
   mobileCountrycode({Key? key }) : super(key: key);

  @override
  State<mobileCountrycode> createState() => _mobileCountrycodeState();
}

class _mobileCountrycodeState extends State<mobileCountrycode> {
  Country _branchselecteDialogcode =
  CountryPickerUtils.getCountryByPhoneCode('91');
  String mcc = "";
  @override
  Widget build(BuildContext context) {
    return    StatefulBuilder(
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
                        _branchselecteDialogcode = country;
                         _branchselecteDialogcode.phoneCode;
                        print(_branchselecteDialogcode.phoneCode);
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
        title:_branchbuildDialogcode(_branchselecteDialogcode),
        trailing:  Icon(Icons.arrow_drop_down),
      ),
    );
  }
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

//
class countrycode extends StatelessWidget {

  Country _branchselecteDialogCountry =
  CountryPickerUtils.getCountryByName('India');
  String Cc ="";
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
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
                      setState(() {

                        _branchselecteDialogCountry = country;
                        // widget.
                        Cc = _branchselecteDialogCountry.name;
                        // print(
                        // widget.
                        // Cc);
                      }),
                  itemBuilder: _branchbuildDialog,
                  priorityList:
                  [
                    CountryPickerUtils.getCountryByIsoCode('IN'),
                  ],
                ),
              ),
            );
          });
        },
        title:_branchbuildDialog(_branchselecteDialogCountry),
        trailing:  Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
Widget _branchbuildDialog(Country country) =>Row(
    children: <Widget>[
      // CountryPickerUtils.getDefaultFlagImage(country),
      Flexible(child: Text(country.name),),
      // SizedBox(width: 8.0),
      // Flexible(child: Text("+${country.phoneCode}")),
      // SizedBox(width: 8.0),
    ]
);
