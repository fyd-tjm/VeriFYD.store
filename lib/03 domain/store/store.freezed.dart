// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  String get storeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  Map<String, int> get types => throw _privateConstructorUsedError;
  Map<String, String> get socialPresence => throw _privateConstructorUsedError;
  Map<int, String> get featuredIn => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get storeLogo => throw _privateConstructorUsedError;
  Map<int, String> get storeAddress => throw _privateConstructorUsedError;
  Map<int, String> get storeContact => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;
  Map<String, String> get offers => throw _privateConstructorUsedError;
  Map<String, Coupon> get coupons => throw _privateConstructorUsedError;
  Map<int, String> get storeAlerts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {String storeId,
      String name,
      List<String> categories,
      Map<String, int> types,
      Map<String, String> socialPresence,
      Map<int, String> featuredIn,
      double rating,
      String about,
      String storeLogo,
      Map<int, String> storeAddress,
      Map<int, String> storeContact,
      bool isLive,
      Map<String, String> offers,
      Map<String, Coupon> coupons,
      Map<int, String> storeAlerts});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? name = null,
    Object? categories = null,
    Object? types = null,
    Object? socialPresence = null,
    Object? featuredIn = null,
    Object? rating = null,
    Object? about = null,
    Object? storeLogo = null,
    Object? storeAddress = null,
    Object? storeContact = null,
    Object? isLive = null,
    Object? offers = null,
    Object? coupons = null,
    Object? storeAlerts = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      socialPresence: null == socialPresence
          ? _value.socialPresence
          : socialPresence // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      featuredIn: null == featuredIn
          ? _value.featuredIn
          : featuredIn // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      storeLogo: null == storeLogo
          ? _value.storeLogo
          : storeLogo // ignore: cast_nullable_to_non_nullable
              as String,
      storeAddress: null == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      storeContact: null == storeContact
          ? _value.storeContact
          : storeContact // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      offers: null == offers
          ? _value.offers
          : offers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      coupons: null == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as Map<String, Coupon>,
      storeAlerts: null == storeAlerts
          ? _value.storeAlerts
          : storeAlerts // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$_StoreCopyWith(_$_Store value, $Res Function(_$_Store) then) =
      __$$_StoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String storeId,
      String name,
      List<String> categories,
      Map<String, int> types,
      Map<String, String> socialPresence,
      Map<int, String> featuredIn,
      double rating,
      String about,
      String storeLogo,
      Map<int, String> storeAddress,
      Map<int, String> storeContact,
      bool isLive,
      Map<String, String> offers,
      Map<String, Coupon> coupons,
      Map<int, String> storeAlerts});
}

