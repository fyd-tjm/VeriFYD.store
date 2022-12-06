import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/domain/auth/auth_user.dart';
import 'package:verifyd_store/domain/user/fyd_user.dart';
import 'package:verifyd_store/domain/user/i_user_repository.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

part 'fyd_user_state.dart';
part 'fyd_user_cubit.freezed.dart';

@lazySingleton
class FydUserCubit extends Cubit<FydUserState> {
  late final IUserRepository _iUserRepo;
  FydUserCubit() : super(FydUserState.initial()) {
    _iUserRepo = getIt<IUserRepository>();
  }

  Future<void> getUserStatus() async {
    // emit loading state
    emit(state.copyWith(loadingState: true, authUser: null, fydUser: null));
    await Future.delayed(const Duration(seconds: 1));
    // get fydUser from db
    final userStatus = await _iUserRepo.getFydUser();
    // emit the result
    emit(state.copyWith(
        loadingState: false,
        authUser: userStatus.head,
        fydUser: userStatus.tail));
  }

  Future<void> logOutUser() async {
    await _iUserRepo.logOutUser();
    await getUserStatus();
  }
}
