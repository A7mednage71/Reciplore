import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';

class ChatTextFieldAndSendButton extends StatelessWidget {
  const ChatTextFieldAndSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: TextEditingController(),
            hintText: 'Write a Message',
            maxLines: 1,
            validator: null,
            contentPadding: EdgeInsets.all(10.w),
          ),
        ),
        IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: Transform.rotate(
            angle: -0.6,
            child: const Icon(
              Icons.send,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
