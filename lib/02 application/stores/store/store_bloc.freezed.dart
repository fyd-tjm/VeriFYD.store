// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String storeId) getStoreRealtime,
    required TResult Function(Either<StoreFailure, Store> event)
        recievedStreamEvent,
    required TResult Function(String type) updateSelectedType,
    required TResult Function() loadMoreProducts,
    required TResult Function() toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? getStoreRealtime,
    TResult? Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult? Function(String type)? updateSelectedType,
    TResult? Function()? loadMoreProducts,
    TResult? Function()? toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? getStoreRealtime,
    TResult Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult Function(String type)? updateSelectedType,
    TResult Function()? loadMoreProducts,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStoreRealtime value) getStoreRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(UpdateSelectedType value) updateSelectedType,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoreRealtime value)? getStoreRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(UpdateSelectedType value)? updateSelectedType,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoreRealtime value)? getStoreRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(UpdateSelectedType value)? updateSelectedType,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreEventCopyWith<$Res> {
  factory $StoreEventCopyWith(
          StoreEvent value, $Res Function(StoreEvent) then) =
      _$StoreEventCopyWithImpl<$Res, StoreEvent>;
}

/// @nodoc
class _$StoreEventCopyWithImpl<$Res, $Val extends StoreEvent>
    implements $StoreEventCopyWith<$Res> {
  _$StoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetStoreRealtimeCopyWith<$Res> {
  factory _$$GetStoreRealtimeCopyWith(
          _$GetStoreRealtime value, $Res Function(_$GetStoreRealtime) then) =
      __$$GetStoreRealtimeCopyWithImpl<$Res>;
  @useResult
  $Res call({String storeId});
}

/// @nodoc
class __$$GetStoreRealtimeCopyWithImpl<$Res>
    extends _$StoreEventCopyWithImpl<$Res, _$GetStoreRealtime>
    implements _$$GetStoreRealtimeCopyWith<$Res> {
  __$$GetStoreRealtimeCopyWithImpl(
      _$GetStoreRealtime _value, $Res Function(_$GetStoreRealtime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_$GetStoreRealtime(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetStoreRealtime implements GetStoreRealtime {
  const _$GetStoreRealtime({required this.storeId});

  @override
  final String storeId;

  @override
  String toString() {
    return 'StoreEvent.getStoreRealtime(storeId: $storeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStoreRealtime &&
            (identical(other.storeId, storeId) || other.storeId == storeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStoreRealtimeCopyWith<_$GetStoreRealtime> get copyWith =>
      __$$GetStoreRealtimeCopyWithImpl<_$GetStoreRealtime>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String storeId) getStoreRealtime,
    required TResult Function(Either<StoreFailure, Store> event)
        recievedStreamEvent,
    required TResult Function(String type) updateSelectedType,
    required TResult Function() loadMoreProducts,
    required TResult Function() toggleFailures,
  }) {
    return getStoreRealtime(storeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? getStoreRealtime,
    TResult? Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult? Function(String type)? updateSelectedType,
    TResult? Function()? loadMoreProducts,
    TResult? Function()? toggleFailures,
  }) {
    return getStoreRealtime?.call(storeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? getStoreRealtime,
    TResult Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult Function(String type)? updateSelectedType,
    TResult Function()? loadMoreProducts,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) {
    if (getStoreRealtime != null) {
      return getStoreRealtime(storeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStoreRealtime value) getStoreRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(UpdateSelectedType value) updateSelectedType,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return getStoreRealtime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoreRealtime value)? getStoreRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(UpdateSelectedType value)? updateSelectedType,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return getStoreRealtime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoreRealtime value)? getStoreRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(UpdateSelectedType value)? updateSelectedType,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (getStoreRealtime != null) {
      return getStoreRealtime(this);
    }
    return orElse();
  }
}

abstract class GetStoreRealtime implements StoreEvent {
  const factory GetStoreRealtime({required final String storeId}) =
      _$GetStoreRealtime;

  String get storeId;
  @JsonKey(ignore: true)
  _$$GetStoreRealtimeCopyWith<_$GetStoreRealtime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecievedStreamEventCopyWith<$Res> {
  factory _$$RecievedStreamEventCopyWith(_$RecievedStreamEvent value,
          $Res Function(_$RecievedStreamEvent) then) =
      __$$RecievedStreamEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<StoreFailure, Store> event});
}

/// @nodoc
class __$$RecievedStreamEventCopyWithImpl<$Res>
    extends _$StoreEventCopyWithImpl<$Res, _$RecievedStreamEvent>
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
              as Either<StoreFailure, Store>,
    ));
  }
}

