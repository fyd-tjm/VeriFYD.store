import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/03%20domain/store/store_failure.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

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
      emit(state.copyWith(isFetching: true));
      _subscription?.cancel();
      _subscription = _iStoreRepo
          .getStoreRealTime(
              storeRef: Helpers.getStoreRef(storeId: event.storeId))
          .listen(
            (failureOrStore) => add(
              StoreEvent.recievedStreamEvent(event: failureOrStore),
            ),
          );
    });
//?-----------------------------------------------------------------------------
    on<RecievedStreamEvent>((event, emit) {
      event.event.fold(
        (storeFailure) {
          emit(state.copyWith(
            isFetching: false,
            failure: some(left(storeFailure)),
          ));
          add(const ToggleFailures());
        },
        (store) => emit(state.copyWith(
          isFetching: false,
          storeRealtime: store,
          failure: none(),
        )),
      );
    });
//?-----------------------------------------------------------------------------
    on<UpdateSelectedType>((event, emit) async {
      if (state.isFetching) return;

      emit(state.copyWith(
        isFetching: true,
        selectedType: event.type,
        failure: none(),
      ));
      // check if type available in _productsLocally
      if (_productsLocally.containsKey(state.selectedType) == false) {
        final newEntry = <String, List<Product>>{state.selectedType!: []};
        _productsLocally.addEntries(newEntry.entries);
      }
      // if productsLocally [isNotEmpty]
      // (1)=> emit isFetching: false, productList: _productsLocally(selectedType)
      // (0)=> AddProductsLocally(state.category)
      if (_productsLocally[state.selectedType!]!.isNotEmpty) {
        emit(state.copyWith(
          isFetching: false,
          productList: _productsLocally[state.selectedType!]!,
        ));
      } else {
        // AddProductsLocally(type) :
        // check if types available in storeRealtime
        // (1)=> FetchProducts(state.selectedType)
        // (0)=> emit isFetching: false, notAvailable: true

        final type = state.selectedType!;
        final typeAvailability = state.storeRealtime!.types[type];
        if (typeAvailability != null && typeAvailability > 0) {
          // FetchProducts(type, afterSkuId?):
          // fetchProducts via iStoreRepo -->
          // (0)=> emit isFetching: fasle, failure: some(ProductFailure)
          // (1)=> add list to _storeLocally respected List
          //       && emit isFetching: false, storeList: _storeLocally(state.Category)[]
          final productsCollectionRef = Helpers.getProductsCollectionRef(
            storeId: state.storeRealtime!.storeId,
          );
          final failureOrProducts = await _iStoreRepo.getProductsByType(
              type: type, productsCollectionRef: productsCollectionRef);
          failureOrProducts.fold(
            (productFailure) {
              emit(state.copyWith(
                isFetching: false,
                failure: some(right(productFailure)),
                productList: _productsLocally[type]!,
              ));
              add(const ToggleFailures());
            },
            (products) {
              _productsLocally[type]!.addAll(products);
              emit(state.copyWith(
                isFetching: false,
                productList: _productsLocally[type]!,
                failure: none(),
              ));
            },
          );
        } //------
        else {
          emit(state.copyWith(
            isFetching: false,
            productList: _productsLocally[type]!,
          ));
        }
      }
    });
//?-----------------------------------------------------------------------------
    on<LoadMoreProducts>((event, emit) async {
      emit(state.copyWith(isFetching: false, failure: none()));
      final type = state.selectedType!;
      final fetchAfterSkuId = state.productList.last.skuId;
      final productsCollectionRef = Helpers.getProductsCollectionRef(
        storeId: state.storeRealtime!.storeId,
      );

      // FetchProducts(type, afterSkuId?):
      // fetchProducts via iStoreRepo -->
      // (0)=> emit isFetching: fasle, loadingMore: false, failure: some(ProductFailure)
      // (1)=> add list to _productsLocally respected List
      //       && emit isFetching: false, loadingMore: false, productList: _productsLocally(state.type)[]
      final failureOrProducts = await _iStoreRepo.getProductsByType(
        type: type,
        productsCollectionRef: productsCollectionRef,
        startAfterSkuId: fetchAfterSkuId,
      );
      failureOrProducts.fold(
        (productFailure) {
          emit(state.copyWith(
            failure: some(right(productFailure)),
            productList: _productsLocally[type]!,
          ));
          add(const ToggleFailures());
        },
        (products) {
          _productsLocally[type]!.addAll(products);
          emit(state.copyWith(
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
