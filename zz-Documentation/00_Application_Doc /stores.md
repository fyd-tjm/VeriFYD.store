## Stores Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(4): storesView, storeView, product, storeInfo
`Routers`: StoresRouter(2screens) 
`Routing`: 'main/stores', 'main/stores/:storeId'
`tag`: uic-Stores
----------------------------------------------------------

# StoresViewPage: ('/main/stores')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
     Bloc Providers: storesBloc, sharedInfoCubit

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 200.h   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: storesBloc
    `listenWhen`: currentUrl == '/main/stores'
    `Listener`: ErrorHandling
        permissionDenied: () => 'permission Denied',
        notFound: () => 'not exist anymore',
        serverError: () => 'seError: try again',
        unexpectedError: () => 'something went wrong: try again',
    `buildWhen`: currentUrl == '/main/stores'
    `builder`: 
        Loading(bottomSheet): SpinKitWave(color: fydBblue,size: 40.0)
        null(selectedCategory): 'select-a-category or search a store'
        if-stores-not-available: launch-soon image
        view
    `events`: updateRecentSearchMap(), 
              UpdateSelectedCategory(category)
              LoadMoreStores()
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: launch_soon.. svg_apparel..footwear..other
    `widgets`: storesSearchBar(), StoresCategoryCard(),
               StoresVerticleListView(),
               StoresTile(), 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 
    - commit: ui-cleanup-storesViewPage
    

----------------------------------------------------------

# StoreViewPage: ('main/stores/:storeId')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: StoreBloc()..GetStoreRealtime(storeId)
        Will PopScope: Yes | showPermissionDialog()
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 200.h
    `AppBar`: Text(h3)--Icon()   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: 
    `listenWhen`: (context.tabsRouter.currentUrl == '/main/stores')
    `Listener`: Error-Handling
            -'store not found'
            -'product not found'
            -'server error: try again'
            -'unexpected error: try again'
    `buildWhen`:
    `builder`: 
            Loading(fetching+state.storeRealtime is null): SpinKitWave(color: fydBblue, size: 40.0)
            null(state.storeRealtime): go-back or retry 
            view
    `events`: GetStoreRealtime(storeId)
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: store_closed, launch_soon, stockout, fetching_error,
    `widgets`: showPermissionDialog(), FydAutoScrollingText()
               StoreOfferCard, StoreTypeChip()
               StoreListView(), StoreGridRow(),
               StoreProductCard()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`:
            => storeInfo touchArea Increase
            => onStart null view image avoid
            => star-logo for verifyd store 
            => grid-row integrate within storelistView
            => ui-Design social Media display maybe
    - commit: 'ui-cleanup-storeView'

----------------------------------------------------------

# StoreInfoPage: (/storeInfo)
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: null
        Will PopScope: null 
        Network Dialogs: via mainPage 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 200.h
    `AppBar`: Text(h3)--Icon(back)   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: none
    `listenWhen`:
    `Listener`: ErrorHandling()
    `buildWhen`:
    `builder`: Loading(): null(): view
    `events`: 
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`:

    `widgets`: FydTExtCard(), fydCloseDialog,
              FydAutoScrollingText()
              StoreInfoExpansionTile() 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`:
            => add verifyd check at top right
    - commit: ui-cleanup-storeInfo

----------------------------------------------------------

# ProductPage: ('/product')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: ProductBloc()..GetProductRealtime(pRef)
        Will PopScope: nil
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 
    `AppBar`: Icon(back)   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: ProductBloc()
    `listenWhen`: (context.router.currentUrl == '/product')
    `Listener`: ErrorHandling() + showPermissionDialog()
                => 'permission-denied'
                => 'product not found'
                => 'server error: try later!'
                => 'unexpected error: try later!'

                => 'No more left in stock',
                => 'Max cart limit reached.',
                => 'unexpected Error, try later!',
    `builder`: 
        Loading(fetching + prodRealtime is null): spinkit(40+fydBblue)
        null(): 
        view
    `events`: AddNewCartWithProduct(size), AddToCart()
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: fetch_error, soldout
    `widgets`:  ProductCarouselSlider(),
                ProductInfoSection(), ProductSizeTile()
                StoreInfoExpansionTile()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 
            => avoid loading/null display on start
            => Add size-Guide Logic

    - commit: ui-cleanup-product

----------------------------------------------------------