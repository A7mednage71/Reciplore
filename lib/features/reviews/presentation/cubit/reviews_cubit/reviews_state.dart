part of 'reviews_cubit.dart';

enum ReviewsStatus { initial, loading, success, failure }

enum ReviewActionStatus { initial, loading, success, failure }

enum ReviewActionType { none, add, update }

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    @Default(ReviewsStatus.initial) ReviewsStatus status,
    @Default(ReviewActionStatus.initial) ReviewActionStatus reviewActionStatus,
    @Default(ReviewActionType.none) ReviewActionType currentAction,
    @Default([]) List<ReviewModel> reviews,
    String? recipeId,
    String? ingredientId,
    String? currentUserId,
    @Default(2.0) double rate,
    String? comment,
    @Default(2.0) double updatedrate,
    String? updatedcomment,
    String? commentId,
    String? reactionType,
    String? message,
  }) = _ReviewsState;
}