/// @nodoc
class __$$_StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res, _$_Store>
    implements _$$_StoreCopyWith<$Res> {
  __$$_StoreCopyWithImpl(_$_Store _value, $Res Function(_$_Store) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? name = null,
    Object? categories = null,
    Object? types = null,
    Object? socialPresence = null,
    Object? featuredIn = null,
    Object? rating = null,
    Object? about = null,
    Object? storeLogo = null,
    Object? storeAddress = null,
    Object? storeContact = null,
    Object? isLive = null,
    Object? offers = null,
    Object? coupons = null,
    Object? storeAlerts = null,
  }) {
    return _then(_$_Store(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      socialPresence: null == socialPresence
          ? _value._socialPresence
          : socialPresence // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      featuredIn: null == featuredIn
          ? _value._featuredIn
          : featuredIn // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      storeLogo: null == storeLogo
          ? _value.storeLogo
          : storeLogo // ignore: cast_nullable_to_non_nullable
              as String,
      storeAddress: null == storeAddress
          ? _value._storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      storeContact: null == storeContact
          ? _value._storeContact
          : storeContact // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      offers: null == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      coupons: null == coupons
          ? _value._coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as Map<String, Coupon>,
      storeAlerts: null == storeAlerts
          ? _value._storeAlerts
          : storeAlerts // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Store implements _Store {
  const _$_Store(
      {required this.storeId,
      required this.name,
      required final List<String> categories,
      required final Map<String, int> types,
      required final Map<String, String> socialPresence,
      required final Map<int, String> featuredIn,
      required this.rating,
      required this.about,
      required this.storeLogo,
      required final Map<int, String> storeAddress,
      required final Map<int, String> storeContact,
      required this.isLive,
      required final Map<String, String> offers,
      required final Map<String, Coupon> coupons,
      required final Map<int, String> storeAlerts})
      : _categories = categories,
        _types = types,
        _socialPresence = socialPresence,
        _featuredIn = featuredIn,
        _storeAddress = storeAddress,
        _storeContact = storeContact,
        _offers = offers,
        _coupons = coupons,
        _storeAlerts = storeAlerts;

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$$_StoreFromJson(json);

  @override
  final String storeId;
  @override
  final String name;
  final List<String> _categories;
  @override
  List<String> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final Map<String, int> _types;
  @override
  Map<String, int> get types {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_types);
  }

  final Map<String, String> _socialPresence;
  @override
  Map<String, String> get socialPresence {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_socialPresence);
  }

  final Map<int, String> _featuredIn;
  @override
  Map<int, String> get featuredIn {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_featuredIn);
  }

  @override
  final double rating;
  @override
  final String about;
  @override
  final String storeLogo;
  final Map<int, String> _storeAddress;
  @override
  Map<int, String> get storeAddress {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_storeAddress);
  }

  final Map<int, String> _storeContact;
  @override
  Map<int, String> get storeContact {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_storeContact);
  }

  @override
  final bool isLive;
  final Map<String, String> _offers;
  @override
  Map<String, String> get offers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_offers);
  }

  final Map<String, Coupon> _coupons;
  @override
  Map<String, Coupon> get coupons {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_coupons);
  }

  final Map<int, String> _storeAlerts;
  @override
  Map<int, String> get storeAlerts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_storeAlerts);
  }

  @override
  String toString() {
    return 'Store(storeId: $storeId, name: $name, categories: $categories, types: $types, socialPresence: $socialPresence, featuredIn: $featuredIn, rating: $rating, about: $about, storeLogo: $storeLogo, storeAddress: $storeAddress, storeContact: $storeContact, isLive: $isLive, offers: $offers, coupons: $coupons, storeAlerts: $storeAlerts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Store &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._socialPresence, _socialPresence) &&
            const DeepCollectionEquality()
                .equals(other._featuredIn, _featuredIn) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.storeLogo, storeLogo) ||
                other.storeLogo == storeLogo) &&
            const DeepCollectionEquality()
                .equals(other._storeAddress, _storeAddress) &&
            const DeepCollectionEquality()
                .equals(other._storeContact, _storeContact) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            const DeepCollectionEquality().equals(other._offers, _offers) &&
            const DeepCollectionEquality().equals(other._coupons, _coupons) &&
            const DeepCollectionEquality()
                .equals(other._storeAlerts, _storeAlerts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeId,
      name,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_socialPresence),
      const DeepCollectionEquality().hash(_featuredIn),
      rating,
      about,
      storeLogo,
      const DeepCollectionEquality().hash(_storeAddress),
      const DeepCollectionEquality().hash(_storeContact),
      isLive,
      const DeepCollectionEquality().hash(_offers),
      const DeepCollectionEquality().hash(_coupons),
      const DeepCollectionEquality().hash(_storeAlerts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      __$$_StoreCopyWithImpl<_$_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreToJson(
      this,
    );
  }
}

abstract class _Store implements Store {
  const factory _Store(
      {required final String storeId,
      required final String name,
      required final List<String> categories,
      required final Map<String, int> types,
      required final Map<String, String> socialPresence,
      required final Map<int, String> featuredIn,
      required final double rating,
      required final String about,
      required final String storeLogo,
      required final Map<int, String> storeAddress,
      required final Map<int, String> storeContact,
      required final bool isLive,
      required final Map<String, String> offers,
      required final Map<String, Coupon> coupons,
      required final Map<int, String> storeAlerts}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  String get storeId;
  @override
  String get name;
  @override
  List<String> get categories;
  @override
  Map<String, int> get types;
  @override
  Map<String, String> get socialPresence;
  @override
  Map<int, String> get featuredIn;
  @override
  double get rating;
  @override
  String get about;
  @override
  String get storeLogo;
  @override
  Map<int, String> get storeAddress;
  @override
  Map<int, String> get storeContact;
  @override
  bool get isLive;
  @override
  Map<String, String> get offers;
  @override
  Map<String, Coupon> get coupons;
  @override
  Map<int, String> get storeAlerts;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      throw _privateConstructorUsedError;
}
