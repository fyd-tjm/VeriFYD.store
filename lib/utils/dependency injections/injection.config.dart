// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_loading_overlay.dart'
    as _i5;
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_network_dialog.dart'
    as _i25;
import 'package:verifyd_store/02%20application/cart/cubit/cart_cubit.dart'
    as _i24;
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart'
    as _i28;
import 'package:verifyd_store/02%20application/core/network/network_cubit.dart'
    as _i18;
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart'
    as _i26;
import 'package:verifyd_store/02%20application/on%20boarding/on_boarding_cubit.dart'
    as _i19;
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart'
    as _i20;
import 'package:verifyd_store/02%20application/product/product_bloc.dart'
    as _i27;
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart'
    as _i21;
import 'package:verifyd_store/02%20application/stores/store/store_bloc.dart'
    as _i22;
import 'package:verifyd_store/02%20application/stores/stores_bloc.dart' as _i23;
import 'package:verifyd_store/03%20domain/auth/00_export_auth_domain.dart'
    as _i6;
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart' as _i8;
import 'package:verifyd_store/03%20domain/checkout/i_checkout_repository.dart'
    as _i10;
import 'package:verifyd_store/03%20domain/shared/00_export_shared_domain.dart'
    as _i12;
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart'
    as _i14;
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart'
    as _i16;
import 'package:verifyd_store/04%20infrastructure/auth/firebase_auth_facade.dart'
    as _i7;
import 'package:verifyd_store/04%20infrastructure/cart/firebase_cart_repository.dart'
    as _i9;
import 'package:verifyd_store/04%20infrastructure/checkout/firebase_checkout_repository.dart'
    as _i11;
import 'package:verifyd_store/04%20infrastructure/shared/firebase_shared_info_repository.dart'
    as _i13;
import 'package:verifyd_store/04%20infrastructure/store/firebase_store_repository.dart'
    as _i15;
import 'package:verifyd_store/04%20infrastructure/user/firebase_user_repository.dart'
    as _i17;

import '../../04%20infrastructure/core/firebase_injectable_module.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
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
        () => _i7.FirebaseAuthFacade(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i8.ICartRepository>(
        () => _i9.FirebaseCartRepository(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i10.ICheckoutRepository>(
        () => _i11.FirebaseCheckoutRepository(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i12.ISharedInfoRepository>(
        () => _i13.FirebaseSharedInfoRepository(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i14.IStoreRepository>(
        () => _i15.FirebaseStoreRepository(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i16.IUserRepository>(
        () => _i17.FirebaseUserRepository(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i18.NetworkCubit>(() => _i18.NetworkCubit());
    gh.factory<_i19.OnBoardingCubit>(
        () => _i19.OnBoardingCubit(gh<_i16.IUserRepository>()));
    gh.factory<_i20.PhoneLoginBloc>(() => _i20.PhoneLoginBloc());
    gh.lazySingleton<_i21.SharedInfoCubit>(
        () => _i21.SharedInfoCubit(gh<_i12.ISharedInfoRepository>()));
    gh.factory<_i22.StoreBloc>(
        () => _i22.StoreBloc(gh<_i14.IStoreRepository>()));
    gh.lazySingleton<_i23.StoresBloc>(() => _i23.StoresBloc(
          gh<_i14.IStoreRepository>(),
          gh<_i21.SharedInfoCubit>(),
        ));
    gh.lazySingleton<_i24.CartCubit>(() => _i24.CartCubit(
          gh<_i8.ICartRepository>(),
          gh<_i14.IStoreRepository>(),
          gh<_i21.SharedInfoCubit>(),
        ));
    gh.lazySingleton<_i25.FydNetworkDialog>(
        () => _i25.FydNetworkDialog(gh<_i18.NetworkCubit>()));
    gh.lazySingleton<_i26.FydUserCubit>(() => _i26.FydUserCubit(
          gh<_i16.IUserRepository>(),
          gh<_i6.IAuthFacade>(),
        ));
    gh.factory<_i27.ProductBloc>(() => _i27.ProductBloc(
          gh<_i14.IStoreRepository>(),
          gh<_i8.ICartRepository>(),
          gh<_i24.CartCubit>(),
          gh<_i26.FydUserCubit>(),
          gh<_i21.SharedInfoCubit>(),
        ));
    gh.lazySingleton<_i28.CheckoutBloc>(() => _i28.CheckoutBloc(
          gh<_i24.CartCubit>(),
          gh<_i26.FydUserCubit>(),
          gh<_i21.SharedInfoCubit>(),
          gh<_i10.ICheckoutRepository>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i29.FirebaseInjectableModule {}
