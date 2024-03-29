// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shipping_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) {
  return _ShippingInfo.fromJson(json);
}

/// @nodoc
mixin _$ShippingInfo {
  FydAddress get shippingAddress => throw _privateConstructorUsedError;
  double get shippingCost => throw _privateConstructorUsedError;
  String get trackingUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShippingInfoCopyWith<ShippingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingInfoCopyWith<$Res> {
  factory $ShippingInfoCopyWith(
          ShippingInfo value, $Res Function(ShippingInfo) then) =
      _$ShippingInfoCopyWithImpl<$Res, ShippingInfo>;
  @useResult
  $Res call(
      {FydAddress shippingAddress, double shippingCost, String trackingUrl});

  $FydAddressCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class _$ShippingInfoCopyWithImpl<$Res, $Val extends ShippingInfo>
    implements $ShippingInfoCopyWith<$Res> {
  _$ShippingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingAddress = null,
    Object? shippingCost = null,
    Object? trackingUrl = null,
  }) {
    return _then(_value.copyWith(
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as FydAddress,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      trackingUrl: null == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FydAddressCopyWith<$Res> get shippingAddress {
    return $FydAddressCopyWith<$Res>(_value.shippingAddress, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ShippingInfoCopyWith<$Res>
    implements $ShippingInfoCopyWith<$Res> {
  factory _$$_ShippingInfoCopyWith(
          _$_ShippingInfo value, $Res Function(_$_ShippingInfo) then) =
      __$$_ShippingInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FydAddress shippingAddress, double shippingCost, String trackingUrl});

  @override
  $FydAddressCopyWith<$Res> get shippingAddress;
}

/// @nodoc
class __$$_ShippingInfoCopyWithImpl<$Res>
    extends _$ShippingInfoCopyWithImpl<$Res, _$_ShippingInfo>
    implements _$$_ShippingInfoCopyWith<$Res> {
  __$$_ShippingInfoCopyWithImpl(
      _$_ShippingInfo _value, $Res Function(_$_ShippingInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingAddress = null,
    Object? shippingCost = null,
    Object? trackingUrl = null,
  }) {
    return _then(_$_ShippingInfo(
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as FydAddress,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      trackingUrl: null == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ShippingInfo implements _ShippingInfo {
  const _$_ShippingInfo(
      {required this.shippingAddress,
      required this.shippingCost,
      required this.trackingUrl});

  factory _$_ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ShippingInfoFromJson(json);

  @override
  final FydAddress shippingAddress;
  @override
  final double shippingCost;
  @override
  final String trackingUrl;

  @override
  String toString() {
    return 'ShippingInfo(shippingAddress: $shippingAddress, shippingCost: $shippingCost, trackingUrl: $trackingUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShippingInfo &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.trackingUrl, trackingUrl) ||
                other.trackingUrl == trackingUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, shippingAddress, shippingCost, trackingUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShippingInfoCopyWith<_$_ShippingInfo> get copyWith =>
      __$$_ShippingInfoCopyWithImpl<_$_ShippingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShippingInfoToJson(
      this,
    );
  }
}

abstract class _ShippingInfo implements ShippingInfo {
  const factory _ShippingInfo(
      {required final FydAddress shippingAddress,
      required final double shippingCost,
      required final String trackingUrl}) = _$_ShippingInfo;

  factory _ShippingInfo.fromJson(Map<String, dynamic> json) =
      _$_ShippingInfo.fromJson;

  @override
  FydAddress get shippingAddress;
  @override
  double get shippingCost;
  @override
  String get trackingUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ShippingInfoCopyWith<_$_ShippingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
