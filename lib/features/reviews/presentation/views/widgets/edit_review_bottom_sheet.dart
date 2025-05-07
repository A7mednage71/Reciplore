import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/cancel_and_save_update_review_buttons.dart';

class EditReviewBottomSheet extends StatefulWidget {
  const EditReviewBottomSheet({
    super.key,
    required this.review,
  });
  final ReviewModel review;

  @override
  State<EditReviewBottomSheet> createState() => _EditReviewBottomSheetState();
}

class _EditReviewBottomSheetState extends State<EditReviewBottomSheet> {
  late GlobalKey<FormState> _formkey;
  late TextEditingController _commentController;

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _commentController = TextEditingController(text: widget.review.comment);
    context.read<ReviewsCubit>().setUpdatedRate(widget.review.rate.toDouble());
    context.read<ReviewsCubit>().setUpdatedComment(widget.review.comment!);
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Edit Your Review",
              style: AppStyles.normalBoldText,
            ),
          ),
          SizedBox(height: 15.h),
          RatingBar.builder(
            initialRating: widget.review.rate.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 25.w,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            tapOnlyMode: true,
            allowHalfRating: true,
            onRatingUpdate: (rating) {
              context.read<ReviewsCubit>().setUpdatedRate(rating);
            },
          ),
          SizedBox(height: 15.h),
          Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomTextField(
              controller: _commentController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "Comment is required";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              maxLines: 3,
              hintText: "Enter New Comment",
              onChanged: (value) {
                context.read<ReviewsCubit>().setUpdatedComment(value!);
                return null;
              },
            ),
          ),
          SizedBox(height: 10.h),
          CancelAndSaveUpdateReviewButtons(
              formkey: _formkey, reviewId: widget.review.id),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
