// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String get cartId => throw _privateConstructorUsedError;
  int get cartLimit => throw _privateConstructorUsedError;
  int get cartCount => throw _privateConstructorUsedError;
  String get productsCollectionReference => throw _privateConstructorUsedError;
  Map<String, Map<String, int>> get cartMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {String cartId,
      int cartLimit,
      int cartCount,
      String productsCollectionReference,
      Map<String, Map<String, int>> cartMap});
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? cartId = freezed,
    Object? cartLimit = freezed,
    Object? cartCount = freezed,
    Object? productsCollectionReference = freezed,
    Object? cartMap = freezed,
  }) {
    return _then(_value.copyWith(
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      cartLimit: cartLimit == freezed
          ? _value.cartLimit
          : cartLimit // ignore: cast_nullable_to_non_nullable
              as int,
      cartCount: cartCount == freezed
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
      productsCollectionReference: productsCollectionReference == freezed
          ? _value.productsCollectionReference
          : productsCollectionReference // ignore: cast_nullable_to_non_nullable
              as String,
      cartMap: cartMap == freezed
          ? _value.cartMap
          : cartMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {String cartId,
      int cartLimit,
      int cartCount,
      String productsCollectionReference,
      Map<String, Map<String, int>> cartMap});
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, (v) => _then(v as _$_Cart));

  @override
  _$_Cart get _value => super._value as _$_Cart;

  @override
  $Res call({
    Object? cartId = freezed,
    Object? cartLimit = freezed,
    Object? cartCount = freezed,
    Object? productsCollectionReference = freezed,
    Object? cartMap = freezed,
  }) {
    return _then(_$_Cart(
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      cartLimit: cartLimit == freezed
          ? _value.cartLimit
          : cartLimit // ignore: cast_nullable_to_non_nullable
              as int,
      cartCount: cartCount == freezed
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
      productsCollectionReference: productsCollectionReference == freezed
          ? _value.productsCollectionReference
          : productsCollectionReference // ignore: cast_nullable_to_non_nullable
              as String,
      cartMap: cartMap == freezed
          ? _value._cartMap
          : cartMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Cart implements _Cart {
  const _$_Cart(
      {required this.cartId,
      required this.cartLimit,
      required this.cartCount,
      required this.productsCollectionReference,
      required final Map<String, Map<String, int>> cartMap})
      : _cartMap = cartMap;

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  final String cartId;
  @override
  final int cartLimit;
  @override
  final int cartCount;
  @override
  final String productsCollectionReference;
  final Map<String, Map<String, int>> _cartMap;
  @override
  Map<String, Map<String, int>> get cartMap {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cartMap);
  }

  @override
  String toString() {
    return 'Cart(cartId: $cartId, cartLimit: $cartLimit, cartCount: $cartCount, productsCollectionReference: $productsCollectionReference, cartMap: $cartMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            const DeepCollectionEquality().equals(other.cartId, cartId) &&
            const DeepCollectionEquality().equals(other.cartLimit, cartLimit) &&
            const DeepCollectionEquality().equals(other.cartCount, cartCount) &&
            const DeepCollectionEquality().equals(
                other.productsCollectionReference,
                productsCollectionReference) &&
            const DeepCollectionEquality().equals(other._cartMap, _cartMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartId),
      const DeepCollectionEquality().hash(cartLimit),
      const DeepCollectionEquality().hash(cartCount),
      const DeepCollectionEquality().hash(productsCollectionReference),
      const DeepCollectionEquality().hash(_cartMap));

  @JsonKey(ignore: true)
  @override
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {required final String cartId,
      required final int cartLimit,
      required final int cartCount,
      required final String productsCollectionReference,
      required final Map<String, Map<String, int>> cartMap}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  String get cartId;
  @override
  int get cartLimit;
  @override
  int get cartCount;
  @override
  String get productsCollectionReference;
  @override
  Map<String, Map<String, int>> get cartMap;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}
