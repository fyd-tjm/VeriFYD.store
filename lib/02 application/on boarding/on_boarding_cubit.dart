import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../03 domain/auth/00_export_auth_domain.dart';
import '../../03 domain/user/00_export_user_domain.dart';
part 'on_boarding_state.dart';
part 'on_boarding_cubit.freezed.dart';

@injectable
class OnBoardingCubit extends Cubit<OnBoardingState> {
  late final IUserRepository _iUserRepo;
  OnBoardingCubit() : super(OnBoardingState.initial()) {
    _iUserRepo = getIt<IUserRepository>();
  }

  Future<void> addUserName({required UserName userName}) async {
    // return if already in progress
    if (state.isSubmitting) return;
    // emit loading state
    emit(
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ),
    );

    // calling createUser via userRepo to db
    await _iUserRepo
        .createUser(name: userName.getOrCrash())
        .then(
          (failureOrSuccess) => failureOrSuccess.fold(
            (authFailure) => emit(
              state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(left(authFailure)),
              ),
            ),
            (success) => emit(
              state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(right(success)),
              ),
            ),
          ),
        )
        .onError(
          (error, stackTrace) => emit(
            state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: none(),
            ),
          ),
        );
  }
}
