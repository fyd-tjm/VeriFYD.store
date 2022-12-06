part of 'auth_status_cubit.dart';

@freezed
class AuthStatusState with _$AuthStatusState {
  const AuthStatusState._();
  const factory AuthStatusState({
    required AuthUser? authUser,
    required bool isInProgress,
  }) = _AuthStatusState;

  factory AuthStatusState.empty() => const AuthStatusState(
        authUser: null,
        isInProgress: false,
      );
}
