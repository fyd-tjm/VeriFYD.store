part of 'fyd_user_cubit.dart';

@freezed
class FydUserState with _$FydUserState {
  const factory FydUserState({
    required bool loadingState,
    required AuthUser? authUser,
    required FydUser? fydUser,
    required Option<Either<UserFailure, Unit>> failureOrSuccess,
    required bool updating,
  }) = _FydUserState;

  factory FydUserState.initial() => FydUserState(
      loadingState: false,
      authUser: null,
      fydUser: null,
      failureOrSuccess: none(),
      updating: false);
}
