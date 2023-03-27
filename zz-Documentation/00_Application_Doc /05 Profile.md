# Profile Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(8): profileView, 
             editProfile, profileAddress, help
             newAddress, updateAddress
             orders, orderDetails

`Routers`: Orders Router (2 screens)
`Routing`: ('/main/profile')
`tag`: uic-Profile
`domain-infra`: user
------------------------------------------

# Presentaion
>>>>>>>>>>>>>>>>>>>>>>>>>>>

## ProfileView ('/main/profile')
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

## EditProfile ('/editProfile')
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

## Orders ('/orders')
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

## OrderDetails ('/orders/detail')
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

## ProfileAddress ('/profileAddress')
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
        Bloc Providers:
        Will PopScope: 
        Network Dialogs: 

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

---------------------------------------


## Help ('/help')
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

# Domain-Infra
>>>>>>>>>>>>>>>>>>>>>>>>>>>
 * `domain/infra`: IUserRepository: @LazySingleton
 * `entities`: FydUser, fydAddress, Otp
 * `interfaces`: 
        => createUser(name, email) :: <UserFailure, Unit>
        => logOutUser() :: void
        => getFydUserRealtime() :: <UserFailure, FydUser?>
        => updateProfile(name? email?) :: <UserFailure, Unit>
        => updateAddress(address, atIndex) :: <UserFailure, Unit>
        => addNewAddress(address, newIndex) :: <UserFailure, Unit>
        => getOrders(userId) :: <UserFailure, List<FydOrder>>
 * `failures`:
        => aborted 
        => invalidArgument
        => alreadyExists
        => notFound
        => permissionDenied
        => serverError
        => unknownError

 * `TODOS`: 
        => crashylitics logging in UserFailureMapper
----------------------------------------------------------


