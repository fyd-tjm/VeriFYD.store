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
  String get storeName => throw _privateConstructorUsedError;
  int get cartCount => throw _privateConstructorUsedError;
  Map<String, Map<String, int>> get cartItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String cartId,
      String storeName,
      int cartCount,
      Map<String, Map<String, int>> cartItems});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? storeName = null,
    Object? cartCount = null,
    Object? cartItems = null,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      cartCount: null == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cartId,
      String storeName,
      int cartCount,
      Map<String, Map<String, int>> cartItems});
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res, _$_Cart>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? storeName = null,
    Object? cartCount = null,
    Object? cartItems = null,
  }) {
    return _then(_$_Cart(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      cartCount: null == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Cart implements _Cart {
  const _$_Cart(
      {required this.cartId,
      required this.storeName,
      required this.cartCount,
      required final Map<String, Map<String, int>> cartItems})
      : _cartItems = cartItems;

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  final String cartId;
  @override
  final String storeName;
  @override
  final int cartCount;
  final Map<String, Map<String, int>> _cartItems;
  @override
  Map<String, Map<String, int>> get cartItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cartItems);
  }

  @override
  String toString() {
    return 'Cart(cartId: $cartId, storeName: $storeName, cartCount: $cartCount, cartItems: $cartItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cartId, storeName, cartCount,
      const DeepCollectionEquality().hash(_cartItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final String storeName,
      required final int cartCount,
      required final Map<String, Map<String, int>> cartItems}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  String get cartId;
  @override
  String get storeName;
  @override
  int get cartCount;
  @override
  Map<String, Map<String, int>> get cartItems;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartSummary {
  int get totalItems => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartSummaryCopyWith<CartSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartSummaryCopyWith<$Res> {
  factory $CartSummaryCopyWith(
          CartSummary value, $Res Function(CartSummary) then) =
      _$CartSummaryCopyWithImpl<$Res, CartSummary>;
  @useResult
  $Res call({int totalItems, double subTotal});
}

/// @nodoc
class _$CartSummaryCopyWithImpl<$Res, $Val extends CartSummary>
    implements $CartSummaryCopyWith<$Res> {
  _$CartSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? subTotal = null,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartSummaryCopyWith<$Res>
    implements $CartSummaryCopyWith<$Res> {
  factory _$$_CartSummaryCopyWith(
          _$_CartSummary value, $Res Function(_$_CartSummary) then) =
      __$$_CartSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalItems, double subTotal});
}

/// @nodoc
class __$$_CartSummaryCopyWithImpl<$Res>
    extends _$CartSummaryCopyWithImpl<$Res, _$_CartSummary>
    implements _$$_CartSummaryCopyWith<$Res> {
  __$$_CartSummaryCopyWithImpl(
      _$_CartSummary _value, $Res Function(_$_CartSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? subTotal = null,
  }) {
    return _then(_$_CartSummary(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CartSummary implements _CartSummary {
  const _$_CartSummary({required this.totalItems, required this.subTotal});

  @override
  final int totalItems;
  @override
  final double subTotal;

  @override
  String toString() {
    return 'CartSummary(totalItems: $totalItems, subTotal: $subTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartSummary &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalItems, subTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartSummaryCopyWith<_$_CartSummary> get copyWith =>
      __$$_CartSummaryCopyWithImpl<_$_CartSummary>(this, _$identity);
}

abstract class _CartSummary implements CartSummary {
  const factory _CartSummary(
      {required final int totalItems,
      required final double subTotal}) = _$_CartSummary;

  @override
  int get totalItems;
  @override
  double get subTotal;
  @override
  @JsonKey(ignore: true)
  _$$_CartSummaryCopyWith<_$_CartSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
