// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart'; // Import the package
import 'package:student_support_app/tabs/news_tab.dart';
import 'colors.dart' as color;

class NewsTipsPage extends StatefulWidget {
  const NewsTipsPage({Key? key}) : super(key: key);

  @override
  State<NewsTipsPage> createState() => _NewsTipsPageState();
}

class _NewsTipsPageState extends State<NewsTipsPage> {
  int _pageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Column(
          children: [
            FlutterToggleTab(
              unSelectedBackgroundColors: [color.AppColor.cardColor],
              // Use the FlutterToggleTab widget
              width: 90,
              marginSelected: EdgeInsets.all(5),
              borderRadius: 10,
              height: 60,
              selectedIndex: _pageIndex,
              selectedBackgroundColors: [color.AppColor.homePageBackground],
              selectedTextStyle: TextStyle(
                  fontFamily: 'SFProRegular',
                  color: color.AppColor.fontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              unSelectedTextStyle: TextStyle(
                fontFamily: 'SFProRegular',
                color: color.AppColor.fontColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              labels: ['News', 'Tips'],
              selectedLabelIndex: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              isScroll: false,
            ),
            Expanded(
              child: IndexedStack(
                index: _pageIndex,
                children: [
                  // NEWS PAGE
                  NewsTab(),
                  // TIPS PAGE
                  Container(
                    child: Column(
                      children: [
                        Text('Welcome to the tips page.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
