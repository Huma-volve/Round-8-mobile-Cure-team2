import 'package:cure_team_2/core/widgets/spacing.dart';
import 'package:cure_team_2/features/search/presentation/pages/widegt/custom_text_field.dart';
import 'package:cure_team_2/features/search/presentation/pages/widegt/custom_text_rich.dart';
import 'package:cure_team_2/features/search/presentation/pages/widegt/custom_text_search_page.dart';
import 'package:flutter/material.dart';

class CustomSearchPageBody extends StatelessWidget {
  const CustomSearchPageBody({super.key});

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
