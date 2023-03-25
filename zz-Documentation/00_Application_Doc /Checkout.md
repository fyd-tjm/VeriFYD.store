# Checkout Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(3): deliveryAddress/ payment/ confirmation

`Routers`: Checkout Router 
`Routing`: ('/checkout')
`tag`: uic-Checkout
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



# ProfileView ('/main/profile')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: fydUserCubit()
        Will PopScope: nil
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: FydUserCubit()
    `listenWhen`: (context.tabsRouter.currentUrl == '/main/profile')
    `Listener`: ErrorHandling()
                => 'Failed! try again ',
                => 'Invalid Argument. try again',
                => 'Data already Exists',
                => 'Data not found!',
                => 'Permission Denied',
                => 'Server Error: try again',
                => 'Something went wrong: try again '
    `buildWhen`: nil
    `builder`: Loading(if null) : view
    `events`: logOutUser()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 300.h
    `AppBar`: Text(d3--1.3)--Icon(mode_edit_outline_outlined)   
    `assets`: address/orders/help...svgs
    `widgets`: ProfileTile()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 

-----------------------------------------

# EditProfile ('/editProfile')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: fydUserCubit, 
        Will PopScope: showPermissionDialog()
        Network Dialogs: via MainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - Scaffold(resize)-->SafeArea: 
    - TopSheet/btmSheet--stless:
    `topsheet Height`: 
    AppBar: Text()--Icon()   
    
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

-----------------------------------------

# Orders ('/orders')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: fydUserCubit()..getFydOrders()
        Will PopScope: nil
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: fydUserCubit()
    `listenWhen`: (context.router.currentUrl == '/orders')
    `Listener`: ErrorHandling()
                => 'something went wrong'
                => navigateTo(profile) 
    `buildWhen`: (context.router.currentUrl == '/orders')
    `builder`: 
        Loading(updating+null): spinkit(Bbluegrey + 30)
        fydView:
            no-orders
    `events`: getFydOrders()
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 150.h
    `AppBar`: Text(d3--1.3)--Icon(close)   
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `assets`: no_orders
    `widgets`: OrdersTile

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: 

-----------------------------------------

# OrderDetails ('/orders/detail')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers:
        Will PopScope: 
        Network Dialogs: 

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - TopSheet/btmSheet--stless:
    `topsheet Height`: 
    AppBar: text(rich-24)--Icon(back)   
    
    
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `widgets`: orderItemTile() Tracker4, StepTracker

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: => add Return Logic

-----------------------------------------


# Help ('/help')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers: SharedInfoCubit()
        Will PopScope: nil
        Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `topsheet Height`: 170.h
    AppBar: Text(d3-1.3)--Icon(close)   
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `widgets`: HelpTile()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: add pre-message

-----------------------------------------
