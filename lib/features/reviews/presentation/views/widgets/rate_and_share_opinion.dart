import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/send_review_button.dart';

class RateAndShareOpinion extends StatelessWidget {
  const RateAndShareOpinion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate recipe and Share your Opinion',
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
          onRatingUpdate: (rating) {
            log(" Rating $rating");
          },
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Say something...',
          maxLines: 3,
          keyboardType: TextInputType.text,
          validator: (p0) {
            if (p0!.isEmpty) {
              return 'Please enter some Words...';
            }
            return null;
          },
        ),
        SizedBox(height: 10.h),
        const Align(
          alignment: Alignment.centerRight,
          child: SendReviewButton(),
        ),
      ],
    );
  }
}
