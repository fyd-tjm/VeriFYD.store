// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/shared/00_export_shared_domain.dart';

part 'shared_info_state.dart';
part 'shared_info_cubit.freezed.dart';

@lazySingleton
class SharedInfoCubit extends Cubit<SharedInfoState> {
  final ISharedInfoRepository _iSharedRepo;
  StreamSubscription<Either<SharedInfoFailure, SharedInfo>>? _subscription;
//?-----------------------------------------------------------------------------
  SharedInfoCubit(this._iSharedRepo) : super(SharedInfoState.initial());
//?-----------------------------------------------------------------------------
  void getSharedInfoRealtime() async {
    emit(state.copyWith(isFetching: true, failure: none()));
    // cancel the subs if active
    _subscription?.cancel();
    // update recent-search-Map from local-db
    final localDb = Hive.box('local-db');
    final recentSearchMap = localDb.get(
      'recentSearchMap',
      defaultValue: {},
    ) as Map<dynamic, dynamic>;
    emit(state.copyWith(
        recentSearchMap: recentSearchMap.cast<String, String>()));
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
  void updateRecentSearchMap({
    required MapEntry<String, String> recentSearchEntry,
  }) async {
    Map<String, String> recentSearchMap = Map.from(state.recentSearchMap);
    //! updating map logic
    if (recentSearchMap.containsKey(recentSearchEntry.key)) {
      recentSearchMap.remove(recentSearchEntry.key);
      recentSearchMap.addAll({recentSearchEntry.key: recentSearchEntry.value});
      emit(state.copyWith(recentSearchMap: recentSearchMap));
    } else {
      if (recentSearchMap.length > 9) {
        recentSearchMap.remove(recentSearchMap.keys.first);
        recentSearchMap
            .addAll({recentSearchEntry.key: recentSearchEntry.value});
        emit(state.copyWith(recentSearchMap: recentSearchMap));
      } else {
        recentSearchMap
            .addAll({recentSearchEntry.key: recentSearchEntry.value});
        emit(state.copyWith(recentSearchMap: recentSearchMap));
      }
    }
    //! updating local-db
    final localDb = Hive.box('local-db');
    await localDb.put('recentSearchMap', recentSearchMap);
  }

//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
