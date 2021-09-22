import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  List<String> items = ["temp1","temp2","temp3"];
  List<bool> buy = [false,false,false];
  String iteminput = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Shopping Done :: '
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              '${jobDone}'
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              child: ListView.builder(
                //reverse: true,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    final item = items[index];
                    return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction){
                          setState(() {
                            if(buy[index] == true) jobDone --;
                            items.removeAt(index);
                            buy.removeAt(index);
                          });
                        },
                        background: Container(color: Colors.blueGrey,),
                        child: ListTile(
                          title: Text(
                            item,
                          ),
                          tileColor: buy[index]? Colors.green.shade300: Colors.redAccent.shade100,
                          onTap: (){
                            setState(() {
                              if(buy[index]){
                                buy[index] = false;
                                jobDone--;
                              }
                              else{
                                buy[index] = true;
                                jobDone ++;
                              }
                            });
                          },
                        ));
                  }
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.black87,
            child: Column(
              children: [
                TextButton(
                    onPressed: (){
                      setState(() {
                        items.add(iteminput);
                        buy.add(false);
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
                    onChanged: (input){
                      iteminput = input;
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

