// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:url_launcher/url_launcher.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 50,
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Books",
                    style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: color.AppColor.fontColor),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
//BOOKS TO BE DISPLAYED HERE
          Expanded(
              child: GridView.count(
            padding: EdgeInsets.only(bottom: 20),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              //FIRST BOOK CONTAINER
              GestureDetector(
                onTap: () {
                  // Define the link URL here
                  String link =
                      'https://www.pdfdrive.com/the-whole-brain-child-12-revolutionary-strategies-to-nurture-your-childs-developing-mind-e60737121.html';
                  // Navigate to the link using the launch function from the url_launcher package
                  launch(link);
                },
                child: Container(
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black.withOpacity(0.6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 100, left: 10),
                                  child: Text(
                                    "CSM 497",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
//Second BOOK
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 100, left: 10),
                                child: Text(
                                  "CSM 457",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 100, left: 10),
                                child: Text(
                                  "CSM 457",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 100, left: 10),
                                child: Text(
                                  "CSM 457",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 100, left: 10),
                                child: Text(
                                  "CSM 457",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 100, left: 10),
                                child: Text(
                                  "CSM 457",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
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
                            'assets/images/books.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 100, left: 10),
                                child: Text(
                                  "CSM 457",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
