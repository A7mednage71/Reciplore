import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/reviews/data/models/add_review_request_model.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/data/repos/reviews_repo.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/like_and_dislike.dart';

part 'reviews_cubit.freezed.dart';
part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._reviewsRepo) : super(const ReviewsState());

  final ReviewsRepo _reviewsRepo;

  Future<void> getReviews({String? recipeId, String? ingredientId}) async {
    emit(state.copyWith(
      recipeId: recipeId,
      ingredientId: ingredientId,
      status: ReviewsStatus.loading,
    ));

    final result = await _reviewsRepo.getReviews(
      recipeId: recipeId,
      ingredientId: ingredientId,
    );

    result.when(
      success: (data) {
        emit(state.copyWith(
            status: ReviewsStatus.success, reviews: data.reviews));
      },
      failure: (failure) {
        emit(state.copyWith(
            status: ReviewsStatus.failure, message: failure.errMessages));
      },
    );
  }

  Future<void> addReview() async {
    emit(state.copyWith(addReviewStatus: AddReviewStatus.loading));

    final result = await _reviewsRepo.addReview(AddReviewRequestModel(
        comment: state.comment!,
        recipeId: state.recipeId,
        ingredientId: state.ingredientId,
        rate: state.rate));

    result.when(
      success: (data) {
        final updatedReviews = [...state.reviews, data.review];

        emit(state.copyWith(
          reviews: updatedReviews,
          addReviewStatus: AddReviewStatus.success,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
          addReviewStatus: AddReviewStatus.failure,
          message: failure.errMessages,
        ));
      },
    );
  }

  Future<void> makeReaction(String id, UserReaction reaction) async {
    final result = await _reviewsRepo.makeReaction(id, reaction.name);
    result.when(
      success: (data) {
        final updatedReviews = state.reviews.map((review) {
          if (review.id == id) {
            String? oldReaction = review.userAction;
            return review.copyWith(
              likesCount: data.likes,
              dislikesCount: data.dislikes,
              userAction: oldReaction == reaction.name ? "null" : reaction.name,
            );
          }
          return review;
        }).toList();

        emit(state.copyWith(reviews: updatedReviews));
      },
      failure: (failure) {
        emit(state.copyWith(message: failure.errMessages));
      },
    );
  }

  /// set rate in state
  void setRate(double rate) {
    emit(state.copyWith(rate: rate));
  }

  /// set comment
  void setComment(String comment) {
    emit(state.copyWith(comment: comment));
  }
}
