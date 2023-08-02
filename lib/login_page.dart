// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:student_support_app/components/mybutton.dart';
import 'package:student_support_app/home_page.dart';
import 'colors.dart' as color;
import 'components/textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';


class LoginAlbum {
  final String username;
  final String token;

  const LoginAlbum({
    required this.username,
    required this.token,
  });

  factory LoginAlbum.fromJson(Map<String, dynamic> field) {
    return LoginAlbum(
      username: field['username'],
      token: field['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['token'] = token;
    return data;
  }
}

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController userEmailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController loadingcontroller = TextEditingController();

  void signUserIn(BuildContext context) {
    // Navigate to HomePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Future<int> validateUser(String userEmail, String password,) async {
    try {
      final ioc =  HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http =  IOClient(ioc);
      final response = await http.post(
        Uri.parse('https://192.168.210.45:7125/api/User/Login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "userEmail": "PS@yahoo", "password": "nope"
        }),
      );

      if(response.statusCode==200){
        //To Match THe JsonLike "reply" values to each other
        //To turn the matched values into objects
        LoginAlbum loginAlbum = LoginAlbum.fromJson(json.decode(response.body));

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', loginAlbum.token);
        sharedPreferences.setString('username', loginAlbum.username);
        print(loginAlbum.token);
      }

      return response.statusCode;

    }on SocketException{
      //There is no route to server
      return 113;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.AppColor.homePageBackground,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Icon(
                  Icons.support_agent,
                  size: 100,
                  color: Colors.blueGrey.shade900,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome back buddy',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey.shade400),
                ),
                SizedBox(
                  height: 30,
                ),
                //USERNAME FIELD
                UserTextField(
                  controller: userEmailcontroller,
                  hintText: 'UserEmail',
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                //PASSWORD FIELD
                UserTextField(
                  controller: passwordcontroller,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                //SUBMIT BUTTON WITH PERFORMNING AUTH AND REDIRECTING TO HOMEPAGE
                MyButton(
                    onTap: () async  {
                      setState(() {
                        loadingcontroller.text = "Loading...";
                      });
                      signUserIn(context);
                     // int futureCode = await validateUser(userEmailcontroller.text, passwordcontroller.text);
                      // setState(() {
                      //   if (futureCode == 200) {
                      //     //If User is Found
                      //     setState(() {
                      //       signUserIn(context);
                      //       loadingcontroller.text = "";
                      //     });
                      //   }else if(futureCode==400){
                      //     //If User is not found
                      //     setState(() {
                      //       loadingcontroller.text="Wrong Email or Password";
                      //     });
                      //   }else {
                      //     //If there was a network problem
                      //     setState(() {
                      //       loadingcontroller.text="Could Not Connect to Server";
                      //     });
                      //   }
                      // });
                    }
                ),
                TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: false,
                    controller: loadingcontroller,
                    enabled: false,
                    readOnly:true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xff0d1b1c),
                    )
                ),
                SizedBox(
                  height: 30,
                ),
                // MyButton(
                //     onTap: () async {
                //       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                //       var taken= sharedPreferences.get('token');
                //       print(taken);
                //     }
                // ),
                // MyButton(
                //     onTap: () async {
                //       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                //       sharedPreferences.remove('token');
                //       print("Token Deleted");
                //     }
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
