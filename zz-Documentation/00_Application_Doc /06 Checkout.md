# Checkout Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(3): deliveryAddress/ payment/ confirmation

`Routers`: Checkout Router 
`Routing`: ('/checkout')
`tag`: uic-Checkout
`TODOs`: Single Scroll Page for Checkout
`domain-infra`: checkout
------------------------------------------

# DeliveryAddressPage ('/checkout/delivery')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: via Router Wrapper
        Will PopScope: yes
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: CheckoutBloc
    `listenWhen`: '/checkout/delivery'
    `Listener`: ErrorHandling() 
    `buildWhen`: fydUser changes
    `builder`: Loading(): null(): view
    `events`: addShippingInfo()
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 160.h
    `AppBar`: Text(h2-.9)--Icon(close)   
    `assets`: no_address
    `widgets`: DeliveryAddressTile()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 
---------------------------------------



# PaymentPage ('/checkout/payment')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: via Router Wrapper
        Will PopScope: null
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: checkoutBloc
    `listenWhen`: '/checkout/payment'
    `Listener`: ErrorHandling() + redirection
    `builder`: loading + fydView
    `events`: AddPaymentInfo

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 380.h
    `assets`: comming-soon-tag via paymenttile
    `widgets`: DeliveryInfoCard, PaymentTile
               CouponSearch, OrderSummarySection

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: Add orderId via cloudf() + payment-gateway

-----------------------------------------

# Confirmation ('/checkout/confirmation')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Will PopScope: yes
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 500
    `AppBar`: heading(d2--.8) 
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: success.gif, failure.gif
    `widgets`: 
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: orderId and paymentId integration 

-----------------------------------------


# Domain-Infra
>>>>>>>>>>>>>>>>>>>>>>>>>>>
 * `domain/infra`: ICheckoutRepository : @lazyS
 * `entities`: FydOrder, orderStatus,
               customerInfo, OrderInfo,
               shippingInfo, paymentInfo, paymentMode
               orderSummary       
 * `interfaces`: 
        => getStoreCoupons(storeRef) :: <CheckoutFailure,<String, Coupon>>
        => createOrder(cart) :: <CheckoutFailure, Unit>
        => getOrderId(orderNumber) :: <CheckoutFailure, String>

 * `failures`:
        => cartAvailabilityFailure
        => paymentFailure
        => couponFailure
        => orderIdFailure(orderNumber)
        => createOrderFailure(fydOrder)
        => unexpectedFailure(e)
 * `TODOS`: 
        => orderId/create order logic 
        => crashylitics logging 
----------------------------------------------------------