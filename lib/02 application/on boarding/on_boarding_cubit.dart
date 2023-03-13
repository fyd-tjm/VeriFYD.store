import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../03 domain/user/00_export_user_domain.dart';

part 'on_boarding_state.dart';
part 'on_boarding_cubit.freezed.dart';

@injectable
class OnBoardingCubit extends Cubit<OnBoardingState> {
  final IUserRepository _iUserRepo;
  OnBoardingCubit(this._iUserRepo) : super(OnBoardingState.initial());
//?-----------------------------------------------------------------------------
  Future<void> addUserName(
      {required String name, required String email}) async {
    if (state.isSubmitting) return;
    emit(
        state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none()));
    await Future.delayed(const Duration(milliseconds: 1000));
    // calling createUser via userRepo to db
    await _iUserRepo
        .createUser(name: name, email: email)
        .then((failureOrSuccess) => failureOrSuccess.fold(
              (authFailure) {
                emit(state.copyWith(
                  isSubmitting: false,
                  authFailureOrSuccessOption: some(left(authFailure)),
                ));
                toggleFailures();
              },
              (success) => emit(state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: some(right(success)),
              )),
            ));
  }

//?-----------------------------------------------------------------------------
  void toggleFailures() {
    emit(state.copyWith(authFailureOrSuccessOption: none()));
  }
//?-----------------------------------------------------------------------------
}
