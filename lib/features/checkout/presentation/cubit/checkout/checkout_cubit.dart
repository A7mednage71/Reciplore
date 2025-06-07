import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/checkout/data/models/add_and_update_address_request_model.dart';
import 'package:looqma/features/checkout/data/models/cart_overview_response_model.dart';
import 'package:looqma/features/checkout/data/repos/checkout_repo.dart';

part 'checkout_cubit.freezed.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(const CheckoutState());

  final CheckoutRepo _checkoutRepo;

  Future<void> getCartOverview() async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    final result = await _checkoutRepo.getCartOverview();

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
            status: CheckoutStatus.success, cartOverview: successResponse));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CheckoutStatus.failure,
            message: failureResponse.errMessages));
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
