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
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
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
abstract class _$$PhoneNumberUpdateCopyWith<$Res> {
  factory _$$PhoneNumberUpdateCopyWith(
          _$PhoneNumberUpdate value, $Res Function(_$PhoneNumberUpdate) then) =
      __$$PhoneNumberUpdateCopyWithImpl<$Res>;
  $Res call({PhoneNumber phoneNumber});
}

/// @nodoc
class __$$PhoneNumberUpdateCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$PhoneNumberUpdateCopyWith<$Res> {
  __$$PhoneNumberUpdateCopyWithImpl(
      _$PhoneNumberUpdate _value, $Res Function(_$PhoneNumberUpdate) _then)
      : super(_value, (v) => _then(v as _$PhoneNumberUpdate));

  @override
  _$PhoneNumberUpdate get _value => super._value as _$PhoneNumberUpdate;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$PhoneNumberUpdate(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ));
  }
}

/// @nodoc

class _$PhoneNumberUpdate implements PhoneNumberUpdate {
  const _$PhoneNumberUpdate({required this.phoneNumber});

  @override
  final PhoneNumber phoneNumber;

  @override
  String toString() {
    return 'PhoneLoginEvent.phoneNumberUpdate(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberUpdate &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$PhoneNumberUpdateCopyWith<_$PhoneNumberUpdate> get copyWith =>
      __$$PhoneNumberUpdateCopyWithImpl<_$PhoneNumberUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return phoneNumberUpdate(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return phoneNumberUpdate?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (phoneNumberUpdate != null) {
      return phoneNumberUpdate(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return phoneNumberUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return phoneNumberUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (phoneNumberUpdate != null) {
      return phoneNumberUpdate(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberUpdate implements PhoneLoginEvent {
  const factory PhoneNumberUpdate({required final PhoneNumber phoneNumber}) =
      _$PhoneNumberUpdate;

  PhoneNumber get phoneNumber;
  @JsonKey(ignore: true)
  _$$PhoneNumberUpdateCopyWith<_$PhoneNumberUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOtpCopyWith<$Res> {
  factory _$$SendOtpCopyWith(_$SendOtp value, $Res Function(_$SendOtp) then) =
      __$$SendOtpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendOtpCopyWithImpl<$Res> extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$SendOtpCopyWith<$Res> {
  __$$SendOtpCopyWithImpl(_$SendOtp _value, $Res Function(_$SendOtp) _then)
      : super(_value, (v) => _then(v as _$SendOtp));

  @override
  _$SendOtp get _value => super._value as _$SendOtp;
}

/// @nodoc

class _$SendOtp implements SendOtp {
  const _$SendOtp();

  @override
  String toString() {
    return 'PhoneLoginEvent.sendOtp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendOtp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return sendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return sendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
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
  const factory SendOtp() = _$SendOtp;
}

/// @nodoc
abstract class _$$RecievedOtpStreamEventCopyWith<$Res> {
  factory _$$RecievedOtpStreamEventCopyWith(_$RecievedOtpStreamEvent value,
          $Res Function(_$RecievedOtpStreamEvent) then) =
      __$$RecievedOtpStreamEventCopyWithImpl<$Res>;
  $Res call({Either<AuthFailure, bool> event});
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
    Object? event = freezed,
  }) {
    return _then(_$RecievedOtpStreamEvent(
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Either<AuthFailure, bool>,
    ));
  }
}

/// @nodoc

class _$RecievedOtpStreamEvent implements RecievedOtpStreamEvent {
  const _$RecievedOtpStreamEvent({required this.event});

  @override
  final Either<AuthFailure, bool> event;

  @override
  String toString() {
    return 'PhoneLoginEvent.recievedOtpStreamEvent(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecievedOtpStreamEvent &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  _$$RecievedOtpStreamEventCopyWith<_$RecievedOtpStreamEvent> get copyWith =>
      __$$RecievedOtpStreamEventCopyWithImpl<_$RecievedOtpStreamEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return recievedOtpStreamEvent(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return recievedOtpStreamEvent?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (recievedOtpStreamEvent != null) {
      return recievedOtpStreamEvent(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return recievedOtpStreamEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return recievedOtpStreamEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
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
          {required final Either<AuthFailure, bool> event}) =
      _$RecievedOtpStreamEvent;

  Either<AuthFailure, bool> get event;
  @JsonKey(ignore: true)
  _$$RecievedOtpStreamEventCopyWith<_$RecievedOtpStreamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCodeSentStateCopyWith<$Res> {
  factory _$$UpdateCodeSentStateCopyWith(_$UpdateCodeSentState value,
          $Res Function(_$UpdateCodeSentState) then) =
      __$$UpdateCodeSentStateCopyWithImpl<$Res>;
  $Res call({bool codeSentStatus});
}

/// @nodoc
class __$$UpdateCodeSentStateCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$UpdateCodeSentStateCopyWith<$Res> {
  __$$UpdateCodeSentStateCopyWithImpl(
      _$UpdateCodeSentState _value, $Res Function(_$UpdateCodeSentState) _then)
      : super(_value, (v) => _then(v as _$UpdateCodeSentState));

  @override
  _$UpdateCodeSentState get _value => super._value as _$UpdateCodeSentState;

  @override
  $Res call({
    Object? codeSentStatus = freezed,
  }) {
    return _then(_$UpdateCodeSentState(
      codeSentStatus: codeSentStatus == freezed
          ? _value.codeSentStatus
          : codeSentStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateCodeSentState implements UpdateCodeSentState {
  const _$UpdateCodeSentState({required this.codeSentStatus});

  @override
  final bool codeSentStatus;

  @override
  String toString() {
    return 'PhoneLoginEvent.updateCodeSentState(codeSentStatus: $codeSentStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCodeSentState &&
            const DeepCollectionEquality()
                .equals(other.codeSentStatus, codeSentStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(codeSentStatus));

  @JsonKey(ignore: true)
  @override
  _$$UpdateCodeSentStateCopyWith<_$UpdateCodeSentState> get copyWith =>
      __$$UpdateCodeSentStateCopyWithImpl<_$UpdateCodeSentState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return updateCodeSentState(codeSentStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return updateCodeSentState?.call(codeSentStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (updateCodeSentState != null) {
      return updateCodeSentState(codeSentStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return updateCodeSentState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return updateCodeSentState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (updateCodeSentState != null) {
      return updateCodeSentState(this);
    }
    return orElse();
  }
}

abstract class UpdateCodeSentState implements PhoneLoginEvent {
  const factory UpdateCodeSentState({required final bool codeSentStatus}) =
      _$UpdateCodeSentState;

  bool get codeSentStatus;
  @JsonKey(ignore: true)
  _$$UpdateCodeSentStateCopyWith<_$UpdateCodeSentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleIsCodeSentStateCopyWith<$Res> {
  factory _$$ToggleIsCodeSentStateCopyWith(_$ToggleIsCodeSentState value,
          $Res Function(_$ToggleIsCodeSentState) then) =
      __$$ToggleIsCodeSentStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleIsCodeSentStateCopyWithImpl<$Res>
    extends _$PhoneLoginEventCopyWithImpl<$Res>
    implements _$$ToggleIsCodeSentStateCopyWith<$Res> {
  __$$ToggleIsCodeSentStateCopyWithImpl(_$ToggleIsCodeSentState _value,
      $Res Function(_$ToggleIsCodeSentState) _then)
      : super(_value, (v) => _then(v as _$ToggleIsCodeSentState));

  @override
  _$ToggleIsCodeSentState get _value => super._value as _$ToggleIsCodeSentState;
}

/// @nodoc

class _$ToggleIsCodeSentState implements ToggleIsCodeSentState {
  const _$ToggleIsCodeSentState();

  @override
  String toString() {
    return 'PhoneLoginEvent.toggleIsCodeSentState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleIsCodeSentState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return toggleIsCodeSentState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return toggleIsCodeSentState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
    required TResult orElse(),
  }) {
    if (toggleIsCodeSentState != null) {
      return toggleIsCodeSentState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return toggleIsCodeSentState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return toggleIsCodeSentState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
    required TResult orElse(),
  }) {
    if (toggleIsCodeSentState != null) {
      return toggleIsCodeSentState(this);
    }
    return orElse();
  }
}

abstract class ToggleIsCodeSentState implements PhoneLoginEvent {
  const factory ToggleIsCodeSentState() = _$ToggleIsCodeSentState;
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
    required TResult Function(PhoneNumber phoneNumber) phoneNumberUpdate,
    required TResult Function() sendOtp,
    required TResult Function(Either<AuthFailure, bool> event)
        recievedOtpStreamEvent,
    required TResult Function(bool codeSentStatus) updateCodeSentState,
    required TResult Function() toggleIsCodeSentState,
    required TResult Function(Otp otp) confirmOtp,
  }) {
    return confirmOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
    TResult Function(Otp otp)? confirmOtp,
  }) {
    return confirmOtp?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber)? phoneNumberUpdate,
    TResult Function()? sendOtp,
    TResult Function(Either<AuthFailure, bool> event)? recievedOtpStreamEvent,
    TResult Function(bool codeSentStatus)? updateCodeSentState,
    TResult Function()? toggleIsCodeSentState,
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
    required TResult Function(PhoneNumberUpdate value) phoneNumberUpdate,
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(RecievedOtpStreamEvent value)
        recievedOtpStreamEvent,
    required TResult Function(UpdateCodeSentState value) updateCodeSentState,
    required TResult Function(ToggleIsCodeSentState value)
        toggleIsCodeSentState,
    required TResult Function(ConfirmOtp value) confirmOtp,
  }) {
    return confirmOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
    TResult Function(ConfirmOtp value)? confirmOtp,
  }) {
    return confirmOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberUpdate value)? phoneNumberUpdate,
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(RecievedOtpStreamEvent value)? recievedOtpStreamEvent,
    TResult Function(UpdateCodeSentState value)? updateCodeSentState,
    TResult Function(ToggleIsCodeSentState value)? toggleIsCodeSentState,
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
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
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
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
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
    Object? authFailureOrSuccessOption = freezed,
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
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_PhoneAuthStateCopyWith<$Res>
    implements $PhoneLoginStateCopyWith<$Res> {
  factory _$$_PhoneAuthStateCopyWith(
          _$_PhoneAuthState value, $Res Function(_$_PhoneAuthState) then) =
      __$$_PhoneAuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneNumber phoneNumber,
      bool isSubmitting,
      bool isCodeSent,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_PhoneAuthStateCopyWithImpl<$Res>
    extends _$PhoneLoginStateCopyWithImpl<$Res>
    implements _$$_PhoneAuthStateCopyWith<$Res> {
  __$$_PhoneAuthStateCopyWithImpl(
      _$_PhoneAuthState _value, $Res Function(_$_PhoneAuthState) _then)
      : super(_value, (v) => _then(v as _$_PhoneAuthState));

  @override
  _$_PhoneAuthState get _value => super._value as _$_PhoneAuthState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? isSubmitting = freezed,
    Object? isCodeSent = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_PhoneAuthState(
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
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_PhoneAuthState extends _PhoneAuthState {
  _$_PhoneAuthState(
      {required this.phoneNumber,
      required this.isSubmitting,
      required this.isCodeSent,
      required this.authFailureOrSuccessOption})
      : super._();

  @override
  final PhoneNumber phoneNumber;
  @override
  final bool isSubmitting;
  @override
  final bool isCodeSent;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'PhoneLoginState(phoneNumber: $phoneNumber, isSubmitting: $isSubmitting, isCodeSent: $isCodeSent, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneAuthState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isCodeSent, isCodeSent) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isCodeSent),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_PhoneAuthStateCopyWith<_$_PhoneAuthState> get copyWith =>
      __$$_PhoneAuthStateCopyWithImpl<_$_PhoneAuthState>(this, _$identity);
}

abstract class _PhoneAuthState extends PhoneLoginState {
  factory _PhoneAuthState(
      {required final PhoneNumber phoneNumber,
      required final bool isSubmitting,
      required final bool isCodeSent,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_PhoneAuthState;
  _PhoneAuthState._() : super._();

  @override
  PhoneNumber get phoneNumber;
  @override
  bool get isSubmitting;
  @override
  bool get isCodeSent;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneAuthStateCopyWith<_$_PhoneAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
