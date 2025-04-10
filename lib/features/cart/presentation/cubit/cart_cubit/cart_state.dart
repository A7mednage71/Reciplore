part of 'cart_cubit.dart';

enum CartStatus { initial, loading, success, failure, cartActionFailure }

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(CartStatus.initial) CartStatus status,
    GetCartReponseModel? getCartReponseModel,
    String? responseMessage,
  }) = _CartState;
}
