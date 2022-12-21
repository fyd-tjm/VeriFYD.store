import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/03%20domain/store/store_failure.dart';

part 'store_event.dart';
part 'store_state.dart';
part 'store_bloc.freezed.dart';

@injectable
class StoreBloc extends Bloc<StoreEvent, StoreState> {
//?-----------------------------------------------------------------------------
  // final Store store;
  final IStoreRepository _iStoreRepo;
  late final Map<String, List<Product>> _productsLocally;
  StreamSubscription<Either<StoreFailure, Store>>? _subscription;
//?-----------------------------------------------------------------------------
  StoreBloc(this._iStoreRepo) : super(StoreState.initial()) {
    _productsLocally = {};

//?-----------------------------------------------------------------------------
    on<GetStoreRealtime>((event, emit) async {
      log("0");
      _subscription?.cancel();
      _subscription =
          _iStoreRepo.getStoreRealTime(storeId: event.storeId).listen(
                (failureOrStore) => add(
                  StoreEvent.recievedStreamEvent(event: failureOrStore),
                ),
              );
    });
//?-----------------------------------------------------------------------------
    on<RecievedStreamEvent>((event, emit) {
      log('newStoreRealTime');
      emit(
        event.event.fold(
          (storeFailure) => state.copyWith(
            isFetching: false,
            failure: some(left(storeFailure)),
          ),
          (store) => state.copyWith(
            isFetching: false,
            storeRealtime: store,
            failure: none(),
            loadingMore: false,
          ),
        ),
      );
    });
//?-----------------------------------------------------------------------------
    on<UpdateSelectedType>((event, emit) async {
      log('update-type-Event-called');
      // TODO : storeRealTime null logic
      if (state.storeRealtime == null) return;
      // emit isFetching, selectedType,..
      emit(state.copyWith(
        isFetching: true,
        selectedType: event.type,
        loadingMore: false,
        notAvailable: false,
        failure: none(),
      ));
      // check if type available in _productsLocally
      if (_productsLocally.containsKey(state.selectedType) == false) {
        log("1");
        final newEntry = <String, List<Product>>{state.selectedType!: []};
        _productsLocally.addEntries(newEntry.entries);
      }
      // if productsLocally [isNotEmpty]
      // (1)=> emit isFetching: false, productList: _productsLocally(selectedType)
      // (0)=> AddProductsLocally(state.category)
      if (_productsLocally[state.selectedType!]!.isNotEmpty) {
        log('2');

        emit(state.copyWith(
          isFetching: false,
          productList: _productsLocally[state.selectedType!]!,
        ));
      } else {
        // AddProductsLocally(type) :
        // check if types available in storeRealtime
        // (1)=> FetchProducts(state.selectedType)
        // (0)=> emit isFetching: false, notAvailable: true
        log('3');
        final type = state.selectedType!;
        final typeAvailability = state.storeRealtime!.types[type];
        if (typeAvailability != null && typeAvailability > 0) {
          log('4');
          // FetchProducts(type, afterSkuId?):
          // fetchProducts via iStoreRepo -->
          // (0)=> emit isFetching: fasle, failure: some(ProductFailure)
          // (1)=> add list to _storeLocally respected List
          //       && emit isFetching: false, storeList: _storeLocally(state.Category)[]
          final productCollectionRef = state.storeRealtime!.productsRef;
          final failureOrProducts = await _iStoreRepo.getProductsByType(
              type: type, productsReference: productCollectionRef);
          failureOrProducts.fold(
            (productFailure) => emit(state.copyWith(
              isFetching: false,
              failure: some(right(productFailure)),
              productList: _productsLocally[type]!,
            )),
            (products) {
              _productsLocally[type]!.addAll(products);
              emit(state.copyWith(
                isFetching: false,
                productList: _productsLocally[type]!,
                failure: none(),
                loadingMore: false,
              ));
            },
          );
        } else {
          log('5');
          emit(state.copyWith(
            isFetching: false,
            notAvailable: true,
            productList: _productsLocally[type]!,
            loadingMore: false,
          ));
        }
      }
    });
//?-----------------------------------------------------------------------------
    on<LoadMoreProducts>((event, emit) async {
      log('7');
      emit(state.copyWith(
          loadingMore: true, notAvailable: false, failure: none()));
      final type = state.selectedType!;
      final fetchAfterSkuId = state.productList.last.skuId;
      final productCollectionRef = state.storeRealtime!.productsRef;
      log('8');
      // FetchProducts(type, afterSkuId?):
      // fetchProducts via iStoreRepo -->
      // (0)=> emit isFetching: fasle, loadingMore: false, failure: some(ProductFailure)
      // (1)=> add list to _productsLocally respected List
      //       && emit isFetching: false, loadingMore: false, productList: _productsLocally(state.type)[]
      final failureOrProducts = await _iStoreRepo.getProductsByType(
        type: type,
        productsReference: productCollectionRef,
        startAfterSkuId: fetchAfterSkuId,
      );
      failureOrProducts.fold(
        (productFailure) => emit(state.copyWith(
          isFetching: false,
          loadingMore: false,
          failure: some(right(productFailure)),
          productList: _productsLocally[type]!,
        )),
        (products) {
          _productsLocally[type]!.addAll(products);
          emit(state.copyWith(
            loadingMore: false,
            isFetching: false,
            productList: _productsLocally[type]!,
            failure: none(),
          ));
        },
      );
    });
//?-----------------------------------------------------------------------------
  }
//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
}
