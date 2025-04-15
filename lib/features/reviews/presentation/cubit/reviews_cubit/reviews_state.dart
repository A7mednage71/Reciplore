part of 'reviews_cubit.dart';

enum ReviewsStatus { initial, loading, success, failure }

enum AddReviewStatus { initial, loading, success, failure }

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    @Default(ReviewsStatus.initial) ReviewsStatus status,
    @Default(AddReviewStatus.initial) AddReviewStatus addReviewStatus,
    @Default([]) List<ReviewModel> reviews,
    String? recipeId,
    String? ingredientId,
    @Default(2.0) double rate,
    String? comment,
    String? commentId,
    String? reactionType,
    String? message,
  }) = _ReviewsState;
}
