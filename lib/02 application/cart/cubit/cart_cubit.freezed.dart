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
  Cart? get cartRealtime => throw _privateConstructorUsedError;
  List<Tuple3>? get cartItemsInTuple3 => throw _privateConstructorUsedError;
  Map<String, Product>? get cartItemsDetail =>
      throw _privateConstructorUsedError;
  bool get updating => throw _privateConstructorUsedError;
  Option<CartFailure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call(
      {Cart? cartRealtime,
      List<Tuple3>? cartItemsInTuple3,
      Map<String, Product>? cartItemsDetail,
      bool updating,
      Option<CartFailure> failure});

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
    Object? cartRealtime = freezed,
    Object? cartItemsInTuple3 = freezed,
    Object? cartItemsDetail = freezed,
    Object? updating = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      cartRealtime: cartRealtime == freezed
          ? _value.cartRealtime
          : cartRealtime // ignore: cast_nullable_to_non_nullable
              as Cart?,
      cartItemsInTuple3: cartItemsInTuple3 == freezed
          ? _value.cartItemsInTuple3
          : cartItemsInTuple3 // ignore: cast_nullable_to_non_nullable
              as List<Tuple3>?,
      cartItemsDetail: cartItemsDetail == freezed
          ? _value.cartItemsDetail
          : cartItemsDetail // ignore: cast_nullable_to_non_nullable
              as Map<String, Product>?,
      updating: updating == freezed
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<CartFailure>,
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
      {Cart? cartRealtime,
      List<Tuple3>? cartItemsInTuple3,
      Map<String, Product>? cartItemsDetail,
      bool updating,
      Option<CartFailure> failure});

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
    Object? cartRealtime = freezed,
    Object? cartItemsInTuple3 = freezed,
    Object? cartItemsDetail = freezed,
    Object? updating = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_CartState(
      cartRealtime: cartRealtime == freezed
          ? _value.cartRealtime
          : cartRealtime // ignore: cast_nullable_to_non_nullable
              as Cart?,
      cartItemsInTuple3: cartItemsInTuple3 == freezed
          ? _value._cartItemsInTuple3
          : cartItemsInTuple3 // ignore: cast_nullable_to_non_nullable
              as List<Tuple3>?,
      cartItemsDetail: cartItemsDetail == freezed
          ? _value._cartItemsDetail
          : cartItemsDetail // ignore: cast_nullable_to_non_nullable
              as Map<String, Product>?,
      updating: updating == freezed
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<CartFailure>,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {required this.cartRealtime,
      required final List<Tuple3>? cartItemsInTuple3,
      required final Map<String, Product>? cartItemsDetail,
      required this.updating,
      required this.failure})
      : _cartItemsInTuple3 = cartItemsInTuple3,
        _cartItemsDetail = cartItemsDetail,
        super._();

  @override
  final Cart? cartRealtime;
  final List<Tuple3>? _cartItemsInTuple3;
  @override
  List<Tuple3>? get cartItemsInTuple3 {
    final value = _cartItemsInTuple3;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, Product>? _cartItemsDetail;
  @override
  Map<String, Product>? get cartItemsDetail {
    final value = _cartItemsDetail;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool updating;
  @override
  final Option<CartFailure> failure;

  @override
  String toString() {
    return 'CartState(cartRealtime: $cartRealtime, cartItemsInTuple3: $cartItemsInTuple3, cartItemsDetail: $cartItemsDetail, updating: $updating, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other.cartRealtime, cartRealtime) &&
            const DeepCollectionEquality()
                .equals(other._cartItemsInTuple3, _cartItemsInTuple3) &&
            const DeepCollectionEquality()
                .equals(other._cartItemsDetail, _cartItemsDetail) &&
            const DeepCollectionEquality().equals(other.updating, updating) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartRealtime),
      const DeepCollectionEquality().hash(_cartItemsInTuple3),
      const DeepCollectionEquality().hash(_cartItemsDetail),
      const DeepCollectionEquality().hash(updating),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {required final Cart? cartRealtime,
      required final List<Tuple3>? cartItemsInTuple3,
      required final Map<String, Product>? cartItemsDetail,
      required final bool updating,
      required final Option<CartFailure> failure}) = _$_CartState;
  const _CartState._() : super._();

  @override
  Cart? get cartRealtime;
  @override
  List<Tuple3>? get cartItemsInTuple3;
  @override
  Map<String, Product>? get cartItemsDetail;
  @override
  bool get updating;
  @override
  Option<CartFailure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
