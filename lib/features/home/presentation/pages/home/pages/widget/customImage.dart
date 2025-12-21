import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
        width: width * 0.95,
        height: height * 0.23,
        child: Image.asset(
          'assets/images/Banner.png',
          fit: BoxFit.cover,
        ));
  }
}
