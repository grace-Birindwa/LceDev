import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    String name = "grace";
    return MaterialApp(
      home: Home(),
    );
}
}


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Text('My debugApp'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("click"),
            onPressed: ()
            {
              print('you clik button');
            },
          ),
        ),
      ) ,
    );
  }
}

