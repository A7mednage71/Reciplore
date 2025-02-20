import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_countries_cubit.freezed.dart';
part 'get_countries_state.dart';

class GetCountriesCubit extends Cubit<GetCountriesState> {
  GetCountriesCubit(this._homeRepo) : super(const GetCountriesState.initial());
  final HomeRepo _homeRepo;

  Future<void> getCountries() async {
    log("getCountries");
    emit(const GetCountriesState.loading());
    final result = await _homeRepo.getAllCountries();

    result.when(success: (allCountries) {
      emit(GetCountriesState.success(allCountries));
    }, failure: (error) {
      log(error.errMessages);
      emit(GetCountriesState.failure(error.errMessages));
    });
  }
}
