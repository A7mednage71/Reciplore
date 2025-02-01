import 'package:flutter/material.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';

class UsersReview extends StatelessWidget {
  const UsersReview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Search Recipes'),
      body: Center(
        child: Text('Users Review'),
      ),
    );
  }
}
