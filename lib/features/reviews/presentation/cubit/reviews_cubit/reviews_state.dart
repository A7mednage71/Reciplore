part of 'reviews_cubit.dart';

enum ReviewsStatus { initial, loading, success, failure }

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    @Default(ReviewsStatus.initial) ReviewsStatus status,
    @Default([]) List<ReviewModel> reviews,
    @Default('') String reviewId,
    @Default('') String commentId,
    @Default('') String reactionType,
    String? message,
  }) = _ReviewsState;
}
