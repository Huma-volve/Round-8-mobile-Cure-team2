import 'package:flutter/material.dart';

class CustomTextSearchPage extends StatelessWidget {
  final String text;
  const CustomTextSearchPage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Align(
            alignment: AlignmentGeometry.topLeft,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000)),
            )));
  }
}
