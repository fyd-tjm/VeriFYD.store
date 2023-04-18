# Firestore-DB Collections: 

- ## `shared-info`

     ### `user(doc):`
        banners: { url : message}
        cartLimit: 8
        shippingCost: 100
        deliveryStates: [states...]
        isPodAvailable: false
        support: {
            MAIL : "fyd.technologies@gmail.com"
            PHONE : "+919690590197"
            WHATSAPP : "+919690590197"
            }
        timmings: {
            CALLING HOURS: "12:00 - 18:00"
            OPERATING HOURS: "09:00 - 18:00"
        }
        offers: {code : coupon-entity}
        liveStores: {category : no. of live stores}
        storeSearchMap: {storeId : storeName}
        recentlyPurchased: {storeId : product-enitity}
        totalOrders: no-of-orders
        
     ### `order-ids(doc):`
        docType: "main"
        ids: { index : order-id}


- ## `stores` 

    ##### `docId(#A104):`
    
      storeId: #A104
      name: <store-name>
      isLive: <boolean>
      categories: [categories]
      about: 
      featuredIn: {index : ytb-link}
      rating: 4.1
      socialPresence: {
        FACEBOOK : '' 
        INSTAGRAM : '' 
        WEBSITE : ''
        WHATSAPP : ''
        YOUTUBE : '' 
      }
      storeAddress: { index : address-string }
      storeContact: {index : phone-no}
      storeLogo: <store-logo-url>
      storeAlerts: {index : message}
      coupons: {code : coupon-entity}
      types: {type : availability}
    >>>>>>>>>>>>>>>>>>>>>>>>>>>>
    

    ### `products: subcollection`
    ##### `docId(#2104):`
    
      skuId: #2104
      storeId:
      storeName:
      name:<product-name>  
      company: <product-company-name>
      type: <type>
      inStock: <boolean> 
      sellingPrice: 
      mrp:
      productImages: [...urls]
      thumbnail: <url>
      sizeAvailability: {size : availability}
      sizeGuide: <url>
      popularity: 4
      description: 
      policy:    

- ## `users`

    ##### `docId(uid):`
    
      uId: #A104
      phone:
      name: 
      email:
      addresses: {index : fydAddress-entity} 
    >>>>>>>>>>>>>>>>>>>>>>>>>>>>
    

    ### `cart: subcollection`
    ##### `docId(0):`
    
      cartId: <storeId>
      storeName: <store-name>
      cartCount: <item-count>
      cartItems: {skuId : {size : qty}}


- ## `orders`

    ##### `docId(A-08577)`
        
        orderId: A-08577
        orderDate: <timeStamp>
        deliveryDate: <timeStamp>
        orderStatus: {runtime Type : 'type'}
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        orderInfo: {
            storeId:
            storeName:
            orderItems: {skuId : {size : qty}}
            orderItemsDetail : {skuId : Product-entity}
            orderSummary : {
                discount: coupon-entity
                shippingCost:
                subTotal:
                total:
                tatalItems:
            }
        }
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        shippingInfo: {
            shippingAddress : fydAddress-entity
            shippingCost: 
            trackingUrl:
        }
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        customerInfo: {
            customerId:
            name:
            phone:
            email:
        }
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        paymentInfo: {
            paymentAmount:
            paymentMode: {
                runtime Type : "online"
                paymentId: ''
            }
        }
        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>