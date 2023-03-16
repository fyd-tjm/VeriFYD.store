
# ui-CleanUp checklist

## [AUTH] [HOME] [STORES] [CART] [PROFILE] [CHECKOUT]

 * `WrapperHandling`
        Bloc Providers
        Will PopScope
        Network Dialogs

 * `UI`
        Scaffold(resize)-->SafeArea
        TopSheet/btmSheet--stless---height
        AppBar: Text()--Icon()
        Btn: height()--padding()
        ListView: shrinkWrap(false)--ItemExtent(true)
                  --automaticKeepAlives/addreapainbound(false)
                  --pulltoRefresh
        Images: asset(exporting): Cache:
        Avoid: ShaderMask--opacity--clipping
               --for.maps/each
               --SizedBox(nil)
        colors:     
 
 * `Bloc Handling`
        listenWhen:
        Listener: ErrorHandling()
        buildWhen:
        builder: Loading(): null(): view
 
 * `Asset Handling`
        Assets Exporting in Helper

 * `Exporting / Importing`
        widets exporting -- barrel imports -- relative Imports

 * `Doc`
        topsheet H:
        AppBar: Text()--Icon()
        Btn: height()--padding()
        widgets: 
        assets:

        blocs: 
        listenWhen:
        Listener: ErrorHandling()
        buildWhen:
        builder: Loading(): null(): view
        
        todos:
        tag: 

 * `Git-Tagging`