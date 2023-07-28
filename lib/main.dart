// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support_app/login_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Support App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

/*       home: const HomePage()*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MaterialPageRoute nextLocation  = MaterialPageRoute(builder: (context) => LoginPage());

  @override
  void initState() {

    super.initState();
      hasToken().then((result){
        nextLocation = findNextLocation(result);
      });

    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,nextLocation)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }

  MaterialPageRoute findNextLocation(bool hasToken) {
    if(hasToken == true){
      print("Token found");
      return MaterialPageRoute(builder: (context) => HomePage());
    }else{
      print("Token not found");
      return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }

  Future<bool> hasToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get('token');
    print(token);
    print("Looked for token");

    if(!(token == null)){
      return  true;
    }else{
      return false;
    }
  }
}