/// @nodoc

class _$RecievedStreamEvent implements RecievedStreamEvent {
  const _$RecievedStreamEvent({required this.event});

  @override
  final Either<StoreFailure, Store> event;

  @override
  String toString() {
    return 'StoreEvent.recievedStreamEvent(event: $event)';
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
    required TResult Function(String storeId) getStoreRealtime,
    required TResult Function(Either<StoreFailure, Store> event)
        recievedStreamEvent,
    required TResult Function(String type) updateSelectedType,
    required TResult Function() loadMoreProducts,
    required TResult Function() toggleFailures,
  }) {
    return recievedStreamEvent(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? getStoreRealtime,
    TResult? Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult? Function(String type)? updateSelectedType,
    TResult? Function()? loadMoreProducts,
    TResult? Function()? toggleFailures,
  }) {
    return recievedStreamEvent?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? getStoreRealtime,
    TResult Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult Function(String type)? updateSelectedType,
    TResult Function()? loadMoreProducts,
    TResult Function()? toggleFailures,
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
    required TResult Function(GetStoreRealtime value) getStoreRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(UpdateSelectedType value) updateSelectedType,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return recievedStreamEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoreRealtime value)? getStoreRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(UpdateSelectedType value)? updateSelectedType,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return recievedStreamEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoreRealtime value)? getStoreRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(UpdateSelectedType value)? updateSelectedType,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (recievedStreamEvent != null) {
      return recievedStreamEvent(this);
    }
    return orElse();
  }
}

abstract class RecievedStreamEvent implements StoreEvent {
  const factory RecievedStreamEvent(
          {required final Either<StoreFailure, Store> event}) =
      _$RecievedStreamEvent;

  Either<StoreFailure, Store> get event;
  @JsonKey(ignore: true)
  _$$RecievedStreamEventCopyWith<_$RecievedStreamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSelectedTypeCopyWith<$Res> {
  factory _$$UpdateSelectedTypeCopyWith(_$UpdateSelectedType value,
          $Res Function(_$UpdateSelectedType) then) =
      __$$UpdateSelectedTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$UpdateSelectedTypeCopyWithImpl<$Res>
    extends _$StoreEventCopyWithImpl<$Res, _$UpdateSelectedType>
    implements _$$UpdateSelectedTypeCopyWith<$Res> {
  __$$UpdateSelectedTypeCopyWithImpl(
      _$UpdateSelectedType _value, $Res Function(_$UpdateSelectedType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$UpdateSelectedType(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSelectedType implements UpdateSelectedType {
  const _$UpdateSelectedType({required this.type});

  @override
  final String type;

  @override
  String toString() {
    return 'StoreEvent.updateSelectedType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSelectedType &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSelectedTypeCopyWith<_$UpdateSelectedType> get copyWith =>
      __$$UpdateSelectedTypeCopyWithImpl<_$UpdateSelectedType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String storeId) getStoreRealtime,
    required TResult Function(Either<StoreFailure, Store> event)
        recievedStreamEvent,
    required TResult Function(String type) updateSelectedType,
    required TResult Function() loadMoreProducts,
    required TResult Function() toggleFailures,
  }) {
    return updateSelectedType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? getStoreRealtime,
    TResult? Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult? Function(String type)? updateSelectedType,
    TResult? Function()? loadMoreProducts,
    TResult? Function()? toggleFailures,
  }) {
    return updateSelectedType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? getStoreRealtime,
    TResult Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult Function(String type)? updateSelectedType,
    TResult Function()? loadMoreProducts,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) {
    if (updateSelectedType != null) {
      return updateSelectedType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStoreRealtime value) getStoreRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(UpdateSelectedType value) updateSelectedType,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return updateSelectedType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoreRealtime value)? getStoreRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(UpdateSelectedType value)? updateSelectedType,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return updateSelectedType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoreRealtime value)? getStoreRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(UpdateSelectedType value)? updateSelectedType,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (updateSelectedType != null) {
      return updateSelectedType(this);
    }
    return orElse();
  }
}

abstract class UpdateSelectedType implements StoreEvent {
  const factory UpdateSelectedType({required final String type}) =
      _$UpdateSelectedType;

