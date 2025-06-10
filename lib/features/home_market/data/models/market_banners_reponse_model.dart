import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';

part 'market_banners_reponse_model.g.dart';

@JsonSerializable()
class MarketBannersReponseModel {
  final MarketBannersModel banners;

  MarketBannersReponseModel({required this.banners});

  factory MarketBannersReponseModel.fromJson(Map<String, dynamic> json) =>
      _$MarketBannersReponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketBannersReponseModelToJson(this);
}

@JsonSerializable()
class MarketBannersModel {
  @JsonKey(name: '_id')
  final String id;
  final String section;
  @JsonKey(name: 'Images')
  final List<ImageURL> images;

  MarketBannersModel(
      {required this.id, required this.section, required this.images});

  factory MarketBannersModel.fromJson(Map<String, dynamic> json) =>
      _$MarketBannersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketBannersModelToJson(this);
}
