import 'package:json_annotation/json_annotation.dart';

part 'all_countries_model.g.dart';

@JsonSerializable()
class AllCountriesModel {
  final List<CountryModel> countries;

  AllCountriesModel({required this.countries});

  factory AllCountriesModel.fromJson(Map<String, dynamic> json) =>
      _$AllCountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCountriesModelToJson(this);
}

@JsonSerializable()
class CountryModel {
  @JsonKey(name: '_id')
  final String countryId;
  @JsonKey(name: 'name')
  final String countryName;

  CountryModel({
    required this.countryId,
    required this.countryName,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
