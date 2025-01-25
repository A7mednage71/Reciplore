import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    super.key,
    required this.logo,
    this.url,
  });
  final String logo;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (await canLaunchUrl(Uri.parse(url))) {
        //       await launchUrl(Uri.parse(url));
        //       log("Launched");
        //     } else {
        //       log('Could not launch');
        //     }
      },
      child: Container(
        height: 25.h,
        width: 25.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
