import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/data/repos/reviews_repo.dart';

part 'reviews_cubit.freezed.dart';
part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._reviewsRepo) : super(const ReviewsState());

  final ReviewsRepo _reviewsRepo;

  Future<void> getReviews({
    String? recipeId,
    String? ingredientId,
  }) async {
    emit(state.copyWith(status: ReviewsStatus.loading));

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
          status: ReviewsStatus.failure,
          message: failure.errMessages,
        ));
      },
    );
  }
}
