import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_categories_cubit.freezed.dart';
part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._homeRepo)
      : super(const GetCategoriesState.initial());

  final HomeRepo _homeRepo;

  Future<void> getCategories() async {
    emit(const GetCategoriesState.loading());
    final result = await _homeRepo.getAllCategories();

    result.when(success: (allCategoriesModel) {
      emit(GetCategoriesState.success(allCategoriesModel.categories));
    }, failure: (error) {
      emit(GetCategoriesState.failure(error.errMessages));
    });
  }
}
