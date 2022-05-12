import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<Map<String, dynamic>> users = [
  {
    "name" : "James",
    "designation" : "Trainee",
    "level" : 1,
    "starRating" : 8,
  },
  {
    "name" : "Robert",
    "designation" : "Software Engineer",
    "level" : 3,
    "starRating" : 2,
  },
  {
    "name" : "John",
    "designation" : "System Engineer",
    "level" : 2,
    "starRating" : 2,
  },
  {
    "name" : "Michael",
    "designation" : "Senior Software Engineer",
    "level" : 4,
    "starRating" : 0,
  },
  {
    "name" : "William",
    "designation" : "Senior System Engineer",
    "level" : 5,
    "starRating" : 6,
  },
  {
    "name" : "David",
    "designation" : "Software Tester",
    "level" : 1,
    "starRating" : 0,
  },
  {
    "name" : "Richard",
    "designation" : "Team Lead",
    "level" : 4,
    "starRating" : 7,
  },
  {
    "name" : "Joseph",
    "designation" : "Trainee",
    "level" : 0,
    "starRating" : 0,
  },
  {
    "name" : "Thomas",
    "designation" : "Software Engineer",
    "level" : 2,
    "starRating" : 9,
  },
  {
    "name" : "Charles",
    "designation" : "System Engineer",
    "level" : 3,
    "starRating" : 4,

  },
  {
    "name" : "Christopher",
    "designation" : "Senior Software Engineer",
    "level" : 4,
    "starRating" : 10,
  },
  {
    "name" : "Daniel",
    "designation" : "Senior System Engineer",
    "level" : 5,
    "starRating" : 7,
  },
  {
    "name" : "Matthew",
    "designation" : "Software Tester",
    "level" : 2,
    "starRating" : 3,
  },
  {
    "name" : "Anthony",
    "designation" : "Team Lead",
    "level" : 5,
    "starRating" : 5,
  },
  {
    "name" : "Mark",
    "designation" : "Trainee",
    "level" : 1,
    "starRating" : 8,
  },
  {
    "name" : "Donald",
    "designation" : "Software Engineer",
    "level" : 4,
    "starRating" : 9,
  },
  {
    "name" : "Steven",
    "designation" : "System Engineer",
    "level" : 2,
    "starRating" : 4,
  },
  {
    "name" : "Paul",
    "designation" : "Senior Software Engineer",
    "level" : 3,
    "starRating" : 7,
  },
  {
    "name" : "Andrew",
    "designation" : "Senior System Engineer",
    "level" : 3,
    "starRating" : 8,
  },
  {
    "name" : "Joshua",
    "designation" : "Software Tester",
    "level" : 3,
    "starRating" : 8,
  },
  {
    "name" : "Kenneth",
    "designation" : "Team Lead",
    "level" : 0,
    "starRating" : 1,
  },
  {
    "name" : "Kevin",
    "designation" : "Trainee",
    "level" : 0,
    "starRating" : 0,
  },
  {
    "name" : "Brian",
    "designation" : "Software Engineer",
    "level" : 2,
    "starRating" : 4,
  },
  {
    "name" : "George",
    "designation" : "System Engineer",
    "level" : 2,
    "starRating" : 6,
  },
  {
    "name" : "Edward",
    "designation" : "Senior Software Engineer",
    "level" : 2,
    "starRating" : 5,
  },
  {
    "name" : "Ronald",
    "designation" : "Senior System Engineer",
    "level" : 0,
    "starRating" : 2,
  },
];

List<String> branch =[
  "Branch 0",
  "Branch 1",
  "Branch 2",
  "Branch 3",
  "Branch 5",
];

class Users extends StatefulWidget {

  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => UsersState();
}

class UsersState extends State<Users> {

  List userBranch = [];

  bool _userWidth = false;
  bool _searchUser = false;

  List<Map<String, dynamic>> usersFilter = users;

  @override
  initState() {
    // at the beginning, all users are shown
    usersFilter = users;
    super.initState();
  }

  void _userSearch(String enteredKeyword){
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = users;
    }else {
      results = users
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      usersFilter = results;
    });

  }

  // List<Map<String, dynamic>> pass = users;

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

                      Flexible(
                        flex: 2,
                          child: Center(
                            child: Text(
                                "Name",
                            ),
                          )
                      ),

                      Flexible(
                          flex: 3,
                          child: Center(
                            child: Text(
                                "Designation"
                            ),
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
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: usersFilter.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
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
                  setState(() {
                    _userWidth=!_userWidth;
                    _searchUser=false;

                  });
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

                                            Navigator.pop(context);

                                            WidgetsBinding.instance?.addPostFrameCallback((_){
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
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
                                                      "TECHNICAL",
                                                      style: TextStyle(
                                                          color: Colors.black.withOpacity(0.7)
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
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
                                                                  child: DropdownButton<String>(
                                                                    hint: Text("Select Users"),
                                                                    isExpanded: true,
                                                                    isDense: false,
                                                                    onChanged: (value) {  },
                                                                    items: branch.map((String items){
                                                                      return DropdownMenuItem<String>(
                                                                        value: items,
                                                                        child: Text(items),
                                                                      );
                                                                    }).toList(),
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
                                                                  child: DropdownButton<String>(
                                                                    hint: Text("Select Users"),
                                                                    isExpanded: true,
                                                                    isDense: false,
                                                                    onChanged: (value) {  },
                                                                    items: branch.map((String items){
                                                                      return DropdownMenuItem<String>(
                                                                        value: items,
                                                                        child: Text(items),
                                                                      );
                                                                    }).toList(),
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
