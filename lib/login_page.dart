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


bool hasToken = false;

void checkForToken() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.get('token');
  if(!(token == null)){
    hasToken =true;
  }
}

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
   LoginPage({super.key}){
     checkForToken();
   }
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
      HttpClient client = HttpClient();
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

      String url = 'https://192.168.198.45:7125/api/User/Login';

      Map map = {
        "userEmail": "PS@yahoo",
        "password": "nope"
      };

      HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(map)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();

      print(reply);

      if(response.statusCode==200){
        //To Match THe JsonLike "reply" values to each other
        Map<String, dynamic> valueMap = json.decode(reply);
        //To turn the matched values into objects
        LoginAlbum loginAlbum = LoginAlbum.fromJson(valueMap);

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', loginAlbum.token);
        print(loginAlbum.token);
      }
      client.close();
      return response.statusCode;

    }on SocketException{
      //There is no route to server
      return 113;
    }
  }


  @override
  Widget build(BuildContext context) {
    if(hasToken == true){
      setState(() {
        signUserIn(context);
      });
    }
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
                        int futureCode = await validateUser(userEmailcontroller.text, passwordcontroller.text);
                      setState(() {
                        signUserIn(context);
                        loadingcontroller.text = "";
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



}
