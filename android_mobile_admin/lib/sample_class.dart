import 'package:flutter/material.dart';

enum WidgetMarker{list,stepper,adder}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WidgetMarker selectedWidgetMarker = WidgetMarker.list;

  int selectedIndex = 0;

  int currentStep = 0;

  final firstName =TextEditingController();
  final lastName =TextEditingController();
  final addFirstName = TextEditingController();
  final addLastname =TextEditingController();

  List<Map<String, dynamic>> ticket = [
    {"firstName": "aaaaaaa", "lastName": "111111"},
    {"firstName": "1111111", "lastName": "aaaaaaa"}
  ];

  @override
  Widget build(BuildContext context) {

    firstName.text = ticket[selectedIndex]["firstName"];
    lastName.text = ticket[selectedIndex]["lastName"];

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

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  selectedWidgetMarker = WidgetMarker.adder;
                });
              },
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: Center(
          child: getCustomContainer()
      ),
    );
  }

  List<Step> getAddSteps(){
    return [
      Step(
          isActive: currentStep >=0,
          title: Text("0"),
          content: Container(
            height: MediaQuery.of(context).size.height-290,
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: TextField(
              controller: addFirstName,
              /*decoration: InputDecoration(
          labelText: ticket["firstName"]
          ),*/
              onSubmitted: (value){
                addFirstName.text=value;
                /*setState(() {
    ticket[selectedIndex]["firstName"]=value;
    });*/
              },
            ),
          )
      ),
      Step(
          isActive: currentStep >=1,
          title: Text("U"),
          content: Container(
            height: MediaQuery.of(context).size.height-290,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: TextField(
              controller: addLastname,
              /*decoration: InputDecoration(
    labelText: ticket["lastName"]
    ),*/
              onSubmitted: (value){
                addLastname.text=value;
                /*setState(() {
    ticket[selectedIndex]["lastName"]=value;
    });*/
              },
            ),
          )
      ),
      Step(
          isActive: currentStep >=2,
          title: Text("P"),
          content: Container(
            height: MediaQuery.of(context).size.height-290,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("FirstName :"),
                    Text(addFirstName.text)
                  ],
                ),
                Row(
                  children: [
                    Text("LastName :"),
                    Text(addLastname.text)
                  ],
                )
              ],
            ),
          )
      )
    ];
  }

  Widget getAdder(){
    return Stepper(
      type: StepperType.horizontal,
      currentStep: currentStep,
      steps: getAddSteps(),
      onStepContinue: (){
        if(currentStep==getSteps().length-1){
          setState(() {
            ticket.add({"firstName":addFirstName.text,"lastName":addLastname.text});
          });
          setState(() {
            selectedWidgetMarker=WidgetMarker.list;
            currentStep = 0;
          });
          /*ticket[selectedIndex]["firstName"]= firstName.text;
        ticket[selectedIndex]["lastName"]= lastName.text;*/
          addFirstName.clear();
          addLastname.clear();
          print("Complete");
          print(ticket);
        }
        else{
          setState(() {
            currentStep++;
          });
        }
      },
      onStepCancel: (){
        if(currentStep!=0){
          setState(() {
            currentStep--;
          });
        }
      },
    );
  }

  List<Step> getSteps(){
    return [
      Step(
          isActive: currentStep >=0,
          title: Text("0"),
          content: Container(
            height: MediaQuery.of(context).size.height-290,
            width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: TextField(
              controller: firstName,
              /*decoration: InputDecoration(
          labelText: ticket["firstName"]
          ),*/
              onSubmitted: (value){
                setState(() {
                  ticket[selectedIndex]["firstName"]=value;
                });
              },
            ),
          )
      ),
      Step(
          isActive: currentStep >=1,
          title: Text("U"),
          content: Container(
            height: MediaQuery.of(context).size.height-290,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: TextField(
              controller: lastName,
              /*decoration: InputDecoration(
    labelText: ticket["lastName"]
    ),*/
              onSubmitted: (value){
                setState(() {
                  ticket[selectedIndex]["lastName"]=value;
                });
              },
            ),
          )
      ),
      Step(
          isActive: currentStep >=2,
          title: Text("P"),
          content: Container(
            height: MediaQuery.of(context).size.height-290,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("FirstName :"),
                    Text(firstName.text)
                  ],
                ),
                Row(
                  children: [
                    Text("LastName :"),
                    Text(lastName.text)
                  ],
                )
              ],
            ),
          )
      )
    ];
  }

  Widget getStepper(){
    return Stepper(
      steps: getSteps(),
      type: StepperType.horizontal,
      currentStep: currentStep,
      /*onStepTapped: (index){
      setState(() {
        currentStep = index;
      });
    },*/
      onStepContinue: (){
        if(currentStep==getSteps().length-1){
          /*setState(() {
    ticket.add({"firstName":firstName.text,"lastName":lastName.text});
    });*/
          setState(() {
            selectedWidgetMarker=WidgetMarker.list;
            currentStep = 0;
          });
          ticket[selectedIndex]["firstName"]= firstName.text;
          ticket[selectedIndex]["lastName"]= lastName.text;
          /*firstName.clear();
    lastName.clear();*/
          print("Complete");
          print(ticket);
        }
        else{
          setState(() {
            currentStep++;
          });
        }
      },
      onStepCancel: (){
        if(currentStep!=0){
          setState(() {
            currentStep--;
          });
        }
      },
    );
  }

  Widget getList(){
    return Container(
      child: ListView.builder(
        itemCount: ticket.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
                selectedWidgetMarker = WidgetMarker.stepper;
              });
              print(selectedIndex);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green.withOpacity(0.4),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                            "First : ${ticket[index]["firstName"]}")
                    ),
                    Expanded(
                        child: Text(
                            "Last : ${ticket[index]["lastName"]}")
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}