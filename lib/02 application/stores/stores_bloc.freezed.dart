// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stores_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoresEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) updateSelectedCategory,
    required TResult Function() loadMoreStores,
    required TResult Function(String category, String? fetchAfterSid)
        fetchStores,
    required TResult Function() toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? updateSelectedCategory,
    TResult? Function()? loadMoreStores,
    TResult? Function(String category, String? fetchAfterSid)? fetchStores,
    TResult? Function()? toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? updateSelectedCategory,
    TResult Function()? loadMoreStores,
    TResult Function(String category, String? fetchAfterSid)? fetchStores,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateSelectedCategory value)
        updateSelectedCategory,
    required TResult Function(LoadMoreStores value) loadMoreStores,
    required TResult Function(FetchStores value) fetchStores,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult? Function(LoadMoreStores value)? loadMoreStores,
    TResult? Function(FetchStores value)? fetchStores,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult Function(LoadMoreStores value)? loadMoreStores,
    TResult Function(FetchStores value)? fetchStores,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoresEventCopyWith<$Res> {
  factory $StoresEventCopyWith(
          StoresEvent value, $Res Function(StoresEvent) then) =
      _$StoresEventCopyWithImpl<$Res, StoresEvent>;
}

/// @nodoc
class _$StoresEventCopyWithImpl<$Res, $Val extends StoresEvent>
    implements $StoresEventCopyWith<$Res> {
  _$StoresEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateSelectedCategoryCopyWith<$Res> {
  factory _$$UpdateSelectedCategoryCopyWith(_$UpdateSelectedCategory value,
          $Res Function(_$UpdateSelectedCategory) then) =
      __$$UpdateSelectedCategoryCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$UpdateSelectedCategoryCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$UpdateSelectedCategory>
    implements _$$UpdateSelectedCategoryCopyWith<$Res> {
  __$$UpdateSelectedCategoryCopyWithImpl(_$UpdateSelectedCategory _value,
      $Res Function(_$UpdateSelectedCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$UpdateSelectedCategory(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSelectedCategory
    with DiagnosticableTreeMixin
    implements UpdateSelectedCategory {
  const _$UpdateSelectedCategory({required this.category});

  @override
  final String category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoresEvent.updateSelectedCategory(category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoresEvent.updateSelectedCategory'))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSelectedCategory &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSelectedCategoryCopyWith<_$UpdateSelectedCategory> get copyWith =>
      __$$UpdateSelectedCategoryCopyWithImpl<_$UpdateSelectedCategory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) updateSelectedCategory,
    required TResult Function() loadMoreStores,
    required TResult Function(String category, String? fetchAfterSid)
        fetchStores,
    required TResult Function() toggleFailures,
  }) {
    return updateSelectedCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? updateSelectedCategory,
    TResult? Function()? loadMoreStores,
    TResult? Function(String category, String? fetchAfterSid)? fetchStores,
    TResult? Function()? toggleFailures,
  }) {
    return updateSelectedCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? updateSelectedCategory,
    TResult Function()? loadMoreStores,
    TResult Function(String category, String? fetchAfterSid)? fetchStores,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) {
    if (updateSelectedCategory != null) {
      return updateSelectedCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateSelectedCategory value)
        updateSelectedCategory,
    required TResult Function(LoadMoreStores value) loadMoreStores,
    required TResult Function(FetchStores value) fetchStores,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return updateSelectedCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult? Function(LoadMoreStores value)? loadMoreStores,
    TResult? Function(FetchStores value)? fetchStores,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return updateSelectedCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult Function(LoadMoreStores value)? loadMoreStores,
    TResult Function(FetchStores value)? fetchStores,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (updateSelectedCategory != null) {
      return updateSelectedCategory(this);
    }
    return orElse();
  }
}

abstract class UpdateSelectedCategory implements StoresEvent {
  const factory UpdateSelectedCategory({required final String category}) =
      _$UpdateSelectedCategory;

  String get category;
  @JsonKey(ignore: true)
  _$$UpdateSelectedCategoryCopyWith<_$UpdateSelectedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreStoresCopyWith<$Res> {
  factory _$$LoadMoreStoresCopyWith(
          _$LoadMoreStores value, $Res Function(_$LoadMoreStores) then) =
      __$$LoadMoreStoresCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreStoresCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$LoadMoreStores>
    implements _$$LoadMoreStoresCopyWith<$Res> {
  __$$LoadMoreStoresCopyWithImpl(
      _$LoadMoreStores _value, $Res Function(_$LoadMoreStores) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreStores with DiagnosticableTreeMixin implements LoadMoreStores {
  const _$LoadMoreStores();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoresEvent.loadMoreStores()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StoresEvent.loadMoreStores'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreStores);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) updateSelectedCategory,
    required TResult Function() loadMoreStores,
    required TResult Function(String category, String? fetchAfterSid)
        fetchStores,
    required TResult Function() toggleFailures,
  }) {
    return loadMoreStores();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? updateSelectedCategory,
    TResult? Function()? loadMoreStores,
    TResult? Function(String category, String? fetchAfterSid)? fetchStores,
    TResult? Function()? toggleFailures,
  }) {
    return loadMoreStores?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? updateSelectedCategory,
    TResult Function()? loadMoreStores,
    TResult Function(String category, String? fetchAfterSid)? fetchStores,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) {
    if (loadMoreStores != null) {
      return loadMoreStores();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateSelectedCategory value)
        updateSelectedCategory,
    required TResult Function(LoadMoreStores value) loadMoreStores,
    required TResult Function(FetchStores value) fetchStores,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return loadMoreStores(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult? Function(LoadMoreStores value)? loadMoreStores,
    TResult? Function(FetchStores value)? fetchStores,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return loadMoreStores?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult Function(LoadMoreStores value)? loadMoreStores,
    TResult Function(FetchStores value)? fetchStores,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (loadMoreStores != null) {
      return loadMoreStores(this);
    }
    return orElse();
  }
}

abstract class LoadMoreStores implements StoresEvent {
  const factory LoadMoreStores() = _$LoadMoreStores;
}

/// @nodoc
abstract class _$$FetchStoresCopyWith<$Res> {
  factory _$$FetchStoresCopyWith(
          _$FetchStores value, $Res Function(_$FetchStores) then) =
      __$$FetchStoresCopyWithImpl<$Res>;
  @useResult
  $Res call({String category, String? fetchAfterSid});
}

/// @nodoc
class __$$FetchStoresCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$FetchStores>
    implements _$$FetchStoresCopyWith<$Res> {
  __$$FetchStoresCopyWithImpl(
      _$FetchStores _value, $Res Function(_$FetchStores) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? fetchAfterSid = freezed,
  }) {
    return _then(_$FetchStores(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fetchAfterSid: freezed == fetchAfterSid
          ? _value.fetchAfterSid
          : fetchAfterSid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchStores with DiagnosticableTreeMixin implements FetchStores {
  const _$FetchStores({required this.category, this.fetchAfterSid});

  @override
  final String category;
  @override
  final String? fetchAfterSid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoresEvent.fetchStores(category: $category, fetchAfterSid: $fetchAfterSid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoresEvent.fetchStores'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('fetchAfterSid', fetchAfterSid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStores &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fetchAfterSid, fetchAfterSid) ||
                other.fetchAfterSid == fetchAfterSid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, fetchAfterSid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStoresCopyWith<_$FetchStores> get copyWith =>
      __$$FetchStoresCopyWithImpl<_$FetchStores>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String category) updateSelectedCategory,
    required TResult Function() loadMoreStores,
    required TResult Function(String category, String? fetchAfterSid)
        fetchStores,
    required TResult Function() toggleFailures,
  }) {
    return fetchStores(category, fetchAfterSid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? updateSelectedCategory,
    TResult? Function()? loadMoreStores,
    TResult? Function(String category, String? fetchAfterSid)? fetchStores,
    TResult? Function()? toggleFailures,
  }) {
    return fetchStores?.call(category, fetchAfterSid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? updateSelectedCategory,
    TResult Function()? loadMoreStores,
    TResult Function(String category, String? fetchAfterSid)? fetchStores,
    TResult Function()? toggleFailures,
    required TResult orElse(),
  }) {
    if (fetchStores != null) {
      return fetchStores(category, fetchAfterSid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateSelectedCategory value)
        updateSelectedCategory,
    required TResult Function(LoadMoreStores value) loadMoreStores,
    required TResult Function(FetchStores value) fetchStores,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return fetchStores(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult? Function(LoadMoreStores value)? loadMoreStores,
    TResult? Function(FetchStores value)? fetchStores,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return fetchStores?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult Function(LoadMoreStores value)? loadMoreStores,
    TResult Function(FetchStores value)? fetchStores,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (fetchStores != null) {
      return fetchStores(this);
    }
    return orElse();
  }
}

abstract class FetchStores implements StoresEvent {
  const factory FetchStores(
      {required final String category,
      final String? fetchAfterSid}) = _$FetchStores;

  String get category;
  String? get fetchAfterSid;
  @JsonKey(ignore: true)
  _$$FetchStoresCopyWith<_$FetchStores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFailuresCopyWith<$Res> {
  factory _$$ToggleFailuresCopyWith(
          _$ToggleFailures value, $Res Function(_$ToggleFailures) then) =
      __$$ToggleFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleFailuresCopyWithImpl<$Res>
    extends _$StoresEventCopyWithImpl<$Res, _$ToggleFailures>
    implements _$$ToggleFailuresCopyWith<$Res> {
  __$$ToggleFailuresCopyWithImpl(
      _$ToggleFailures _value, $Res Function(_$ToggleFailures) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleFailures with DiagnosticableTreeMixin implements ToggleFailures {
  const _$ToggleFailures();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoresEvent.toggleFailures()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StoresEvent.toggleFailures'));
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
    required TResult Function(String category) updateSelectedCategory,
    required TResult Function() loadMoreStores,
    required TResult Function(String category, String? fetchAfterSid)
        fetchStores,
    required TResult Function() toggleFailures,
  }) {
    return toggleFailures();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String category)? updateSelectedCategory,
    TResult? Function()? loadMoreStores,
    TResult? Function(String category, String? fetchAfterSid)? fetchStores,
    TResult? Function()? toggleFailures,
  }) {
    return toggleFailures?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String category)? updateSelectedCategory,
    TResult Function()? loadMoreStores,
    TResult Function(String category, String? fetchAfterSid)? fetchStores,
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
    required TResult Function(UpdateSelectedCategory value)
        updateSelectedCategory,
    required TResult Function(LoadMoreStores value) loadMoreStores,
    required TResult Function(FetchStores value) fetchStores,
    required TResult Function(ToggleFailures value) toggleFailures,
  }) {
    return toggleFailures(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult? Function(LoadMoreStores value)? loadMoreStores,
    TResult? Function(FetchStores value)? fetchStores,
    TResult? Function(ToggleFailures value)? toggleFailures,
  }) {
    return toggleFailures?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateSelectedCategory value)? updateSelectedCategory,
    TResult Function(LoadMoreStores value)? loadMoreStores,
    TResult Function(FetchStores value)? fetchStores,
    TResult Function(ToggleFailures value)? toggleFailures,
    required TResult orElse(),
  }) {
    if (toggleFailures != null) {
      return toggleFailures(this);
    }
    return orElse();
  }
}

abstract class ToggleFailures implements StoresEvent {
  const factory ToggleFailures() = _$ToggleFailures;
}

/// @nodoc
mixin _$StoresState {
  bool get isFetching => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;
  List<Store> get storeList => throw _privateConstructorUsedError;
  bool get notAvailable => throw _privateConstructorUsedError;
  Option<StoreFailure> get failure => throw _privateConstructorUsedError;
  bool get loadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoresStateCopyWith<StoresState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoresStateCopyWith<$Res> {
  factory $StoresStateCopyWith(
          StoresState value, $Res Function(StoresState) then) =
      _$StoresStateCopyWithImpl<$Res, StoresState>;
  @useResult
  $Res call(
      {bool isFetching,
      String? selectedCategory,
      List<Store> storeList,
      bool notAvailable,
      Option<StoreFailure> failure,
      bool loadingMore});
}

/// @nodoc
class _$StoresStateCopyWithImpl<$Res, $Val extends StoresState>
    implements $StoresStateCopyWith<$Res> {
  _$StoresStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? selectedCategory = freezed,
    Object? storeList = null,
    Object? notAvailable = null,
    Object? failure = null,
    Object? loadingMore = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      storeList: null == storeList
          ? _value.storeList
          : storeList // ignore: cast_nullable_to_non_nullable
              as List<Store>,
      notAvailable: null == notAvailable
          ? _value.notAvailable
          : notAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<StoreFailure>,
      loadingMore: null == loadingMore
          ? _value.loadingMore
          : loadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoresStateCopyWith<$Res>
    implements $StoresStateCopyWith<$Res> {
  factory _$$_StoresStateCopyWith(
          _$_StoresState value, $Res Function(_$_StoresState) then) =
      __$$_StoresStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      String? selectedCategory,
      List<Store> storeList,
      bool notAvailable,
      Option<StoreFailure> failure,
      bool loadingMore});
}

/// @nodoc
class __$$_StoresStateCopyWithImpl<$Res>
    extends _$StoresStateCopyWithImpl<$Res, _$_StoresState>
    implements _$$_StoresStateCopyWith<$Res> {
  __$$_StoresStateCopyWithImpl(
      _$_StoresState _value, $Res Function(_$_StoresState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? selectedCategory = freezed,
    Object? storeList = null,
    Object? notAvailable = null,
    Object? failure = null,
    Object? loadingMore = null,
  }) {
    return _then(_$_StoresState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      storeList: null == storeList
          ? _value._storeList
          : storeList // ignore: cast_nullable_to_non_nullable
              as List<Store>,
      notAvailable: null == notAvailable
          ? _value.notAvailable
          : notAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<StoreFailure>,
      loadingMore: null == loadingMore
          ? _value.loadingMore
          : loadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StoresState extends _StoresState with DiagnosticableTreeMixin {
  const _$_StoresState(
      {required this.isFetching,
      required this.selectedCategory,
      required final List<Store> storeList,
      required this.notAvailable,
      required this.failure,
      required this.loadingMore})
      : _storeList = storeList,
        super._();

  @override
  final bool isFetching;
  @override
  final String? selectedCategory;
  final List<Store> _storeList;
  @override
  List<Store> get storeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storeList);
  }

  @override
  final bool notAvailable;
  @override
  final Option<StoreFailure> failure;
  @override
  final bool loadingMore;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoresState(isFetching: $isFetching, selectedCategory: $selectedCategory, storeList: $storeList, notAvailable: $notAvailable, failure: $failure, loadingMore: $loadingMore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoresState'))
      ..add(DiagnosticsProperty('isFetching', isFetching))
      ..add(DiagnosticsProperty('selectedCategory', selectedCategory))
      ..add(DiagnosticsProperty('storeList', storeList))
      ..add(DiagnosticsProperty('notAvailable', notAvailable))
      ..add(DiagnosticsProperty('failure', failure))
      ..add(DiagnosticsProperty('loadingMore', loadingMore));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoresState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._storeList, _storeList) &&
            (identical(other.notAvailable, notAvailable) ||
                other.notAvailable == notAvailable) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      selectedCategory,
      const DeepCollectionEquality().hash(_storeList),
      notAvailable,
      failure,
      loadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoresStateCopyWith<_$_StoresState> get copyWith =>
      __$$_StoresStateCopyWithImpl<_$_StoresState>(this, _$identity);
}

abstract class _StoresState extends StoresState {
  const factory _StoresState(
      {required final bool isFetching,
      required final String? selectedCategory,
      required final List<Store> storeList,
      required final bool notAvailable,
      required final Option<StoreFailure> failure,
      required final bool loadingMore}) = _$_StoresState;
  const _StoresState._() : super._();

  @override
  bool get isFetching;
  @override
  String? get selectedCategory;
  @override
  List<Store> get storeList;
  @override
  bool get notAvailable;
  @override
  Option<StoreFailure> get failure;
  @override
  bool get loadingMore;
  @override
  @JsonKey(ignore: true)
  _$$_StoresStateCopyWith<_$_StoresState> get copyWith =>
      throw _privateConstructorUsedError;
}
