import 'package:cure_team_2/core/widgets/app_bar.dart';
import 'package:cure_team_2/features/search/presentation/pages/widegt/custom_search_page_body.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
      ),
      body: CustomSearchPageBody(),
    );
  }
}
