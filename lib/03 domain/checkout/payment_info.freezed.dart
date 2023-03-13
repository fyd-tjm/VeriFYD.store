// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfo {
  double get paymentAmount => throw _privateConstructorUsedError;
  PaymentMode get paymentMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call({double paymentAmount, PaymentMode paymentMode});

  $PaymentModeCopyWith<$Res> get paymentMode;
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentAmount = null,
    Object? paymentMode = null,
  }) {
    return _then(_value.copyWith(
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModeCopyWith<$Res> get paymentMode {
    return $PaymentModeCopyWith<$Res>(_value.paymentMode, (value) {
      return _then(_value.copyWith(paymentMode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentInfoCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$_PaymentInfoCopyWith(
          _$_PaymentInfo value, $Res Function(_$_PaymentInfo) then) =
      __$$_PaymentInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double paymentAmount, PaymentMode paymentMode});

  @override
  $PaymentModeCopyWith<$Res> get paymentMode;
}

/// @nodoc
class __$$_PaymentInfoCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$_PaymentInfo>
    implements _$$_PaymentInfoCopyWith<$Res> {
  __$$_PaymentInfoCopyWithImpl(
      _$_PaymentInfo _value, $Res Function(_$_PaymentInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentAmount = null,
    Object? paymentMode = null,
  }) {
    return _then(_$_PaymentInfo(
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PaymentInfo implements _PaymentInfo {
  const _$_PaymentInfo(
      {required this.paymentAmount, required this.paymentMode});

  factory _$_PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentInfoFromJson(json);

  @override
  final double paymentAmount;
  @override
  final PaymentMode paymentMode;

  @override
  String toString() {
    return 'PaymentInfo(paymentAmount: $paymentAmount, paymentMode: $paymentMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentInfo &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentAmount, paymentMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentInfoCopyWith<_$_PaymentInfo> get copyWith =>
      __$$_PaymentInfoCopyWithImpl<_$_PaymentInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentInfoToJson(
      this,
    );
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  const factory _PaymentInfo(
      {required final double paymentAmount,
      required final PaymentMode paymentMode}) = _$_PaymentInfo;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$_PaymentInfo.fromJson;

  @override
  double get paymentAmount;
  @override
  PaymentMode get paymentMode;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentInfoCopyWith<_$_PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMode _$PaymentModeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'online':
      return Online.fromJson(json);
    case 'payOnDelivery':
      return PayOnDelivery.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PaymentMode',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PaymentMode {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? paymentId) online,
    required TResult Function() payOnDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? paymentId)? online,
    TResult? Function()? payOnDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? paymentId)? online,
    TResult Function()? payOnDelivery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(PayOnDelivery value) payOnDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(PayOnDelivery value)? payOnDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(PayOnDelivery value)? payOnDelivery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModeCopyWith<$Res> {
  factory $PaymentModeCopyWith(
          PaymentMode value, $Res Function(PaymentMode) then) =
      _$PaymentModeCopyWithImpl<$Res, PaymentMode>;
}

/// @nodoc
class _$PaymentModeCopyWithImpl<$Res, $Val extends PaymentMode>
    implements $PaymentModeCopyWith<$Res> {
  _$PaymentModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnlineCopyWith<$Res> {
  factory _$$OnlineCopyWith(_$Online value, $Res Function(_$Online) then) =
      __$$OnlineCopyWithImpl<$Res>;
  @useResult
  $Res call({String? paymentId});
}

/// @nodoc
class __$$OnlineCopyWithImpl<$Res>
    extends _$PaymentModeCopyWithImpl<$Res, _$Online>
    implements _$$OnlineCopyWith<$Res> {
  __$$OnlineCopyWithImpl(_$Online _value, $Res Function(_$Online) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = freezed,
  }) {
    return _then(_$Online(
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Online implements Online {
  const _$Online({this.paymentId, final String? $type})
      : $type = $type ?? 'online';

  factory _$Online.fromJson(Map<String, dynamic> json) =>
      _$$OnlineFromJson(json);

  @override
  final String? paymentId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PaymentMode.online(paymentId: $paymentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Online &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCopyWith<_$Online> get copyWith =>
      __$$OnlineCopyWithImpl<_$Online>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? paymentId) online,
    required TResult Function() payOnDelivery,
  }) {
    return online(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? paymentId)? online,
    TResult? Function()? payOnDelivery,
  }) {
    return online?.call(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? paymentId)? online,
    TResult Function()? payOnDelivery,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(paymentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(PayOnDelivery value) payOnDelivery,
  }) {
    return online(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(PayOnDelivery value)? payOnDelivery,
  }) {
    return online?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(PayOnDelivery value)? payOnDelivery,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineToJson(
      this,
    );
  }
}

abstract class Online implements PaymentMode {
  const factory Online({final String? paymentId}) = _$Online;

  factory Online.fromJson(Map<String, dynamic> json) = _$Online.fromJson;

  String? get paymentId;
  @JsonKey(ignore: true)
  _$$OnlineCopyWith<_$Online> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayOnDeliveryCopyWith<$Res> {
  factory _$$PayOnDeliveryCopyWith(
          _$PayOnDelivery value, $Res Function(_$PayOnDelivery) then) =
      __$$PayOnDeliveryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PayOnDeliveryCopyWithImpl<$Res>
    extends _$PaymentModeCopyWithImpl<$Res, _$PayOnDelivery>
    implements _$$PayOnDeliveryCopyWith<$Res> {
  __$$PayOnDeliveryCopyWithImpl(
      _$PayOnDelivery _value, $Res Function(_$PayOnDelivery) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PayOnDelivery implements PayOnDelivery {
  const _$PayOnDelivery({final String? $type})
      : $type = $type ?? 'payOnDelivery';

  factory _$PayOnDelivery.fromJson(Map<String, dynamic> json) =>
      _$$PayOnDeliveryFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PaymentMode.payOnDelivery()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PayOnDelivery);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? paymentId) online,
    required TResult Function() payOnDelivery,
  }) {
    return payOnDelivery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? paymentId)? online,
    TResult? Function()? payOnDelivery,
  }) {
    return payOnDelivery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? paymentId)? online,
    TResult Function()? payOnDelivery,
    required TResult orElse(),
  }) {
    if (payOnDelivery != null) {
      return payOnDelivery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(PayOnDelivery value) payOnDelivery,
  }) {
    return payOnDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(PayOnDelivery value)? payOnDelivery,
  }) {
    return payOnDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(PayOnDelivery value)? payOnDelivery,
    required TResult orElse(),
  }) {
    if (payOnDelivery != null) {
      return payOnDelivery(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PayOnDeliveryToJson(
      this,
    );
  }
}

abstract class PayOnDelivery implements PaymentMode {
  const factory PayOnDelivery() = _$PayOnDelivery;

  factory PayOnDelivery.fromJson(Map<String, dynamic> json) =
      _$PayOnDelivery.fromJson;
}
