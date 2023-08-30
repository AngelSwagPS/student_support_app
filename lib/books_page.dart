// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart' as color;
import 'package:url_launcher/url_launcher.dart';

import 'constants/api_consts.dart';


class Book {
  final String Code;
  final String Html;
  final String Image;

  const Book({
    required this.Code,
    required this.Html,
    required this.Image,
  });

  factory Book.fromJson(Map<String, dynamic> field) {
    return Book(
      Code: field['code'],
      Html: field['html'],
      Image: field['image'],
    );

  }
}

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  late Future<List<Book>> futureBooks;

  @override
  void initState()  {
    super.initState();
     futureBooks = getBooks();
  }

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
              child://FIRST BOOK CONTAINER
                  FutureBuilder<List<Book>>(
                    future: futureBooks,
                    builder: ((context, snapshot){
                      if(snapshot.hasData){
                        return  GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: List.generate(snapshot.data!.length, (index) {
                            Book? book = snapshot.data?[index];
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                             child:(
                                 GestureDetector(
                                   onTap: () {
                                     // Define the link URL here
                                     String? link = book.Html;
                                     // Navigate to the link using the launch function from the url_launcher package
                                     launch(link);
                                   },
                                     child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(book!.Image),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(25.0),),
                                        ),
                                          child: Center(
                                            //Code for the book
                                              child: Text(book.Code,
                                                  style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.bold)
                                                          )
                                                  )
                                     )
                                 )
                             ),
                            );
                          },),
                        );
                      }else if(snapshot.hasError){
                        return Text(
                            'Error: ${snapshot.error}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                        );
                      }

                      return CircularProgressIndicator();
                    }),

                  )
              ,
          ),
        ],
      ),
    );
  }

Future<List<Book>> getBooks() async {
  String? token = await getToken();

  final ioc =  HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http =  IOClient(ioc);
  final response = await http.get(
      Uri.parse('$SERVER_URL/User/Books?token=$token'));

  if(response.statusCode == 200){
    final data = jsonDecode(response.body);

    final List<Book> list = [];

    for(var i =0 ; i < data.length; i++){
      final entry = data[i];
      list.add(Book.fromJson(entry));
    }
    print("Got the stuff");
    return list;
  }else{
    throw Exception("Http failed");
  }
}

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token =  sharedPreferences.getString('token');
    print(token);
    print("Past");
    return token;
  }




List<Book> CS4 =  [
  const Book(
      Code:"CSM483",
      Html: "https://csc-knu.github.io/sys-prog/books/Andrew%20S.%20Tanenbaum%20-%20Modern%20Operating%20Systems.pdf",
      Image: "assets/images/ModernOperatingPic.jpeg"
  ),
  const Book(
      Code:"CSM481",
      Html: "https://my.uopeople.edu/pluginfile.php/57436/mod_book/chapter/121629/BUS5114.Gallaugher.Information.Systems.A.Manager.Guide.to.Harness.Technology.pdf",
      Image: "assets/images/InfoSystemPic.png"
  ),
  const Book(
      Code:"CSM491",
      Html: "https://csc-knu.github.io/sys-prog/books/Andrew%20S.%20Tanenbaum%20-%20Modern%20Operating%20Systems.pdf",
      Image: "assets/images/ModernOperatingPic.jpeg"
  ),
  const Book(
      Code:"CSM497",
      Html: "https://my.uopeople.edu/pluginfile.php/57436/mod_book/chapter/121629/BUS5114.Gallaugher.Information.Systems.A.Manager.Guide.to.Harness.Technology.pdf",
      Image: "assets/images/InfoSystemPic.png"
  ),
  const Book(
      Code:"CSM495",
      Html: "https://csc-knu.github.io/sys-prog/books/Andrew%20S.%20Tanenbaum%20-%20Modern%20Operating%20Systems.pdf",
      Image: "assets/images/ModernOperatingPic.jpeg"
  ),
  const Book(
      Code:"MGT471",
      Html: "https://my.uopeople.edu/pluginfile.php/57436/mod_book/chapter/121629/BUS5114.Gallaugher.Information.Systems.A.Manager.Guide.to.Harness.Technology.pdf",
      Image: "assets/images/InfoSystemPic.png"
  ),
  const Book(
      Code:"CSM477",
      Html: "https://csc-knu.github.io/sys-prog/books/Andrew%20S.%20Tanenbaum%20-%20Modern%20Operating%20Systems.pdf",
      Image: "assets/images/ModernOperatingPic.jpeg"
  )
];

List<Book> CS3 =  [
  const Book(
      Code:"CSM352",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/RealTimeSystemsPic.png"
  ),
  const Book(
      Code:"CSM354",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/ComputerArchitecturePic.png"
  ),
  const Book(
      Code:"CSM358",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/ComputerGraphicPic.png"
  ),
  const Book(
      Code:"CSM374",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/E-CommercePic.png"
  )
  ,const Book(
      Code:"CSM376",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/ResearchMethodPic.png"
  ),
  const Book(
      Code:"CSM388",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/DataStructurePic.png"
  ),
  const Book(
      Code:"CSM394",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/OperationResearchPic.png"
  ),
  const Book(
      Code:"CSM386",
      Html: "https://baou.edu.in/assets/pdf/PGDM_101_slm.pdf",
      Image: "assets/images/AccountingPic.png"
  )
];

}
