part of 'on_boarding_cubit.dart';

@freezed
class OnBoardingState with _$OnBoardingState {
  const OnBoardingState._();
  const factory OnBoardingState({
    required bool isSubmitting,
    required Option<Either<UserFailure, Unit>> authFailureOrSuccessOption,
  }) = _OnBoardingState;

  factory OnBoardingState.initial() => OnBoardingState(
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
