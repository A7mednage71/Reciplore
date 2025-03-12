import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/ingredient_details/presentation/views/widgets/customized_app_bar.dart';
import 'package:looqma/features/ingredient_details/presentation/views/widgets/ingredient_content.dart';

class IngredientDetailsScreen extends StatelessWidget {
  const IngredientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomizedAppBar(),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
            width: double.infinity,
            child: Image.asset(
              AppAssets.imagesFresh,
              fit: BoxFit.fill,
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: const IngredientContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
