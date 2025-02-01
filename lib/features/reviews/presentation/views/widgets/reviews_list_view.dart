import 'package:flutter/material.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/review_item.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ReviewItem();
      },
    );
  }
}
