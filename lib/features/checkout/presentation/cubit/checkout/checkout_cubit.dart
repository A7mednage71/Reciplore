import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/checkout/data/models/add_and_update_address_request_model.dart';
import 'package:looqma/features/checkout/data/models/cart_overview_response_model.dart';
import 'package:looqma/features/checkout/data/models/check_coupon_request_model.dart';
import 'package:looqma/features/checkout/data/models/checkout_session_response_model.dart';
import 'package:looqma/features/checkout/data/models/place_order_request_model.dart';
import 'package:looqma/features/checkout/data/models/place_order_response_model.dart';
import 'package:looqma/features/checkout/data/repos/checkout_repo.dart';

part 'checkout_cubit.freezed.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(const CheckoutState());

  final CheckoutRepo _checkoutRepo;

  TextEditingController contactNumberController = TextEditingController();
  GlobalKey<FormState> contactNumberFormKey = GlobalKey<FormState>();

  Future<void> getCartOverview() async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    final result = await _checkoutRepo.getCartOverview();

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
            status: CheckoutStatus.success,
            cartOverview: successResponse,
            originalTotal: successResponse.total));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CheckoutStatus.failure,
            message: failureResponse.errMessages));
      },
    );
  }

  Future<void> setshippingAddressID({required String addressID}) async {
    emit(state.copyWith(shippingAddressID: addressID));
  }

  Future<void> setPaymentMethod({required String paymentMethod}) async {
    emit(state.copyWith(paymentMethod: paymentMethod));
  }

  Future<void> placeOrder() async {
    emit(state.copyWith(placeOrderStatus: PlaceOrderStatus.loading));

    final result = await _checkoutRepo.placeOrder(
        placeOrderRequestModel: PlaceOrderRequestModel(
            shippingAddressID: state.shippingAddressID!,
            paymentMethod: state.paymentMethod!,
            contactNumber: contactNumberController.text.trim(),
            couponCode: state.couponCode));

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
          placeOrderStatus: PlaceOrderStatus.success,
          placeOrderMessage: successResponse.message,
          placeOrderResponse: successResponse,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            placeOrderStatus: PlaceOrderStatus.failure,
            placeOrderMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> payWithStripe({required String orderId}) async {
    emit(state.copyWith(paymentMethodStatus: PaymentMethodStatus.loading));

    final result = await _checkoutRepo.payWithStripe(orderId: orderId);

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
            paymentMethodStatus: PaymentMethodStatus.success,
            checkoutSessionResponse: successResponse,
            paymentMethodMessage: 'payment session created successfully'));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            paymentMethodStatus: PaymentMethodStatus.failure,
            paymentMethodMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> checkCoupon({required String code}) async {
    emit(state.copyWith(couponStatus: CouponCodeStatus.loading));

    final result = await _checkoutRepo.chechCoupon(
        checkCouponRequestModel: CheckCouponRequestModel(
            couponCode: code, total: state.cartOverview!.total));

    result.when(
      success: (successResponse) {
        final newCartOverview = state.cartOverview!.copyWith(
          coupondiscount: successResponse.discount,
          total: successResponse.totalAfterDiscount,
        );

        emit(state.copyWith(
            couponStatus: CouponCodeStatus.success,
            cartOverview: newCartOverview,
            couponCode: code));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            couponStatus: CouponCodeStatus.failure,
            checkCouponMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> addNewAddress(
      {required AddAndUpdateAddressRequestModel addressModel}) async {
    emit(state.copyWith(
        addressActionStatus: AddressActionStatus.loading,
        addressActionType: AddressActionType.add));

    final result = await _checkoutRepo.addNewAddress(
        addAndUpdateAddressModel: addressModel);

    result.when(
      success: (successResponse) {
        final newCartOverview = state.cartOverview!.copyWith(
          addresses: [
            ...state.cartOverview!.addresses,
            successResponse.address
          ],
        );
        emit(state.copyWith(
          addressActionStatus: AddressActionStatus.success,
          cartOverview: newCartOverview,
          addressActionMessage: successResponse.message,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            addressActionStatus: AddressActionStatus.failure,
            addressActionMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> updateAddress(
      {required AddAndUpdateAddressRequestModel addressModel,
      required String id}) async {
    emit(state.copyWith(
        addressActionStatus: AddressActionStatus.loading,
        addressActionType: AddressActionType.update));

    final result = await _checkoutRepo.updateAddress(
        id: id, addAndUpdateAddressModel: addressModel);

    result.when(
      success: (successResponse) {
        final updatedAddresses = state.cartOverview!.addresses.map((address) {
          if (address.id == successResponse.address.id) {
            return successResponse.address;
          }
          return address;
        }).toList();

        final newCartOverview =
            state.cartOverview!.copyWith(addresses: updatedAddresses);

        emit(state.copyWith(
          addressActionStatus: AddressActionStatus.success,
          cartOverview: newCartOverview,
          addressActionMessage: successResponse.message,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            addressActionStatus: AddressActionStatus.failure,
            addressActionMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> deleteAddress({required String id}) async {
    emit(state.copyWith(
        addressActionStatus: AddressActionStatus.loading,
        addressActionType: AddressActionType.delete));

    final result = await _checkoutRepo.deleteAddress(id: id);

    result.when(
      success: (successResponse) {
        final updatedAddresses = state.cartOverview!.addresses
            .where((address) => address.id != id)
            .toList();

        final newCartOverview =
            state.cartOverview!.copyWith(addresses: updatedAddresses);

        emit(state.copyWith(
          addressActionStatus: AddressActionStatus.success,
          cartOverview: newCartOverview,
          addressActionMessage: successResponse.message,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            addressActionStatus: AddressActionStatus.failure,
            addressActionMessage: failureResponse.errMessages));
      },
    );
  }
}
