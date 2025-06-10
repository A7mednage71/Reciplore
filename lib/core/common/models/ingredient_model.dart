import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  @JsonKey(name: 'ingredient')
  final IngredientDataModel ingredientData;
  final String amount;

  IngredientModel({required this.ingredientData, required this.amount});

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}

@JsonSerializable()
class IngredientDataModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String? description;
  final double basePrice;
  final double appliedPrice;
  final int stock;
  @JsonKey(name: 'Average_rating')
  final double averageRating;
  final Discount discount;
  final ImageURL image;
  bool? inCart;

  IngredientDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.appliedPrice,
    required this.stock,
    required this.averageRating,
    required this.discount,
    required this.image,
    this.inCart,
  });

  factory IngredientDataModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDataModelToJson(this);

  IngredientDataModel copyWith({
    String? id,
    String? name,
    String? description,
    double? basePrice,
    double? appliedPrice,
    int? stock,
    double? averageRating,
    Discount? discount,
    ImageURL? image,
    bool? inCart,
  }) {
    return IngredientDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
      appliedPrice: appliedPrice ?? this.appliedPrice,
      stock: stock ?? this.stock,
      averageRating: averageRating ?? this.averageRating,
      discount: discount ?? this.discount,
      image: image ?? this.image,
      inCart: inCart ?? this.inCart,
    );
  }
}

@JsonSerializable()
class Discount {
  final double amount;
  final String type;

  Discount({required this.amount, required this.type});

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
