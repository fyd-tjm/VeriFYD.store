import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../03 domain/auth/00_export_auth_domain.dart';

part 'auth_status_state.dart';
part 'auth_status_cubit.freezed.dart';

@lazySingleton
class AuthStatusCubit extends Cubit<AuthStatusState> {
  late final IAuthFacade _iAuthFacade;
  AuthStatusCubit() : super(AuthStatusState.empty()) {
    _iAuthFacade = getIt<IAuthFacade>();
    currentAuthStatus();
  }

  void currentAuthStatus() {
    emit(state.copyWith(isInProgress: true, authUser: null));
    // get current user via authFacade
    final authUser = _iAuthFacade.getCurrentUser();
    // logic
    if (authUser == null) {
      emit(
        state.copyWith(
          isInProgress: false,
          authUser: authUser,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isInProgress: false,
          authUser: authUser,
        ),
      );
    }
  }
}
