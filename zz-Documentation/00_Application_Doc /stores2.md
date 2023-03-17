## StoresBloc

 ### Update-Selected-Category Event

  * // emit isFetching: true, SelectedCategory: event.category ..and few other 
  * // check if category available in _storesLocally if not add it with []
  * // if storesLocally [isNotEmpty]
      // (1)=> emit isFetching: false, storeList: _storesLocally(selectedCategory)
      // (0)=> AddStoresLocally(state.category)
  * // AddStoresLocally(category) :
        // check if stores available via LiveStores
        // (0)=> emit isFetching: false, notAvailable: true
        // (1)=> FetchStores(state.category)
  * // FetchStores(category, afterSId?):
          // fetchStores via iStoreRepo -->
          // (0)=> emit isFetching: fasle, failure: some(failure)
          // (1)=> add list to _storeLocally respected List
          //       && emit isFetching: false, storeList: _storeLocally(state.Category)[]


## Domain
## Infra
 ### getStoresByCategory(String<category>, String?<fetchAfterSid>)

  * 'isLive' = true + 
  * orderBy 'sId' + 
  * fetchLimit(5)
  * returns List of <Store> objects
 
 ### getStoreRealTime(String<storeId>)
  * first doc match
  * returns Stream of <Store/StoreFailure> snapshots
 
 ### getProductsByType(String<type>, String<productsReference>, String?<startAfterSkuId>)
  * 'inStock' = true
  * orderBy 'skuId'
  * fetchLimit(15)
  * returns List of <Product> objects
 
 ### getProductRealTime(String<productsReference>)
  * returns Stream of <Product/ProductFailure> snapshots
  * inStock value needs to checked at application/ui
