import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/data/models/update_cart_request_model.dart';
import 'package:looqma/features/cart/data/repos/cart_repo.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(const CartState());

  final CartRepo _cartRepo;

  Future<void> getCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await _cartRepo.getCart();

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
            status: CartStatus.success, getCartReponseModel: successResponse));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CartStatus.failure,
            responseMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> addToCart(
      {required AddToCartRequestModel addToCartRequestModel}) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result =
        await _cartRepo.addToCart(addToCartRequestModel: addToCartRequestModel);

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
            status: CartStatus.cartActionSuccess,
            responseMessage: successResponse.message));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CartStatus.cartActionFailure,
            responseMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> removeFromCart(String id) async {
    emit(state.copyWith(status: CartStatus.loading));

    final result = await _cartRepo.removeFromCart(id);

    result.when(
      success: (successResponse) {
        GetCartReponseModel? updatedGetCartResponse;
        // get removed cart ingredient
        if (state.getCartReponseModel != null &&
            state.getCartReponseModel!.cart != null) {
          final ingredients =
              state.getCartReponseModel?.cart?.ingredients ?? [];

          // check if cart has this id
          CartIngredientModel? cartIngredientModel = ingredients
                  .any((element) => element.ingredient.id == id)
              ? ingredients.firstWhere((element) => element.ingredient.id == id)
              : null;

          // update subTotal after removing
          if (cartIngredientModel != null) {
            final newSubTotal = state.getCartReponseModel!.cart!.subTotal -
                (cartIngredientModel.price * cartIngredientModel.quantity);
            // update cart list
            final updatedCart = state.getCartReponseModel!.cart!.copyWith(
                subTotal: newSubTotal,
                ingredients: state.getCartReponseModel!.cart!.ingredients
                    .where((element) => element.ingredient.id != id)
                    .toList());

            updatedGetCartResponse = state.getCartReponseModel!.copyWith(
              cart: updatedCart,
            );
          } else {
            updatedGetCartResponse = state.getCartReponseModel;
          }
        }

        emit(state.copyWith(
          status: CartStatus.cartActionSuccess,
          getCartReponseModel: updatedGetCartResponse,
          responseMessage: successResponse.message,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CartStatus.cartActionFailure,
            responseMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> updateCart(
      String id, UpdateCartRequestModel updateCartRequestModel) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await _cartRepo.updateCart(id, updateCartRequestModel);

    result.when(
      success: (successResponse) {
        // get updated cart ingredient
        final cartIngredientModel = state.getCartReponseModel!.cart!.ingredients
            .firstWhere((element) => element.ingredient.id == id);
        // update subTotal after update quantity
        final newSubTotal = state.getCartReponseModel!.cart!.subTotal +
            ((updateCartRequestModel.quantity - cartIngredientModel.quantity) *
                cartIngredientModel.price);
        // update cart list
        final updatedCart = state.getCartReponseModel!.cart!.copyWith(
          subTotal: newSubTotal,
          ingredients:
              state.getCartReponseModel!.cart!.ingredients.map((element) {
            if (element.ingredient.id == id) {
              return cartIngredientModel.copyWith(
                  quantity: updateCartRequestModel.quantity);
            }
            return element;
          }).toList(),
        );

        final updatedGetCartResponse = state.getCartReponseModel!.copyWith(
          cart: updatedCart,
        );

        emit(state.copyWith(
          status: CartStatus.cartActionSuccess,
          getCartReponseModel: updatedGetCartResponse,
          responseMessage: successResponse.message,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CartStatus.cartActionFailure,
            responseMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> clearCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await _cartRepo.clearCart();

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
            status: CartStatus.cartActionSuccess,
            responseMessage: successResponse.message,
            getCartReponseModel: null));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            status: CartStatus.cartActionFailure,
            responseMessage: failureResponse.errMessages));
      },
    );
  }
}
