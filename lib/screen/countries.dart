import 'package:flutter/material.dart';

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
      ),
    );
  }
}