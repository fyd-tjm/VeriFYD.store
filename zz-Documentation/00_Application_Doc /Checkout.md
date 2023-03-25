# Checkout Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(3): deliveryAddress/ payment/ confirmation

`Routers`: Checkout Router 
`Routing`: ('/checkout')
`tag`: uic-Checkout

`TODOs`: Single Scroll Page for Checkout
------------------------------------------

# DeliveryAddressPage ('/checkout/delivery')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: CheckoutBloc()
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
        Bloc Providers: 
        Will PopScope: 
        Network Dialogs: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: 
    `listenWhen`: 
    `Listener`: ErrorHandling()
    `buildWhen`: 
    `builder`: 
    `events`: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 
    `AppBar`: Text(d3--1.3)--Icon(mode_edit_outline_outlined)   
    `assets`: 
    `widgets`: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 

-----------------------------------------

# Confirmation ('/checkout/confirmation')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: 
        Will PopScope: 
        Network Dialogs:

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: 
    `listenWhen`:
    `Listener`: ErrorHandling()
    `buildWhen`:
    `builder`: Loading(): null(): view
    `events`: 
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - Scaffold(resize)-->SafeArea: 
    - TopSheet/btmSheet--stless:
    `topsheet Height`: 
    `AppBar`: Text()--Icon()   
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: 
    `widgets`: 
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - importing/exporting/widgets
    `Todos`: 
    - tagging/commit:

-----------------------------------------

