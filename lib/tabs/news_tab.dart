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
            reads: 235,
            news:
                "North Pole - Today - In a heartwarming announcement, Santa Claus is set to make a special appearance at the prestigious Elmridge University campus this holiday season. The university's students and staff are eagerly anticipating the festive event, which promises to fill the campus with joy and holiday spirit The beloved figure, known for his cheerful demeanor and iconic red suit, will be visiting the university on December 15th. Santa Claus's visit is part of the university's efforts to create a memorable and enchanting atmosphere for both its students and the local community. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae efficitur purus, ut luctus lectus. Fusce vel ultricies nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce interdum, odio a cursus consequat, nulla elit sagittis risus, at consequat sapien odio et ligula. Fusce varius nunc felis, vel accumsan orci tempus quis. Vivamus interdum mi sed ante scelerisque, non rhoncus ligula volutpat. Pellentesque ac arcu libero. Nullam nec tristique risus. In efficitur libero et turpis viverra posuere. Fusce nec quam ac orci laoreet tincidunt. Sed nec enim aliquet, congue velit nec, pharetra libero.Curabitur hendrerit bibendum nunc vel tincidunt. Sed et efficitur odio. In dictum mauris nec laoreet cursus. Pellentesque tincidunt, justo eget volutpat elementum, sapien justo sollicitudin lectus, eu scelerisque sapien elit eu libero. Vestibulum tincidunt, ante vel auctor sollicitudin, urna ante egestas odio, ut finibus mauris ex ut arcu. Proin et urna a quam vestibulum malesuada vel non mi. Vivamus a diam vel odio volutpat iaculis a eu ligula. Nullam id libero at tortor venenatis egestas a in libero. Aliquam tristique justo quis ante lacinia, vel euismod ante bibendum. Vivamus eget odio a massa fermentum laoreet. Cras lacinia at odio et posuere. Nunc fermentum, ante et fringilla mattis, lectus odio efficitur nunc, quis convallis sapien justo id arcu. Quisque viverra at sem vel tincidunt. Vivamus ullamcorper erat ac purus feugiat, non sodales ante fermentum. Sed vel augue sit amet mauris tincidunt cursus.",
          ),
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
              reads: 235,
              news:
                  "North Pole - Today - In a heartwarming announcement, Santa Claus is set to make a special appearance at the prestigious Elmridge University campus this holiday season. The university's students and staff are eagerly anticipating the festive event, which promises to fill the campus with joy and holiday spirit The beloved figure, known for his cheerful demeanor and iconic red suit, will be visiting the university on December 15th. Santa Claus's visit is part of the university's efforts to create a memorable and enchanting atmosphere for both its students and the local community. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae efficitur purus, ut luctus lectus. Fusce vel ultricies nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce interdum, odio a cursus consequat, nulla elit sagittis risus, at consequat sapien odio et ligula. Fusce varius nunc felis, vel accumsan orci tempus quis. Vivamus interdum mi sed ante scelerisque, non rhoncus ligula volutpat. Pellentesque ac arcu libero. Nullam nec tristique risus. In efficitur libero et turpis viverra posuere. Fusce nec quam ac orci laoreet tincidunt. Sed nec enim aliquet, congue velit nec, pharetra libero.Curabitur hendrerit bibendum nunc vel tincidunt. Sed et efficitur odio. In dictum mauris nec laoreet cursus. Pellentesque tincidunt, justo eget volutpat elementum, sapien justo sollicitudin lectus, eu scelerisque sapien elit eu libero. Vestibulum tincidunt, ante vel auctor sollicitudin, urna ante egestas odio, ut finibus mauris ex ut arcu. Proin et urna a quam vestibulum malesuada vel non mi. Vivamus a diam vel odio volutpat iaculis a eu ligula. Nullam id libero at tortor venenatis egestas a in libero. Aliquam tristique justo quis ante lacinia, vel euismod ante bibendum. Vivamus eget odio a massa fermentum laoreet. Cras lacinia at odio et posuere. Nunc fermentum, ante et fringilla mattis, lectus odio efficitur nunc, quis convallis sapien justo id arcu. Quisque viverra at sem vel tincidunt. Vivamus ullamcorper erat ac purus feugiat, non sodales ante fermentum. Sed vel augue sit amet mauris tincidunt cursus."),
          SizedBox(
            height: 10,
          ),
          //THIRD ARTICLE
          ArticleCard(
              title: "Unfortunate news hits KNUST campus",
              subtitle:
                  "Apologies for the confusion. Here's the updated code for the ArticleCard and ArticleDetailsPage classes, incorporating the changes to display all the passed information:",
              imageUrl:
                  "https://images.pexels.com/photos/6146978/pexels-photo-6146978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              date: "June 10, 2023",
              reads: 235,
              news:
                  "North Pole - Today - In a heartwarming announcement, Santa Claus is set to make a special appearance at the prestigious Elmridge University campus this holiday season. The university's students and staff are eagerly anticipating the festive event, which promises to fill the campus with joy and holiday spirit The beloved figure, known for his cheerful demeanor and iconic red suit, will be visiting the university on December 15th. Santa Claus's visit is part of the university's efforts to create a memorable and enchanting atmosphere for both its students and the local community. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae efficitur purus, ut luctus lectus. Fusce vel ultricies nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce interdum, odio a cursus consequat, nulla elit sagittis risus, at consequat sapien odio et ligula. Fusce varius nunc felis, vel accumsan orci tempus quis. Vivamus interdum mi sed ante scelerisque, non rhoncus ligula volutpat. Pellentesque ac arcu libero. Nullam nec tristique risus. In efficitur libero et turpis viverra posuere. Fusce nec quam ac orci laoreet tincidunt. Sed nec enim aliquet, congue velit nec, pharetra libero.Curabitur hendrerit bibendum nunc vel tincidunt. Sed et efficitur odio. In dictum mauris nec laoreet cursus. Pellentesque tincidunt, justo eget volutpat elementum, sapien justo sollicitudin lectus, eu scelerisque sapien elit eu libero. Vestibulum tincidunt, ante vel auctor sollicitudin, urna ante egestas odio, ut finibus mauris ex ut arcu. Proin et urna a quam vestibulum malesuada vel non mi. Vivamus a diam vel odio volutpat iaculis a eu ligula. Nullam id libero at tortor venenatis egestas a in libero. Aliquam tristique justo quis ante lacinia, vel euismod ante bibendum. Vivamus eget odio a massa fermentum laoreet. Cras lacinia at odio et posuere. Nunc fermentum, ante et fringilla mattis, lectus odio efficitur nunc, quis convallis sapien justo id arcu. Quisque viverra at sem vel tincidunt. Vivamus ullamcorper erat ac purus feugiat, non sodales ante fermentum. Sed vel augue sit amet mauris tincidunt cursus."),
        ],
      ),
    );
  }
}
