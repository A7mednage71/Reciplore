import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_back_arrow_app_bar.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommended_recipe_ingredients_list.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommended_recipe_instructions_list.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommended_recipe_nutriational_information.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommended_recipe_overview.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommended_recipe_tips_and_variations.dart';

class AiRecommendedRecipeDetailsScreen extends StatelessWidget {
  const AiRecommendedRecipeDetailsScreen({super.key, required this.recipe});
  final EnhancedRecipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustombackArrowAppbar(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: recipe.image.imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 250.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      recipe.recipeData.title,
                      style: AppStyles.mediumBoldText,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      recipe.recipeData.description,
                      style: AppStyles.smallRegularText,
                    ),
                    SizedBox(height: 20.h),
                    RecommendedRecipeOverView(recipe: recipe),
                    SizedBox(height: 20.h),
                    RecommenedRecipeIngredientsListView(recipe: recipe),
                    SizedBox(height: 20.h),
                    RecommendedRecipeInstructionsList(recipe: recipe),
                    SizedBox(height: 20.h),
                    RecommendedRecipeTipsAndVariations(recipe: recipe),
                    SizedBox(height: 20.h),
                    RecommendedRecipeNutriationalInformation(recipe: recipe),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