  String get type;
  @JsonKey(ignore: true)
  _$$UpdateSelectedTypeCopyWith<_$UpdateSelectedType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreProductsCopyWith<$Res> {
  factory _$$LoadMoreProductsCopyWith(
          _$LoadMoreProducts value, $Res Function(_$LoadMoreProducts) then) =
      __$$LoadMoreProductsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreProductsCopyWithImpl<$Res>
    extends _$StoreEventCopyWithImpl<$Res, _$LoadMoreProducts>
    implements _$$LoadMoreProductsCopyWith<$Res> {
  __$$LoadMoreProductsCopyWithImpl(
      _$LoadMoreProducts _value, $Res Function(_$LoadMoreProducts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreProducts implements LoadMoreProducts {
  const _$LoadMoreProducts();

  @override
  String toString() {
    return 'StoreEvent.loadMoreProducts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String storeId) getStoreRealtime,
    required TResult Function(Either<StoreFailure, Store> event)
        recievedStreamEvent,
    required TResult Function(String type) updateSelectedType,
    required TResult Function() loadMoreProducts,
    required TResult Function() toggleFailures,
  }) {
    return loadMoreProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? getStoreRealtime,
    TResult? Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult? Function(String type)? updateSelectedType,
    TResult? Function()? loadMoreProducts,
    TResult? Function()? toggleFailures,
  }) {
    return loadMoreProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? getStoreRealtime,
    TResult Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult Function(String type)? updateSelectedType,
    TResult Function()? loadMoreProducts,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetStoreRealtime value) getStoreRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(UpdateSelectedType value) updateSelectedType,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return loadMoreProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoreRealtime value)? getStoreRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(UpdateSelectedType value)? updateSelectedType,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return loadMoreProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoreRealtime value)? getStoreRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(UpdateSelectedType value)? updateSelectedType,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts(this);
    }
    return orElse();
  }
}

abstract class LoadMoreProducts implements StoreEvent {
  const factory LoadMoreProducts() = _$LoadMoreProducts;
}

/// @nodoc
abstract class _$$ToggleFailuresCopyWith<$Res> {
  factory _$$ToggleFailuresCopyWith(
          _$ToggleFailures value, $Res Function(_$ToggleFailures) then) =
      __$$ToggleFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleFailuresCopyWithImpl<$Res>
    extends _$StoreEventCopyWithImpl<$Res, _$ToggleFailures>
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
    return 'StoreEvent.toggleFailures()';
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
    required TResult Function(String storeId) getStoreRealtime,
    required TResult Function(Either<StoreFailure, Store> event)
        recievedStreamEvent,
    required TResult Function(String type) updateSelectedType,
    required TResult Function() loadMoreProducts,
    required TResult Function() toggleFailures,
  }) {
    return toggleFailures();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? getStoreRealtime,
    TResult? Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult? Function(String type)? updateSelectedType,
    TResult? Function()? loadMoreProducts,
    TResult? Function()? toggleFailures,
  }) {
    return toggleFailures?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? getStoreRealtime,
    TResult Function(Either<StoreFailure, Store> event)? recievedStreamEvent,
    TResult Function(String type)? updateSelectedType,
    TResult Function()? loadMoreProducts,
    TResult Function()? toggleFailures,
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
    required TResult Function(GetStoreRealtime value) getStoreRealtime,
    required TResult Function(RecievedStreamEvent value) recievedStreamEvent,
    required TResult Function(UpdateSelectedType value) updateSelectedType,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return toggleFailures(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetStoreRealtime value)? getStoreRealtime,
    TResult? Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult? Function(UpdateSelectedType value)? updateSelectedType,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return toggleFailures?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetStoreRealtime value)? getStoreRealtime,
    TResult Function(RecievedStreamEvent value)? recievedStreamEvent,
    TResult Function(UpdateSelectedType value)? updateSelectedType,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (toggleFailures != null) {
      return toggleFailures(this);
    }
    return orElse();
  }
}

abstract class ToggleFailures implements StoreEvent {
  const factory ToggleFailures() = _$ToggleFailures;
}

