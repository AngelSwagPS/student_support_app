// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../colors.dart' as color;

class TipsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String tips;

  const TipsCard(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.imageUrl,
        required this.tips
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open the detailed article page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TipsDetailsPage(
              title: title,
              imageUrl: imageUrl,
              tips: tips,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 170, // Specify the desired height for the card
        child: Card(
          color: color.AppColor.cardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Tips title
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'SFProRegular',
                          color: color.AppColor.fontColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      //Tips subtitle
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: color.AppColor.supportingText,
                          fontFamily: "Inter",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 120,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//DETAILS PAGE
class TipsDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String tips;

  const TipsDetailsPage(
      {super.key,
        required this.title,
        required this.imageUrl,
        required this.tips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: color.AppColor.cardColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color.AppColor.fontColor,
                      fontFamily: "Inter",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Published: July 3, 2023',
                    style: TextStyle(
                        color: color.AppColor.supportingText, fontSize: 14),
                  ),
                  SizedBox(height: 30),
                  Text(
                    tips,
                    style: TextStyle(
                        color: color.AppColor.fontColor,
                        fontSize: 16,
                        fontFamily: 'SFProLight'),
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