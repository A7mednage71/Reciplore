import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/send_review_button.dart';

class RateAndShareOpinion extends StatefulWidget {
  const RateAndShareOpinion({super.key});

  @override
  State<RateAndShareOpinion> createState() => _RateAndShareOpinionState();
}

class _RateAndShareOpinionState extends State<RateAndShareOpinion> {
  late GlobalKey<FormState> _formkey;
  late TextEditingController _commentController;

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate and Share your Opinion...!',
          style: AppStyles.mediumBoldText,
        ),
        SizedBox(height: 10.h),
        RatingBar.builder(
          initialRating: 2,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemSize: 25.w,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          allowHalfRating: true,
          onRatingUpdate: (rating) {
            log(" Rating $rating");
            context.read<ReviewsCubit>().setRate(rating);
          },
        ),
        SizedBox(height: 10.h),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formkey,
          child: CustomTextField(
            controller: _commentController,
            hintText: 'Say something...',
            maxLines: 3,
            keyboardType: TextInputType.text,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Please share your opinion...!';
              }
              return null;
            },
            onChanged: (comment) {
              context.read<ReviewsCubit>().setComment(comment!);
              return null;
            },
          ),
        ),
        SizedBox(height: 10.h),
        SendReviewButton(formKey: _formkey),
      ],
    );
  }
}
