import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';

import '../../03 domain/user/00_export_user_domain.dart';
import '../../03 domain/auth/00_export_auth_domain.dart';

part 'fyd_user_state.dart';
part 'fyd_user_cubit.freezed.dart';

@lazySingleton
class FydUserCubit extends Cubit<FydUserState> {
  final IUserRepository _iUserRepo;
  final IAuthFacade _iAuthFacade;
  StreamSubscription<Either<UserFailure, FydUser?>>? _subscription;

//?-----------------------------------------------------------------------------
  FydUserCubit(this._iUserRepo, this._iAuthFacade)
      : super(FydUserState.initial());

//?-Get-UserStatus--------------------------------------------------------------
  Future<void> getUserStatus() async {
    // emit loading state
    emit(state.copyWith(
      isFetching: true,
      isAuthenticated: false,
      fydUser: null,
      failureOrSuccess: none(),
    ));

    final authStatus = _iAuthFacade.getAuthStatus();

    if (authStatus == false) {
      emit(state.copyWith(
        isFetching: false,
        isAuthenticated: authStatus,
        failureOrSuccess: none(),
      ));
    } else {
      getFydUserRealtime();
    }
  }

//?-Get-FydUser-Realtime--------------------------------------------------------

  void getFydUserRealtime() async {
    _subscription?.cancel();
    _subscription = _iUserRepo.getFydUserRealtime().listen(
        (userFailureOrFydUser) => _handleStreamEvent(userFailureOrFydUser));
  }

  //-------------------
  void _handleStreamEvent(Either<UserFailure, FydUser?> event) {
    // log('handleUserEvent');
    event.fold(
      (failure) {
        emit(state.copyWith(
          isFetching: false,
          isAuthenticated: true,
          failureOrSuccess: some(left(failure)),
        ));
        toggleFailures();
      },
      (fydUser) {
        emit(state.copyWith(
          isFetching: false,
          fydUser: fydUser,
          isAuthenticated: true,
          failureOrSuccess: none(),
        ));
      },
    );
  }

//?-Update-UserInfo-------------------------------------------------------------

  Future<void> updateUserInfo(
      {required String name, required String email}) async {
    emit(state.copyWith(failureOrSuccess: none(), updating: true));
    //----
    if (name == state.fydUser!.name && email == state.fydUser!.email) {
      // no update call
      emit(
          state.copyWith(failureOrSuccess: some(right(unit)), updating: false));
    } else {
      //----
      final String? updatingName;
      final String? updatingEmail;
      //----
      if (name == state.fydUser!.name) {
        // only email update
        updatingName = null;
        updatingEmail = email;
      } else if (email == state.fydUser!.email) {
        // only name update
        updatingName = name;
        updatingEmail = null;
      } else {
        // both name and email update
        updatingName = name;
        updatingEmail = email;
      }
      //----
      await Future.delayed(const Duration(seconds: 2));
      //----
      await _iUserRepo
          .updateProfile(name: updatingName, email: updatingEmail)
          .then(
            (failureOrSucces) => failureOrSucces.fold(
              (userFailure) {
                emit(state.copyWith(
                    updating: false,
                    failureOrSuccess: some(left(userFailure))));
                toggleFailures();
              },
              (success) => emit(state.copyWith(
                  failureOrSuccess: some(right(success)), updating: false)),
            ),
          );
      //----
    }
  }

//?--Add-New-Address------------------------------------------------------------
  Future<void> addNewAddress({
    required String name,
    required String phone,
    required String email,
    required String al1,
    required String al2,
    required String city,
    required int pincode,
    required String addressState,
  }) async {
    //----
    emit(state.copyWith(failureOrSuccess: none(), updating: true));
    //----
    // new address
    final newAddress = FydAddress(
      name: name,
      phone: '+91$phone',
      email: email,
      line1: al1,
      line2: al2,
      city: city,
      state: addressState,
      pincode: pincode,
    );
    //----
    final newIndex = state.fydUser!.addresses.entries.length;
    //----
    await Future.delayed(const Duration(seconds: 2));
    //----
    await _iUserRepo
        .addNewAddress(address: newAddress, newIndex: newIndex)
        .then(
          (failureOrSucces) => failureOrSucces.fold(
            (userFailure) {
              emit(state.copyWith(
                  updating: false, failureOrSuccess: some(left(userFailure))));
              toggleFailures();
            },
            (success) {
              emit(state.copyWith(
                  failureOrSuccess: some(right(success)), updating: false));
              toggleFailures();
            },
          ),
        );
    //----
  }

//?--Update-Address-------------------------------------------------------------
  Future<void> updateAddress({
    required String name,
    required String phone,
    required String email,
    required String al1,
    required String al2,
    required String city,
    required int pincode,
    required String addressState,
    required int atIndex,
  }) async {
    //----
    emit(state.copyWith(failureOrSuccess: none(), updating: true));
    //----
    // updated address
    final addressUpdate = FydAddress(
      name: name,
      phone: '+91$phone',
      email: email,
      line1: al1,
      line2: al2,
      city: city,
      state: addressState,
      pincode: pincode,
    );

    //----
    await Future.delayed(const Duration(seconds: 2));
    //----
    await _iUserRepo
        .updateAddress(address: addressUpdate, atIndex: atIndex)
        .then(
          (failureOrSucces) => failureOrSucces.fold(
            (userFailure) {
              emit(state.copyWith(
                  updating: false, failureOrSuccess: some(left(userFailure))));
              toggleFailures();
            },
            (success) {
              emit(state.copyWith(
                  failureOrSuccess: some(right(success)), updating: false));
              toggleFailures();
            },
          ),
        );
    //----
  }

//?-----------------------------------------------------------------------------
  void getFydOrders() async {
    //--------
    emit(state.copyWith(
        updating: true, failureOrSuccess: none(), fydOrders: null));
    //--------
    final fydOrders = await _iUserRepo.getOrders(userId: state.fydUser!.uId);
    fydOrders.fold(
      (failure) {
        emit(state.copyWith(
          updating: false,
          failureOrSuccess: some(left(failure)),
        ));
        toggleFailures();
      },
      (ordersList) => emit(state.copyWith(
        updating: false,
        fydOrders: ordersList,
        failureOrSuccess: none(),
      )),
    );

    //-------
  }

//?-Toggle-States---------------------------------------------------------------

  void toggleFailures() {
    // log('toggleStates');
    emit(state.copyWith(failureOrSuccess: none()));
  }

//?-Logout-User-----------------------------------------------------------------
  Future<void> logOutUser() async {
    await _iUserRepo.logOutUser();
    await getUserStatus();
  }

//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------

}
