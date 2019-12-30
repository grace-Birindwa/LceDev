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
  List lcountries = [];
  // creation of other list for filtering countries

  List filtercountries = [];
  bool isSearching = false;
  getcountries() async {
     response = await Dio().get('https://restcountries.eu/rest/v2/all');
     return response.data;
  }
  @override
  void initState() {
    getcountries().then((data){
      setState(() {
       lcountries = filtercountries = data; 
      });
    });
    
    super.initState();
  }

  void _filterCountries(value){
    setState(() {
     filtercountries = 
    lcountries.where((Country) => Country['name'].toLowerCase().contains(value.toLowerCase())).toList(); 
    });
  }
  @override

  Widget build(BuildContext context) {
  
    return Container(
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.pink,
           title: !isSearching ? Text("All contries") : 
           TextField(
             onChanged: (value){
               _filterCountries(value);
             },
             style: TextStyle(color: Colors.white),
             decoration:InputDecoration(
               icon: Icon(Icons.search,color: Colors.white),
               hintText: 'Search Country',
               hintStyle: TextStyle(color: Colors.white)
               ),),
           actions: <Widget>[
             isSearching ?
             IconButton(
                 icon: Icon(Icons.cancel,color: Colors.white), onPressed: (){
                   setState(() {
                     this.isSearching = false;
                     filtercountries = lcountries;
                   });
                 }) :
                  IconButton(
                 icon: Icon(Icons.search,color: Colors.white), onPressed: (){
                   setState(() {
                     this.isSearching = true;
                   });
                 })
           ],
         ),
         body: Container(
           padding: EdgeInsets.all(10),
           // we create a listview with children cause it could holp more than one widgets
           
           // integrate future build in our project
            child: filtercountries.length > 0 ? ListView.builder(
              itemCount: lcountries.length,
              itemBuilder: (BuildContext context,int index){
                    return  GestureDetector(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Country(filtercountries[index])
                   ));
                 },
              child: Card(
             elevation: 10,
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
               child: Text(filtercountries[index]['name']),
             ),
           ),
               );
                  }): Center(
                    child :CircularProgressIndicator()), 
         )
       )
    );
  
  }
}