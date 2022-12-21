
### Core
 * scaffold -> safeArea
 * xx_view_page : with navBar(without scaffold and safeArea)
 * xx_page : without NavBar(with scaffold)
 * xx_WrapperPage / xx_WrapperViewPage : 
   - case 1: if not RouterPage, call WrapperPage to call Page/viewPage
   - case 2: if routerPage, use ViewPage/Page to call itself  


### Referenced Size (890, 400) 
 * usable H 838.6 with safeArea

### Packages
 * `custom_bubble_navigation_bar`  Bottom nav bar

### FydWidgets
 * `FydView` - topSheet, bottomSheet
 * `FydAppBar` - leading, trailing, main Widgets
 * `FydCategoryCard` - title, color, imageUrl/asset

## stores-View-Page
 * `FydCategoryCard` - title, color, imageUrl/asset
 * `StoresVerticleListView` - categoryHeader, footer with onPressed(), widgetList
 * `StoresTile` - store, onPressed()

## shared-Info []
 *  `shared-Info` {categories with logos, liveStores by categories...} 
 * `shared-Info-Cubit`
 * `i-shared-info-repository`

## Stores
 *  `Stores-Bloc`

 