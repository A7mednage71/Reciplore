import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';

part 'get_cart_reponse_model.g.dart';

@JsonSerializable()
class GetCartReponseModel {
  final CartDataModel? cart;
  GetCartReponseModel({required this.cart});

  factory GetCartReponseModel.fromJson(dynamic json) =>
      _$GetCartReponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartReponseModelToJson(this);

  GetCartReponseModel copyWith({CartDataModel? cart}) =>
      GetCartReponseModel(cart: cart ?? this.cart);
}

@JsonSerializable()
class CartDataModel {
  @JsonKey(name: '_id')
  final String cartId;
  final String userID;
  final double subTotal;
  final List<CartIngredientModel> ingredients;

  CartDataModel({
    required this.cartId,
    required this.userID,
    required this.subTotal,
    required this.ingredients,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataModelToJson(this);

  CartDataModel copyWith({
    String? cartId,
    String? userID,
    double? subTotal,
    List<CartIngredientModel>? ingredients,
  }) =>
      CartDataModel(
          cartId: cartId ?? this.cartId,
          userID: userID ?? this.userID,
          subTotal: subTotal ?? this.subTotal,
          ingredients: ingredients ?? this.ingredients);
}

@JsonSerializable()
class CartIngredientModel {
  @JsonKey(name: '_id')
  final String cartIngredientId;
  final int quantity;
  final double price;

  @JsonKey(name: 'IngredientID')
  final IngredientDataModel ingredient;

  CartIngredientModel({
    required this.cartIngredientId,
    required this.quantity,
    required this.price,
    required this.ingredient,
  });

  factory CartIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$CartIngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartIngredientModelToJson(this);

  CartIngredientModel copyWith({
    int? quantity,
    double? price,
  }) =>
      CartIngredientModel(
          cartIngredientId: cartIngredientId,
          quantity: quantity ?? this.quantity,
          price: price ?? this.price,
          ingredient: ingredient);
}
