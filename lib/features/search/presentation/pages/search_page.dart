import 'package:cure_team_2/core/theme/app_colors.dart';
import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
      ),
      body: CustomSearchPage(),
    );
  }
}

class CustomSearchPage extends StatelessWidget {
  const CustomSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      children: [
        VSpace(33),
        CustomTextField(),
        VSpace(16),
        CustomTextRich(),
        VSpace(16),
        Flexible(
          flex: 2,
          child: CustomTextSearchPage(
            text: 'All Specialties',
          ),
        ),
        Flexible(
          flex: 1,
          child: CustomTextSearchPage(
            text: 'History',
          ),
        )
      ],
    ));
  }
}

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
        child: Align(alignment: AlignmentGeometry.topLeft, child: Text(text)));
  }
}

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
        TextSpan(text: 'Search by your location ', children: [
      TextSpan(
          text: '129,El-Nasr Street, Cairo',
          style: TextStyle(color: AppColors.info))
    ]));
  }
}

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
            Image.asset('assets/images/Vector.png'),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for specialty, doctor',
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
