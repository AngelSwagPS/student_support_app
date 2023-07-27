// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_support_app/login_page.dart';
import 'colors.dart' as color;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signUserOut(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.AppColor.homePageBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: color.AppColor.fontColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: color.AppColor.homePageBackground,
        padding: EdgeInsets.only(left: 15, right: 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //PROFILE IMAGE
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle, // set the shape to circle
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      100), // set the border radius to half of the container size
                  child: Image.asset(
                    'assets/images/profileImage.jpg',
                    fit: BoxFit.cover, // scale the image to cover the container
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'KOFI ADJEI',
              style: TextStyle(
                fontFamily: 'SFProMedium',
                fontSize: 30,
                color: color.AppColor.fontColor,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () => {},
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                      decoration: BoxDecoration(
                        color: color.AppColor.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Language",
                            style: TextStyle(
                              fontFamily: 'SFProRegular',
                              fontSize: 17,
                              color: color.AppColor.fontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => signUserOut(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                      decoration: BoxDecoration(
                        color: color.AppColor.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontFamily: 'SFProRegular',
                              fontSize: 17,
                              color: color.AppColor.fontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
