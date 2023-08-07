// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:student_support_app/main_page.dart';
import 'package:student_support_app/profile_page.dart';
import 'books_page.dart';
import 'class.dart';
import 'colors.dart' as color;
import 'news_tips_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentPageIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/profile': (context) => const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: color.AppColor.cardColor,
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: Colors.blueAccent,
                  ),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(
                    Icons.book,
                    color: Colors.blueAccent,
                  ),
                  label: "Books"),
              NavigationDestination(
                  icon: Icon(
                    Icons.newspaper,
                    color: Colors.blueAccent,
                  ),
                  label: "Info"),
              NavigationDestination(
                  icon: Icon(
                    Icons.support_agent,
                    color: Colors.blueAccent,
                  ),
                  label: "ChatGPT"),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_2,
                    color: Colors.blueAccent,
                  ),
                  label: "Profile"),
            ],
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
          backgroundColor: color.AppColor.homePageBackground,
          body: <Widget>[
            MainPage(),
            //SECOND WIDGET & PAGE
            BooksPage(),
            NewsTipsPage(),
            AIChatPage(),
            ProfilePage(),
          ][currentPageIndex]),
    );
  }
}
