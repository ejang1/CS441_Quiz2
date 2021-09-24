import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import for dialog
import 'package:material_dialogs/material_dialogs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: myScaffold(),
    );
  }
}

class myScaffold extends StatefulWidget {
  const myScaffold({Key? key}) : super(key: key);

  @override
  _myScaffoldState createState() => _myScaffoldState();
}

class _myScaffoldState extends State<myScaffold> {
  int jobDone = 0;
  List<String> items = ["item 1", "item 2", "item 3"];
  List<bool> buy = [false, false, false];
  String iteminput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Shopping Done :: '),
            SizedBox(
              width: 30,
            ),
            Text('${jobDone}'),
          ],
        ),
      ),
      body: Column(
        // shopping list view and textinput
        // Must seperated by Column to prevent the textfield go out from screen
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Flexible height to strech the size of container when new item added
          Flexible(
            child: Container(
              //ListView from items[]
              child: ListView.builder(
                  //reverse: true,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Dismissible(
                        key: UniqueKey(),
                        //Delete specific item through swipe
                        onDismissed: (direction) {
                          setState(() {
                            //If deleted item was done, complete count go down
                            if (buy[index] == true) jobDone--;
                            items.removeAt(index);
                            buy.removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.blueGrey,
                        ),
                        child: ListTile(
                          title: Text(
                            item,
                          ),
                          //Green means shopped, Red mean not shopped
                          tileColor: buy[index]
                              ? Colors.green.shade300
                              : Colors.redAccent.shade100,
                          onTap: () {
                            setState(() {
                              if (buy[index]) {
                                buy[index] = false;
                                jobDone--;
                              } else {
                                buy[index] = true;
                                jobDone++;
                              }
                              //if all items are checked pop up animation effect
                              if (jobDone == items.length && jobDone != 0) {
                                Dialogs.materialDialog(
                                  color: Colors.white,
                                  msg: "You Complete Shopping!",
                                  title: "Congratulation",
                                  lottieBuilder: Lottie.asset(
                                    'assets/47543-congratulation.json',
                                    fit: BoxFit.contain,
                                  ),
                                  context: context,
                                );
                              }
                            });
                          },
                        ));
                  }),
            ),
          ),
          //container for textfield and button
          Container(
            height: 100,
            color: Colors.black87,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (iteminput != "") {
                        items.add(iteminput);
                        buy.add(false);
                        iteminput = "";
                      }
                    });
                  },
                  child: Text(
                    'Add ITEM!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (input) {
                      iteminput = input;
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
