# Core Documentation
>>>>>>>>>>>>>>>>>>>>>>>>>>

`Screens`(3): start/ splash/ landing/ 
`Extra Screens`(2):  Address(new/update)
`tag`: uic-Core
`domain-infra`: shared

## Presentation
----------------------------------------------------------

#### `NewAddressPage`: ('/newAddress') 
#### `UpdateAddressPage`: ('/updateAddress') 
>>>>>>>>>>>>>>>>>>>>>>>>>>
 - `WrapperHandling`
      Bloc Providers: FydUserCubit(), SharedInfoCubit()
      Will PopScope: yes
      Network Dialogs: via mainPage

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - `AppBar`: Text(d3--1.3ls)--Icon(back)      
    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - `blocs`: FydUserCubit 
    - `listenWhen`: (context.router.currentUrl == '/newAddress')
    - `Listener`: ErrorHandling() + FydLoadingOverlay
    - `events`: clearCart(), cartAvailabilityCheck(), updateQty(), removeSize()

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    - `widgets`: FydTextFormField, AddressDropdownMenu
    - `assets`: something_went_wrong, empty_cart

    >>>>>>>>>>>>>>>>>>>>>>>>>>
    `Todos`: null

## Domain-Infra
----------------------------------------------------------
 * `domain/infra`: ISharedInfoRepository: @LazySingleton
 * `entities`: sharedInfo
 * `interfaces`: 
        => getSharedInfo :: Stream<SharedInfoFailure, SharedInfo>
     
 * `failures`
        => permissionDenied 
        => notFound
        => serverError
        => unexpectedError

 * `TODOS`: 
   - crashylitics logging in sharedFailureMapper

## Services
----------------------------------------------------------
  #### `AnalyticsService` 
    <Events>: <Parameters>

    * store_visit : store_id
    * product_view : store_id, sku_id, product_type
    * adding_to_cart : store_id, product_type
    * proceed_to_checkout : store_id, sub_total, item_count
    * address_info_added : pincode, state
    * help_needed : help_by

    * auth_exception : error_message
    * shared_info_exception : error_message
    * store_exception : error_message
    * product_exception : error_message
    * cart_exception : error_message
    * user_exception : error_message

    

## Packages
----------------------------------------------------------
* Presentation-Based :
  - `animations`
  - `carousel_slider`
  - `custom_navigation_bar`
  - `dots_indicator`
  - `flutter_animate`
  - `flutter_hooks`
  - `flutter_screenutil`
  - `flutter_spinkit`
  - `flutter_svg`
  - `font_awesome_flutter`
  - `google_fonts`
  - `marquee`
  - `pinput`
  - `url_launcher`
* Application-Based :
  - `flutter_bloc`
  - `hive`
  - `hive_flutter`
* Domain-Based :
  - `dartz`
  - `rxdart`
  - `get_it`
  - `injectable`
  - `json_annotation`
  - `freezed_annotation`
* Infra-Based :
  - `auto-route`
  - `connectivity_plus`
  - `cached_network_image`
* Utility-Based :
  - `cloud_firestore`
  - `cloud_functions`
  - `firebase_analytics`
  - `firebase_auth`
  - `firebase_core`
  - `firebase_crashlytics`
  - `firebase_dynamic_links`
* Developing-Based:
  - `auto_route_generator`
  - `build_runner`
  - `freezed`
  - `injectable_generator`
  - `json_serializable`
  - `hive_generator`