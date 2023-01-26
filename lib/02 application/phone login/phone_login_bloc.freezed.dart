// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneLoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) sendOtp,
    required TResult Function(Either<AuthFailure, Unit> streamEvent)
        recievedOtpStreamEvent,
    required TResult Function() toggleCodeSentState,
    required TResult Function() toggleFailures,
    required TResult Function(Otp otp) confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(ToggleCodeSentState value) toggleCodeSentState,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginEventCopyWith<$Res> {
  factory $PhoneLoginEventCopyWith(
          PhoneLoginEvent value, $Res Function(PhoneLoginEvent) then) =
      _$PhoneLoginEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PhoneLoginEventCopyWithImpl<$Res>
    implements $PhoneLoginEventCopyWith<$Res> {
  _$PhoneLoginEventCopyWithImpl(this._value, this._then);

  final PhoneLoginEvent _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginEvent) _then;
}

/// @nodoc
abstract class _$$SendOtpCopyWith<$Res> {
  factory _$$SendOtpCopyWith(_$SendOtp value, $Res Function(_$SendOtp) then) =
      __$$SendOtpCopyWithImpl<$Res>;
  $Res call({PhoneNumber phoneNumber});
}

/// @nodoc
class __$$SendOtpCopyWithImpl<$Res> extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$SendOtpCopyWith<$Res> {
  __$$SendOtpCopyWithImpl(_$SendOtp _value, $Res Function(_$SendOtp) _then)
      : super(_value, (v) => _then(v as _$SendOtp));

  @override
  _$SendOtp get _value => super._value as _$SendOtp;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$SendOtp(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ));
  }
}

/// @nodoc

class _$SendOtp implements SendOtp {
  const _$SendOtp({required this.phoneNumber});

  @override
  final PhoneNumber phoneNumber;

