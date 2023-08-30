// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'dart:convert';
import '../colors.dart' as color;

import '../components/article_card.dart';
import '../constants/api_consts.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class NewsL{
  final String title;
  final String subtitle;
  final String imageUrl;
  final String datePublished;
  final String content;

  const NewsL({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.datePublished,
    required this.content,
  });

  factory NewsL.fromJson(Map<String, dynamic> field) {
    return NewsL(
      title: field['title'],
      subtitle: field['subtitle'],
      imageUrl: field['imageUrl'],
      datePublished: field['datePublished'],
      content: field['content'],
    );

  }
}


class _NewsTabState extends State<NewsTab> {
  late Future<List<NewsL>> newsList;


  @override
  void initState() {
    super.initState();
    newsList = getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height:1300,
            child:
            FutureBuilder<List<NewsL>>(
              future: newsList,
              builder: ((context, snapshot){
                if(snapshot.hasData){
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context,index){
                        NewsL? news = snapshot.data?[index];

                        return ArticleCard(
                          title: news!.title,
                          subtitle: news.subtitle,
                          imageUrl: news.imageUrl,
                          date: news.datePublished,
                          news: news.content,
                        ) ;
                      },
                      separatorBuilder: ((context, index){
                        return  Divider(color: color.AppColor.cardColor);
                      }),
                      itemCount: snapshot.data!.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,),
                  );
                }else if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.white, fontSize: 15)
                  );
                }
                return CircularProgressIndicator();
              }),

            ),
          ),
        ],
      ),
    );
  }

  Future<List<NewsL>> getNews() async {

    final ioc =  HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http =  IOClient(ioc);
    final response = await http.get(
        Uri.parse('$SERVER_URL/User/News'));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);

      final List<NewsL> list = [];

      for(var i =0 ; i < data.length; i++){
        final entry = data[i];
        list.add(NewsL.fromJson(entry));
      }
      print("Got the stuff");
      return list;
    }else{
      throw Exception("Http failed");
    }
  }

}