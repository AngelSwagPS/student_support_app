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
import '../constants/api_consts.dart';


class LoginAlbum {
  final String username;
  final String studentId;
  final String userEmail;
  final String token;
  final String year;
  final String classCode;
  final String isAdmin;

  const LoginAlbum({
    required this.username,
    required this.token,
    required this.userEmail,
    required this.studentId,
    required this.year,
    required this.classCode,
    required this.isAdmin,
  });

  factory LoginAlbum.fromJson(Map<String, dynamic> field) {
    return LoginAlbum(
      username: field['username'],
        userEmail: field['userEmail'],
        studentId: field['studentId'],
      token: field['token'],
      year: field['year'],
      classCode: field['classCode'],
      isAdmin: field['isAdmin']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['token'] = token;
    data['classCode'] = classCode;
    data['isAdmin'] = isAdmin;
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
      //validation
      if(userEmail ==""){
        return 616;
      }else if (password == ""){
        return 700;
      }else{

      }


      final ioc =  HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http =  IOClient(ioc);
      final response = await http.post(
        Uri.parse('$SERVER_URL/User/Login'),
        //'https://192.168.210.45:7125/api/User/Login'
        headers: <String, String>{
          'Content-Type': /*What*/ 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "userEmail": userEmail.trim(), "password": password.trim()
          // "userEmail": "PS@yahoo", "password": "nope"
        }),
      );

      if(response.statusCode==200){
        //To Match THe JsonLike "reply" values to each other
        //To turn the matched values into objects
        LoginAlbum loginAlbum = LoginAlbum.fromJson(json.decode(response.body));

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', loginAlbum.token);
        sharedPreferences.setString('username', loginAlbum.username);
        sharedPreferences.setString('classCode',loginAlbum.classCode);
        sharedPreferences.setString('year',loginAlbum.year);
        sharedPreferences.setString('isAdmin', loginAlbum.isAdmin);
        sharedPreferences.setString('userEmail', loginAlbum.userEmail);
        sharedPreferences.setString('studentId', loginAlbum.studentId);
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
                //SUBMIT BUTTON WITH PERFORMING AUTH AND REDIRECTING TO HOMEPAGE
                MyButton(
                    onTap: () async  {
                      setState(() {
                        loadingcontroller.text = "Loading...";
                      });
                      //signUserIn(context);
                     int futureCode = await validateUser(userEmailcontroller.text, passwordcontroller.text);
                      setState(() {
                        if(futureCode == 616){
                          setState(() {
                            loadingcontroller.text = "Please enter User Email";
                          });
                        }else if(futureCode == 700){
                          setState(() {
                            loadingcontroller.text = "Please enter Password";
                          });
                        } else if (futureCode == 200) {
                          //If User is Found
                          setState(() {
                            signUserIn(context);
                            loadingcontroller.text = "";
                          });
                        }else if(futureCode==400){
                          //If User is not found
                          setState(() {
                            loadingcontroller.text="Wrong Email or Password";
                          });
                        }else {
                          //If there was a network problem
                          setState(() {
                            loadingcontroller.text="Could Not Connect to Server";
                          });
                        }
                      });
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
