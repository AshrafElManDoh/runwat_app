import 'package:flutter/material.dart';

class CustomModelContainer extends StatelessWidget {
  const CustomModelContainer({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffECECEC),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 10,
            left: 10,
            child: Image.asset("assets/images/shadow.png"),
          ),
          Center(child: Image.asset(imagePath)),
        ],
      ),
    );
  }
}
