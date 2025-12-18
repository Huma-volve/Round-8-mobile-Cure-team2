import 'package:cure_team_2/features/review/widgets/review_textfiels.dart';
import 'package:flutter/material.dart';
import 'rating_part.dart';
import 'send_review_part.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(width: double.infinity, child: RatingPart()),
              SizedBox(height: 16),
              ReviewTextFieldPart(),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          SendReviewPart(),
        ],
      ),
    );
  }
}
