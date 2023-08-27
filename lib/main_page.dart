// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support_app/constants/api_consts.dart';
import 'colors.dart' as color;
import 'profile_page.dart';

class Class{
  final String timeDuration;
  final String nameCode;
  final String location;
  final double actualTime;

  const Class({
    required this.timeDuration,
    required this.nameCode,
    required this.location,
    required this.actualTime,
  });

  factory Class.fromJson(Map<String, dynamic> field) {
    return Class(
      timeDuration: field['timeDuration'],
      nameCode: field['nameCode'],
      location: field['location'],
      actualTime: field['actualTime'],
    );
  }
}

//Notifications in App == Messages on API
class Notification{
  final String title;
  final int icon;
  final String text;

  const Notification({
    required this.title,
    required this.icon,
    required this.text,
  });

  factory Notification.fromJson(Map<String, dynamic> field) {
    return Notification(
      title: field['title'],
      icon: field['icon'],
      text: field['text'],
    );

  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Notification>> futureNotifications;
  late Future<String?> studentName;

  @override
  void initState()  {
    super.initState();

    futureNotifications = getNotifications();
    studentName = getStudentName();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/profile': (context) => const ProfilePage(),
      },
      home: Container(
        padding:
        const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //User welcome
                      FutureBuilder<String?>(
                        future: studentName,
                        builder: ((context, snapshot){
                          if(snapshot.hasData){
                            return Text(
                              "Hi ${snapshot.data},",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'SFProLight',
                                  fontSize: 20,
                                  color: color.AppColor.fontColor),
                            );
                          }else if(snapshot.hasError){
                            //WHat happens when error
                            return Text(
                              "Hi There,",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'SFProLight',
                                  fontSize: 20,
                                  color: color.AppColor.fontColor),
                            );
                          }
                          //What happens while loading
                          return Text(
                            "Hello",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'SFProLight',
                                fontSize: 30,
                                color: color.AppColor.fontColor),
                          );
                        }),

                      ),
                      Row(
                        children: [
                          Text(
                            "Welcome back 👋",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'SFProRegular',
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: color.AppColor.fontColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Container(
                      width: 59,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle, // set the shape to circle
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            50), // set the border radius to half of the container size
                        child: Image.asset(
                          'assets/images/profileImage.jpg',
                          fit: BoxFit
                              .cover, // scale the image to cover the container
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              //NEXT CLASS DISPLAYED HERE
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Transform.scale(
                          scale: 1.05,
                          child: Image.asset(
                            'assets/images/ClassroomPic.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Next class (11:00 AM - 13:00 PM)",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'SFProRegular',
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "CSM 456 - Info Tech",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'SFProRegular',
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "FF5",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'SFProRegular',
                                        color: Colors.white,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ))
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTIFICATION
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notifications",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'SFProRegular',
                            fontSize: 24,
                            color: color.AppColor.fontColor),
                      ),

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              color.AppColor.cardColor),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ]
                  ),

                    Column(
                      children: [
                        SizedBox(
                            height: 350,
                            child:
                            FutureBuilder<List<Notification>>(
                              future: futureNotifications,
                              builder: ((context, snapshot){
                                if(snapshot.hasData){
                                  return ListView.separated(
                                      itemBuilder: (context,index){
                                        Notification? notification = snapshot.data?[index];

                                        return ListTile(
                                          tileColor: color.AppColor.cardColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          leading: getIcon(notification!.icon),
                                          title: Text(notification.text,
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 17,
                                                fontFamily: 'SFProLight',
                                                color: color.AppColor.fontColor),),
                                        );
                                      },
                                      separatorBuilder: ((context, index){
                                        return  Divider(color: color.AppColor.cardColor);
                                      }),
                                      itemCount: snapshot.data!.length);
                                }else if(snapshot.hasError){
                                  return Text('Error: ${snapshot.error}',
                                              style: TextStyle(color: Colors.white, fontSize: 25)
                                            );
                                }
                                return CircularProgressIndicator();
                              }),

                            )
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon getIcon(int icon){
    if(icon ==0){
      return Icon(Icons.now_widgets, color: Colors.blueAccent,);
    }else if(icon ==1){
      return Icon(Icons.not_interested, color: Colors.red,);
    }else if(icon ==2){
      return Icon(Icons.notifications_active, color: Colors.yellow,);
    }else{
      return Icon(Icons.not_accessible, color: Colors.deepPurple,);
    }
  }

  Future<List<Notification>> getNotifications() async {

    String? token = await getToken();

    final ioc =  HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http =  IOClient(ioc);
    final response = await http.get(
        Uri.parse('$SERVER_URL/User/$token'));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);

      final List<Notification> list = [];

      for(var i =0 ; i < data.length; i++){
        final entry = data[i];
        list.add(Notification.fromJson(entry));
      }
      print("Got the stuff");
      return list;
    }else{
      throw Exception("Http failed");
    }
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token =  sharedPreferences.getString('token');
    print(token);
    print("Past");
    return token;
  }

  Future<String?> getStudentName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? name =  sharedPreferences.getString('username');
    print(name);
    print("GOt Name");
    return name;
  }

}
