## Core Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(3): start/ splash/ landing/ 
`Extra Screens`(2):  Address(new/update)
`tag`: uic-Core
`domain-infra`: shared
----------------------------------------------------------
# Presentation

## NewAddressPage: ('/newAddress') 
## UpdateAddressPage: ('/updateAddress') 
>>>>>>>>>>>>>>>>>>>>>>>>>>
* `WrapperHandling`
      Bloc Providers: FydUserCubit(), SharedInfoCubit()
      Will PopScope: yes
      Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `AppBar`: Text(d3--1.3ls)--Icon(back)      
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `blocs`: FydUserCubit
    `listenWhen`: (context.router.currentUrl == '/newAddress')
    `Listener`: ErrorHandling() + FydLoadingOverlay
    `events`: clearCart(), cartAvailabilityCheck(), updateQty(), removeSize()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `widgets`: FydTextFormField, AddressDropdownMenu
    `assets`: something_went_wrong, empty_cart

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: null

# Domain-Infra
>>>>>>>>>>>>>>>>>>>>>>>>>>>
 * `domain/infra`: ISharedInfoRepository: @LazySingleton
 * `entities`: sharedInfo
 * `interfaces`: 
        => getSharedInfo :: Stream<SharedInfoFailure, SharedInfo>
     
 * `failures`:
        => permissionDenied 
        => notFound
        => serverError
        => unexpectedError

 * `TODOS`: 
        => crashylitics logging in sharedFailureMapper
----------------------------------------------------------




