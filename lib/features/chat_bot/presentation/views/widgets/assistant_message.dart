import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';

class AssistantMessage extends StatelessWidget {
  final ChatMessage message;

  const AssistantMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.content.contains("title:") &&
        message.content.contains("ingredients:")) {
      return _buildRecipeMessage(context);
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(15.r),
        margin: EdgeInsets.all(10.r),
        constraints: BoxConstraints(
          maxWidth: 250.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18).w,
            topRight: const Radius.circular(18).w,
            bottomRight: const Radius.circular(18).w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MarkdownBody(
              selectable: true,
              data: message.content,
              styleSheet: MarkdownStyleSheet(
                p: AppStyles.smallRegularText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeMessage(BuildContext context) {
    final Map<String, String> recipeParts = _parseRecipe(message.content);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(15.r),
        margin: EdgeInsets.all(10.r),
        constraints: BoxConstraints(
          maxWidth: 300.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18).w,
            topRight: const Radius.circular(18).w,
            bottomRight: const Radius.circular(18).w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipeParts['title'] ?? 'Recipe Suggestion',
                style: AppStyles.mediumBoldText),
            Divider(height: 20.h, thickness: 1.r),
            Text('Ingredients:', style: AppStyles.smallBoldText),
            SizedBox(height: 5.h),
            ..._buildIngredientsList(recipeParts['ingredients'] ?? ''),
            SizedBox(height: 12.h),
            Text('Directions:', style: AppStyles.smallBoldText),
            SizedBox(height: 5.h),
            ..._buildDirectionsList(recipeParts['directions'] ?? '', context),
            if (message.imageUrl != null)
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    message.imageUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 150.h,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return FailureState(hight: 150.h);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Map<String, String> _parseRecipe(String content) {
    return {
      'title': _extractContent(content, r'title:\s*(.*?)(?=ingredients:)', 'Untitled Recipe'),
      'ingredients': _extractContent(content, r'ingredients:\s*(.*?)(?=directions:)', 'No ingredients listed.'),
      'directions': _extractContent(content, r'directions:\s*(.*?)$', 'No directions provided.')
    };
  }
  String _extractContent(String content, String pattern, String fallback) {
    final match = RegExp(pattern, dotAll: true).firstMatch(content);
    return match?.group(1)?.trim() ?? fallback;
  }


  List<Widget> _buildIngredientsList(String ingredientsText) {
    // Clean up and split ingredients
    final List<String> ingredients = [];

    // Remove any garbage text that might be in ingredients
    ingredientsText =
        ingredientsText.replaceAll(RegExp(r'ingredients for.*?(?=\d)'), '');

    // Try to split by common patterns in ingredients lists
    final ingredientLines = ingredientsText.split(RegExp(r'[\n,]'));

    for (var line in ingredientLines) {
      line = line.trim();
      if (line.isNotEmpty) {
        ingredients.add(line);
      }
    }

    // Build UI for ingredients
    return ingredients.map((ingredient) {
      return Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• ', style: AppStyles.smallBoldText.copyWith(color: AppColors.primaryDark)),
            Expanded(
              child: Text(
                ingredient.replaceAll(RegExp(r'^\d+\s*'), '').trim(),
                style: AppStyles.smallRegularText,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  String removeDuplicateSentences(String text) {
    if (text.isEmpty) return text;

    // Split text into sentences
    final List<String> sentences = text.split(RegExp(r'(?<=\.)\s+'));
    final List<String> uniqueSentences = [];

    // Track sentences we've already seen
    final Set<String> seenSentences = {};

    for (String sentence in sentences) {
      final String normalized = sentence.trim().toLowerCase();
      // Skip if this sentence (normalized) has been seen before
      if (normalized.isNotEmpty && !seenSentences.contains(normalized)) {
        uniqueSentences.add(sentence.trim());
        seenSentences.add(normalized);
      }
    }

    return uniqueSentences.join('. ');
  }

  List<Widget> _buildDirectionsList(
      String directionsText, BuildContext context) {
    // Remove duplicate sentences (like the immersion blender repetition)
    directionsText = removeDuplicateSentences(directionsText);

    // Split directions by periods followed by spaces or line breaks
    final List<String> directions = directionsText
        .split(RegExp(r'(?<=\.)\s+|\n'))
        .where((direction) => direction.trim().isNotEmpty)
        .toList();

    return List.generate(directions.length, (index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Text('${index + 1}.',
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.primaryDark)),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: Text(
                directions[index].trim(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ),
      );
    });
  }
}
