import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<Map<String, dynamic>> users = [
  {
    "name" : "James Bond",
    "designation" : "Network Admin",
    "level" : 1,
    "starRating" : 8,
    "userGroup": "Group A"
  },
  {
    "name" : "Robert",
    "designation" : "Network Technician",
    "level" : 3,
    "starRating" : 2,
    "userGroup": "Group B"
  },
  {
    "name" : "John",
    "designation" : "Server Admin",
    "level" : 2,
    "starRating" : 2,
    "userGroup": "Group C"
  },
  {
    "name" : "Michael",
    "designation" : "System Admin",
    "level" : 4,
    "starRating" : 0,
    "userGroup": "Group D"
  },
  {
    "name" : "William",
    "designation" : "System Engineer",
    "level" : 5,
    "starRating" : 6,
    "userGroup": "Group A"
  },
  {
    "name" : "David",
    "designation" : "Network Admin",
    "level" : 1,
    "starRating" : 0,
    "userGroup": "Group B"
  },
  {
    "name" : "Richard",
    "designation" : "Network Technician",
    "level" : 4,
    "starRating" : 7,
    "userGroup": "Group C"
  },
  {
    "name" : "Joseph",
    "designation" : "Server Admin",
    "level" : 0,
    "starRating" : 0,
    "userGroup": "Group D"
  },
  {
    "name" : "Thomas",
    "designation" : "System Admin",
    "level" : 2,
    "starRating" : 9,
    "userGroup": "Group A"
  },
  {
    "name" : "Charles",
    "designation" : "System Engineer",
    "level" : 3,
    "starRating" : 4,
    "userGroup": "Group B"
  },
  {
    "name" : "Christopher",
    "designation" : "Network Admin",
    "level" : 4,
    "starRating" : 10,
    "userGroup": "Group C"
  },
  {
    "name" : "Daniel",
    "designation" : "Network Technician",
    "level" : 5,
    "starRating" : 7,
    "userGroup": "Group D"
  },
  {
    "name" : "Matthew",
    "designation" : "Server Admin",
    "level" : 2,
    "starRating" : 3,
    "userGroup": "Group A"
  },
  {
    "name" : "Anthony",
    "designation" : "System Admin",
    "level" : 5,
    "starRating" : 5,
    "userGroup": "Group B"
  },
  {
    "name" : "Mark",
    "designation" : "System Engineer",
    "level" : 1,
    "starRating" : 8,
    "userGroup": "Group C"
  },
  {
    "name" : "Donald",
    "designation" : "Network Admin",
    "level" : 4,
    "starRating" : 9,
    "userGroup": "Group D"
  },
  {
    "name" : "Steven",
    "designation" : "Network Technician",
    "level" : 2,
    "starRating" : 4,
    "userGroup": "Group A"
  },
  {
    "name" : "Paul",
    "designation" : "Server Admin",
    "level" : 3,
    "starRating" : 7,
    "userGroup": "Group B"
  },
  {
    "name" : "Andrew",
    "designation" : "System Admin",
    "level" : 3,
    "starRating" : 8,
    "userGroup": "Group C"
  },
  {
    "name" : "Joshua",
    "designation" : "System Engineer",
    "level" : 3,
    "starRating" : 8,
    "userGroup": "Group D"
  },
  {
    "name" : "Kenneth",
    "designation" : "Network Admin",
    "level" : 0,
    "starRating" : 1,
    "userGroup": "Group A"
  },
  {
    "name" : "Kevin",
    "designation" : "Network Technician",
    "level" : 0,
    "starRating" : 0,
    "userGroup": "Group B"
  },
  {
    "name" : "Brian",
    "designation" : "Server Admin",
    "level" : 2,
    "starRating" : 4,
    "userGroup": "Group C"
  },
  {
    "name" : "George",
    "designation" : "System Admin",
    "level" : 2,
    "starRating" : 6,
    "userGroup": "Group D"
  },
  {
    "name" : "Edward",
    "designation" : "System Engineer",
    "level" : 2,
    "starRating" : 5,
    "userGroup": "Group A"
  },
  {
    "name" : "Ronald",
    "designation" : "Network Admin",
    "level" : 0,
    "starRating" : 2,
    "userGroup": "Group B"
  },
];

List<String> branch =[
  "Branch 0",
  "Branch 1",
  "Branch 2",
  "Branch 3",
  "Branch 5",
];

// List<String> designation = [
//   "Network Admin",
//   "Network Technician",
//   "Server Admin",
//   "System Admin",
//   "System Engineer",
// ];

