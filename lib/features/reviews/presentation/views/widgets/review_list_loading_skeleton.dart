import 'package:flutter/material.dart';
import 'package:looqma/core/app/constants.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/review_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReviewListLoadingSkeleton extends StatelessWidget {
  const ReviewListLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<ReviewModel> reviews = List.generate(
      3,
      (index) {
        return ReviewModel(
          id: '',
          comment:
              "Easy to follow recipe and the result was delicious. Will definitely make it again!",
          rate: 3,
          createdAt: '2025-04-14T23:16:25.082Z',
          user: UserReviewModel(
              id: '',
              userName: "userName",
              email: "email",
              profileImage: ImageURL(secureUrl: defaultUserImage)),
          likesCount: 0,
          dislikesCount: 0,
        );
      },
    );
    return Skeletonizer(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewItem(review: reviews[index]);
        },
      ),
    );
  }
}
