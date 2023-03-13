// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ToggleFailureOrSuccessCopyWith<$Res> {
  factory _$$ToggleFailureOrSuccessCopyWith(_$ToggleFailureOrSuccess value,
          $Res Function(_$ToggleFailureOrSuccess) then) =
      __$$ToggleFailureOrSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleFailureOrSuccessCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ToggleFailureOrSuccess>
    implements _$$ToggleFailureOrSuccessCopyWith<$Res> {
  __$$ToggleFailureOrSuccessCopyWithImpl(_$ToggleFailureOrSuccess _value,
      $Res Function(_$ToggleFailureOrSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleFailureOrSuccess implements ToggleFailureOrSuccess {
  const _$ToggleFailureOrSuccess();

  @override
  String toString() {
    return 'CheckoutEvent.toggleFailureOrSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleFailureOrSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return toggleFailureOrSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return toggleFailureOrSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (toggleFailureOrSuccess != null) {
      return toggleFailureOrSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return toggleFailureOrSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return toggleFailureOrSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (toggleFailureOrSuccess != null) {
      return toggleFailureOrSuccess(this);
    }
    return orElse();
  }
}

abstract class ToggleFailureOrSuccess implements CheckoutEvent {
  const factory ToggleFailureOrSuccess() = _$ToggleFailureOrSuccess;
}

/// @nodoc
abstract class _$$CheckoutInitializationCopyWith<$Res> {
  factory _$$CheckoutInitializationCopyWith(_$CheckoutInitialization value,
          $Res Function(_$CheckoutInitialization) then) =
      __$$CheckoutInitializationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutInitializationCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CheckoutInitialization>
    implements _$$CheckoutInitializationCopyWith<$Res> {
  __$$CheckoutInitializationCopyWithImpl(_$CheckoutInitialization _value,
      $Res Function(_$CheckoutInitialization) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckoutInitialization implements CheckoutInitialization {
  _$CheckoutInitialization();

  @override
  String toString() {
    return 'CheckoutEvent.checkoutInitialization()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutInitialization);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return checkoutInitialization();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return checkoutInitialization?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (checkoutInitialization != null) {
      return checkoutInitialization();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return checkoutInitialization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return checkoutInitialization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (checkoutInitialization != null) {
      return checkoutInitialization(this);
    }
    return orElse();
  }
}

abstract class CheckoutInitialization implements CheckoutEvent {
  factory CheckoutInitialization() = _$CheckoutInitialization;
}

/// @nodoc
abstract class _$$AddShippingInfoCopyWith<$Res> {
  factory _$$AddShippingInfoCopyWith(
          _$AddShippingInfo value, $Res Function(_$AddShippingInfo) then) =
      __$$AddShippingInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({FydAddress shippingAddress});

  $FydAddressCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class __$$AddShippingInfoCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$AddShippingInfo>
    implements _$$AddShippingInfoCopyWith<$Res> {
  __$$AddShippingInfoCopyWithImpl(
      _$AddShippingInfo _value, $Res Function(_$AddShippingInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingAddress = null,
  }) {
    return _then(_$AddShippingInfo(
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as FydAddress,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FydAddressCopyWith<$Res> get shippingAddress {
    return $FydAddressCopyWith<$Res>(_value.shippingAddress, (value) {
      return _then(_value.copyWith(shippingAddress: value));
    });
  }
}

/// @nodoc

class _$AddShippingInfo implements AddShippingInfo {
  _$AddShippingInfo({required this.shippingAddress});

  @override
  final FydAddress shippingAddress;

  @override
  String toString() {
    return 'CheckoutEvent.addShippingInfo(shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddShippingInfo &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shippingAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddShippingInfoCopyWith<_$AddShippingInfo> get copyWith =>
      __$$AddShippingInfoCopyWithImpl<_$AddShippingInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return addShippingInfo(shippingAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return addShippingInfo?.call(shippingAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (addShippingInfo != null) {
      return addShippingInfo(shippingAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return addShippingInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return addShippingInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (addShippingInfo != null) {
      return addShippingInfo(this);
    }
    return orElse();
  }
}

abstract class AddShippingInfo implements CheckoutEvent {
  factory AddShippingInfo({required final FydAddress shippingAddress}) =
      _$AddShippingInfo;

  FydAddress get shippingAddress;
  @JsonKey(ignore: true)
  _$$AddShippingInfoCopyWith<_$AddShippingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPaymentInfoCopyWith<$Res> {
  factory _$$AddPaymentInfoCopyWith(
          _$AddPaymentInfo value, $Res Function(_$AddPaymentInfo) then) =
      __$$AddPaymentInfoCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double amount, PaymentMode mode, Coupon? discountCpn, double total});

  $PaymentModeCopyWith<$Res> get mode;
  $CouponCopyWith<$Res>? get discountCpn;
}

/// @nodoc
class __$$AddPaymentInfoCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$AddPaymentInfo>
    implements _$$AddPaymentInfoCopyWith<$Res> {
  __$$AddPaymentInfoCopyWithImpl(
      _$AddPaymentInfo _value, $Res Function(_$AddPaymentInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? mode = null,
    Object? discountCpn = freezed,
    Object? total = null,
  }) {
    return _then(_$AddPaymentInfo(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
      discountCpn: freezed == discountCpn
          ? _value.discountCpn
          : discountCpn // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModeCopyWith<$Res> get mode {
    return $PaymentModeCopyWith<$Res>(_value.mode, (value) {
      return _then(_value.copyWith(mode: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CouponCopyWith<$Res>? get discountCpn {
    if (_value.discountCpn == null) {
      return null;
    }

    return $CouponCopyWith<$Res>(_value.discountCpn!, (value) {
      return _then(_value.copyWith(discountCpn: value));
    });
  }
}

/// @nodoc

class _$AddPaymentInfo implements AddPaymentInfo {
  _$AddPaymentInfo(
      {required this.amount,
      required this.mode,
      required this.discountCpn,
      required this.total});

  @override
  final double amount;
  @override
  final PaymentMode mode;
  @override
  final Coupon? discountCpn;
  @override
  final double total;

  @override
  String toString() {
    return 'CheckoutEvent.addPaymentInfo(amount: $amount, mode: $mode, discountCpn: $discountCpn, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentInfo &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.discountCpn, discountCpn) ||
                other.discountCpn == discountCpn) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, mode, discountCpn, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentInfoCopyWith<_$AddPaymentInfo> get copyWith =>
      __$$AddPaymentInfoCopyWithImpl<_$AddPaymentInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return addPaymentInfo(amount, mode, discountCpn, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return addPaymentInfo?.call(amount, mode, discountCpn, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (addPaymentInfo != null) {
      return addPaymentInfo(amount, mode, discountCpn, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return addPaymentInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return addPaymentInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (addPaymentInfo != null) {
      return addPaymentInfo(this);
    }
    return orElse();
  }
}

abstract class AddPaymentInfo implements CheckoutEvent {
  factory AddPaymentInfo(
      {required final double amount,
      required final PaymentMode mode,
      required final Coupon? discountCpn,
      required final double total}) = _$AddPaymentInfo;

  double get amount;
  PaymentMode get mode;
  Coupon? get discountCpn;
  double get total;
  @JsonKey(ignore: true)
  _$$AddPaymentInfoCopyWith<_$AddPaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MakePaymentCopyWith<$Res> {
  factory _$$MakePaymentCopyWith(
          _$MakePayment value, $Res Function(_$MakePayment) then) =
      __$$MakePaymentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MakePaymentCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$MakePayment>
    implements _$$MakePaymentCopyWith<$Res> {
  __$$MakePaymentCopyWithImpl(
      _$MakePayment _value, $Res Function(_$MakePayment) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MakePayment implements MakePayment {
  _$MakePayment();

  @override
  String toString() {
    return 'CheckoutEvent.makePayment()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MakePayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return makePayment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return makePayment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (makePayment != null) {
      return makePayment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return makePayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return makePayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (makePayment != null) {
      return makePayment(this);
    }
    return orElse();
  }
}

abstract class MakePayment implements CheckoutEvent {
  factory MakePayment() = _$MakePayment;
}

/// @nodoc
abstract class _$$OnCheckoutSuccessCopyWith<$Res> {
  factory _$$OnCheckoutSuccessCopyWith(
          _$OnCheckoutSuccess value, $Res Function(_$OnCheckoutSuccess) then) =
      __$$OnCheckoutSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentInfo paymentInfo});

  $PaymentInfoCopyWith<$Res> get paymentInfo;
}

/// @nodoc
class __$$OnCheckoutSuccessCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$OnCheckoutSuccess>
    implements _$$OnCheckoutSuccessCopyWith<$Res> {
  __$$OnCheckoutSuccessCopyWithImpl(
      _$OnCheckoutSuccess _value, $Res Function(_$OnCheckoutSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = null,
  }) {
    return _then(_$OnCheckoutSuccess(
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get paymentInfo {
    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value));
    });
  }
}

/// @nodoc

class _$OnCheckoutSuccess implements OnCheckoutSuccess {
  _$OnCheckoutSuccess({required this.paymentInfo});

  @override
  final PaymentInfo paymentInfo;

  @override
  String toString() {
    return 'CheckoutEvent.onCheckoutSuccess(paymentInfo: $paymentInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnCheckoutSuccess &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnCheckoutSuccessCopyWith<_$OnCheckoutSuccess> get copyWith =>
      __$$OnCheckoutSuccessCopyWithImpl<_$OnCheckoutSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return onCheckoutSuccess(paymentInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return onCheckoutSuccess?.call(paymentInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (onCheckoutSuccess != null) {
      return onCheckoutSuccess(paymentInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return onCheckoutSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return onCheckoutSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (onCheckoutSuccess != null) {
      return onCheckoutSuccess(this);
    }
    return orElse();
  }
}

abstract class OnCheckoutSuccess implements CheckoutEvent {
  factory OnCheckoutSuccess({required final PaymentInfo paymentInfo}) =
      _$OnCheckoutSuccess;

  PaymentInfo get paymentInfo;
  @JsonKey(ignore: true)
  _$$OnCheckoutSuccessCopyWith<_$OnCheckoutSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnCheckoutFailureCopyWith<$Res> {
  factory _$$OnCheckoutFailureCopyWith(
          _$OnCheckoutFailure value, $Res Function(_$OnCheckoutFailure) then) =
      __$$OnCheckoutFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnCheckoutFailureCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$OnCheckoutFailure>
    implements _$$OnCheckoutFailureCopyWith<$Res> {
  __$$OnCheckoutFailureCopyWithImpl(
      _$OnCheckoutFailure _value, $Res Function(_$OnCheckoutFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnCheckoutFailure implements OnCheckoutFailure {
  _$OnCheckoutFailure();

  @override
  String toString() {
    return 'CheckoutEvent.onCheckoutFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnCheckoutFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleFailureOrSuccess,
    required TResult Function() checkoutInitialization,
    required TResult Function(FydAddress shippingAddress) addShippingInfo,
    required TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)
        addPaymentInfo,
    required TResult Function() makePayment,
    required TResult Function(PaymentInfo paymentInfo) onCheckoutSuccess,
    required TResult Function() onCheckoutFailure,
  }) {
    return onCheckoutFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleFailureOrSuccess,
    TResult? Function()? checkoutInitialization,
    TResult? Function(FydAddress shippingAddress)? addShippingInfo,
    TResult? Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult? Function()? makePayment,
    TResult? Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult? Function()? onCheckoutFailure,
  }) {
    return onCheckoutFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleFailureOrSuccess,
    TResult Function()? checkoutInitialization,
    TResult Function(FydAddress shippingAddress)? addShippingInfo,
    TResult Function(
            double amount, PaymentMode mode, Coupon? discountCpn, double total)?
        addPaymentInfo,
    TResult Function()? makePayment,
    TResult Function(PaymentInfo paymentInfo)? onCheckoutSuccess,
    TResult Function()? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (onCheckoutFailure != null) {
      return onCheckoutFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleFailureOrSuccess value)
        toggleFailureOrSuccess,
    required TResult Function(CheckoutInitialization value)
        checkoutInitialization,
    required TResult Function(AddShippingInfo value) addShippingInfo,
    required TResult Function(AddPaymentInfo value) addPaymentInfo,
    required TResult Function(MakePayment value) makePayment,
    required TResult Function(OnCheckoutSuccess value) onCheckoutSuccess,
    required TResult Function(OnCheckoutFailure value) onCheckoutFailure,
  }) {
    return onCheckoutFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult? Function(CheckoutInitialization value)? checkoutInitialization,
    TResult? Function(AddShippingInfo value)? addShippingInfo,
    TResult? Function(AddPaymentInfo value)? addPaymentInfo,
    TResult? Function(MakePayment value)? makePayment,
    TResult? Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult? Function(OnCheckoutFailure value)? onCheckoutFailure,
  }) {
    return onCheckoutFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleFailureOrSuccess value)? toggleFailureOrSuccess,
    TResult Function(CheckoutInitialization value)? checkoutInitialization,
    TResult Function(AddShippingInfo value)? addShippingInfo,
    TResult Function(AddPaymentInfo value)? addPaymentInfo,
    TResult Function(MakePayment value)? makePayment,
    TResult Function(OnCheckoutSuccess value)? onCheckoutSuccess,
    TResult Function(OnCheckoutFailure value)? onCheckoutFailure,
    required TResult orElse(),
  }) {
    if (onCheckoutFailure != null) {
      return onCheckoutFailure(this);
    }
    return orElse();
  }
}

abstract class OnCheckoutFailure implements CheckoutEvent {
  factory OnCheckoutFailure() = _$OnCheckoutFailure;
}

/// @nodoc
mixin _$CheckoutState {
  String? get orderId => throw _privateConstructorUsedError;
  OrderStatus? get orderStatus => throw _privateConstructorUsedError;
  OrderInfo? get orderInfo => throw _privateConstructorUsedError;
  CustomerInfo? get customerInfo => throw _privateConstructorUsedError;
  ShippingInfo? get shippingInfo => throw _privateConstructorUsedError;
  PaymentInfo? get paymentInfo => throw _privateConstructorUsedError;
  bool get isProcessing => throw _privateConstructorUsedError;
  Map<String, Coupon>? get coupons => throw _privateConstructorUsedError;
  Option<Either<CheckoutFailure, Unit>> get failureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {String? orderId,
      OrderStatus? orderStatus,
      OrderInfo? orderInfo,
      CustomerInfo? customerInfo,
      ShippingInfo? shippingInfo,
      PaymentInfo? paymentInfo,
      bool isProcessing,
      Map<String, Coupon>? coupons,
      Option<Either<CheckoutFailure, Unit>> failureOrSuccess});

  $OrderStatusCopyWith<$Res>? get orderStatus;
  $OrderInfoCopyWith<$Res>? get orderInfo;
  $CustomerInfoCopyWith<$Res>? get customerInfo;
  $ShippingInfoCopyWith<$Res>? get shippingInfo;
  $PaymentInfoCopyWith<$Res>? get paymentInfo;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderStatus = freezed,
    Object? orderInfo = freezed,
    Object? customerInfo = freezed,
    Object? shippingInfo = freezed,
    Object? paymentInfo = freezed,
    Object? isProcessing = null,
    Object? coupons = freezed,
    Object? failureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      orderInfo: freezed == orderInfo
          ? _value.orderInfo
          : orderInfo // ignore: cast_nullable_to_non_nullable
              as OrderInfo?,
      customerInfo: freezed == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo?,
      shippingInfo: freezed == shippingInfo
          ? _value.shippingInfo
          : shippingInfo // ignore: cast_nullable_to_non_nullable
              as ShippingInfo?,
      paymentInfo: freezed == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      coupons: freezed == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as Map<String, Coupon>?,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CheckoutFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderStatusCopyWith<$Res>? get orderStatus {
    if (_value.orderStatus == null) {
      return null;
    }

    return $OrderStatusCopyWith<$Res>(_value.orderStatus!, (value) {
      return _then(_value.copyWith(orderStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderInfoCopyWith<$Res>? get orderInfo {
    if (_value.orderInfo == null) {
      return null;
    }

    return $OrderInfoCopyWith<$Res>(_value.orderInfo!, (value) {
      return _then(_value.copyWith(orderInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerInfoCopyWith<$Res>? get customerInfo {
    if (_value.customerInfo == null) {
      return null;
    }

    return $CustomerInfoCopyWith<$Res>(_value.customerInfo!, (value) {
      return _then(_value.copyWith(customerInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShippingInfoCopyWith<$Res>? get shippingInfo {
    if (_value.shippingInfo == null) {
      return null;
    }

    return $ShippingInfoCopyWith<$Res>(_value.shippingInfo!, (value) {
      return _then(_value.copyWith(shippingInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res>? get paymentInfo {
    if (_value.paymentInfo == null) {
      return null;
    }

    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo!, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$_CheckoutStateCopyWith(
          _$_CheckoutState value, $Res Function(_$_CheckoutState) then) =
      __$$_CheckoutStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? orderId,
      OrderStatus? orderStatus,
      OrderInfo? orderInfo,
      CustomerInfo? customerInfo,
      ShippingInfo? shippingInfo,
      PaymentInfo? paymentInfo,
      bool isProcessing,
      Map<String, Coupon>? coupons,
      Option<Either<CheckoutFailure, Unit>> failureOrSuccess});

  @override
  $OrderStatusCopyWith<$Res>? get orderStatus;
  @override
  $OrderInfoCopyWith<$Res>? get orderInfo;
  @override
  $CustomerInfoCopyWith<$Res>? get customerInfo;
  @override
  $ShippingInfoCopyWith<$Res>? get shippingInfo;
  @override
  $PaymentInfoCopyWith<$Res>? get paymentInfo;
}

/// @nodoc
class __$$_CheckoutStateCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$_CheckoutState>
    implements _$$_CheckoutStateCopyWith<$Res> {
  __$$_CheckoutStateCopyWithImpl(
      _$_CheckoutState _value, $Res Function(_$_CheckoutState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? orderStatus = freezed,
    Object? orderInfo = freezed,
    Object? customerInfo = freezed,
    Object? shippingInfo = freezed,
    Object? paymentInfo = freezed,
    Object? isProcessing = null,
    Object? coupons = freezed,
    Object? failureOrSuccess = null,
  }) {
    return _then(_$_CheckoutState(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      orderInfo: freezed == orderInfo
          ? _value.orderInfo
          : orderInfo // ignore: cast_nullable_to_non_nullable
              as OrderInfo?,
      customerInfo: freezed == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo?,
      shippingInfo: freezed == shippingInfo
          ? _value.shippingInfo
          : shippingInfo // ignore: cast_nullable_to_non_nullable
              as ShippingInfo?,
      paymentInfo: freezed == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      coupons: freezed == coupons
          ? _value._coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as Map<String, Coupon>?,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CheckoutFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CheckoutState implements _CheckoutState {
  const _$_CheckoutState(
      {required this.orderId,
      required this.orderStatus,
      required this.orderInfo,
      required this.customerInfo,
      required this.shippingInfo,
      required this.paymentInfo,
      required this.isProcessing,
      required final Map<String, Coupon>? coupons,
      required this.failureOrSuccess})
      : _coupons = coupons;

  @override
  final String? orderId;
  @override
  final OrderStatus? orderStatus;
  @override
  final OrderInfo? orderInfo;
  @override
  final CustomerInfo? customerInfo;
  @override
  final ShippingInfo? shippingInfo;
  @override
  final PaymentInfo? paymentInfo;
  @override
  final bool isProcessing;
  final Map<String, Coupon>? _coupons;
  @override
  Map<String, Coupon>? get coupons {
    final value = _coupons;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Option<Either<CheckoutFailure, Unit>> failureOrSuccess;

  @override
  String toString() {
    return 'CheckoutState(orderId: $orderId, orderStatus: $orderStatus, orderInfo: $orderInfo, customerInfo: $customerInfo, shippingInfo: $shippingInfo, paymentInfo: $paymentInfo, isProcessing: $isProcessing, coupons: $coupons, failureOrSuccess: $failureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutState &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.orderInfo, orderInfo) ||
                other.orderInfo == orderInfo) &&
            (identical(other.customerInfo, customerInfo) ||
                other.customerInfo == customerInfo) &&
            (identical(other.shippingInfo, shippingInfo) ||
                other.shippingInfo == shippingInfo) &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            const DeepCollectionEquality().equals(other._coupons, _coupons) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      orderStatus,
      orderInfo,
      customerInfo,
      shippingInfo,
      paymentInfo,
      isProcessing,
      const DeepCollectionEquality().hash(_coupons),
      failureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      __$$_CheckoutStateCopyWithImpl<_$_CheckoutState>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState(
      {required final String? orderId,
      required final OrderStatus? orderStatus,
      required final OrderInfo? orderInfo,
      required final CustomerInfo? customerInfo,
      required final ShippingInfo? shippingInfo,
      required final PaymentInfo? paymentInfo,
      required final bool isProcessing,
      required final Map<String, Coupon>? coupons,
      required final Option<Either<CheckoutFailure, Unit>>
          failureOrSuccess}) = _$_CheckoutState;

  @override
  String? get orderId;
  @override
  OrderStatus? get orderStatus;
  @override
  OrderInfo? get orderInfo;
  @override
  CustomerInfo? get customerInfo;
  @override
  ShippingInfo? get shippingInfo;
  @override
  PaymentInfo? get paymentInfo;
  @override
  bool get isProcessing;
  @override
  Map<String, Coupon>? get coupons;
  @override
  Option<Either<CheckoutFailure, Unit>> get failureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}
