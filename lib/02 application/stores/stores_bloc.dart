import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import '../../03 domain/store/store_failure.dart';
import '../shared info/shared_info_cubit.dart';

part 'stores_event.dart';
part 'stores_state.dart';
part 'stores_bloc.freezed.dart';

@lazySingleton
class StoresBloc extends Bloc<StoresEvent, StoresState> {
//?-----------------------------------------------------------------------------
  final IStoreRepository _iStoreRepo;
  final SharedInfoCubit _sharedInfoCubit;
  late final Map<String, List<Store>> _storesLocally;

//?-----------------------------------------------------------------------------
  StoresBloc(this._iStoreRepo, this._sharedInfoCubit)
      : super(StoresState.initial()) {
    _storesLocally = {};

//?-----------------------------------------------------------------------------

    on<UpdateSelectedCategory>((event, emit) async {
      if (state.isFetching) return;

      emit(state.copyWith(
        isFetching: true,
        selectedCategory: event.category,
        loadingMore: false,
        notAvailable: false,
        failure: none(),
      ));
      // check if category available in _storesLocally if not add it with []
      if (_storesLocally.containsKey(state.selectedCategory) == false) {
        final newEntry = <String, List<Store>>{state.selectedCategory!: []};
        _storesLocally.addEntries(newEntry.entries);
      }
      // if storesLocally [isNotEmpty]
      // (1)=> emit isFetching: false, storeList: _storesLocally(selectedCategory)
      // (0)=> AddStoresLocally(state.category)
      if (_storesLocally[state.selectedCategory!]!.isNotEmpty) {
        emit(state.copyWith(
          isFetching: false,
          storeList: _storesLocally[state.selectedCategory!]!,
        ));
      } else {
        // AddStoresLocally(category) :
        // check if stores available via LiveStores
        // (1)=> FetchStores(state.category)
        // (0)=> emit isFetching: false, notAvailable: true

        final liveStores = _sharedInfoCubit
            .state.sharedInfo?.liveStores[state.selectedCategory];
        if (liveStores != null && liveStores > 0) {
          final category = state.selectedCategory!;

          // FetchStores(category, afterSId?):
          // fetchStores via iStoreRepo -->
          // (0)=> emit isFetching: fasle, failure: some(failure)
          // (1)=> add list to _storeLocally respected List
          //       && emit isFetching: false, storeList: _storeLocally(state.Category)[]
          var failureOrStores = await _iStoreRepo.getStoresByCategory(
              category: category, startAfterStoreId: null);
          failureOrStores.fold(
            (storeFailure) {
              emit(state.copyWith(
                  isFetching: false,
                  loadingMore: false,
                  failure: some(storeFailure)));
              add(const ToggleFailures());
            },
            (storesList) {
              _storesLocally[state.selectedCategory]!.addAll(storesList);
              emit(state.copyWith(
                isFetching: false,
                failure: none(),
                loadingMore: false,
                storeList: _storesLocally[state.selectedCategory]!,
              ));
            },
          );
        } else {
          emit(state.copyWith(
              isFetching: false,
              notAvailable: true,
              storeList: _storesLocally[state.selectedCategory!]!));
        }
      }
    });

//?-----------------------------------------------------------------------------

    on<LoadMoreStores>((event, emit) async {
      if (state.isFetching) return;
      emit(state.copyWith(
        loadingMore: true,
        notAvailable: false,
        failure: none(),
      ));
      final category = state.selectedCategory!;
      final fetchAfterSid = state.storeList.last.storeId;
      // FetchStores(category, afterSId?):
      // fetchStores via iStoreRepo -->
      // (0)=> emit isFetching: fasle, failure: some(failure)
      // (1)=> add list to _storeLocally respected List
      //       && emit isFetching: false, storeList: _storeLocally(state.Category)[]
      var failureOrStores = await _iStoreRepo.getStoresByCategory(
          category: category, startAfterStoreId: fetchAfterSid);
      failureOrStores.fold(
        (storeFailure) {
          emit(state.copyWith(
              isFetching: false,
              loadingMore: false,
              failure: some(storeFailure)));

          add(const ToggleFailures());
        },
        (storesList) {
          _storesLocally[state.selectedCategory]!.addAll(storesList);
          emit(state.copyWith(
            isFetching: false,
            failure: none(),
            loadingMore: false,
            storeList: _storesLocally[state.selectedCategory]!,
          ));
        },
      );
    });
  }
//?-----------------------------------------------------------------------------

}
