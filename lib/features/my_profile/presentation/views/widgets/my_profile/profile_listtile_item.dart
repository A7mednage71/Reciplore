import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ProfileListTileItem extends StatelessWidget {
  const ProfileListTileItem(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: AppStyles.smallBoldText),
      trailing: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.grayLight,
          size: 18.w,
        ),
      ),
    );
  }
}
