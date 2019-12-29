import 'package:flutter/material.dart';

class Country extends StatelessWidget {

  final Map name;
  Country(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(name['name']),
        ),
        body: Container(
          child: Center(
            child: Text(name['name']),
          ),
          )
        );
    
  }
}