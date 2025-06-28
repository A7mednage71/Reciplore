import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBackTap,
  });
  final String title;
  final List<Widget>? actions;
  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onBackTap ?? () => context.pop(),
        child: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: AppStyles.mediumBoldText,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
