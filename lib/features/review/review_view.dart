import 'package:cure_team_2/features/review/widgets/review_view_body.dart';
import 'package:flutter/material.dart';
import 'widgets/review_appbar.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ReviewAppBar(),
      body: ReviewBody(),
    );
  }
}
