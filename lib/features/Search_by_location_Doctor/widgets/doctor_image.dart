import 'package:flutter/material.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
        topRight: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      child: Container(
        width: 70,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
