import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../03 domain/auth/00_export_auth_domain.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';
part 'phone_login_bloc.freezed.dart';

@injectable
class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
//?-----------------------------------------------------------------------------
  late final IAuthFacade _iAuthFacade;
  StreamSubscription<Either<AuthFailure, Unit>>? _sendOtpSubscription;
//?-----------------------------------------------------------------------------
  PhoneLoginBloc() : super(PhoneLoginState.initial()) {
//?-----------------------------------------------------------------------------
    _iAuthFacade = getIt<IAuthFacade>();
//?-----------------------------------------------------------------------------
    on<SendOtp>((event, emit) async {
      // return if already in progress
      if (state.isSubmitting) return;
      // emit new state with submitting and phoneNumber
      emit(state.copyWith(
        phoneNumber: event.phoneNumber,
        isSubmitting: true,
        isCodeSent: false,
        failureOrSuccess: none(),
      ));
      await Future.delayed(const Duration(seconds: 1));
      // subscribe to codeSent Stream
      await _sendOtpSubscription?.cancel();
      // subcribing to  sendOtp stream
      _sendOtpSubscription = _iAuthFacade
          .sendOtp(phoneNumber: event.phoneNumber)
          .timeout(
        const Duration(seconds: 15),
        onTimeout: (sink) {
          // add failure event to Stream
          sink.add(left(const AuthFailure.tooManyRequests()));
          // closing subscription
          _sendOtpSubscription!.cancel();
        },
      ).listen((failureOrCodeSent) =>
              add(RecievedOtpStreamEvent(streamEvent: failureOrCodeSent)));
    });

//?-----------------------------------------------------------------------------
    on<RecievedOtpStreamEvent>((event, emit) async {
      event.streamEvent.fold(
        (authFailure) {
          emit(state.copyWith(
            isSubmitting: false,
            isCodeSent: false,
            failureOrSuccess: some(left(authFailure)),
          ));
          add(const ToggleFailures());
        },
        (isCodeSent) {
          emit(state.copyWith(
            isSubmitting: false,
            isCodeSent: true,
            failureOrSuccess: none(),
          ));
          add(const ToggleCodeSentState());
        },
      );
      // closing subscription
      _sendOtpSubscription!.cancel();
    });

//?-----------------------------------------------------------------------------
    on<ToggleFailures>((event, emit) => {
          emit(state.copyWith(failureOrSuccess: none())),
        });

//?-----------------------------------------------------------------------------
    on<ToggleCodeSentState>((event, emit) => {
          emit(state.copyWith(isCodeSent: false, failureOrSuccess: none())),
        });
//?-----------------------------------------------------------------------------

    on<ConfirmOtp>((event, emit) async {
      // return if already in progress
      if (state.isSubmitting) return;
      // emit loading state
      emit(state.copyWith(
        isSubmitting: true,
        failureOrSuccess: none(),
      ));
      await Future.delayed(const Duration(seconds: 1));
      // calling confirmOtp via authFacade
      await _iAuthFacade.confirmOtp(otp: event.otp).then(
            (result) => result.fold(
              (authFailure) {
                emit(state.copyWith(
                  isSubmitting: false,
                  failureOrSuccess: some(left(authFailure)),
                ));
                add(const ToggleFailures());
              },
              (success) => emit(state.copyWith(
                isSubmitting: false,
                failureOrSuccess: some(right(success)),
              )),
            ),
          );
    });
  }
//?-----------------------------------------------------------------------------
  @override
  Future<void> close() async {
    await _sendOtpSubscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
}
