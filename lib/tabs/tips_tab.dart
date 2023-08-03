import 'package:flutter/material.dart';
import 'package:student_support_app/colors.dart' as color;

class TipsTab extends StatefulWidget {
  const TipsTab({super.key});

  @override
  State<TipsTab> createState() => _TipsTabState();
}

class _TipsTabState extends State<TipsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Text(
              "Welcome to the TIPS tab.",
              style: TextStyle(color: color.AppColor.fontColor),
            )
          ],
        ),
      ),
    );
  }
}
