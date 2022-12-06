part of 'phone_login_bloc.dart';

@freezed
class PhoneLoginEvent with _$PhoneLoginEvent {
  const factory PhoneLoginEvent.phoneNumberUpdate({
    required PhoneNumber phoneNumber,
  }) = PhoneNumberUpdate;

  const factory PhoneLoginEvent.sendOtp() = SendOtp;

  const factory PhoneLoginEvent.recievedOtpStreamEvent(
      {required Either<AuthFailure, bool> event}) = RecievedOtpStreamEvent;

  const factory PhoneLoginEvent.updateCodeSentState(
      {required bool codeSentStatus}) = UpdateCodeSentState;

  const factory PhoneLoginEvent.toggleIsCodeSentState() = ToggleIsCodeSentState;

  const factory PhoneLoginEvent.confirmOtp({
    required Otp otp,
  }) = ConfirmOtp;
}
