part of 'cart_cubit.dart';

enum CartStatus {
  initial,
  loading,
  success,
  failure,
  cartActionSuccess,
  cartActionFailure
}

enum CartActionType { toggleItem, updateCart, clearCart }

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(CartStatus.initial) CartStatus status,
    GetCartReponseModel? getCartReponseModel,
    CartActionType? actionType,
    String? responseMessage,
    String? lastAffectedIngredientId,
  }) = _CartState;
}
