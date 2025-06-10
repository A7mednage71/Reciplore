import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';

class RatingStars extends StatelessWidget {
  final double rating; // Rating value (e.g., 4.5)
  final int maxStars; // Total number of stars (e.g., 5)

  const RatingStars({
    super.key,
    required this.rating,
    this.maxStars = 5,
  });

  @override
  Widget build(BuildContext context) {
    // Generate the stars
    List<Widget> stars = List.generate(maxStars, (index) {
      if (index < rating.floor()) {
        // Full star
        return Icon(Icons.star, color: AppColors.ratingColor, size: 14.w);
      } else if (index < rating && rating % 1 != 0) {
        // Half star
        return Icon(Icons.star_half, color: AppColors.ratingColor, size: 14.w);
      } else {
        // Empty star
        return Icon(Icons.star_border, color: Colors.grey, size: 14.w);
      }
    });

    return Row(children: stars); // Display stars in a row
  }
}
