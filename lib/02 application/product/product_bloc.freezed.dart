// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetProductRealtimeCopyWith<$Res> {
  factory _$$GetProductRealtimeCopyWith(_$GetProductRealtime value,
          $Res Function(_$GetProductRealtime) then) =
      __$$GetProductRealtimeCopyWithImpl<$Res>;
  @useResult
  $Res call({String productRef});
}

/// @nodoc
class __$$GetProductRealtimeCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$GetProductRealtime>
    implements _$$GetProductRealtimeCopyWith<$Res> {
  __$$GetProductRealtimeCopyWithImpl(
      _$GetProductRealtime _value, $Res Function(_$GetProductRealtime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRef = null,
  }) {
    return _then(_$GetProductRealtime(
      productRef: null == productRef
          ? _value.productRef
          : productRef // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductRealtime implements GetProductRealtime {
  const _$GetProductRealtime({required this.productRef});

  @override
  final String productRef;

  @override
  String toString() {
    return 'ProductEvent.getProductRealtime(productRef: $productRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductRealtime &&
            (identical(other.productRef, productRef) ||
                other.productRef == productRef));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductRealtimeCopyWith<_$GetProductRealtime> get copyWith =>
      __$$GetProductRealtimeCopyWithImpl<_$GetProductRealtime>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return getProductRealtime(productRef);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return getProductRealtime?.call(productRef);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (getProductRealtime != null) {
      return getProductRealtime(productRef);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return getProductRealtime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return getProductRealtime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (getProductRealtime != null) {
      return getProductRealtime(this);
    }
    return orElse();
  }
}

abstract class GetProductRealtime implements ProductEvent {
  const factory GetProductRealtime({required final String productRef}) =
      _$GetProductRealtime;

  String get productRef;
  @JsonKey(ignore: true)
  _$$GetProductRealtimeCopyWith<_$GetProductRealtime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecievedStreamEventCopyWith<$Res> {
  factory _$$RecievedStreamEventCopyWith(_$RecievedStreamEvent value,
          $Res Function(_$RecievedStreamEvent) then) =
      __$$RecievedStreamEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<ProductFailure, Product> event});
}

/// @nodoc
class __$$RecievedStreamEventCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$RecievedStreamEvent>
    implements _$$RecievedStreamEventCopyWith<$Res> {
  __$$RecievedStreamEventCopyWithImpl(
      _$RecievedStreamEvent _value, $Res Function(_$RecievedStreamEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$RecievedStreamEvent(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Either<ProductFailure, Product>,
    ));
  }
}

/// @nodoc

class _$RecievedStreamEvent implements RecievedStreamEvent {
  const _$RecievedStreamEvent({required this.event});

  @override
  final Either<ProductFailure, Product> event;

  @override
  String toString() {
    return 'ProductEvent.recievedStreamEvent(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecievedStreamEvent &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecievedStreamEventCopyWith<_$RecievedStreamEvent> get copyWith =>
      __$$RecievedStreamEventCopyWithImpl<_$RecievedStreamEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return recievedStreamEvent(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return recievedStreamEvent?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (recievedStreamEvent != null) {
      return recievedStreamEvent(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return recievedStreamEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return recievedStreamEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (recievedStreamEvent != null) {
      return recievedStreamEvent(this);
    }
    return orElse();
  }
}

abstract class RecievedStreamEvent implements ProductEvent {
  const factory RecievedStreamEvent(
          {required final Either<ProductFailure, Product> event}) =
      _$RecievedStreamEvent;

  Either<ProductFailure, Product> get event;
  @JsonKey(ignore: true)
  _$$RecievedStreamEventCopyWith<_$RecievedStreamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleStatesCopyWith<$Res> {
  factory _$$ToggleStatesCopyWith(
          _$ToggleStates value, $Res Function(_$ToggleStates) then) =
      __$$ToggleStatesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleStatesCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$ToggleStates>
    implements _$$ToggleStatesCopyWith<$Res> {
  __$$ToggleStatesCopyWithImpl(
      _$ToggleStates _value, $Res Function(_$ToggleStates) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleStates implements ToggleStates {
  const _$ToggleStates();

  @override
  String toString() {
    return 'ProductEvent.toggleStates()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleStates);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return toggleStates();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return toggleStates?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (toggleStates != null) {
      return toggleStates();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return toggleStates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return toggleStates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (toggleStates != null) {
      return toggleStates(this);
    }
    return orElse();
  }
}

abstract class ToggleStates implements ProductEvent {
  const factory ToggleStates() = _$ToggleStates;
}

/// @nodoc
abstract class _$$ToggleFailuresCopyWith<$Res> {
  factory _$$ToggleFailuresCopyWith(
          _$ToggleFailures value, $Res Function(_$ToggleFailures) then) =
      __$$ToggleFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleFailuresCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$ToggleFailures>
    implements _$$ToggleFailuresCopyWith<$Res> {
  __$$ToggleFailuresCopyWithImpl(
      _$ToggleFailures _value, $Res Function(_$ToggleFailures) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleFailures implements ToggleFailures {
  const _$ToggleFailures();

  @override
  String toString() {
    return 'ProductEvent.toggleFailures()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleFailures);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return toggleFailures();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return toggleFailures?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (toggleFailures != null) {
      return toggleFailures();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return toggleFailures(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return toggleFailures?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (toggleFailures != null) {
      return toggleFailures(this);
    }
    return orElse();
  }
}

abstract class ToggleFailures implements ProductEvent {
  const factory ToggleFailures() = _$ToggleFailures;
}

/// @nodoc
abstract class _$$AddToCartCopyWith<$Res> {
  factory _$$AddToCartCopyWith(
          _$AddToCart value, $Res Function(_$AddToCart) then) =
      __$$AddToCartCopyWithImpl<$Res>;
  @useResult
  $Res call({String size});
}

/// @nodoc
class __$$AddToCartCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$AddToCart>
    implements _$$AddToCartCopyWith<$Res> {
  __$$AddToCartCopyWithImpl(
      _$AddToCart _value, $Res Function(_$AddToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$AddToCart(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddToCart implements AddToCart {
  const _$AddToCart({required this.size});

  @override
  final String size;

  @override
  String toString() {
    return 'ProductEvent.addToCart(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCart &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartCopyWith<_$AddToCart> get copyWith =>
      __$$AddToCartCopyWithImpl<_$AddToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return addToCart(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return addToCart?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class AddToCart implements ProductEvent {
  const factory AddToCart({required final String size}) = _$AddToCart;

  String get size;
  @JsonKey(ignore: true)
  _$$AddToCartCopyWith<_$AddToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddNewCartWithProductCopyWith<$Res> {
  factory _$$AddNewCartWithProductCopyWith(_$AddNewCartWithProduct value,
          $Res Function(_$AddNewCartWithProduct) then) =
      __$$AddNewCartWithProductCopyWithImpl<$Res>;
  @useResult
  $Res call({String size});
}

/// @nodoc
class __$$AddNewCartWithProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$AddNewCartWithProduct>
    implements _$$AddNewCartWithProductCopyWith<$Res> {
  __$$AddNewCartWithProductCopyWithImpl(_$AddNewCartWithProduct _value,
      $Res Function(_$AddNewCartWithProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$AddNewCartWithProduct(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddNewCartWithProduct implements AddNewCartWithProduct {
  const _$AddNewCartWithProduct({required this.size});

  @override
  final String size;

  @override
  String toString() {
    return 'ProductEvent.addNewCartWithProduct(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewCartWithProduct &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewCartWithProductCopyWith<_$AddNewCartWithProduct> get copyWith =>
      __$$AddNewCartWithProductCopyWithImpl<_$AddNewCartWithProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return addNewCartWithProduct(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return addNewCartWithProduct?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addNewCartWithProduct != null) {
      return addNewCartWithProduct(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return addNewCartWithProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return addNewCartWithProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addNewCartWithProduct != null) {
      return addNewCartWithProduct(this);
    }
    return orElse();
  }
}

abstract class AddNewCartWithProduct implements ProductEvent {
  const factory AddNewCartWithProduct({required final String size}) =
      _$AddNewCartWithProduct;

  String get size;
  @JsonKey(ignore: true)
  _$$AddNewCartWithProductCopyWith<_$AddNewCartWithProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddNewProductCopyWith<$Res> {
  factory _$$AddNewProductCopyWith(
          _$AddNewProduct value, $Res Function(_$AddNewProduct) then) =
      __$$AddNewProductCopyWithImpl<$Res>;
  @useResult
  $Res call({String skuId, String size});
}

/// @nodoc
class __$$AddNewProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$AddNewProduct>
    implements _$$AddNewProductCopyWith<$Res> {
  __$$AddNewProductCopyWithImpl(
      _$AddNewProduct _value, $Res Function(_$AddNewProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skuId = null,
    Object? size = null,
  }) {
    return _then(_$AddNewProduct(
      skuId: null == skuId
          ? _value.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddNewProduct implements AddNewProduct {
  const _$AddNewProduct({required this.skuId, required this.size});

  @override
  final String skuId;
  @override
  final String size;

  @override
  String toString() {
    return 'ProductEvent.addNewProduct(skuId: $skuId, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNewProduct &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skuId, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNewProductCopyWith<_$AddNewProduct> get copyWith =>
      __$$AddNewProductCopyWithImpl<_$AddNewProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return addNewProduct(skuId, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return addNewProduct?.call(skuId, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addNewProduct != null) {
      return addNewProduct(skuId, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return addNewProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return addNewProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addNewProduct != null) {
      return addNewProduct(this);
    }
    return orElse();
  }
}

abstract class AddNewProduct implements ProductEvent {
  const factory AddNewProduct(
      {required final String skuId,
      required final String size}) = _$AddNewProduct;

  String get skuId;
  String get size;
  @JsonKey(ignore: true)
  _$$AddNewProductCopyWith<_$AddNewProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSameProductCopyWith<$Res> {
  factory _$$AddSameProductCopyWith(
          _$AddSameProduct value, $Res Function(_$AddSameProduct) then) =
      __$$AddSameProductCopyWithImpl<$Res>;
  @useResult
  $Res call({String skuId, String size});
}

/// @nodoc
class __$$AddSameProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$AddSameProduct>
    implements _$$AddSameProductCopyWith<$Res> {
  __$$AddSameProductCopyWithImpl(
      _$AddSameProduct _value, $Res Function(_$AddSameProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skuId = null,
    Object? size = null,
  }) {
    return _then(_$AddSameProduct(
      skuId: null == skuId
          ? _value.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddSameProduct implements AddSameProduct {
  const _$AddSameProduct({required this.skuId, required this.size});

  @override
  final String skuId;
  @override
  final String size;

  @override
  String toString() {
    return 'ProductEvent.addSameProduct(skuId: $skuId, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSameProduct &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skuId, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSameProductCopyWith<_$AddSameProduct> get copyWith =>
      __$$AddSameProductCopyWithImpl<_$AddSameProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productRef) getProductRealtime,
    required TResult Function(Either<ProductFailure, Product> event)
        recievedStreamEvent,
    required TResult Function() toggleStates,
    required TResult Function() toggleFailures,
    required TResult Function(String size) addToCart,
    required TResult Function(String size) addNewCartWithProduct,
    required TResult Function(String skuId, String size) addNewProduct,
    required TResult Function(String skuId, String size) addSameProduct,
  }) {
    return addSameProduct(skuId, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productRef)? getProductRealtime,
    TResult? Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult? Function()? toggleStates,
    TResult? Function()? toggleFailures,
    TResult? Function(String size)? addToCart,
    TResult? Function(String size)? addNewCartWithProduct,
    TResult? Function(String skuId, String size)? addNewProduct,
    TResult? Function(String skuId, String size)? addSameProduct,
  }) {
    return addSameProduct?.call(skuId, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productRef)? getProductRealtime,
    TResult Function(Either<ProductFailure, Product> event)?
        recievedStreamEvent,
    TResult Function()? toggleStates,
    TResult Function()? toggleFailures,
    TResult Function(String size)? addToCart,
    TResult Function(String size)? addNewCartWithProduct,
    TResult Function(String skuId, String size)? addNewProduct,
    TResult Function(String skuId, String size)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addSameProduct != null) {
      return addSameProduct(skuId, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetProductRealtime value) getProductRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(ToggleStates value) toggleStates,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(AddToCart value) addToCart,
    required TResult Function(AddNewCartWithProduct value)
        addNewCartWithProduct,
    required TResult Function(AddNewProduct value) addNewProduct,
    required TResult Function(AddSameProduct value) addSameProduct,
  }) {
    return addSameProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetProductRealtime value)? getProductRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(ToggleStates value)? toggleStates,
    TResult? Function(ToggleFailures value)? toggleFailures,
    TResult? Function(AddToCart value)? addToCart,
    TResult? Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult? Function(AddNewProduct value)? addNewProduct,
    TResult? Function(AddSameProduct value)? addSameProduct,
  }) {
    return addSameProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetProductRealtime value)? getProductRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(ToggleStates value)? toggleStates,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(AddToCart value)? addToCart,
    TResult Function(AddNewCartWithProduct value)? addNewCartWithProduct,
    TResult Function(AddNewProduct value)? addNewProduct,
    TResult Function(AddSameProduct value)? addSameProduct,
    required TResult orElse(),
  }) {
    if (addSameProduct != null) {
      return addSameProduct(this);
    }
    return orElse();
  }
}

abstract class AddSameProduct implements ProductEvent {
  const factory AddSameProduct(
      {required final String skuId,
      required final String size}) = _$AddSameProduct;

  String get skuId;
  String get size;
  @JsonKey(ignore: true)
  _$$AddSameProductCopyWith<_$AddSameProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<ProductFailure> get failure => throw _privateConstructorUsedError;
  Product? get productRealtime => throw _privateConstructorUsedError;
  bool get addingToCart => throw _privateConstructorUsedError;
  bool get newCartPermissionState => throw _privateConstructorUsedError;
  Option<Either<CartFailure, Unit>> get cartFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<ProductFailure> failure,
      Product? productRealtime,
      bool addingToCart,
      bool newCartPermissionState,
      Option<Either<CartFailure, Unit>> cartFailureOrSuccess});

  $ProductCopyWith<$Res>? get productRealtime;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failure = null,
    Object? productRealtime = freezed,
    Object? addingToCart = null,
    Object? newCartPermissionState = null,
    Object? cartFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<ProductFailure>,
      productRealtime: freezed == productRealtime
          ? _value.productRealtime
          : productRealtime // ignore: cast_nullable_to_non_nullable
              as Product?,
      addingToCart: null == addingToCart
          ? _value.addingToCart
          : addingToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      newCartPermissionState: null == newCartPermissionState
          ? _value.newCartPermissionState
          : newCartPermissionState // ignore: cast_nullable_to_non_nullable
              as bool,
      cartFailureOrSuccess: null == cartFailureOrSuccess
          ? _value.cartFailureOrSuccess
          : cartFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CartFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get productRealtime {
    if (_value.productRealtime == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.productRealtime!, (value) {
      return _then(_value.copyWith(productRealtime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$_ProductStateCopyWith(
          _$_ProductState value, $Res Function(_$_ProductState) then) =
      __$$_ProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<ProductFailure> failure,
      Product? productRealtime,
      bool addingToCart,
      bool newCartPermissionState,
      Option<Either<CartFailure, Unit>> cartFailureOrSuccess});

  @override
  $ProductCopyWith<$Res>? get productRealtime;
}

/// @nodoc
class __$$_ProductStateCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductState>
    implements _$$_ProductStateCopyWith<$Res> {
  __$$_ProductStateCopyWithImpl(
      _$_ProductState _value, $Res Function(_$_ProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failure = null,
    Object? productRealtime = freezed,
    Object? addingToCart = null,
    Object? newCartPermissionState = null,
    Object? cartFailureOrSuccess = null,
  }) {
    return _then(_$_ProductState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<ProductFailure>,
      productRealtime: freezed == productRealtime
          ? _value.productRealtime
          : productRealtime // ignore: cast_nullable_to_non_nullable
              as Product?,
      addingToCart: null == addingToCart
          ? _value.addingToCart
          : addingToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      newCartPermissionState: null == newCartPermissionState
          ? _value.newCartPermissionState
          : newCartPermissionState // ignore: cast_nullable_to_non_nullable
              as bool,
      cartFailureOrSuccess: null == cartFailureOrSuccess
          ? _value.cartFailureOrSuccess
          : cartFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CartFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ProductState extends _ProductState {
  const _$_ProductState(
      {required this.isFetching,
      required this.failure,
      required this.productRealtime,
      required this.addingToCart,
      required this.newCartPermissionState,
      required this.cartFailureOrSuccess})
      : super._();

  @override
  final bool isFetching;
  @override
  final Option<ProductFailure> failure;
  @override
  final Product? productRealtime;
  @override
  final bool addingToCart;
  @override
  final bool newCartPermissionState;
  @override
  final Option<Either<CartFailure, Unit>> cartFailureOrSuccess;

  @override
  String toString() {
    return 'ProductState(isFetching: $isFetching, failure: $failure, productRealtime: $productRealtime, addingToCart: $addingToCart, newCartPermissionState: $newCartPermissionState, cartFailureOrSuccess: $cartFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.productRealtime, productRealtime) ||
                other.productRealtime == productRealtime) &&
            (identical(other.addingToCart, addingToCart) ||
                other.addingToCart == addingToCart) &&
            (identical(other.newCartPermissionState, newCartPermissionState) ||
                other.newCartPermissionState == newCartPermissionState) &&
            (identical(other.cartFailureOrSuccess, cartFailureOrSuccess) ||
                other.cartFailureOrSuccess == cartFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      failure,
      productRealtime,
      addingToCart,
      newCartPermissionState,
      cartFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      __$$_ProductStateCopyWithImpl<_$_ProductState>(this, _$identity);
}

abstract class _ProductState extends ProductState {
  const factory _ProductState(
      {required final bool isFetching,
      required final Option<ProductFailure> failure,
      required final Product? productRealtime,
      required final bool addingToCart,
      required final bool newCartPermissionState,
      required final Option<Either<CartFailure, Unit>>
          cartFailureOrSuccess}) = _$_ProductState;
  const _ProductState._() : super._();

  @override
  bool get isFetching;
  @override
  Option<ProductFailure> get failure;
  @override
  Product? get productRealtime;
  @override
  bool get addingToCart;
  @override
  bool get newCartPermissionState;
  @override
  Option<Either<CartFailure, Unit>> get cartFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
