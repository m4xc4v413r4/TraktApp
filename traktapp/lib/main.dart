import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
    // TODO: implement initState
    super.initState();
    movies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: Container(),
    );
  }
}

movies() async {
  final response =
      await http.get("https://api.trakt.tv/movies/popular", headers: {
    'Content-Type': 'application/json',
    'trakt-api-version': '2',
    'trakt-api-key':
        'da986893dbeb57da52760478c82af518b31d62425053c565845acc550f6430bf'
  });
  var json = jsonDecode(response.body);
  return json;
}
