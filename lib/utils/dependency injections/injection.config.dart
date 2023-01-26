// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../00%20ui-core/widget/fyd_loading_overlay.dart' as _i5;
import '../../02%20application/cart/cubit/cart_cubit.dart' as _i23;
import '../../02%20application/checkout/checkout_bloc.dart' as _i26;
import '../../02%20application/fyd%20user/fyd_user_cubit.dart' as _i24;
import '../../02%20application/on%20boarding/on_boarding_cubit.dart' as _i18;
import '../../02%20application/phone%20login/phone_login_bloc.dart' as _i19;
import '../../02%20application/product/product_bloc.dart' as _i25;
import '../../02%20application/shared%20info/shared_info_cubit.dart' as _i20;
import '../../02%20application/stores/store/store_bloc.dart' as _i21;
import '../../02%20application/stores/stores_bloc.dart' as _i22;
import '../../03%20domain/auth/00_export_auth_domain.dart' as _i6;
import '../../03%20domain/cart/i_cart_repository.dart' as _i8;
import '../../03%20domain/checkout/i_checkout_repository.dart' as _i10;
import '../../03%20domain/shared/00_export_shared_domain.dart' as _i12;
import '../../03%20domain/store/00_export_store_domain.dart' as _i14;
import '../../03%20domain/user/00_export_user_domain.dart' as _i16;
import '../../04%20infrastructure/auth/firebase_auth_facade.dart' as _i7;
import '../../04%20infrastructure/cart/firebase_cart_repository.dart' as _i9;
import '../../04%20infrastructure/checkout/firebase_checkout_repository.dart'
    as _i11;
import '../../04%20infrastructure/core/firebase_injectable_module.dart' as _i27;
import '../../04%20infrastructure/shared/firebase_shared_info_repository.dart'
    as _i13;
import '../../04%20infrastructure/store/firebase_store_repository.dart' as _i15;
import '../../04%20infrastructure/user/firebase_user_repository.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.FydLoadingOverlay>(() => _i5.FydLoadingOverlay());
  gh.lazySingleton<_i6.IAuthFacade>(
      () => _i7.FirebaseAuthFacade(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i8.ICartRepository>(
      () => _i9.FirebaseCartRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i10.ICheckoutRepository>(
      () => _i11.FirebaseCheckoutRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i12.ISharedInfoRepository>(
      () => _i13.FirebaseSharedInfoRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i14.IStoreRepository>(
      () => _i15.FirebaseStoreRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i16.IUserRepository>(
      () => _i17.FirebaseUserRepository(get<_i4.FirebaseFirestore>()));
  gh.factory<_i18.OnBoardingCubit>(
      () => _i18.OnBoardingCubit(get<_i16.IUserRepository>()));
  gh.factory<_i19.PhoneLoginBloc>(() => _i19.PhoneLoginBloc());
  gh.lazySingleton<_i20.SharedInfoCubit>(
      () => _i20.SharedInfoCubit(get<_i12.ISharedInfoRepository>()));
  gh.factory<_i21.StoreBloc>(
      () => _i21.StoreBloc(get<_i14.IStoreRepository>()));
  gh.lazySingleton<_i22.StoresBloc>(() => _i22.StoresBloc(
        get<_i14.IStoreRepository>(),
        get<_i20.SharedInfoCubit>(),
      ));
  gh.lazySingleton<_i23.CartCubit>(() => _i23.CartCubit(
        get<_i8.ICartRepository>(),
        get<_i14.IStoreRepository>(),
        get<_i20.SharedInfoCubit>(),
      ));
  gh.lazySingleton<_i24.FydUserCubit>(() => _i24.FydUserCubit(
        get<_i16.IUserRepository>(),
        get<_i6.IAuthFacade>(),
      ));
  gh.factory<_i25.ProductBloc>(() => _i25.ProductBloc(
        get<_i14.IStoreRepository>(),
        get<_i8.ICartRepository>(),
        get<_i23.CartCubit>(),
        get<_i24.FydUserCubit>(),
        get<_i20.SharedInfoCubit>(),
      ));
  gh.lazySingleton<_i26.CheckoutBloc>(() => _i26.CheckoutBloc(
        get<_i23.CartCubit>(),
        get<_i24.FydUserCubit>(),
        get<_i20.SharedInfoCubit>(),
        get<_i10.ICheckoutRepository>(),
      ));
  return get;
}

class _$FirebaseInjectableModule extends _i27.FirebaseInjectableModule {}
