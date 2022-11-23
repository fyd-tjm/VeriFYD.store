// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/auth/i_auth_facade.dart' as _i5;
import '../../domain/shared/i_shared_info_repository.dart' as _i7;
import '../../domain/store/i_store_repository.dart' as _i9;
import '../../infrastructure/auth/firebase_auth_facade.dart' as _i6;
import '../../infrastructure/core/firebase_injectable_module.dart' as _i11;
import '../../infrastructure/shared/firebase_shared_info_repository.dart'
    as _i8;
import '../../infrastructure/store/firebase_store_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.IAuthFacade>(
      () => _i6.FirebaseAuthFacade(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i7.ISharedInfoRepository>(
      () => _i8.FirebaseSharedInfoRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i9.IStoreRepository>(
      () => _i10.FirebaseStoreRepository(get<_i4.FirebaseFirestore>()));
  return get;
}

class _$FirebaseInjectableModule extends _i11.FirebaseInjectableModule {}
