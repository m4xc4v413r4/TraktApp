import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'film.dart';


void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
  super.initState();
    filmlerCek();
  }
List<Film> filmler;
int c=0;
void filmlerCek() async{
  
 filmler = await movies();
 c=filmler.length;
 setState(() {
   
 });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: Container(
        child: ListView.builder(
          itemCount: c,
          itemBuilder: (context,index){
            if(filmler.length>0)
            {
              return ListTile(
                title: Text(filmler[index].title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                subtitle: Text(filmler[index].year.toString(),style: TextStyle(color: Colors.white,fontSize: 10,fontStyle: FontStyle.italic)),
              );
            }
            else
            {
              return Text('Loading...',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white));
            }
          },
        ),

      ),
    );
  }
}

movies() async {
  final response =
      await http.get("https://api.trakt.tv/movies/popular", headers: {
    'Content-Type': 'application/json',
    'trakt-api-version': '2',
    'trakt-api-key': 'da986893dbeb57da52760478c82af518b31d62425053c565845acc550f6430bf'
  });
  var json = Film.fromArray(jsonDecode(response.body));
  return json;
}
