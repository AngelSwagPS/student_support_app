// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../components/tips_card.dart';

class TipsTab extends StatefulWidget {
  const TipsTab({super.key});

  @override
  State<TipsTab> createState() => _TipsTabState();
}

class _TipsTabState extends State<TipsTab> {
  late List<dynamic> tipsList = [];

  Future<void> readTJson() async {
    try {
      final String response = await rootBundle.loadString('assets/tips.json');
      final Map<String, dynamic> data = json.decode(response);

      if (data.containsKey("tips")) {
        final Map<String, dynamic> fetchedTipsList = data["tips"];
        setState(() {
          tipsList = fetchedTipsList.values.toList();
        });
      } else {
        print("No 'tips' key found in JSON data.");
      }
    } catch (e) {
      print('Error reading JSON: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height:950,
            child:
            FutureBuilder(
              future: readTJson(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                return Expanded(
                    child:
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: tipsList.length,
                      itemBuilder: (context, index) {
                        final dynamic news = tipsList[index];
                        print(news);
                        return TipsCard(
                          title: news['title'],
                          subtitle: news['subtitle'],
                          imageUrl: news['image_url'],
                          tips: news['tips'],
                        );
                      },
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}