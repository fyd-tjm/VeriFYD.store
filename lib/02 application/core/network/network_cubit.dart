import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'network_state.dart';
part 'network_cubit.freezed.dart';

//?-----------------------------------------------------------------------------
@lazySingleton
class NetworkCubit extends Cubit<NetworkState> {
  late Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _subs;

//?-----------------------------------------------------------------------------

  NetworkCubit() : super(NetworkState.initial()) {
    _connectivity = Connectivity();
    _subs = _connectivity.onConnectivityChanged.listen(_updateNetworkStatus);
    networkStatusCheck();
  }

//?-----------------------------------------------------------------------------

  Future<void> networkStatusCheck() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    return _updateNetworkStatus(result);
  }

//?-----------------------------------------------------------------------------

  void _updateNetworkStatus(ConnectivityResult event) {
    if (event == ConnectivityResult.none) {
      emit(state.copyWith(isNetworkAvailable: false));
    } else {
      emit(state.copyWith(isNetworkAvailable: true));
    }
  }

//?-----------------------------------------------------------------------------

  @override
  Future<void> close() {
    _subs.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
}
