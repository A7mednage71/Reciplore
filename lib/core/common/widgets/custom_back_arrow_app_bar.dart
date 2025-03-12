import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';

class CustombackArrowAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustombackArrowAppbar({
    super.key,
    this.arrowBackColor ,
  });

  final Color? arrowBackColor;

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => context.pop(),
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: arrowBackColor??AppColors.black,
        ),
      ),
    );
  }
}
