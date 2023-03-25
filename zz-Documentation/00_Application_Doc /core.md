## Core Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(3): start/ splash/ landing/ 
`Extra Screens`(2):  Address(new/update)
`tag`: uic-Core
----------------------------------------------------------

# NewAddressPage: ('/newAddress') 
# UpdateAddressPage: ('/updateAddress') 
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

# Extra
>>>>>>>>>>>>>>>>>>>>>>>>>>
widets
----------------------------------------------------------

