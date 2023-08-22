// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../components/article_card.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late List<dynamic> newsList = [];

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('assets/news.json');
      final Map<String, dynamic> data = json.decode(response);

      if (data.containsKey("news")) {
        final Map<String, dynamic> fetchedNewsList = data["news"];
        setState(() {
          newsList = fetchedNewsList.values.toList();
        });
      } else {
        print("No 'news' key found in JSON data.");
      }
    } catch (e) {
      print('Error reading JSON: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    //futureNotifications = getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: readJson(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              return SizedBox(
                height: 800,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final dynamic news = newsList[index];
                    return ArticleCard(
                      title: news['title'],
                      subtitle: news['subtitle'],
                      imageUrl: news['image_url'],
                      date: news['date_published'],
                      reads: news['number_of_reads'],
                      news: news['content'],
                    );
                  },
                ),
              );
            },
          ),
          /* ElevatedButton(
              onPressed: () {
                print('This is the news data: $newsList');
              },
              child: Text("Load JSON data")), */
        ],
      ),
    );
  }
}
