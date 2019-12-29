import 'package:debugapp/screen/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  // Home({Key key}) : super(key: key);
  @override
  _AllCountriesState createState() => _AllCountriesState();


 
  
}

class _AllCountriesState extends State<AllCountries> {
  var response;
  Future<List> lcountries;
 Future<List> getcountries() async {
     response = await Dio().get('https://restcountries.eu/rest/v2/all');
     return response.data;
  }
  @override
  void initState() {
    lcountries = getcountries();
    
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
  
    return Container(
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.pink,
           title: Text("All contries"),
         ),
         body: Container(
           padding: EdgeInsets.all(10),
           // we create a listview with children cause it could holp more than one widgets
           
           // integrate future build in our project
            child: FutureBuilder<List>(
              future: lcountries,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot ){
                if(snapshot.hasData){
                  
                  return ListView.builder(itemBuilder: (BuildContext context,int index){
                    return  GestureDetector(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Country('DRCongo')
                   ));
                 },
              child: Card(
             elevation: 10,
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
               child: Text(snapshot.data[index]['name']),
             ),
           ),
               );
                  });
                }
                return null;
              },)
         )
       )
    );
  
  }
}