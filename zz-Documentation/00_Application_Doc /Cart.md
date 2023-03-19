## Cart Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(1): cartView
`Routers`: none
`Routing`: '/main/cart'
`tag`: uic-Cart
----------------------------------------------------------

# CartViewPage: ('main/cart') 
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
      Bloc Providers: CartCubit..initializeCart()
      Will PopScope: null
      Network Dialogs: null

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Heigh`t: 180| 280| 380| 490.h
    `AppBar`: Text(d3--1.3ls)--Icon(delete_forever)
    `Btn`: height(60.h)--padding(15.w, 25.h)
         loading: fydloadingOverlay()         

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: CartCubit()
    `listenWhen`: (context.router.currentUrl == '/main/cart')
    `Listener`: ErrorHandling()
    `buildWhen`: nil
    `builder`: 
          Loading(): SpinKitWave(color: fydBblue, size: 40.0)
          null(): something_went_wrong + refresh
          emptyCart(): empty_cart
          CartView 
    `events`: clearCart(), cartAvailabilityCheck(), updateQty(), removeSize()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `widgets`: FydVListView(), CartTile()
    `assets`: something_went_wrong, empty_cart

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: null
