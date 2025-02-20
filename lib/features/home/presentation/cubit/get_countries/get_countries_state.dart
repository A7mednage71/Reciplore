part of 'get_countries_cubit.dart';

@freezed
class GetCountriesState with _$GetCountriesState {
  const factory GetCountriesState.initial() = _Initial;
  const factory GetCountriesState.loading() = _Loading;
  const factory GetCountriesState.success(AllCountriesModel allCountriesModel) =
      _Success;
  const factory GetCountriesState.failure(String message) = _Failure;
}