  @override
  String toString() {
    return 'PhoneLoginEvent.sendOtp(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtp &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$SendOtpCopyWith<_$SendOtp> get copyWith =>
      __$$SendOtpCopyWithImpl<_$SendOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) sendOtp,
    required TResult Function(Either<AuthFailure, Unit> streamEvent)
        recievedOtpStreamEvent,
    required TResult Function() toggleCodeSentState,
    required TResult Function() toggleFailures,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return sendOtp(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return sendOtp?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(ToggleCodeSentState value) toggleCodeSentState,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements PhoneLoginEvent {
  const factory SendOtp({required final PhoneNumber phoneNumber}) = _$SendOtp;

  PhoneNumber get phoneNumber;
  @JsonKey(ignore: true)
  _$$SendOtpCopyWith<_$SendOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecievedOtpStreamEventCopyWith<$Res> {
  factory _$$RecievedOtpStreamEventCopyWith(_$RecievedOtpStreamEvent value,
          $Res Function(_$RecievedOtpStreamEvent) then) =
      __$$RecievedOtpStreamEventCopyWithImpl<$Res>;
  $Res call({Either<AuthFailure, Unit> streamEvent});
}

/// @nodoc
class __$$RecievedOtpStreamEventCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$RecievedOtpStreamEventCopyWith<$Res> {
  __$$RecievedOtpStreamEventCopyWithImpl(_$RecievedOtpStreamEvent _value,
      $Res Function(_$RecievedOtpStreamEvent) _then)
      : super(_value, (v) => _then(v as _$RecievedOtpStreamEvent));

  @override
  _$RecievedOtpStreamEvent get _value =>
      super._value as _$RecievedOtpStreamEvent;

  @override
  $Res call({
    Object? streamEvent = freezed,
  }) {
    return _then(_$RecievedOtpStreamEvent(
      streamEvent: streamEvent == freezed
          ? _value.streamEvent
          : streamEvent // ignore: cast_nullable_to_non_nullable
              as Either<AuthFailure, Unit>,
    ));
  }
}

/// @nodoc

class _$RecievedOtpStreamEvent implements RecievedOtpStreamEvent {
  const _$RecievedOtpStreamEvent({required this.streamEvent});

  @override
  final Either<AuthFailure, Unit> streamEvent;

  @override
  String toString() {
    return 'PhoneLoginEvent.recievedOtpStreamEvent(streamEvent: $streamEvent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecievedOtpStreamEvent &&
            const DeepCollectionEquality()
                .equals(other.streamEvent, streamEvent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(streamEvent));

  @JsonKey(ignore: true)
  @override
  _$$RecievedOtpStreamEventCopyWith<_$RecievedOtpStreamEvent> get copyWith =>
      __$$RecievedOtpStreamEventCopyWithImpl<_$RecievedOtpStreamEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) sendOtp,
    required TResult Function(Either<AuthFailure, Unit> streamEvent)
        recievedOtpStreamEvent,
    required TResult Function() toggleCodeSentState,
    required TResult Function() toggleFailures,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return recievedOtpStreamEvent(streamEvent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return recievedOtpStreamEvent?.call(streamEvent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (recievedOtpStreamEvent != null) {
      return recievedOtpStreamEvent(streamEvent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(ToggleCodeSentState value) toggleCodeSentState,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return recievedOtpStreamEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return recievedOtpStreamEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (recievedOtpStreamEvent != null) {
      return recievedOtpStreamEvent(this);
    }
    return orElse();
  }
}

abstract class RecievedOtpStreamEvent implements PhoneLoginEvent {
  const factory RecievedOtpStreamEvent(
          {required final Either<AuthFailure, Unit> streamEvent}) =
      _$RecievedOtpStreamEvent;

  Either<AuthFailure, Unit> get streamEvent;
  @JsonKey(ignore: true)
  _$$RecievedOtpStreamEventCopyWith<_$RecievedOtpStreamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleCodeSentStateCopyWith<$Res> {
  factory _$$ToggleCodeSentStateCopyWith(_$ToggleCodeSentState value,
          $Res Function(_$ToggleCodeSentState) then) =
      __$$ToggleCodeSentStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleCodeSentStateCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$ToggleCodeSentStateCopyWith<$Res> {
  __$$ToggleCodeSentStateCopyWithImpl(
      _$ToggleCodeSentState _value, $Res Function(_$ToggleCodeSentState) _then)
      : super(_value, (v) => _then(v as _$ToggleCodeSentState));

  @override
  _$ToggleCodeSentState get _value => super._value as _$ToggleCodeSentState;
}

/// @nodoc

class _$ToggleCodeSentState implements ToggleCodeSentState {
  const _$ToggleCodeSentState();

  @override
  String toString() {
    return 'PhoneLoginEvent.toggleCodeSentState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleCodeSentState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) sendOtp,
    required TResult Function(Either<AuthFailure, Unit> streamEvent)
        recievedOtpStreamEvent,
    required TResult Function() toggleCodeSentState,
    required TResult Function() toggleFailures,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return toggleCodeSentState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return toggleCodeSentState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (toggleCodeSentState != null) {
      return toggleCodeSentState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(ToggleCodeSentState value) toggleCodeSentState,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return toggleCodeSentState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return toggleCodeSentState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (toggleCodeSentState != null) {
      return toggleCodeSentState(this);
    }
    return orElse();
  }
}

abstract class ToggleCodeSentState implements PhoneLoginEvent {
  const factory ToggleCodeSentState() = _$ToggleCodeSentState;
}

/// @nodoc
abstract class _$$ToggleFailuresCopyWith<$Res> {
  factory _$$ToggleFailuresCopyWith(
          _$ToggleFailures value, $Res Function(_$ToggleFailures) then) =
      __$$ToggleFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleFailuresCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$ToggleFailuresCopyWith<$Res> {
  __$$ToggleFailuresCopyWithImpl(
      _$ToggleFailures _value, $Res Function(_$ToggleFailures) _then)
      : super(_value, (v) => _then(v as _$ToggleFailures));

  @override
  _$ToggleFailures get _value => super._value as _$ToggleFailures;
}

/// @nodoc

class _$ToggleFailures implements ToggleFailures {
  const _$ToggleFailures();

  @override
  String toString() {
    return 'PhoneLoginEvent.toggleFailures()';
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
    required TResult Function(PhoneNumber phoneNumber) sendOtp,
    required TResult Function(Either<AuthFailure, Unit> streamEvent)
        recievedOtpStreamEvent,
    required TResult Function() toggleCodeSentState,
    required TResult Function() toggleFailures,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return toggleFailures();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return toggleFailures?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
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
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(ToggleCodeSentState value) toggleCodeSentState,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return toggleFailures(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return toggleFailures?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (toggleFailures != null) {
      return toggleFailures(this);
    }
    return orElse();
  }
}

abstract class ToggleFailures implements PhoneLoginEvent {
  const factory ToggleFailures() = _$ToggleFailures;
}

/// @nodoc
abstract class _$$ConfirmOtpCopyWith<$Res> {
  factory _$$ConfirmOtpCopyWith(
          _$ConfirmOtp value, $Res Function(_$ConfirmOtp) then) =
      __$$ConfirmOtpCopyWithImpl<$Res>;
  $Res call({Otp otp});
}

/// @nodoc
class __$$ConfirmOtpCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$ConfirmOtpCopyWith<$Res> {
  __$$ConfirmOtpCopyWithImpl(
      _$ConfirmOtp _value, $Res Function(_$ConfirmOtp) _then)
      : super(_value, (v) => _then(v as _$ConfirmOtp));

  @override
  _$ConfirmOtp get _value => super._value as _$ConfirmOtp;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_$ConfirmOtp(
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp,
    ));
  }
}

/// @nodoc

class _$ConfirmOtp implements ConfirmOtp {
  const _$ConfirmOtp({required this.otp});

  @override
  final Otp otp;

  @override
  String toString() {
    return 'PhoneLoginEvent.confirmOtp(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmOtp &&
            const DeepCollectionEquality().equals(other.otp, otp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(otp));

  @JsonKey(ignore: true)
  @override
  _$$ConfirmOtpCopyWith<_$ConfirmOtp> get copyWith =>
      __$$ConfirmOtpCopyWithImpl<_$ConfirmOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) sendOtp,
    required TResult Function(Either<AuthFailure, Unit> streamEvent)
        recievedOtpStreamEvent,
    required TResult Function() toggleCodeSentState,
    required TResult Function() toggleFailures,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return confirmOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return confirmOtp?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? sendOtp,
    TResult Function(Either<AuthFailure, Unit> streamEvent)?
        recievedOtpStreamEvent,
    TResult Function()? toggleCodeSentState,
    TResult Function()? toggleFailures,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (confirmOtp != null) {
      return confirmOtp(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(ToggleCodeSentState value) toggleCodeSentState,
    required TResult Function(ToggleFailures value) toggleFailures,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return confirmOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return confirmOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(ToggleCodeSentState value)? toggleCodeSentState,
    TResult Function(ToggleFailures value)? toggleFailures,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (confirmOtp != null) {
      return confirmOtp(this);
    }
    return orElse();
  }
}

abstract class ConfirmOtp implements PhoneLoginEvent {
  const factory ConfirmOtp({required final Otp otp}) = _$ConfirmOtp;

  Otp get otp;
  @JsonKey(ignore: true)
  _$$ConfirmOtpCopyWith<_$ConfirmOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhoneLoginState {
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isCodeSent => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneLoginStateCopyWith<PhoneLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneLoginStateCopyWith<$Res> {
  factory $PhoneLoginStateCopyWith(
          PhoneLoginState value, $Res Function(PhoneLoginState) then) =
      _$PhoneLoginStateCopyWithImpl<$Res>;
  $Res call(
      {PhoneNumber phoneNumber,
      bool isSubmitting,
      bool isCodeSent,
      Option<Either<AuthFailure, Unit>> failureOrSuccess});
}

/// @nodoc
class _$PhoneLoginStateCopyWithImpl<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  _$PhoneLoginStateCopyWithImpl(this._value, this._then);

  final PhoneLoginState _value;
  // ignore: unused_field
  final $Res Function(PhoneLoginState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? isSubmitting = freezed,
    Object? isCodeSent = freezed,
    Object? failureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeSent: isCodeSent == freezed
          ? _value.isCodeSent
          : isCodeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_PhoneLoginStateCopyWith<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  factory _$$_PhoneLoginStateCopyWith(
          _$_PhoneLoginState value, $Res Function(_$_PhoneLoginState) then) =
      __$$_PhoneLoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneNumber phoneNumber,
      bool isSubmitting,
      bool isCodeSent,
      Option<Either<AuthFailure, Unit>> failureOrSuccess});
}

/// @nodoc
class __$$_PhoneLoginStateCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$$_PhoneLoginStateCopyWith<$Res> {
  __$$_PhoneLoginStateCopyWithImpl(
      _$_PhoneLoginState _value, $Res Function(_$_PhoneLoginState) _then)
      : super(_value, (v) => _then(v as _$_PhoneLoginState));

  @override
  _$_PhoneLoginState get _value => super._value as _$_PhoneLoginState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? isSubmitting = freezed,
    Object? isCodeSent = freezed,
    Object? failureOrSuccess = freezed,
  }) {
    return _then(_$_PhoneLoginState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeSent: isCodeSent == freezed
          ? _value.isCodeSent
          : isCodeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_PhoneLoginState extends _PhoneLoginState {
  _$_PhoneLoginState(
      {required this.phoneNumber,
      required this.isSubmitting,
      required this.isCodeSent,
      required this.failureOrSuccess})
      : super._();

  @override
  final PhoneNumber phoneNumber;
  @override
  final bool isSubmitting;
  @override
  final bool isCodeSent;
  @override
  final Option<Either<AuthFailure, Unit>> failureOrSuccess;

  @override
  String toString() {
    return 'PhoneLoginState(phoneNumber: $phoneNumber, isSubmitting: $isSubmitting, isCodeSent: $isCodeSent, failureOrSuccess: $failureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneLoginState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isCodeSent, isCodeSent) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccess, failureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isCodeSent),
      const DeepCollectionEquality().hash(failureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_PhoneLoginStateCopyWith<_$_PhoneLoginState> get copyWith =>
      __$$_PhoneLoginStateCopyWithImpl<_$_PhoneLoginState>(this, _$identity);
}

abstract class _PhoneLoginState extends PhoneLoginState {
  factory _PhoneLoginState(
          {required final PhoneNumber phoneNumber,
          required final bool isSubmitting,
          required final bool isCodeSent,
          required final Option<Either<AuthFailure, Unit>> failureOrSuccess}) =
      _$_PhoneLoginState;
  _PhoneLoginState._() : super._();

  @override
  PhoneNumber get phoneNumber;
  @override
  bool get isSubmitting;
  @override
  bool get isCodeSent;
  @override
  Option<Either<AuthFailure, Unit>> get failureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneLoginStateCopyWith<_$_PhoneLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
