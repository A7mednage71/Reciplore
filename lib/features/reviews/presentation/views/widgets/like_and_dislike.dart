import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';

enum UserReaction { like, dislike, none }

class LikeAndDislike extends StatelessWidget {
  const LikeAndDislike({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  UserReaction _parseUserReaction(String? action) {
    switch (action?.toLowerCase()) {
      case 'like':
        return UserReaction.like;
      case 'dislike':
        return UserReaction.dislike;
      default:
        return UserReaction.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    final reaction = _parseUserReaction(review.userAction);
    final cubit = context.read<ReviewsCubit>();
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            await cubit.makeReaction(review.id, UserReaction.like);
          },
          highlightColor: Colors.transparent,
          icon: Icon(
            reaction == UserReaction.like
                ? Icons.thumb_up_alt_rounded
                : Icons.thumb_up_alt_outlined,
            color:
                reaction == UserReaction.like ? AppColors.primaryDarker : null,
          ),
        ),
        Text(
          '${review.likesCount}',
          style: AppStyles.smallRegularGrayDarkText,
        ),
        IconButton(
          onPressed: () async {
            await cubit.makeReaction(review.id, UserReaction.dislike);
          },
          highlightColor: Colors.transparent,
          icon: Icon(
            reaction == UserReaction.dislike
                ? Icons.thumb_down_alt_rounded
                : Icons.thumb_down_alt_outlined,
            color: reaction == UserReaction.dislike
                ? AppColors.primaryDarker
                : null,
          ),
        ),
        Text('${review.dislikesCount}',
            style:
                AppStyles.smallRegularGrayDarkText),
      ],
    );
  }
}