/// @nodoc
mixin _$StoreState {
  bool get isFetching => throw _privateConstructorUsedError;
  String? get selectedType => throw _privateConstructorUsedError;
  Store? get storeRealtime => throw _privateConstructorUsedError;
  List<Product> get productList => throw _privateConstructorUsedError;
  bool get notAvailable => throw _privateConstructorUsedError;
  Option<Either<StoreFailure, ProductFailure>> get failure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreStateCopyWith<StoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreStateCopyWith<$Res> {
  factory $StoreStateCopyWith(
          StoreState value, $Res Function(StoreState) then) =
      _$StoreStateCopyWithImpl<$Res, StoreState>;
  @useResult
  $Res call(
      {bool isFetching,
      String? selectedType,
      Store? storeRealtime,
      List<Product> productList,
      bool notAvailable,
      Option<Either<StoreFailure, ProductFailure>> failure});

  $StoreCopyWith<$Res>? get storeRealtime;
}

/// @nodoc
class _$StoreStateCopyWithImpl<$Res, $Val extends StoreState>
    implements $StoreStateCopyWith<$Res> {
  _$StoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? selectedType = freezed,
    Object? storeRealtime = freezed,
    Object? productList = null,
    Object? notAvailable = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
      storeRealtime: freezed == storeRealtime
          ? _value.storeRealtime
          : storeRealtime // ignore: cast_nullable_to_non_nullable
              as Store?,
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      notAvailable: null == notAvailable
          ? _value.notAvailable
          : notAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Either<StoreFailure, ProductFailure>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCopyWith<$Res>? get storeRealtime {
    if (_value.storeRealtime == null) {
      return null;
    }

    return $StoreCopyWith<$Res>(_value.storeRealtime!, (value) {
      return _then(_value.copyWith(storeRealtime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoreStateCopyWith<$Res>
    implements $StoreStateCopyWith<$Res> {
  factory _$$_StoreStateCopyWith(
          _$_StoreState value, $Res Function(_$_StoreState) then) =
      __$$_StoreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      String? selectedType,
      Store? storeRealtime,
      List<Product> productList,
      bool notAvailable,
      Option<Either<StoreFailure, ProductFailure>> failure});

  @override
  $StoreCopyWith<$Res>? get storeRealtime;
}

/// @nodoc
class __$$_StoreStateCopyWithImpl<$Res>
    extends _$StoreStateCopyWithImpl<$Res, _$_StoreState>
    implements _$$_StoreStateCopyWith<$Res> {
  __$$_StoreStateCopyWithImpl(
      _$_StoreState _value, $Res Function(_$_StoreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? selectedType = freezed,
    Object? storeRealtime = freezed,
    Object? productList = null,
    Object? notAvailable = null,
    Object? failure = null,
  }) {
    return _then(_$_StoreState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
      storeRealtime: freezed == storeRealtime
          ? _value.storeRealtime
          : storeRealtime // ignore: cast_nullable_to_non_nullable
              as Store?,
      productList: null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      notAvailable: null == notAvailable
          ? _value.notAvailable
          : notAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Either<StoreFailure, ProductFailure>>,
    ));
  }
}

/// @nodoc

class _$_StoreState extends _StoreState {
  const _$_StoreState(
      {required this.isFetching,
      required this.selectedType,
      required this.storeRealtime,
      required final List<Product> productList,
      required this.notAvailable,
      required this.failure})
      : _productList = productList,
        super._();

  @override
  final bool isFetching;
  @override
  final String? selectedType;
  @override
  final Store? storeRealtime;
  final List<Product> _productList;
  @override
  List<Product> get productList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  final bool notAvailable;
  @override
  final Option<Either<StoreFailure, ProductFailure>> failure;

  @override
  String toString() {
    return 'StoreState(isFetching: $isFetching, selectedType: $selectedType, storeRealtime: $storeRealtime, productList: $productList, notAvailable: $notAvailable, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.storeRealtime, storeRealtime) ||
                other.storeRealtime == storeRealtime) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.notAvailable, notAvailable) ||
                other.notAvailable == notAvailable) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      selectedType,
      storeRealtime,
      const DeepCollectionEquality().hash(_productList),
      notAvailable,
      failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreStateCopyWith<_$_StoreState> get copyWith =>
      __$$_StoreStateCopyWithImpl<_$_StoreState>(this, _$identity);
}

abstract class _StoreState extends StoreState {
  const factory _StoreState(
      {required final bool isFetching,
      required final String? selectedType,
      required final Store? storeRealtime,
      required final List<Product> productList,
      required final bool notAvailable,
      required final Option<Either<StoreFailure, ProductFailure>>
          failure}) = _$_StoreState;
  const _StoreState._() : super._();

  @override
  bool get isFetching;
  @override
  String? get selectedType;
  @override
  Store? get storeRealtime;
  @override
  List<Product> get productList;
  @override
  bool get notAvailable;
  @override
  Option<Either<StoreFailure, ProductFailure>> get failure;
  @override
  @JsonKey(ignore: true)
  _$$_StoreStateCopyWith<_$_StoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
