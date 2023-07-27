// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/article_card.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          //FIRST ARTICLE
          ArticleCard(
              title: "Unfortunate news hits KNUST campus",
              subtitle:
                  "Apologies for the confusion. Here's the updated code for the ArticleCard and ArticleDetailsPage classes, incorporating the changes to display all the passed information:",
              imageUrl:
                  "https://images.pexels.com/photos/6146978/pexels-photo-6146978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              date: "June 10, 2023",
              reads: 235),
          SizedBox(
            height: 10,
          ),
          //SECOND ARTICLE
          ArticleCard(
              title: "Unfortunate news hits KNUST campus",
              subtitle:
                  "Apologies for the confusion. Here's the updated code for the ArticleCard and ArticleDetailsPage classes, incorporating the changes to display all the passed information:",
              imageUrl:
                  "https://images.pexels.com/photos/6146978/pexels-photo-6146978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              date: "June 10, 2023",
              reads: 235),
          SizedBox(
            height: 10,
          ),
          //SECOND ARTICLE
          ArticleCard(
              title: "Unfortunate news hits KNUST campus",
              subtitle:
                  "Apologies for the confusion. Here's the updated code for the ArticleCard and ArticleDetailsPage classes, incorporating the changes to display all the passed information:",
              imageUrl:
                  "https://images.pexels.com/photos/6146978/pexels-photo-6146978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              date: "June 10, 2023",
              reads: 235),
        ],
      ),
    );
  }
}
