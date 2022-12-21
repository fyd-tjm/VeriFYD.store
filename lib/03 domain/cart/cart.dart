// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    required String cartId,
    required int cartLimit,
    required int cartCount,
    required String productsCollectionReference,
    required Map<String, Map<String, int>> cartMap,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  factory Cart.initial() => const Cart(
        cartId: "",
        cartLimit: 10,
        cartCount: 0,
        productsCollectionReference: "",
        cartMap: {},
      );
}
