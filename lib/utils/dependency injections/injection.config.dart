// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../02%20application/auth%20status/auth_status_cubit.dart' as _i3;
import '../../02%20application/fyd%20user/fyd_user_cubit.dart' as _i6;
import '../../02%20application/on%20boarding/on_boarding_cubit.dart' as _i15;
import '../../02%20application/phone%20login/phone_login_bloc.dart' as _i16;
import '../../domain/auth/i_auth_facade.dart' as _i7;
import '../../domain/shared/i_shared_info_repository.dart' as _i9;
import '../../domain/store/i_store_repository.dart' as _i11;
import '../../domain/user/i_user_repository.dart' as _i13;
import '../../infrastructure/auth/firebase_auth_facade.dart' as _i8;
import '../../infrastructure/core/firebase_injectable_module.dart' as _i17;
import '../../infrastructure/shared/firebase_shared_info_repository.dart'
    as _i10;
import '../../infrastructure/store/firebase_store_repository.dart' as _i12;
import '../../infrastructure/user/firebase_user_repository.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.AuthStatusCubit>(() => _i3.AuthStatusCubit());
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i6.FydUserCubit>(() => _i6.FydUserCubit());
  gh.lazySingleton<_i7.IAuthFacade>(
      () => _i8.FirebaseAuthFacade(get<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i9.ISharedInfoRepository>(
      () => _i10.FirebaseSharedInfoRepository(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i11.IStoreRepository>(
      () => _i12.FirebaseStoreRepository(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i13.IUserRepository>(
      () => _i14.FirebaseUserRepository(get<_i5.FirebaseFirestore>()));
  gh.factory<_i15.OnBoardingCubit>(() => _i15.OnBoardingCubit());
  gh.factory<_i16.PhoneLoginBloc>(() => _i16.PhoneLoginBloc());
  return get;
}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}
