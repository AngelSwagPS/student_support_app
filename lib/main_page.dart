// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart' as color;

class Class {
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
class Notification {
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
  List _days = [];
  late List<dynamic> mondayClasses = [];

  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/courses.json');
      final Map<String, dynamic> data = json.decode(response);

      if (data.containsKey("days")) {
        final Map<String, dynamic> daysData = data["days"];

        // Print the entire daysData map to the console

        mondayClasses = daysData['monday'];
        print(' Monday classes: $mondayClasses');

        // Print the number of items in the daysData map
        print('Number of items: ${daysData.length}');
      } else {
        print("No 'days' key found in JSON data.");
      }
    } catch (e) {
      print('Error reading JSON: $e');
    }
  }

  late Future<List<Notification>> futureNotifications;

  List<Message> messages = [];

  // Function to add a new message to the list
  void _addMessage(String text) {
    setState(() {
      messages.insert(0, Message(text: text, timestamp: DateTime.now()));
    });
  }

  // Function to remove expired messages older than 12 hours
  void _removeExpiredMessages() {
    final currentTime = DateTime.now();
    setState(() {
      messages.removeWhere((message) => message.timestamp
          .isBefore(currentTime.subtract(Duration(hours: 12))));
    });
  }

  void _showInputDialog(BuildContext context) {
    String newMessage = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.all(10),
          backgroundColor: color.AppColor.cardColor,
          title: Text(
            "Add a Message",
            style: TextStyle(
                color: color.AppColor.fontColor,
                fontFamily: 'SFProRegular',
                fontWeight: FontWeight.w300,
                fontSize: 18),
          ),
          content: TextField(
            style: TextStyle(
                color: color.AppColor.fontColor,
                fontFamily: 'SFProRegular',
                fontSize: 15),
            onChanged: (value) {
              newMessage = value;
            },
          ),
          actions: [
            ElevatedButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: 'SFProRegular',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'SFProRegular',
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {
                _addMessage(newMessage);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to display time in hours ago format
  String _getTimeAgo(DateTime time) {
    final hoursAgo = DateTime.now().difference(time).inHours;
    return hoursAgo == 1 ? "$hoursAgo hr ago" : "$hoursAgo hrs ago";
  }

  @override
  void initState() {
    super.initState();
    readJson();

    //futureNotifications = getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      Text(
                        "Hi Michael,",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'SFProLight',
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: color.AppColor.fontColor),
                      ),
                      Row(
                        children: [
                          Text(
                            "Welcome back 👋",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'SFProRegular',
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: color.AppColor.fontColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {},
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
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mondayClasses.length,
                      itemBuilder: ((context, index) {
                        final dynamic classData = mondayClasses[index];
                        print('This is the class data: $classData');
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 245,
                            width: 345,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [Colors.red, Colors.orange],
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 160, left: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mondayClasses[index]['courseCode'],
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Martian',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: color.AppColor.fontColor),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    mondayClasses[index]['venue'],
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Martian',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: color.AppColor.fontColor),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    mondayClasses[index]['time'],
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Martian',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: color.AppColor.fontColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTIFICATION
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'SFProRegular',
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: color.AppColor.fontColor),
                        ),
                        Expanded(child: Container()),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color?>(
                                color.AppColor.cardColor),
                          ),
                          onPressed: () {
                            _showInputDialog(context);
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: /* Column(
                        children: [
                          /* FutureBuilder<List<Notification>>(
                            //future: futureNotifications,
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              return CircularProgressIndicator();
                            }),
                          ) */
                        ],
                      ), */
                          Column(
                        children: messages.map((message) {
                          return Card(
                            color: color.AppColor.cardColor,
                            child: ListTile(
                              leading: Icon(
                                Icons.notifications_active_rounded,
                                size: 30,
                                color: Colors.blueAccent,
                              ),
                              title: Text(
                                message.text,
                                style: TextStyle(
                                    color: color.AppColor.fontColor,
                                    fontFamily: 'SFProRegular'),
                              ),
                              subtitle: Text(
                                _getTimeAgo(message.timestamp),
                                style: TextStyle(
                                    color: color.AppColor.supportingText,
                                    fontFamily: 'SFProRegular',
                                    fontSize: 12),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    /* ElevatedButton(
                        onPressed: () {
                          print('Monday classes: $mondayClasses');
                        },
                        child: Text('Load data')) */
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<List<Notification>> getNotifications() { Future<List<Notification>> you;
  //  return you;}
}

class Message {
  String text;
  DateTime timestamp;

  Message({required this.text, required this.timestamp});
}
