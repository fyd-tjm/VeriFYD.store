part of 'fyd_user_cubit.dart';

@freezed
class FydUserState with _$FydUserState {
  const factory FydUserState({
    required bool loadingState,
    required AuthUser? authUser,
    required FydUser? fydUser,
  }) = _FydUserState;

  factory FydUserState.initial() => const FydUserState(
        loadingState: false,
        authUser: null,
        fydUser: null,
      );
}
