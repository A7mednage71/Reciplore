import 'package:json_annotation/json_annotation.dart';

part 'checkout_session_response_model.g.dart';

@JsonSerializable()
class CheckoutSessionResponseModel {
  final CheckoutSession checkOutSession;

  CheckoutSessionResponseModel({required this.checkOutSession});

  factory CheckoutSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutSessionResponseModelToJson(this);
}

@JsonSerializable()
class CheckoutSession {
  final String id;
  @JsonKey(name: 'amount_total')
  final int amountTotal;
  @JsonKey(name: 'amount_subtotal')
  final int amountSubtotal;
  final String currency;
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  final String url;

  CheckoutSession({
    required this.id,
    required this.amountTotal,
    required this.amountSubtotal,
    required this.currency,
    required this.paymentStatus,
    required this.url,
  });

  factory CheckoutSession.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutSessionToJson(this);
}