class Users extends StatefulWidget {

  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => UsersState();
}

class UsersState extends State<Users> {

  String? userGroupHeading;

  final firstName =TextEditingController();
  final eMail =TextEditingController();

  // bool userGroup = false;

  Map map = Map();
  List<String> group = [];

  Set<String> designation = {};

  String? selectedDesignation;
  String? selectedlevel;

  List userBranch = [];

  bool _userWidth = false;
  bool _searchUser = false;

  List<Map<String, dynamic>> usersFilter = users;

  @override
  void dispose() {
    firstName.dispose();
    eMail.dispose();
    super.dispose();
  }

  @override
  initState() {
    // at the beginning, all users are shown
    usersFilter = users;

    usersFilter.forEach((element) {
      designation.add(element["designation"]);
    });

    usersFilter.forEach((element) {
      group.add(element["userGroup"]);
    });

    group.forEach((element){
      map[element] = !map.containsKey(element) ? (1) : (map[element] + 1);
    });

    // userGroup = false;
    
    super.initState();
  }

  void _userSearch(String enteredKeyword){
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = users;
    }else {
      results = users
          .where((user) =>!_searchUser?
      user["userGroup"].toLowerCase().contains(enteredKeyword.toLowerCase()):user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      usersFilter = results;
    });

  }

  // List<Map<String, dynamic>> pass = users;

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = firstName.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code

    String result = "";

    if (text.isEmpty) {
      return result = 'Enter User Name'/*'Can\'t be empty'*/;
    }else if (text.length > 1) {
      usersFilter.forEach((element) {
        if(element["name"].toString().toLowerCase()==text.toLowerCase()){
          print("same");
          result = 'User already exists';
        }
      });
    }
    // return null if the text is valid
    return result;
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 12.5,right: 12.5,top: 0,bottom: 5),
          padding: EdgeInsets.only(top: 0,bottom: 0),
          child: Column(
            children: [

              Card(
                margin: EdgeInsets.only(/*left: 12.5,right: 12.5,*/top: 10,/*bottom: 5*/),
                elevation: 5.0,
                color: Colors.white.withOpacity(0.4),
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  // margin: EdgeInsets.only(left: 12.5,right: 12.5,top: 0,bottom: 5),
                  padding: EdgeInsets.only(top: 0,bottom: 0),
                  height: 27.5,
                  // padding: EdgeInsets.only(right: 7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      SizedBox(
                        width: 35,
                        child: PopupMenuButton(
                          enabled: !_searchUser,
                          icon: Icon(Icons.arrow_drop_down_outlined,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          onCanceled: (){
                            print("Cancel");
                          },
                          // onSelected: (val){
                          //   print(val);
                          // },
                          color: Color(0xff19547b).withOpacity(0.975),
                          padding: EdgeInsets.zero,
                          offset: Offset(2,2),
                          itemBuilder: (BuildContext context) {
                            return [

                                PopupMenuItem(
                                    onTap: (){
                                      setState(() {
                                        _userSearch("");
                                        userGroupHeading = null;
                                      });
                                    },
                                    value: "All",
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                          color: Colors.white,
                                      ),
                                    ),
                                ),

                              for(int i=0; i<map.length;i++)...[
                                PopupMenuItem(
                                  onTap: (){
                                    setState(() {
                                      _userSearch(map.keys.toList()[i]);
                                      userGroupHeading = map.keys.toList()[i];
                                    });
                                  },
                                    value: map.keys.toList()[i],
                                    child: Text(
                                      map.keys.toList()[i],/*usersFilter[i]["name"],*//*"${map.keys.toList()[i]}   ${map.values.toList()[i]}",*/
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                )
                              ],

                            ];

                            //   group.toSet().map((item){
                            //   return PopupMenuItem(
                            //     value: item,
                            //     child: Text(item),
                            //   );
                            // }).toList();

                            //   [
                            //
                            //   PopupMenuItem(
                            //       onTap: (){
                            //         setState(() {
                            //           userGroup = false;
                            //         });
                            //       },
                            //       value: "User",
                            //       child: Text(
                            //         "User",
                            //         style: TextStyle(
                            //             color: Colors.white
                            //         ),
                            //       )
                            //   ),
                            //
                            //   PopupMenuItem(
                            //       onTap: (){
                            //         setState(() {
                            //           userGroup = true;
                            //         });
                            //       },
                            //       value: "Group",
                            //       child: Text(
                            //         "Group",
                            //         style: TextStyle(
                            //             color: Colors.white
                            //         ),
                            //       )
                            //   ),
                            //
                            // ];
                          },
                        ),
                      ),

                      /*userGroup?Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Flexible(
                                  child: Center(
                                      child: Text(
                                          "Groups"
                                      )
                                  )
                              ),

                              Flexible(
                                  child: Center(
                                      child: Text(
                                          "Users"
                                      )
                                  )
                              ),

                            ],
                          )
                      ):*/Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [

                            Flexible(
                                child: Center(
                                    child: Text(
                                        "Name",
                                    )
                                )
                            ),

                            Flexible(
                              flex: 3,
                                child: Center(
                                    child: Text(
                                        "Designation",
                                    )
                                )
                            ),

                              Flexible(
                                  child: Center(
                                    child: Icon(
                                      Icons.leaderboard_sharp,
                                      color: Color(0xff19547b).withOpacity(0.9),
                                    ),
                                  )
                              ),

                              Flexible(
                                  child: Center(
                                    child: Icon(
                                        Icons.star_half_sharp,
                                      color: Color(0xff19547b).withOpacity(0.9),
                                    ),
                                  )
                              ),

                          ],
                        ),
                      )

                    ],

                    // children: [
                    //
                    //   Flexible(
                    //     flex: 2,
                    //       child: Row(
                    //         // mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //
                    //           // Flexible(
                    //           //     flex: 3,
                    //           //   child: GestureDetector(
                    //           //     onTap: (){
                    //           //       print("down arrow");
                    //           //     },
                    //           //     child: Center(
                    //           //       child: Icon(
                    //           //         Icons.arrow_drop_down_outlined,
                    //           //         size: 28,
                    //           //       ),
                    //           //     ),
                    //           //   )
                    //           // ),
                    //           Flexible(
                    //             flex: 3,
                    //               child: PopupMenuButton(
                    //                 icon: Icon(Icons.arrow_drop_down_outlined,),
                    //                 shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.all(
                    //                     Radius.circular(20.0),
                    //                   ),
                    //                 ),
                    //                 onSelected: (val){
                    //                   print(val);
                    //                 },
                    //                 color: Color(0xff19547b).withOpacity(0.975),
                    //                 padding: EdgeInsets.zero,
                    //                 offset: Offset(2,2),
                    //                 itemBuilder: (BuildContext context) {
                    //                   return [
                    //
                    //                     PopupMenuItem(
                    //                       onTap: (){
                    //                         setState(() {
                    //                           userGroup = false;
                    //                         });
                    //                       },
                    //                       value: "User",
                    //                         child: Text(
                    //                             "User",
                    //                           style: TextStyle(
                    //                             color: Colors.white
                    //                           ),
                    //                         )
                    //                     ),
                    //
                    //                     PopupMenuItem(
                    //                         onTap: (){
                    //                           setState(() {
                    //                             userGroup = true;
                    //                           });
                    //                         },
                    //                         value: "Group",
                    //                         child: Text(
                    //                             "Group",
                    //                           style: TextStyle(
                    //                               color: Colors.white
                    //                           ),
                    //                         )
                    //                     )
                    //
                    //                   ];
                    //                 },
                    //               )
                    //           ),
                    //
                    //           Flexible(
                    //             flex: 4,
                    //             child: Text(
                    //               'Name',
                    //             ),
                    //           )
                    //
                    //         ],
                    //       )
                    //   ),
                    //
                    //   Flexible(
                    //       flex: 3,
                    //       child: Center(
                    //         child: Text(
                    //             "Designation"
                    //         ),
                    //       )
                    //   ),
                    //
                    //   Flexible(
                    //       child: Center(
                    //         child: Icon(
                    //           Icons.leaderboard_sharp,
                    //           color: Color(0xff19547b).withOpacity(0.9),
                    //         ),
                    //       )
                    //   ),
                    //
                    //   Flexible(
                    //       child: Center(
                    //         child: Icon(
                    //             Icons.star_half_sharp,
                    //           color: Color(0xff19547b).withOpacity(0.9),
                    //         ),
                    //       )
                    //   ),
                    //
                    // ],

                  ),
                ),
              ),

              Visibility(
                visible: userGroupHeading==null?false:true,
                child: Card(
                    elevation: 5.0,
                    color: Colors.white.withOpacity(0.4),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(top: 7.5,bottom: 0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xffACC5C6).withOpacity(0.375),/*(index%2==0)?Color(0xff19547b).withOpacity(0.6):Color(0xff19547b).withOpacity(0.4),*/
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(userGroupHeading.toString())
                    )
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 5),
                  shrinkWrap: true,
                  itemCount:/*userGroup?map.length:*/usersFilter.length,
                  itemBuilder: (BuildContext context, int index) {
                    return /*userGroup?GestureDetector(
                      onTap: (){
                        print("${map.keys.toList()[index]}:${map.values.toList()[index]}");
                      },
                      child: Card(
                        elevation: 5.0,
                        color: Colors.white.withOpacity(0.4),
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 40,
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Color(0xff19547b).withOpacity(0.375),*//*(index%2==0)?Color(0xff19547b).withOpacity(0.6):Color(0xff19547b).withOpacity(0.4),*//*
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [

                              SizedBox(
                                width: 35,
                                child: Center(
                                  child: Text(
                                    "${index+1}"
                                  ),
                                ),
                              ),

                              Flexible(
                                child: Center(
                                  child: Text(
                                      map.keys.toList()[index]
                                  ),
                                ),
                              ),

                              Flexible(
                                child: Center(
                                  child: Text(
                                      map.values.toList()[index].toString()
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ):*/GestureDetector(
                      onTap: (){
                        print(usersFilter[index]);
                        // print(context.owner);
                      },
                      child: Card(
                        elevation: 5.0,
                        color: Colors.white.withOpacity(0.4),
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // elevation: 8,
                        // margin: EdgeInsets.only(left: 7.5,right: 7.5,top: 5,bottom: 5),
                        child: Slidable(
                          key: UniqueKey(),
                          endActionPane: ActionPane(
                            extentRatio: 0.3,
                              // closeThreshold: 0.25,openThreshold: 0.2,
                              motion: const DrawerMotion(),
                              /*dismissible: DismissiblePane(
                                key: UniqueKey(),
                                  onDismissed: () {

                                setState(() {
                                  usersFilter.removeAt(index);
                                });


                                print(index);
                                print(usersFilter[index]);
                              }),*/
                              children: [

                                SlidableAction(
                                  // flex: 1,
                                  autoClose: true,
                                  onPressed: (value){
                                    print(value);
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  spacing: 10,
                                  // label: 'Edit',
                                ),

                                SlidableAction(
                                  // flex: 1,
                                  autoClose: true,
                                  onPressed: (value){
                                    print(value);
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  icon: Icons.block,
                                  spacing: 10,
                                  // label: 'Disable',
                                ),

                                /*SlidableAction(
                                  autoClose: true,
                                  onPressed: (value){
                                    print(value);
                                  },
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  icon: Icons.close_rounded,
                                  spacing: 10,
                                  // label: 'Remove',
                                ),*/

                                /*SlidableAction(
                              onPressed: (value){},
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Share',
                            ),*/
                              ]
                          ),
                          child: Container(
                            height: 40,
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff19547b).withOpacity(0.375),/*(index%2==0)?Color(0xff19547b).withOpacity(0.6):Color(0xff19547b).withOpacity(0.4),*/
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Flexible(
                                  flex: 2,
                                  child: Center(
                                      child: Text(
                                          usersFilter[index]["name"],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.85)
                                        ),
                                      )
                                  ),
                                ),

                                Flexible(
                                  flex: 3,
                                  child: Center(
                                      child: Text(
                                        usersFilter[index]["designation"],
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.85)
                                        ),
                                      )
                                  ),
                                ),

                                Flexible(
                                  child: Center(
                                      child: Text(
                                        usersFilter[index]["starRating"].toString(),
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.85)
                                        ),
                                      )
                                  ),
                                ),

                                Flexible(
                                  child: Center(
                                      child: Text(
                                    usersFilter[index]["level"].toString(),
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.85)
                                        ),
                                      )
                                  ),
                                ),

                                // SizedBox(
                                //   width: 52.5,
                                //     child: Text(
                                //       usersFilter[index]["userGroup"].toString(),
                                //       style: TextStyle(
                                //           color: Colors.black.withOpacity(0.85)
                                //       ),
                                //     )
                                // ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

              ),
            ],
          ),
        ),

    Positioned.fill(
      child: Align(
        alignment: Alignment(1,-0.6),
        child: SingleChildScrollView(
          physics:  NeverScrollableScrollPhysics(),/*ClampingScrollPhysics(),*/
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){

                  // usersFilter.add({
                  //   "name" : "456456",
                  //   "designation" : "Network Admin",
                  //   "level" : 0,
                  //   "starRating" : 2,
                  //   "userGroup": "Group B"
                  // },);

                  print(designation);
                  print(group);
                  print(map);

                  // print(usersFilter.last);
                  // print(users.last);

                  setState(() {

                    _userWidth=!_userWidth;
                    _searchUser=false;

                  });

                  userGroupHeading = null;
                  _userSearch("");

                },
                child: AnimatedContainer(
                  constraints: BoxConstraints(
                      minWidth: 25),
                  duration: Duration(milliseconds: 0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.2)
                      ],
                      stops: [0.0, 1.0],
                    ),
                    // color: Colors.white60,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                  height: 50,
                  child: Visibility(
                    visible: _userWidth,
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top:4,bottom: 4,left: 0,right: 0),
                      children: [/*_searchUser*/
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          child: _searchUser?GestureDetector(
                            key: Key('2'),
                            onTap: (){
                              setState(() {
                                _searchUser=!_searchUser;
                              });
                            },
                            child: Card(
                              color: Colors.transparent,
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(25),
                                    color: Colors.black.withOpacity(0.5),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          offset: Offset(2, 4),
                                          color: Colors.black12
                                              .withOpacity(
                                              0.15)), //3dright
                                    ]),
                                child: Row(children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Center(
                                    child: Container(
                                        width: 150,
                                        child: TextField(
                                          onChanged: (value) => _userSearch(value),
                                          autofocus: true,
                                          cursorColor: Colors.white24,
                                          keyboardType:
                                          TextInputType.text,
                                          style: TextStyle(
                                              fontFamily:
                                              'fonts/Roboto-Bold.ttf',
                                              fontSize: 18,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                          decoration:
                                          InputDecoration.collapsed(
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                                color: Colors.white70),
                                            border: InputBorder.none,
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.5,
                                  ),
                                  SizedBox(
                                    height: 24.5,
                                    child: Icon(
                                      Icons.search_sharp,
                                      color: Colors.white,
                                      size: 27,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ]),
                              ),
                            ),
                          ):GestureDetector(
                            key: Key('1'),
                            onTap: (){
                              setState(() {
                                _searchUser=!_searchUser;
                              });
                            },
                            child: Card(
                              color: Colors.transparent,
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(25),
                                    color: Colors.black.withOpacity(0.5),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          offset: Offset(2, 4),
                                          color: Colors.black12
                                              .withOpacity(
                                              0.15)), //3dright
                                    ]),
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      SizedBox(
                                        height: 22.5,
                                        child: Icon(
                                          Icons.search_sharp,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Search',
                                          style: TextStyle(
                                              fontFamily:
                                              'fonts/Roboto-Light.ttf',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.white
                                                  .withOpacity(0.75)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {

                                return AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  backgroundColor: Colors.white70,
                                  insetPadding: EdgeInsets.zero,
                                  // contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                  titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                                  actionsOverflowButtonSpacing: 10,
                                  elevation: 5,
                                  scrollable: true,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      ElevatedButton(
                                          onPressed: (){

                                            Navigator.pop(context);

                                            WidgetsBinding.instance?.addPostFrameCallback((_){
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext context, void Function(void Function()) setState) {
                                                      return AlertDialog(
                                                        alignment: Alignment.center,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30.0),
                                                        ),
                                                        scrollable: false,
                                                        insetPadding: EdgeInsets.zero,
                                                        contentPadding: EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                                        titlePadding: EdgeInsets.only(top: 5,bottom: 5),
                                                        backgroundColor: Colors.white70,
                                                        title: Text(
                                                          "ADMIN",
                                                          style: TextStyle(
                                                              color: Colors.black.withOpacity(0.7)
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        content: SingleChildScrollView(
                                                          physics: NeverScrollableScrollPhysics(),
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width*0.85,
                                                            padding: EdgeInsets.all(20),
                                                            decoration: BoxDecoration(
                                                              color: Colors.white70,
                                                              borderRadius: BorderRadius.circular(30.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Row(
                                                                  children: [

                                                                    Flexible(
                                                                      child: Align(
                                                                          alignment: Alignment.centerRight,
                                                                          child: Text(
                                                                              "Name : "
                                                                          )
                                                                      ),
                                                                    ),

                                                                    Flexible(
                                                                      flex: 2,
                                                                      child: Center(
                                                                        child: TextField(

                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),

                                                                SizedBox(
                                                                  height: 10,
                                                                ),

                                                                Row(
                                                                  children: [

                                                                    Flexible(
                                                                      child: Align(
                                                                          alignment: Alignment.centerRight,
                                                                          child: Text(
                                                                              "Email : "
                                                                          )
                                                                      ),
                                                                    ),

                                                                    Flexible(
                                                                      flex: 2,
                                                                      child: Center(
                                                                        child: TextField(

                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),

                                                                SizedBox(
                                                                  height: 10,
                                                                ),

                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(15),
                                                                      border: Border.all(
                                                                          width: 1,
                                                                          color: Colors.black.withOpacity(0.5)
                                                                      )
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Text("Org Name"),

                                                                      Checkbox(
                                                                          value: false,
                                                                          onChanged: (value){

                                                                          }
                                                                      )

                                                                    ],
                                                                  ),
                                                                ),

                                                                SizedBox(
                                                                  height: 10,
                                                                ),

                                                                Container(
                                                                  height: /*MediaQuery.of(context).size.height*0.6,*/((48.4*branch.length)>MediaQuery.of(context).size.height*0.6)?MediaQuery.of(context).size.height*0.6:(48.4*branch.length),/*48.4*5,*/
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(15),
                                                                      border: Border.all(
                                                                          width: 1,
                                                                          color: Colors.black.withOpacity(0.5)
                                                                      )
                                                                  ),
                                                                  child: ListView.builder(
                                                                    shrinkWrap: true,
                                                                    // physics: NeverScrollableScrollPhysics(),
                                                                    itemCount: branch.length,
                                                                    itemBuilder: (BuildContext context, int index) {
                                                                      return GestureDetector(
                                                                        onTap: (){
                                                                          print(MediaQuery.of(context).size.height*0.6);
                                                                          print(47.5*branch.length);
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(branch[index]),

                                                                            Checkbox(
                                                                                value: false,
                                                                                onChanged: (value){

                                                                                }
                                                                            )
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                )

                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        // actions: [
                                                        //   Text("SUBMIT")
                                                        // ],

                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            });

                                          },
                                          child: Text("Admin"),
                                        style: ButtonStyle(
                                          textStyle: MaterialStateProperty.all( TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14
                                          )
                                          ),
                                          animationDuration: Duration(milliseconds: 0),
                                          foregroundColor: MaterialStateProperty.resolveWith((states){
                                            if(states.contains(MaterialState.pressed)){
                                              return Colors.white;
                                            }
                                            return Color(0xff467695);
                                          }),
                                          backgroundColor:  MaterialStateProperty.resolveWith((states){
                                            if(states.contains(MaterialState.pressed)){
                                              return Color(0xff19547b);
                                            }
                                            return Colors.white;/*Color(0xffF1F1F1);*///0xffE2E2E2
                                          }),
                                          // MaterialStateProperty.all(Color(0xffD3D3D3)),
                                          // /*backgroundColor: MaterialStateProperty.all(Colors.white),
                                          // overlayColor:MaterialStateProperty.resolveWith((states){
                                          //   if(states.contains(MaterialState.pressed)){
                                          //     return Color(0xff19547b);
                                          //   }
                                          //   return Colors.white;
                                          // }),*/
                                          overlayColor:MaterialStateProperty.all(Colors.transparent),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.5),))
                                        ),
                                      ),

                                      ElevatedButton(
                                          onPressed: (){

                                            selectedDesignation=null;
                                            selectedlevel=null;

                                            Navigator.pop(context);

                                            WidgetsBinding.instance?.addPostFrameCallback((_){
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext context, void Function(void Function()) setState) {
                                                      return AlertDialog(
                                                        alignment: Alignment.center,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30.0),
                                                        ),
                                                        scrollable: false,
                                                        insetPadding: EdgeInsets.zero,
                                                        actionsPadding: EdgeInsets.zero,
                                                        contentPadding: EdgeInsets.only(left: 5,right: 5),
                                                        titlePadding: EdgeInsets.only(top: 7.5,bottom: 7.5),
                                                        backgroundColor: Colors.white70,
                                                        title: Text(
                                                          "TECHNICAL",
                                                          style: TextStyle(
                                                              color: Colors.black.withOpacity(0.7)
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),

                                                        actions: [
                                                          Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [

                                                              TextButton(
                                                                  onPressed: (){

                                                                    Navigator.of(context).pop();

                                                                  },
                                                                  child: Text(
                                                                      "CANCEL",
                                                                    style: TextStyle(
                                                                      color: Color(0xff19547b)
                                                                    ),
                                                                  ),
                                                                style: ButtonStyle(
                                                                    shape: MaterialStateProperty.all(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(12.5),
                                                                        )
                                                                    ),
                                                                    backgroundColor: MaterialStateProperty.all(Colors.white)
                                                                ),
                                                              ),

                                                              TextButton(
                                                                  onPressed: (){
                                                                    print(_errorText=="");
                                                                  },
                                                                  child: Text(
                                                                    "SUBMIT",
                                                                    style: TextStyle(
                                                                        color: Color(0xff19547b)
                                                                    ),
                                                                  ),
                                                                style: ButtonStyle(
                                                                    shape: MaterialStateProperty.all(
                                                                        RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(12.5),
                                                                        )
                                                                    ),
                                                                  backgroundColor: MaterialStateProperty.all(_errorText==""?Colors.white:Colors.transparent)
                                                                ),
                                                              ),

                                                            ],
                                                          )
                                                        ],

                                                        content: Container(
                                                          width: MediaQuery.of(context).size.width*0.85,
                                                          padding: EdgeInsets.all(20),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius: BorderRadius.circular(30.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [

                                                              Row(
                                                                children: [

                                                                  Flexible(
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: Text(
                                                                            "Name : "
                                                                        ),
                                                                      )
                                                                  ),

                                                                  Flexible(
                                                                    flex: 2,
                                                                    child: Center(
                                                                      child: TextField(
                                                                        controller: firstName,
                                                                        cursorColor: Colors.white,
                                                                        decoration: InputDecoration(
                                                                          errorText: _errorText,
                                                                          errorBorder: UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors.black.withOpacity(0.35)
                                                                            ),
                                                                          ),
                                                                          focusedErrorBorder: UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors.black.withOpacity(0.5)
                                                                            ),
                                                                          ),
                                                                          errorStyle: TextStyle(
                                                                            color: Colors.blue,
                                                                          ),
                                                                          enabledBorder: UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors.black.withOpacity(0.35)
                                                                            ),
                                                                          ),
                                                                          focusedBorder: UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors.black.withOpacity(0.5)
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        onChanged: (_){
                                                                          setState((){});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              Row(
                                                                children: [

                                                                  Flexible(
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: Text(
                                                                            "Email : "
                                                                        ),
                                                                      )
                                                                  ),

                                                                  Flexible(
                                                                    flex: 2,
                                                                    child: Center(
                                                                      child: TextField(
                                                                        controller: eMail,
                                                                        cursorColor: Colors.white,
                                                                        decoration: InputDecoration(
                                                                          enabledBorder: UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors.black.withOpacity(0.35)
                                                                            ),
                                                                          ),
                                                                          focusedBorder: UnderlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                color: Colors.black.withOpacity(0.5)
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              Row(
                                                                children: [

                                                                  Flexible(
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: Text(
                                                                            "Designation : "
                                                                        ),
                                                                      )
                                                                  ),

                                                                  Flexible(
                                                                    flex: 2,
                                                                    child: Center(
                                                                      child: ButtonTheme(
                                                                        alignedDropdown: true,
                                                                        child: DropdownButton<String>(
                                                                          value: selectedDesignation,
                                                                          hint: Text("Select Designation"),
                                                                          isExpanded: true,
                                                                          isDense: false,
                                                                          borderRadius: BorderRadius.circular(12.5),
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              selectedDesignation = value;
                                                                            });
                                                                          },
                                                                          // selectedItemBuilder: ,
                                                                          items: designation.map((String items){
                                                                            return DropdownMenuItem<String>(
                                                                              value: items,
                                                                              alignment: AlignmentDirectional.centerStart,
                                                                              child: Text(items),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              Row(
                                                                children: [

                                                                  Flexible(
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: Text(
                                                                            "Level : "
                                                                        ),
                                                                      )
                                                                  ),

                                                                  Flexible(
                                                                    flex: 2,
                                                                    child: Center(
                                                                      child: ButtonTheme(
                                                                        alignedDropdown: true,
                                                                        child: DropdownButton<String>(
                                                                          value: selectedlevel,
                                                                          hint: Text("Select Users"),
                                                                          isExpanded: true,
                                                                          isDense: false,
                                                                          borderRadius: BorderRadius.circular(12.5),
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              selectedlevel = value;
                                                                            });
                                                                          },
                                                                          items: <String>[
                                                                            '1',
                                                                            '2',
                                                                            '3',
                                                                            '4',
                                                                            '5',
                                                                          ].map((String items){
                                                                            return DropdownMenuItem<String>(
                                                                              value: items,
                                                                              child: Text(items),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            });

                                          },
                                          child: Text("Technical"),
                                        style: ButtonStyle(
                                          textStyle: MaterialStateProperty.all( TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14
                                          )
                                          ),
                                          animationDuration: Duration(milliseconds: 0),
                                          foregroundColor: MaterialStateProperty.resolveWith((states){
                                            if(states.contains(MaterialState.pressed)){
                                              return Colors.white;
                                            }
                                            return Color(0xff467695);
                                          }),
                                          backgroundColor:  MaterialStateProperty.resolveWith((states){
                                            if(states.contains(MaterialState.pressed)){
                                              return Color(0xff19547b);
                                            }
                                            return Colors.white;/*Color(0xffF1F1F1);*///0xffE2E2E2
                                          }),
                                          // MaterialStateProperty.all(Color(0xffD3D3D3)),
                                          // /*backgroundColor: MaterialStateProperty.all(Colors.white),
                                          // overlayColor:MaterialStateProperty.resolveWith((states){
                                          //   if(states.contains(MaterialState.pressed)){
                                          //     return Color(0xff19547b);
                                          //   }
                                          //   return Colors.white;
                                          // }),*/
                                          overlayColor:MaterialStateProperty.all(Colors.transparent),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.5),))
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                            },
                            );

                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black.withOpacity(0.5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0,
                                        offset: Offset(2, 4),
                                        color: Colors.black12.withOpacity(0.15)), //3dright
                                  ]),
                              child: Row(
                                  children: [
                                    SizedBox(width: 3,),
                                    SizedBox(
                                      height: 30.5,
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Center(
                                      child: Text(
                                        'Users',
                                        style: TextStyle(
                                            fontFamily: 'fonts/Roboto-Light.ttf',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.white.withOpacity(0.75)),
                                      ),
                                    ),
                                    SizedBox(width: 7.5,),
                                  ]),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            print("User Group");

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {

                                    return AlertDialog(
                                      actionsAlignment: MainAxisAlignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      backgroundColor: Colors.white70,
                                      actionsOverflowButtonSpacing: 0,
                                      elevation: 5,
                                      scrollable: true,
                                      actionsPadding: EdgeInsets.only(top: 5,bottom: 10),
                                      titlePadding: EdgeInsets.only(top: 20),
                                      contentPadding: EdgeInsets.only(left: 24,right: 24,top: 20,bottom: 5),
                                      title: Text("Group",
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            GestureDetector(
                                                onTap:(){
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("CREATE")
                                            ),

                                            GestureDetector(
                                                onTap:(){
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("CANCEL")
                                            ),

                                          ],
                                        )
                                      ],
                                      content: Container(
                                        // height: 200,
                                        // width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // Text("GROUP"),

                                            // SizedBox(height: 17.5,),

                                            Container(
                                              // padding: EdgeInsets.symmetric(horizontal: 5),
                                              height: 47,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black.withOpacity(0.55))),
                                              child: TextField(
                                                cursorColor: Colors.white,
                                                autofocus: false,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                    hintText: "Name",
                                                    border: InputBorder.none,
                                                    labelStyle: TextStyle(
                                                        color: Colors.black.withOpacity(0.6))
                                                ),
                                              ),
                                            ),

                                            SizedBox(height: 9,),

                                            GestureDetector(
                                              onTap: (){},
                                              child: Container(
                                                width: MediaQuery.of(context).size.width*0.6,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(
                                                        color: Colors.black.withOpacity(0.55),
                                                        width: 1,
                                                        style: BorderStyle.solid
                                                    )
                                                ),
                                                child:Column(
                                                  children: [

                                                    Padding(
                                                      padding: const EdgeInsets.only(top:10,bottom: 10),
                                                      child: Text("USERS",
                                                        style: TextStyle(
                                                            color: Colors.black.withOpacity(0.75)),
                                                      ),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 5,bottom: 5),
                                                      child: Align(
                                                        alignment: Alignment.centerRight,
                                                        child: Icon(
                                                          Icons.add_box_outlined,
                                                          color: Colors.black.withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            )


                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );

                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black.withOpacity(0.5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0,
                                        offset: Offset(2, 4),
                                        color: Colors.black12.withOpacity(0.15)), //3dright
                                  ]),
                              child: Row(
                                  children: [
                                    SizedBox(width: 3,),
                                    SizedBox(
                                      height: 30.5,
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Center(
                                      child: Text(
                                        'Group',
                                        style: TextStyle(
                                            fontFamily: 'fonts/Roboto-Light.ttf',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.white.withOpacity(0.75)),
                                      ),
                                    ),
                                    SizedBox(width: 7.5,),
                                  ]),
                            ),
                          ),
                        ),

                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    )

      ],
    );
  }
}
