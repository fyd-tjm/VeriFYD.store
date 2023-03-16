part of 'fyd_user_cubit.dart';

@freezed
class FydUserState with _$FydUserState {
  const factory FydUserState({
    required bool isFetching,
    required bool loadingState,
    required bool isAuthenticated,
    required bool onBoardingStatus,
    required FydUser? fydUser,
    required List<FydOrder>? fydOrders,
    required Option<Either<UserFailure, Unit>> failureOrSuccess,
    required bool updating,
  }) = _FydUserState;

  factory FydUserState.initial() => FydUserState(
      isFetching: false,
      loadingState: false,
      isAuthenticated: false,
      onBoardingStatus: false,
      fydUser: null,
      fydOrders: null,
      failureOrSuccess: none(),
      updating: false);
}
