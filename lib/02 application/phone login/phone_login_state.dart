part of 'phone_login_bloc.dart';

@freezed
abstract class PhoneLoginState with _$PhoneLoginState {
  const PhoneLoginState._();
  factory PhoneLoginState({
    required PhoneNumber phoneNumber,
    required bool isSubmitting,
    required bool isCodeSent,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _PhoneAuthState;

  factory PhoneLoginState.initial() => PhoneLoginState(
        phoneNumber: PhoneNumber(''),
        isSubmitting: false,
        isCodeSent: false,
        authFailureOrSuccessOption: none(),
      );
}
