## Home Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(1): homeView
`Routers`: none
`Routing`: '/main/home'
`tag`: uic-Home
----------------------------------------------------------

* `WrapperHandling`
      Bloc Providers: via mainPage (sharedInfoCubit)
      Will PopScope: null
      Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 420.h
    `AppBar`: Text(size: 26+35)   
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: SharedInfoCubit()
    `listenWhen`: (context.router.currentUrl == '/main/home')
    `Listener`: ErrorHandling()
    `buildWhen`: when banners || recentlyPurchased is changed
    `builder`: 
          Loading(when null): SpinKitWave(color: fydBblue, size: 40)
    `events`: 
          updateRecentSearchMap(), via storeSearch
          UpdateSelectedCategory(category) via category

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: svg_apparel/footwear/other
    `widgets`: StoreSearchBar(), BannerCard(), BannerDialog()
             FydCategoryCard(), StoreProductCard()
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 
          -> on-start-loading remove
          -> ui design
          -> buildWhen-add searchMap condition