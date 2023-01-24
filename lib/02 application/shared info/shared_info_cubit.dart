import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/shared/00_export_shared_domain.dart';

part 'shared_info_state.dart';
part 'shared_info_cubit.freezed.dart';

@lazySingleton
class SharedInfoCubit extends Cubit<SharedInfoState> {
  final ISharedInfoRepository _iSharedRepo;
  StreamSubscription<Either<SharedInfoFailure, SharedInfo>>? _subscription;
//?-----------------------------------------------------------------------------
  SharedInfoCubit(this._iSharedRepo) : super(SharedInfoState.initial()) {
    // _iSharedRepo = getIt<ISharedInfoRepository>();
    // _getSharedInfoRealtime();
  }
//?-----------------------------------------------------------------------------
  void getSharedInfoRealtime() async {
    emit(state.copyWith(isFetching: true, failure: none()));
    // cancel the subs if active
    _subscription?.cancel();
    // start listening to stream via sharedRepo
    _subscription = _iSharedRepo.getSharedInfo().listen(
          (failureOrSharedInfo) => _handleStreamEvent(failureOrSharedInfo),
        );
  }

//?-----------------------------------------------------------------------------
  void _handleStreamEvent(Either<SharedInfoFailure, SharedInfo> event) {
    event.fold(
      (failure) =>
          emit(state.copyWith(isFetching: false, failure: some(failure))),
      (sharedInfo) => emit(
        state.copyWith(
            sharedInfo: sharedInfo, isFetching: false, failure: none()),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
