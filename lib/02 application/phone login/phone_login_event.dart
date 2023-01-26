part of 'phone_login_bloc.dart';

@freezed
class PhoneLoginEvent with _$PhoneLoginEvent {
  const factory PhoneLoginEvent.sendOtp({required PhoneNumber phoneNumber}) =
      SendOtp;

  const factory PhoneLoginEvent.recievedOtpStreamEvent(
          {required Either<AuthFailure, Unit> streamEvent}) =
      RecievedOtpStreamEvent;

  const factory PhoneLoginEvent.toggleCodeSentState() = ToggleCodeSentState;

  const factory PhoneLoginEvent.toggleFailures() = ToggleFailures;

  const factory PhoneLoginEvent.confirmOtp({
    required Otp otp,
  }) = ConfirmOtp;
}
