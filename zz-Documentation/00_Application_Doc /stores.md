`Stores` Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(4): storesView, storeView, product, storeInfo
`Routers`: StoresRouter(2screens) 
`Routing`: 'main/stores'
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
    `Listener`: 
        ErrorHandling
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
    `Todos`: null
    - commit: ui-cleanup-storesViewPage
    

----------------------------------------------------------

# StoreViewPage: ()
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers:
        Will PopScope: 
        Network Dialogs: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - Scaffold(resize)-->SafeArea: 
    - TopSheet/btmSheet--stless:
    `topsheet Height`: 
    `AppBar`: Text()--Icon()   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: 
    `listenWhen`:
    `Listener`: ErrorHandling()
    `buildWhen`:
    `builder`: Loading(): null(): view
    `events`: 
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: 
    `widgets`: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - importing/exporting/widgets
    `Todos`: 
    - tagging/commit:

----------------------------------------------------------

# StoreInfoPage: ()
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers:
        Will PopScope: 
        Network Dialogs: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - Scaffold(resize)-->SafeArea: 
    - TopSheet/btmSheet--stless:
    `topsheet Height`: 
    `AppBar`: Text()--Icon()   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: 
    `listenWhen`:
    `Listener`: ErrorHandling()
    `buildWhen`:
    `builder`: Loading(): null(): view
    `events`: 
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: 
    `widgets`: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - importing/exporting/widgets
    `Todos`: 
    - tagging/commit:

----------------------------------------------------------

# ProductPage: ()
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers:
        Will PopScope: 
        Network Dialogs: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - Scaffold(resize)-->SafeArea: 
    - TopSheet/btmSheet--stless:
    `topsheet Height`: 
    `AppBar`: Text()--Icon()   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: 
    `listenWhen`:
    `Listener`: ErrorHandling()
    `buildWhen`:
    `builder`: Loading(): null(): view
    `events`: 
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: 
    `widgets`: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - importing/exporting/widgets
    `Todos`: 
    - tagging/commit:

----------------------------------------------------------