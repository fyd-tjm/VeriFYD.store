import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/domain/auth/i_auth_facade.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../domain/auth/auth_failure.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';
part 'phone_login_bloc.freezed.dart';

@injectable
class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
//?-----------------------------------------------------------------------------
  late final IAuthFacade _iAuthFacade;
  StreamSubscription<Either<AuthFailure, bool>>? _sendOtpSubscription;
//?-----------------------------------------------------------------------------
  PhoneLoginBloc() : super(PhoneLoginState.initial()) {
//?-----------------------------------------------------------------------------
    _iAuthFacade = getIt<IAuthFacade>();
    on<PhoneNumberUpdate>((event, emit) async {
      log('phoneNumberUpdate Event');
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });
//?-----------------------------------------------------------------------------

    on<SendOtp>((event, emit) async {
      log('sendOtp Event');
      // return if already in progress
      if (state.isSubmitting) return;
      // emit new state with submitting and phoneNumber
      emit(PhoneLoginState(
        phoneNumber: state.phoneNumber,
        isSubmitting: true,
        isCodeSent: false,
        authFailureOrSuccessOption: none(),
      ));
      await Future.delayed(const Duration(seconds: 1));
      // subscribe to codeSent Stream
      await _sendOtpSubscription?.cancel();
      // subcribing to  sendOtp stream
      _sendOtpSubscription = _iAuthFacade
          .sendOtp(phoneNumber: state.phoneNumber)
          .timeout(
        const Duration(seconds: 15),
        onTimeout: (sink) {
          // add failure event to Stream
          sink.add(left(const AuthFailure.tooManyRequests()));
          // closing subscription
          _sendOtpSubscription!.cancel();
        },
      ).listen((failureOrCodeSent) => add(
              PhoneLoginEvent.recievedOtpStreamEvent(
                  event: failureOrCodeSent)));
    });

//?-----------------------------------------------------------------------------
    on<RecievedOtpStreamEvent>((event, emit) async {
      emit(event.event.fold(
        (authFailure) => state.copyWith(
          isSubmitting: false,
          isCodeSent: false,
          authFailureOrSuccessOption: some(left(authFailure)),
        ),
        (codeSent) => state.copyWith(
            isSubmitting: false,
            isCodeSent: true,
            authFailureOrSuccessOption: none()),
      ));
      // closing subscription
      _sendOtpSubscription!.cancel();
    });

//?-----------------------------------------------------------------------------
    on<ToggleIsCodeSentState>((event, emit) => {
          log('toggleCodeSentState Event'),
          // set to false so that while comming back on phoneAuth,
          // ui won't navigate based on iscodeSent
          emit(state.copyWith(isCodeSent: false))
        });
//?-----------------------------------------------------------------------------

    on<ConfirmOtp>((event, emit) async {
      log('confirmOtp Event');
      // return if already in progress
      if (state.isSubmitting) return;
      // emit loading state
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      await Future.delayed(const Duration(seconds: 1));
      // calling confirmOtp via authFacade
      await _iAuthFacade.confirmOtp(otp: event.otp).then(
            (result) => result.fold(
              (authFailure) => emit(
                state.copyWith(
                  isSubmitting: false,
                  authFailureOrSuccessOption: some(left(authFailure)),
                ),
              ),
              (success) => emit(
                state.copyWith(
                    isSubmitting: false,
                    authFailureOrSuccessOption: some(right(success))),
              ),
            ),
          );
    });
  }
//?-----------------------------------------------------------------------------
  @override
  Future<void> close() async {
    log('PhoneAuth Bloc close callback');
    await _sendOtpSubscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
}
