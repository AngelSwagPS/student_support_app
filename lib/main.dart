// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_support_app/login_page.dart';

/* import 'home_page.dart';
 */
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
      home: LoginPage(),
    );
  }
}
