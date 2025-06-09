part of 'checkout_cubit.dart';

enum CheckoutStatus { initial, loading, success, failure }

enum AddressActionStatus { initial, loading, success, failure }

enum AddressActionType { none, add, update, delete }

enum CouponCodeStatus { initial, loading, success, failure }

enum PlaceOrderStatus { initial, loading, success, failure }

enum PaymentMethodStatus { initial, loading, success, failure }

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(CheckoutStatus.initial) CheckoutStatus status,
    CartOverviewResponseModel? cartOverview,
    int? originalTotal,
    String? shippingAddressID,
    String? paymentMethod,
    String? message,
    @Default(AddressActionStatus.initial)
    AddressActionStatus addressActionStatus,
    @Default(AddressActionType.none) AddressActionType addressActionType,
    String? addressActionMessage,
    @Default(CouponCodeStatus.initial) CouponCodeStatus couponStatus,
    String? couponCode,
    String? checkCouponMessage,
    @Default(PlaceOrderStatus.initial) PlaceOrderStatus? placeOrderStatus,
    PlaceOrderResponseModel? placeOrderResponse,
    String? placeOrderMessage,
    @Default(PaymentMethodStatus.initial)
    PaymentMethodStatus paymentMethodStatus,
    CheckoutSessionResponseModel? checkoutSessionResponse,
    String? paymentMethodMessage,
  }) = _CheckoutState;
}
