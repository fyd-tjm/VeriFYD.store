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
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {String cartId,
      String storeName,
      int cartCount,
      Map<String, Map<String, int>> cartItems});
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
    Object? storeName = freezed,
    Object? cartCount = freezed,
    Object? cartItems = freezed,
  }) {
    return _then(_value.copyWith(
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      cartCount: cartCount == freezed
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
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
      String storeName,
      int cartCount,
      Map<String, Map<String, int>> cartItems});
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
    Object? storeName = freezed,
    Object? cartCount = freezed,
    Object? cartItems = freezed,
  }) {
    return _then(_$_Cart(
      cartId: cartId == freezed
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      cartCount: cartCount == freezed
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: cartItems == freezed
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
            const DeepCollectionEquality().equals(other.cartId, cartId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality().equals(other.cartCount, cartCount) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(cartCount),
      const DeepCollectionEquality().hash(_cartItems));

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
      _$CartSummaryCopyWithImpl<$Res>;
  $Res call({int totalItems, double subTotal});
}

/// @nodoc
class _$CartSummaryCopyWithImpl<$Res> implements $CartSummaryCopyWith<$Res> {
  _$CartSummaryCopyWithImpl(this._value, this._then);

  final CartSummary _value;
  // ignore: unused_field
  final $Res Function(CartSummary) _then;

  @override
  $Res call({
    Object? totalItems = freezed,
    Object? subTotal = freezed,
  }) {
    return _then(_value.copyWith(
      totalItems: totalItems == freezed
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_CartSummaryCopyWith<$Res>
    implements $CartSummaryCopyWith<$Res> {
  factory _$$_CartSummaryCopyWith(
          _$_CartSummary value, $Res Function(_$_CartSummary) then) =
      __$$_CartSummaryCopyWithImpl<$Res>;
  @override
  $Res call({int totalItems, double subTotal});
}

/// @nodoc
class __$$_CartSummaryCopyWithImpl<$Res> extends _$CartSummaryCopyWithImpl<$Res>
    implements _$$_CartSummaryCopyWith<$Res> {
  __$$_CartSummaryCopyWithImpl(
      _$_CartSummary _value, $Res Function(_$_CartSummary) _then)
      : super(_value, (v) => _then(v as _$_CartSummary));

  @override
  _$_CartSummary get _value => super._value as _$_CartSummary;

  @override
  $Res call({
    Object? totalItems = freezed,
    Object? subTotal = freezed,
  }) {
    return _then(_$_CartSummary(
      totalItems: totalItems == freezed
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: subTotal == freezed
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
            const DeepCollectionEquality()
                .equals(other.totalItems, totalItems) &&
            const DeepCollectionEquality().equals(other.subTotal, subTotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalItems),
      const DeepCollectionEquality().hash(subTotal));

  @JsonKey(ignore: true)
  @override
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
