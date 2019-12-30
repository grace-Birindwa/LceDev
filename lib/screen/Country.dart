import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          padding: EdgeInsets.all(10),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              FlipCard(
                direction: FlipDirection.VERTICAL,
                  front: CountryCard(title: 'Capital',),
                  back: CountryDetailCard(title: name['capital'],)),
              FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: CountryCard(title: 'Population',),
                  back: CountryDetailCard(title: name['population'].toString(),)),
              FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: CountryCard(title: 'Flag',),
                  back: Card(
                    elevation: 10,
                    child: Center(
                      child: SvgPicture.network(name['flag'],width: 200,),
                    ),
                  )),
              FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: CountryCard(title: 'Currency',),
                  back: CountryDetailCard(title: name['currencies'][0]['name'],)),
             CountryCard(title: 'Show Map',)
            ],
          ),
        ),
        );
    
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  const CountryDetailCard({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 10,
                child: Center(
    child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center( child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),)
      );
  }
}