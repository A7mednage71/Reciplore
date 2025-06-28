// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutSessionResponseModel _$CheckoutSessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckoutSessionResponseModel(
      checkOutSession: CheckoutSession.fromJson(
          json['checkOutSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutSessionResponseModelToJson(
        CheckoutSessionResponseModel instance) =>
    <String, dynamic>{
      'checkOutSession': instance.checkOutSession,
    };

CheckoutSession _$CheckoutSessionFromJson(Map<String, dynamic> json) =>
    CheckoutSession(
      id: json['id'] as String,
      amountTotal: (json['amount_total'] as num).toInt(),
      amountSubtotal: (json['amount_subtotal'] as num).toInt(),
      currency: json['currency'] as String,
      paymentStatus: json['payment_status'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CheckoutSessionToJson(CheckoutSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount_total': instance.amountTotal,
      'amount_subtotal': instance.amountSubtotal,
      'currency': instance.currency,
      'payment_status': instance.paymentStatus,
      'url': instance.url,
    };
