# Cart Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(1): cartView
`Routers`: none
`Routing`: '/main/cart'
`tag`: uic-Cart
`domain-infra`: cart
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
----------------------------------------------------------

# Domain-Infra
>>>>>>>>>>>>>>>>>>>>>>>>>>>
 * `domain/infra`: ICartRepository : @LazySingleton
 * `entities`: cart, cartSummary
 * `interfaces`: 
        => getCartRealtime :: Stream<cartFailure-cart>
        => addNewCart(cart) :: cartFailure-unit
        => addNewProduct(skuId, sizeQty) :: cartFailure-unit
        => updateSize(skuId, size, updateBy) :: cartFailure-unit
        => removeSize(skuId, size, removeQty) :: cartFailure-unit
        => clearCart :: cartFailure-unit
 * `failures`:
        => itemNotAvailableAnymore
        => maxItemAvailability
        => maxCartLimit
        => availabilityCheckFailure
        => itemsDetailFailure
        => updateCartFailure
        => cartStreamFailure
        => unexpectedError(e)
 * `TODOS`: 
        => crashylitics logging 
----------------------------------------------------------