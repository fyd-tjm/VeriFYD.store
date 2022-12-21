// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  bool get isFetching => throw _privateConstructorUsedError;
  Cart? get cartRealtime => throw _privateConstructorUsedError;
  bool get updating => throw _privateConstructorUsedError;
  Map<String, Product> get productDetails => throw _privateConstructorUsedError;
  Option<Either<CartFailure, ProductFailure>> get failure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call(
      {bool isFetching,
      Cart? cartRealtime,
      bool updating,
      Map<String, Product> productDetails,
      Option<Either<CartFailure, ProductFailure>> failure});

  $CartCopyWith<$Res>? get cartRealtime;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? cartRealtime = freezed,
    Object? updating = freezed,
    Object? productDetails = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      cartRealtime: cartRealtime == freezed
          ? _value.cartRealtime
          : cartRealtime // ignore: cast_nullable_to_non_nullable
              as Cart?,
      updating: updating == freezed
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetails: productDetails == freezed
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, Product>,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Either<CartFailure, ProductFailure>>,
    ));
  }

  @override
  $CartCopyWith<$Res>? get cartRealtime {
    if (_value.cartRealtime == null) {
      return null;
    }

    return $CartCopyWith<$Res>(_value.cartRealtime!, (value) {
      return _then(_value.copyWith(cartRealtime: value));
    });
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isFetching,
      Cart? cartRealtime,
      bool updating,
      Map<String, Product> productDetails,
      Option<Either<CartFailure, ProductFailure>> failure});

  @override
  $CartCopyWith<$Res>? get cartRealtime;
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, (v) => _then(v as _$_CartState));

  @override
  _$_CartState get _value => super._value as _$_CartState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? cartRealtime = freezed,
    Object? updating = freezed,
    Object? productDetails = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_CartState(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      cartRealtime: cartRealtime == freezed
          ? _value.cartRealtime
          : cartRealtime // ignore: cast_nullable_to_non_nullable
              as Cart?,
      updating: updating == freezed
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetails: productDetails == freezed
          ? _value._productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, Product>,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Either<CartFailure, ProductFailure>>,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {required this.isFetching,
      required this.cartRealtime,
      required this.updating,
      required final Map<String, Product> productDetails,
      required this.failure})
      : _productDetails = productDetails,
        super._();

  @override
  final bool isFetching;
  @override
  final Cart? cartRealtime;
  @override
  final bool updating;
  final Map<String, Product> _productDetails;
  @override
  Map<String, Product> get productDetails {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_productDetails);
  }

  @override
  final Option<Either<CartFailure, ProductFailure>> failure;

  @override
  String toString() {
    return 'CartState(isFetching: $isFetching, cartRealtime: $cartRealtime, updating: $updating, productDetails: $productDetails, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching) &&
            const DeepCollectionEquality()
                .equals(other.cartRealtime, cartRealtime) &&
            const DeepCollectionEquality().equals(other.updating, updating) &&
            const DeepCollectionEquality()
                .equals(other._productDetails, _productDetails) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isFetching),
      const DeepCollectionEquality().hash(cartRealtime),
      const DeepCollectionEquality().hash(updating),
      const DeepCollectionEquality().hash(_productDetails),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
          {required final bool isFetching,
          required final Cart? cartRealtime,
          required final bool updating,
          required final Map<String, Product> productDetails,
          required final Option<Either<CartFailure, ProductFailure>> failure}) =
      _$_CartState;
  const _CartState._() : super._();

  @override
  bool get isFetching;
  @override
  Cart? get cartRealtime;
  @override
  bool get updating;
  @override
  Map<String, Product> get productDetails;
  @override
  Option<Either<CartFailure, ProductFailure>> get failure;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
