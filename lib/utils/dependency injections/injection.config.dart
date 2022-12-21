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
import '../../02%20application/cart/cubit/cart_cubit.dart' as _i22;
import '../../02%20application/fyd%20user/fyd_user_cubit.dart' as _i6;
import '../../02%20application/on%20boarding/on_boarding_cubit.dart' as _i17;
import '../../02%20application/phone%20login/phone_login_bloc.dart' as _i18;
import '../../02%20application/shared%20info/shared_info_cubit.dart' as _i19;
import '../../02%20application/stores/product/product_bloc.dart' as _i23;
import '../../02%20application/stores/store/store_bloc.dart' as _i20;
import '../../02%20application/stores/stores_bloc.dart' as _i21;
import '../../03%20domain/auth/00_export_auth_domain.dart' as _i7;
import '../../03%20domain/cart/i_cart_repository.dart' as _i9;
import '../../03%20domain/shared/00_export_shared_domain.dart' as _i11;
import '../../03%20domain/store/00_export_store_domain.dart' as _i13;
import '../../03%20domain/user/00_export_user_domain.dart' as _i15;
import '../../04%20infrastructure/auth/firebase_auth_facade.dart' as _i8;
import '../../04%20infrastructure/cart/firebase_cart_repository.dart' as _i10;
import '../../04%20infrastructure/core/firebase_injectable_module.dart' as _i24;
import '../../04%20infrastructure/shared/firebase_shared_info_repository.dart'
    as _i12;
import '../../04%20infrastructure/store/firebase_store_repository.dart' as _i14;
import '../../04%20infrastructure/user/firebase_user_repository.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.ICartRepository>(
      () => _i10.FirebaseCartRepository(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i11.ISharedInfoRepository>(
      () => _i12.FirebaseSharedInfoRepository(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i13.IStoreRepository>(
      () => _i14.FirebaseStoreRepository(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i15.IUserRepository>(
      () => _i16.FirebaseUserRepository(get<_i5.FirebaseFirestore>()));
  gh.factory<_i17.OnBoardingCubit>(() => _i17.OnBoardingCubit());
  gh.factory<_i18.PhoneLoginBloc>(() => _i18.PhoneLoginBloc());
  gh.lazySingleton<_i19.SharedInfoCubit>(
      () => _i19.SharedInfoCubit(get<_i11.ISharedInfoRepository>()));
  gh.factory<_i20.StoreBloc>(
      () => _i20.StoreBloc(get<_i13.IStoreRepository>()));
  gh.lazySingleton<_i21.StoresBloc>(() => _i21.StoresBloc(
        get<_i13.IStoreRepository>(),
        get<_i19.SharedInfoCubit>(),
      ));
  gh.singleton<_i22.CartCubit>(_i22.CartCubit(
    get<_i9.ICartRepository>(),
    get<_i13.IStoreRepository>(),
  ));
  gh.factory<_i23.ProductBloc>(() => _i23.ProductBloc(
        get<_i13.IStoreRepository>(),
        get<_i9.ICartRepository>(),
        get<_i22.CartCubit>(),
      ));
  return get;
}

class _$FirebaseInjectableModule extends _i24.FirebaseInjectableModule {}
