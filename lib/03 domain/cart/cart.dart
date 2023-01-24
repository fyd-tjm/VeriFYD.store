// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

//?-----------------------------------------------------------------------------
@freezed
abstract class Cart with _$Cart {
  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    required String cartId,
    required String storeName,
    required int cartCount,
    required Map<String, Map<String, int>> cartItems,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  factory Cart.initial() => const Cart(
        cartId: "",
        storeName: '',
        cartCount: 0,
        cartItems: {},
      );
}

//?-----------------------------------------------------------------------------

@freezed
class CartSummary with _$CartSummary {
  @JsonSerializable(explicitToJson: true)
  const factory CartSummary({
    required int totalItems,
    required double subTotal,
  }) = _CartSummary;
}
//?-----------------------------------------------------------------------------