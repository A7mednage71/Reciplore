import 'package:flutter/material.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/comment_item.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const CommentItem();
      },
    );
  }
}
