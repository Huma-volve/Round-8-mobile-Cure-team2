import 'package:cure_team_2/core/constants/assets.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(Assets.searchIcon),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for specialty, doctor',
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF6D7379)),
                  isCollapsed: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
